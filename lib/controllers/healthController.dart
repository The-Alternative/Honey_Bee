import 'package:childrensdiary/models/child.dart';
import 'package:childrensdiary/models/health.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io';
import 'package:childrensdiary/utils/databaseConfig.dart';

class HealthController {
//  static Database _honeyBee ;
  final String healthTable = 'healthTable';
  final String cloumnId = 'id';
  final String cloumnName = 'name';
  final String cloumnNote = 'note';
  final String cloumnTall = 'tall';
  final String cloumnWeight = 'weight';
  final String cloumnTempreture = 'tempreture';
  final String cloumnIsActive = 'isActive';
  final String cloumnCreatedDate = 'createdDate';
  final String cloumnChildId = 'childId';
  final DatabaseConfig db = new DatabaseConfig();

//  Future<Database> get honeyBee async{
//
//      return _honeyBee;
//    }
//    _honeyBee = await intDb();
//    return _honeyBee;
//  }
//
//  intDb() async {
//    Directory appDirectory = await getApplicationDocumentsDirectory();
//    String path = join(appDirectory.path , 'honeyBee1.db');
//    var myOwnDb = await openDatabase(path,version: 1,
//        onCreate: _oncreate );
//    return myOwnDb;
//  }
//  void _oncreate(Database db,int newVersion) async{
//    var sql = "CREATE TABLE $healthTable ($cloumnId INTEGER PRIMARY KEY ,"
//        "$cloumnName TEXT , $cloumnNote TEXT , $cloumnTall INTEGER , $cloumnWeight INTEGER , $cloumnTempreture INTEGER , $cloumnIsActive INTEGER , $cloumnCreatedDate INTEGER , $cloumnChildId INTEGER ,FOREIGN KEY ($cloumnChildId) REFERENCES childTable (id))";
//    await db.execute(sql);
//  }

  Future<int> saveHealth(Health health) async{
    var dbClient = await db.honeyBee;
    int result = await dbClient.insert("$healthTable", health.toMap());
    return result;
  }

  Future<List> getAllHealth() async{
    var dbClient = await db.honeyBee;
    var sql ="SELECT * FROM $healthTable";
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }

  Future<int> getHealthCount () async{
    var dbClient = await db.honeyBee;
    var sql ="SELECT COUNT(*) FROM $healthTable";
    return Sqflite.firstIntValue(
        await dbClient.rawQuery(sql)
    );
  }

  Future<Health> getHealth (int id) async{
    var dbClient = await db.honeyBee;
    var sql ="SELECT * FROM $healthTable WHERE $cloumnId = $id";
    var result = await dbClient.rawQuery(sql);
    if(result.length == 0) return null;
    return new Health.fromeMap(result.first);
  }

  Future<int> updateChild(Health health) async{
    var dbClient = await db.honeyBee;
    return await dbClient.update(
        healthTable, health.toMap(),where: "$cloumnId",whereArgs: [health.id]
    );
  }

  Future<int> deleteHealth(Health health) async{
    var dbClient = await db.honeyBee;
    Health dHealth = new Health(health.name, health.note, health.tall, health.weight, health.tempreture,
        0, health.childId, health.createdDate);
    return await dbClient.update(
        healthTable, dHealth.toMap(),where: "$cloumnId",whereArgs: [health.id]
    );
  }

  close() async{
    var dbClient = await db.honeyBee;
    return await dbClient.close();
  }
}