import 'package:childrensdiary/models/habit.dart';
import 'package:childrensdiary/service/habitService.dart';
import 'dart:async';

class HabitController {

  final HabitService habitService = new HabitService();

  Future<int> savehabit(Habit habit) async{
    return this.habitService.savehabit(habit);
  }

  Future<List> getAllHabits() async{
    return this.habitService.getAllHabits();
  }

  Future<List> getNegaiveHabits() async{
    return this.habitService.getNegaiveHabits();
  }

  Future<List> getPositiveHabits() async{
    return this.habitService.getPositiveHabits();
  }

  Future<int> getHabitsCount () async{
    return this.habitService.getHabitsCount();
  }

  Future<Habit> getHabit (int id) async{
    return this.habitService.getHabit(id);
  }

  Future<int> updateHabit(Habit habit) async{
    return this.habitService.updateHabit(habit);
  }

  Future<int> deleteHabit(Habit habit) async{
    return this.habitService.deleteHabit(habit);
  }

  close() async{
    return this.habitService.close();
  }
}