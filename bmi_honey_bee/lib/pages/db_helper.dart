import 'dart:async';
import 'dart:io'as io;
import 'package:bmi_honey_bee/pages/bmi1.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'contact.dart';


class DBHelper {
  static Database _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String Average = '18.5-25كجم/م';
  static const String TABLE = 'Contact';
  static const String DB_NAME = 'contact.db';


  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLE($ID INTEGER PRIMARY KEY AUTOINCREMENT, $NAME TEXT,$Average DOUBLE");
  }

  Future<Contact> save(Contact contact) async {
    var dbClient = await db;
    contact.id = await dbClient.insert(TABLE, contact.toMap());
    return contact;
  }
  Future<List<Contact>> getContact() async{
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID,NAME,Average]);
    List<Contact> contact = [];
    if (maps.length > 0){
      for(int i = 0 ;i < maps.length; i++){
        contact.add(Contact.fromMap(maps[i]));
      }
    }
    return contact;
}

// Future<int> delete(int id) async{
//     var dbClient =await db;
//     return await dbClient.delete(TABLE,where: '$ID =?',whereArgs: [id]);
// }
//   Future<int> update(Contact contact) async{
//     var dbClient =await db;
//     return await dbClient.update(TABLE,contact.toMap(),where: '$ID =?',whereArgs: [contact.id]);
//   }

  Future close() async {
    var dbClient = await db;
    dbClient.close();


  }
}
