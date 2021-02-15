import 'package:clock_app/models/MedicineInfo.dart';
import 'package:clock_app/services/cardinfoService.dart';
import 'package:clock_app/services/medicineDayService.dart';
import 'package:clock_app/services/medicineViewService.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class MedicineViewController {
  final MedicineView _medicineView  =  MedicineView();

  Future<int> insertRecordMedicine(MedicineInfo medicine) async {
    return this._medicineView.insertRecordMedicine(medicine);
  }
  Future<List<Map<String,dynamic>>> getInfo(table) async {
    return this._medicineView.getInfo(table);

  }
  Future<List<MedicineInfo>> getselectRMedicine(String name) async {
    return this._medicineView.getselectRMedicine(name);

  }

}