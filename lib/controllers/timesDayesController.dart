import 'package:clock_app/models/MedicineInfo.dart';
import 'package:clock_app/models/MedicineTimes.dart';
import 'package:clock_app/services/cardinfoService.dart';
import 'package:clock_app/services/timesDayesService.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class TimesDayesController {

  final TimesDayesService _timesDayesService =  TimesDayesService();

  Future<List<MedicineTimes>> getDayTimesList() async {
    return this._timesDayesService.getDayTimesList();
  }
  Future<int> insert_DayTimes(MedicineTimes medicineTimes) async {
    return this._timesDayesService.insert_DayTimes(medicineTimes);

  }
  Future<int> deleteDayTimes( id,  day) async {
    return this._timesDayesService.deleteDayTimes(id, day);

  }
}