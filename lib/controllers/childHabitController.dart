import 'package:childrensdiary/models/childHabit.dart';
import 'package:childrensdiary/service/childHabitService.dart';
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
  final ChildHabitService childHabitService = new ChildHabitService();

  Future<int> saveChildHabit(ChildHabit childHabit) async{
    return this.childHabitService.saveChildHabit(childHabit);
  }

  Future<List> getAllChildHabits() async{
    return this.childHabitService.getAllChildHabits();
  }

  Future<List> getNegativeChildHabits(int id) async{
    return this.childHabitService.getNegativeChildHabits(id);
  }

  Future<List> getNegativeChildHabit(int id,int childHabitId) async{
    return this.childHabitService.getNegativeChildHabit(id, childHabitId);
  }

  Future<List> getPositiveChildHabits(int id) async{
    return this.childHabitService.getPositiveChildHabits(id);
  }

  Future<int> getChildHabitsCount () async{
    return this.childHabitService.getChildHabitsCount();
  }

   Future<int>childHabitExist (int childId,int habitId) async {
     return this.childHabitService.childHabitExist(childId, habitId);

  }

  Future<List> getChildHabits (int id) async{
    return this.childHabitService.getChildHabits(id);
  }


  Future<int> updateChildHabit(ChildHabit childHabit) async{
    return this.childHabitService.updateChildHabit(childHabit);
  }

  Future<int> deleteChildHabit(ChildHabit childHabit) async{
    return this.childHabitService.deleteChildHabit(childHabit);
  }

  close() async{
    return this.childHabitService.close();
  }
}