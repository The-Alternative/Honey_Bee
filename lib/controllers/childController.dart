import 'package:childrensdiary/models/child.dart';
import 'package:childrensdiary/utils/databaseConfig.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io';

class ChildController {
  static Database _honeyBee ;
  final String childTable = 'childTable';
  final String cloumnId = 'id';
  final String cloumnName = 'name';
  final String cloumnSex = 'sex';
  final String cloumnBirthDate = 'birthDate';
  final String cloumnImage = 'image';
  final String cloumnIsActive = 'isActive';
  final DatabaseConfig db = new DatabaseConfig();
//  final Database honeyBee = awitt db.honeyBee;
//  Future<Database> get honeyBee async{
//    if(_honeyBee != null){
//      return _honeyBee;
//    }
//    _honeyBee = await intDb();
//    return _honeyBee;
//  }
//
//  intDb() async {
//    Directory appDirectory = await getApplicationDocumentsDirectory();
//    String path = join(appDirectory.path , 'honeyBee.db');
//    var myOwnDb = await openDatabase(path,version: 1,
//    onCreate: _oncreate );
//    return myOwnDb;
//  }
//  void _oncreate(Database db,int newVersion) async{
//    var sql = "CREATE TABLE $childTable ($cloumnId INTEGER PRIMARY KEY ,"
//    "$cloumnName TEXT,$cloumnSex TEXT,$cloumnBirthDate INTEGER,$cloumnImage TEXT,$cloumnIsActive INTEGER)";
//    await db.execute(sql);
//  }

  Future<int> saveChild(Child child) async{
    var dbClient = await db.honeyBee;
    int result = await dbClient.insert("$childTable", child.toMap());
    return result;
  }

  Future<List> getAllChild() async{
    var dbClient = await db.honeyBee;
    var sql ="SELECT * FROM $childTable";
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }

  Future<int> getChildCount () async{
    var dbClient = await db.honeyBee;
    var sql ="SELECT COUNT(*) FROM $childTable";
    return Sqflite.firstIntValue(
      await dbClient.rawQuery(sql)
    );
  }

  Future<Child> getChild (int id) async{
    var dbClient = await db.honeyBee;
    var sql ="SELECT * FROM $childTable WHERE $cloumnId = $id";
    var result = await dbClient.rawQuery(sql);
    if(result.length == 0) return null;
    return new Child.fromeMap(result.first);
  }

  Future<int> updateChild(Child child) async{
    var dbClient = await db.honeyBee;
    return await dbClient.update(
        childTable, child.toMap(),where: "$cloumnId",whereArgs: [child.id]
    );
  }

  Future<int> deleteChild(Child child) async{
    var dbClient = await db.honeyBee;
    Child dChild = new Child(child.name, child.sex, child.birthDate, child.image, 0);
    return await dbClient.update(
        childTable, dChild.toMap(),where: "$cloumnId",whereArgs: [child.id]
    );
  }

   close() async{
    var dbClient = await db.honeyBee;
    return await dbClient.close();
  }
}