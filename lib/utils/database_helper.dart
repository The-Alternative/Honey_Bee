import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:ssd/models/db_models.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database
////////////////////////////////////////////////////
  String medicinTable = 'med_table';
  String medId = 'id'; //primry/forign..key
  String medTitle = 'title';
  String medform = 'form';
  //////////////////////////////////////////////////
  String diagonTable = 'diagon_table';
  String diagid = 'd_id'; //primry/forign..key
  String doctname = 'd_name';
  String medAmount = 'amount';
  String instruction = 'description';
  String diagon = 'diagon';
  String img_direct = 'img_direct';
  String times = 'times';
  String dayes = 'dayes';
  String first_date = 'fdate';
  String first_clock = 'fclock';
  String notice = 'notic';

  //////////////////////////////////////////////////
  String patentTable = 'patent_table';
  String patname = 'p_name';
  String patId = 'p_id'; //primry/forign..key

  //////////////////////////////////////////////////
  String midDayesTable = 'mDayes_table';
  String dayesId = 'day_id';
  String day_date = 'd_date';
  String sortNum = 'sortn';

  //////////////////////////////////////////////////
  String dayTimesTable = 'mTimes_table';
  String timesId = 'tid';
  String day_time = 'd_time';
  String day_time_state = 'd_t_state';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $medicinTable($medId INTEGER PRIMARY KEY AUTOINCREMENT, $medTitle TEXT UNIQUE, '
        '$medform TEXT)');
    await db.execute(
        'CREATE TABLE $patentTable($patId INTEGER PRIMARY KEY AUTOINCREMENT, $patname TEXT UNIQUE)');

    await db.execute(
        'CREATE TABLE $diagonTable($diagid INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$doctname TEXT, $medAmount INTEGER, $diagon TEXT,$instruction TEXT,$first_date TEXT,$first_clock TEXT,'
        '$dayes TEXT,$times TEXT,$img_direct TEXT,$notice TEXT'
        ',$medId INTEGER FORIGN KEY REFERENCES $medicinTable($medId),'
        '$patId INTEGER FORIGN KEY REFERENCES  $patentTable($patId))');
    await db.execute(
        'CREATE TABLE $midDayesTable($dayesId INTEGER PRIMARY KEY AUTOINCREMENT, $day_date TEXT UNIQUE,$sortNum int,'
        '$diagid INTEGER FORIGN KEY REFERENCES $diagonTable($diagid) )');
    await db.execute(
        'CREATE TABLE $dayTimesTable($timesId INTEGER PRIMARY KEY AUTOINCREMENT, $day_time TEXT,'
        '$day_time_state int,'
        '$dayesId INTEGER FORIGN KEY REFERENCES $midDayesTable($dayesId) )');
  }

/////////////////////////////timesday//////////////////////////////////////////////////////
  Future<List<Map<String, dynamic>>> getDayTimesMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = db.query(dayTimesTable, orderBy: '$timesId ASC');
    return result;
  }

  Future<int> insert_DayTimes(MedicineTimes medicineTimes) async {
    Database db = await this.database;
    var result = await db.insert(dayTimesTable, medicineTimes.toMap());
    return result;
  }

  Future<int> updateDayTimes(MedicineTimes medicineTimes) async {
    var db = await this.database;
    var result = await db.update(dayTimesTable, medicineTimes.toMap(),
        where: '$timesId = ?', whereArgs: [medicineTimes.timesId]);
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deleteDayTimes(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $dayTimesTable WHERE $timesId = $id');
    return result;
  }

  // Get number of Note objects in database
  Future<int> getCountDayTimes() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $dayTimesTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<MedicineTimes>> getDayTimesList() async {
    var medicineTimesMapList =
        await getDayTimesMapList(); // Get 'Map List' from database
    int count = medicineTimesMapList
        .length; // Count the number of map entries in db table
    List<MedicineTimes> medicineTimeList = List<MedicineTimes>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      medicineTimeList
          .add(MedicineTimes.fromMapObject(medicineTimesMapList[i]));
    }

    return medicineTimeList;
  }

/////////////////////////////Medicine//////////////////////////
  Future<List<Map<String, dynamic>>> getMedicineMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(medicinTable, orderBy: '$medId ASC');
    return result;
  }

  Future<int> insert_medicine(Medicine medicine) async {
    Database db = await this.database;
    var result = await db.insert(medicinTable, medicine.toMap());
    return result;
  }

  Future<int> updateMedicine(Medicine medicine) async {
    var db = await this.database;
    var result = await db.update(medicinTable, medicine.toMap(),
        where: '$medId = ?', whereArgs: [medicine.medId]);
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deleteMedicine(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $medicinTable WHERE $medId = $id');
    return result;
  }

  // Get number of Note objects in database
  Future<int> getCount_Medicine() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $medicinTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Medicine>> getMedicineList() async {
    var medicineMapList =
        await getMedicineMapList(); // Get 'Map List' from database
    int count =
        medicineMapList.length; // Count the number of map entries in db table
    List<Medicine> medicineList = List<Medicine>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      medicineList.add(Medicine.fromMapObject(medicineMapList[i]));
    }

    return medicineList;
  }

  //////////////////////////////////////////////////////diagon///////////////////////////////////////////////////////////////////////
  Future<List<Map<String, dynamic>>> getDiagonMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(diagonTable, orderBy: '$diagid ASC');
    return result;
  }

  Future<int> insertDiagon(Diagon diagon) async {
    Database db = await this.database;
    var result = await db.insert(diagonTable, diagon.toMap());
    return result;
  }

  Future<int> updateDiagon(Diagon diagon) async {
    var db = await this.database;
    var result = await db.update(diagonTable, diagon.toMap(),
        where: '$diagid = ?', whereArgs: [diagon.diagonId]);
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deleteDiagon(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $diagonTable WHERE $diagid = $id');
    return result;
  }

  // Get number of Note objects in database
  Future<int> getCountDiagon() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $diagonTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Diagon>> getDiagonList() async {
    var diagonMapList =
        await getDiagonMapList(); // Get 'Map List' from database
    int count =
        diagonMapList.length; // Count the number of map entries in db table
    List<Diagon> diagonList = List<Diagon>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      diagonList.add(Diagon.fromMapObject(diagonMapList[i]));
    }
    return diagonList;
  }

  ////////////////////////////////////////////patient///////////////////////////////

  Future<List<Map<String, dynamic>>> getPatientMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = db.query(patentTable, orderBy: '$patId ASC');
    return result;
  }

  Future<int> insertPatient(Patient patient) async {
    Database db = await this.database;
    try {
      var result = await db.insert(patentTable, patient.toMap());
      return result;
    } catch (e) {
      return getIdPatient(patient.patName);
    }
  }

  Future<int> updatePatient(Patient patient) async {
    var db = await this.database;
    var result = db.update(patentTable, patient.toMap(),
        where: '$patId = ?', whereArgs: [patient.patId]);
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deletePatient(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $patentTable WHERE $patId = $id');
    return result;
  }

  // Get number of Note objects in database
  Future<int> getCountPatient() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $patentTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Patient>> getPatientList() async {
    var patientMapList =
        await getPatientMapList(); // Get 'Map List' from database
    int count =
        patientMapList.length; // Count the number of map entries in db table

    List<Patient> patientList = List<Patient>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      patientList.add(Patient.fromMapObject(patientMapList[i]));
    }

    return patientList;
  }

  Future<int> getIdPatient(String name) async {
    // get a reference to the database
    Database db = await this.database;

    // get single row
    List<String> columnsToSelect = [patId];
    String whereString = '${patname} = ?';
    int rowId = 0;
    List<dynamic> whereArguments = [name];
    List<Map> result = await db.query(patentTable,
        columns: columnsToSelect,
        where: whereString,
        whereArgs: whereArguments);

    // print the results
    rowId = Sqflite.firstIntValue(result);
    return rowId;
  }

  Future<int> getIdDay(String name) async {
    // get a reference to the database
    Database db = await this.database;

    // get single row
    List<String> columnsToSelect = [dayesId];
    String whereString = '${day_date} = ?';
    int rowId = 0;
    List<dynamic> whereArguments = [name];
    List<Map> result = await db.query(midDayesTable,
        columns: columnsToSelect,
        where: whereString,
        whereArgs: whereArguments);

    // print the results
    rowId = Sqflite.firstIntValue(result);
    return rowId;
  }

  /////////////////////////////////////////////////////////////midDayes///////////////////////////////////////////////////
  Future<List<Map<String, dynamic>>> getmidDayesMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = db.query(midDayesTable, orderBy: '$sortNum ASC');
    return result;
  }

  Future<int> insertDayes(MedicineDays days) async {
    Database db = await this.database;
    try {
      var result = await db.insert(midDayesTable, days.toMap());
      return result;
    } catch (e) {
      return getIdDay(days.dayDate);
    }
  }

  Future<int> updateDayes(MedicineDays days) async {
    var db = await this.database;
    var result = await db.update(midDayesTable, days.toMap(),
        where: '$dayesId = ?', whereArgs: [days.dayesId]);
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deleteDayes(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $midDayesTable WHERE $dayesId = $id');
    return result;
  }

  // Get number of Note objects in database
  Future<int> getCountDayes() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $midDayesTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<MedicineDays>> getmidDayesList() async {
    var midDayesMapList = await getmidDayesMapList(); // Get 'Map List' from database
    int count = midDayesMapList.length; // Count the number of map entries in db table

    List<MedicineDays> dayesList = List<MedicineDays>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      dayesList.add(MedicineDays.fromMapObject(midDayesMapList[i]));
    }
    return dayesList;
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Map<String, dynamic>>> getCardInfoMapList(int id) async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(
        'SELECT ( $patentTable.$patname ,$medicinTable.$medTitle,$medicinTable.$medAmount,'
            '$dayTimesTable.$timesId,$diagonTable.$diagid,$midDayesTable.$dayesId,'
            '$dayTimesTable.$day_time,$dayTimesTable.$day_time_state)FROM'
        ' $diagonTable,$patentTable,$medicinTable,$midDayesTable,$dayTimesTable'
        ' WHERE $patentTable.$patId = $diagonTable.$patId and $medicinTable.$medId =$diagonTable.$medId'
            ' and '
        ' AND $diagonTable.$diagid =$id ');
    return result;
  }

  Future<List<Map<String, dynamic>>> getptname(int id) async {
    Database db = await this.database;
    List<Map> result = await db.rawQuery(
        'SELECT $patname,$medTitle ,$diagonTable.$diagid,$medAmount,'
            '$dayTimesTable.$timesId,$dayTimesTable.$dayesId,$day_time,$day_time_state,$day_date,$sortNum'
            ' FROM $diagonTable,$patentTable,$medicinTable,$dayTimesTable,'
            '$midDayesTable WHERE '
        '$diagonTable.$patId = $patentTable.$patId AND '
            ' $diagonTable.$medId = $medicinTable.$medId '
        ' AND $diagonTable.$diagid =  $midDayesTable.$diagid'
            ' and $midDayesTable.$dayesId = $dayTimesTable.$dayesId'

            ' AND $dayTimesTable.$timesId = $id  order By $sortNum ASC');
    String s = "";

    result.forEach((row) {
      s = row['p_name'];
    });
    return result;
  }

  Future<List<Card_info>> getAllIds() async {
    List<Card_info> cardList = List<Card_info>();
    cardList.clear();
    Database db = await this.database;
    List<Map> result = await db.rawQuery('SELECT $timesId FROM $dayTimesTable');
    List<int> ids = List<int>();
    // get each row in the result list and print it
    result.forEach((row) {
      int a = row['$timesId'];
      ids.add(a);
    });
    for (var i = 0; i < ids.length; i++)
    {
      //print(ids.elementAt(i));
      var cardMapList = await getptname(ids.elementAt(i)); // Get 'Map List' from database
      // int count = cardMapList.length; // Count the number of map entries in db table
      Card_info cardObject = Card_info.WithId();
      cardObject = Card_info.fromMapObject(cardMapList[0]);
      cardList.add(cardObject);
    }
    return cardList;
  }
}
