import 'package:bmi_honey_bee/model/descriptor.dart';
import 'package:bmi_honey_bee/utils/Database.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DescController {
  static Database _honeyBee ;
  final String DescTable = 'DescTable';
  final String cloumnId = 'id';
  final String cloumnHeight = 'height';
  final String cloumnWeight = 'weight';
  final String cloumnBmi = 'bmi';
  final String cloumnDate = 'date';
  final DatabaseConfig db = new DatabaseConfig();


  Future<int> saveDesc(Descriptors descriptors) async{
    var dbClient = await db.honeyBee;
    int result = await dbClient.insert("$DescTable", descriptors.toMap());
    return result;
  }

  Future<List> getAllDesc() async{
    var dbClient = await db.honeyBee;
    var sql ="SELECT * FROM $DescTable";
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }

  Future<int> getDescCount () async{
    var dbClient = await db.honeyBee;
    var sql ="SELECT COUNT(*) FROM $DescTable";
    return Sqflite.firstIntValue(
        await dbClient.rawQuery(sql)
    );
  }

  Future<Descriptors> getDesc (int id) async{
    var dbClient = await db.honeyBee;
    var sql ="SELECT * FROM $DescTable WHERE $cloumnId = $id";
    var result = await dbClient.rawQuery(sql);
    if(result.length == 0) return null;
    return new Descriptors.fromeMap(result.first);
  }


  Future<int> deleteDesc(int id) async{
    var dbClient = await db.honeyBee;
    return await dbClient.delete(DescTable
      ,where: "$cloumnId",whereArgs: [id]
    );
  }

  close() async{
    var dbClient = await db.honeyBee;
    return await dbClient.close();
  }
}