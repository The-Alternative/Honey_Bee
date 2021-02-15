import 'package:clock_app/models/medicineDays.dart';
import 'package:clock_app/services/medicineDayService.dart';
import 'dart:async';

class MedicineDayController {
  final MedicineDayService _medicineDayinfoService =  MedicineDayService();

  Future<List<Map<String, dynamic>>> getmidDayesMapList() async {
    return this._medicineDayinfoService.getmidDayesMapList();
  }
  Future<int> insertDayes( days) async {
    return this._medicineDayinfoService.insertDayes(days);
  }
  Future<List<MedicineDays>> getselectmidDayesList( name) async {
    return this._medicineDayinfoService.getselectmidDayesList(name);

  }
  Future<int> updateDayTimes( medicineTimes) async {
    return this._medicineDayinfoService.updateDayTimes(medicineTimes);

  }



}