import 'package:childrensdiary/models/habitType.dart';
import 'package:childrensdiary/service/habitTypeService.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:childrensdiary/utils/databaseConfig.dart';

class HabitTypeController {

  final HabitTypeService habitTypeService = new HabitTypeService();

  Future<int> saveHabitType(HabitType habitType) async{
    return this.habitTypeService.saveHabitType(habitType);
  }

  Future<List> getAllHabitTypes() async{
    return this.habitTypeService.getAllHabitTypes();
  }

  Future<int> getHabitTypesCount () async{
    return this.habitTypeService.getHabitTypesCount();
  }

  Future<HabitType> getHabitType (int id) async{
    return this.habitTypeService.getHabitType(id);
  }

  Future<int> updateHabitType(HabitType habitType) async{
    return this.habitTypeService.updateHabitType(habitType);
  }

  Future<int> deleteHabitType(int id) async {
    return this.habitTypeService.deleteHabitType(id);
  }

  close() async{
    return this.habitTypeService.close();
  }
}