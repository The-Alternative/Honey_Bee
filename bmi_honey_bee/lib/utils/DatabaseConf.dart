import 'package:bmi_honey_bee/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io' as io;


class DatabaseConfig {
  static DatabaseConfig _honeyBee;
  static Database _database;

  DatabaseConfig.Createinstance();

  factory DatabaseConfig() {
    if (_honeyBee == null) {
      _honeyBee = DatabaseConfig.Createinstance();
    }
    return DatabaseConfig();
  }


  final String ContactTable = 'ContactTable';
  final String Id = 'id';
  final String Name = 'name';
  final String SaveDate = 'savedate';

  Future<Database> get honeyBee async {
    if (_database == null) {
      _database = await intDb();
    }
    return _database;
  }

  Future<Database> intDb() async {
     io.Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path +'honeyBee.db';

    var honeyBeedb = await openDatabase(path, version: 1, onCreate: CreateDatabase);
    return honeyBeedb;
  }

  void CreateDatabase(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $ContactTable($Id INTEGER PRIMERY KEY AUTOINCREMENT,$Name TEXT,$SaveDate TEXT");
  }

  Future<List<Map<String, dynamic>>> getContactMapList() async {
    Database db =await this.honeyBee;
    var result = await db.query(ContactTable, orderBy: "$Id ASC");
    return result;
  }

  Future<int> insertContact(Contact contact)async{
    Database db =await this.honeyBee;
    var result = await db.insert(ContactTable, contact.toMap());
    return result;
  }

  Future<int> upDateContact(Contact contact) async{
    Database db =await this.honeyBee;
    var result = await db.update(ContactTable, contact.toMap(), where: "$Id = ?",whereArgs: [contact.id]);
    return result;
  }

  Future<int> deleteContact( int id )async{
    var db = await this.honeyBee;
    int result = await db.rawDelete("DELETE FROM$ContactTable WHERE $Id = $id");
    return result;
  }

  Future<int> getCount() async{
    Database db = await this.honeyBee;
    List<Map<String, dynamic>> all = await db.rawQuery("SELECT COUNT (*) FROME $ContactTable");
    int result = Sqflite.firstIntValue(all);
    return result;
  }

  Future<List<Contact>> getContactList() async{
    var contactMapList = await getContactMapList();
    int count = contactMapList.length;
    List<Contact> contacts = new List<Contact>();

    for (int i = 0 ; i <count  ; i++){
      contacts.add(Contact.getMap(contactMapList[i]));
    }
    return contacts;
  }
}