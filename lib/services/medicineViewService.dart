import 'package:clock_app/database/medicne.dart';
import 'package:clock_app/models/MedicineInfo.dart';
import 'package:sqflite/sqflite.dart';

  class MedicineView{
  String medicinView = 'med_view';
  String medId = 'id'; //primry/forign..key
  String medTitle = 'title';
  String patname = 'p_name';


  MedicineDatabase _medicineDatabase = MedicineDatabase();
  static Database _database;

  //init database
  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _medicineDatabase.setDatabase();
    return _database;
  }

///////////////////////////////////////////////////////////////////////////
Future<int> insertRecordMedicine(MedicineInfo medicine) async {
  Database db = await this.database;
  int id;
  try {
    id = await db.insert(medicinView, medicine.toMap());
    return id;
  } catch (e) {
    id =await getIdMedicine(medicinView,medicine.medTitle);
    print('mosa $id');
    await db.update(medicinView,medicine.toMap(), where: "$medId = ?",whereArgs: [id]);
  }
  return 1;
}
  Future<int> getIdMedicine(table,String title) async {
    // get a reference to the database
    Database db = await this.database;
    // get single row
    List<String> columnsToSelect = [medId];
    String whereString = '${medTitle} = ?';
    int rowId = 0;
    List<dynamic> whereArguments = ['$title'];
    List<Map> result = await db.query(table,
        columns: columnsToSelect,
        where: whereString,
        whereArgs: whereArguments);
    // print the results
    rowId = Sqflite.firstIntValue(result);
    return rowId;
  }
Future<List<Map<String,dynamic>>> getInfo(table) async {

  var db = await this.database;
  var result = await db.query(table);

  return result;
}

Future<List<MedicineInfo>> getselectRMedicine(String name) async {
  List<MedicineInfo> _medicn = [];

  var db = await this.database;
  var result = await db.rawQuery(
      'SELECT * FROM $medicinView'
          ' WHERE $patname =?',
      ['$name']);
  result.forEach((element) {
    var medicineInfo = MedicineInfo.fromMap(element);
    _medicn.add(medicineInfo);
  });

  return _medicn;
}}