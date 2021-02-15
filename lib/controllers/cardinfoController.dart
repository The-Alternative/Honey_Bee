
import 'package:clock_app/models/MedicineInfo.dart';
import 'package:clock_app/services/cardinfoService.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class CardinfoController {

  final CardinfoService _cardinfoService =  CardinfoService();

  Future<List<MedicineInfo>> getSelectCards(String name) async{
    return this._cardinfoService.getAllTimes(name);
  }

}