import 'package:childrensdiary/models/childHabit.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:childrensdiary/utils/databaseConfig.dart';

class ChildHabitController {

  final String childHabitTable = 'childHabitTable';
  final String cloumnId = 'id';
  final String cloumnIsActive = 'isActive';
  final String cloumnCreatedDate = 'createdDate';
  final String cloumnHabitId = 'habitId';
  final String cloumnChildId = 'childId';
  final DatabaseConfig db = new DatabaseConfig();

  Future<int> saveChildHabit(ChildHabit childHabit) async{
    var dbClient = await db.honeyBee;
    int result = await dbClient.insert("$childHabitTable", childHabit.toMap());
    return result;
  }

  Future<List> getAllChildHabits() async{
    var dbClient = await db.honeyBee;
    var sql ="SELECT * FROM $childHabitTable";
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }

  Future<List> getNegativeChildHabits(int id) async{
    var dbClient = await db.honeyBee;
    var sql ="SELECT * FROM $childHabitTable WHERE $cloumnChildId=$id";
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }

  Future<List> getPositiveChildHabits(int id) async{
    var dbClient = await db.honeyBee;
    var sql ="SELECT * FROM $childHabitTable WHERE $cloumnChildId=$id";
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }

  Future<int> getChildHabitsCount () async{
    var dbClient = await db.honeyBee;
    var sql ="SELECT COUNT(*) FROM $childHabitTable";
    return Sqflite.firstIntValue(
        await dbClient.rawQuery(sql)
    );
  }

  Future<List> getChildHabits (int id) async{
    var dbClient = await db.honeyBee;
    var sql ="SELECT * FROM $childHabitTable WHERE $cloumnChildId = $id";
    var result = await dbClient.rawQuery(sql);
    if(result.length == 0) return null;
    return result.toList();
  }
//  Future<List> getChildHabitss (int id) async{
//    var dbClient = await db.honeyBee;
//    var sql ="SELECT * FROM $childHabitTable whe";
//    var result = await dbClient.rawQuery(sql);
//    if(result.length == 0) return null;
//    return result.toList();
//  }

  Future<int> updateChildHabit(ChildHabit childHabit) async{
    var dbClient = await db.honeyBee;
    return await dbClient.update(
        childHabitTable, childHabit.toMap(),where: "$cloumnId",whereArgs: [childHabit.id]
    );
  }

  Future<int> deleteChildHabit(ChildHabit childHabit) async{
    var dbClient = await db.honeyBee;
    ChildHabit dchildhabit = new ChildHabit(0, childHabit.habitId, childHabit.childId, childHabit.createdDate);
    return await dbClient.update(
        childHabitTable, dchildhabit.toMap(),where: "$cloumnId",whereArgs: [childHabit.id]
    );
  }

  close() async{
    var dbClient = await db.honeyBee;
    return await dbClient.close();
  }
}