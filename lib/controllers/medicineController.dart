import 'package:clock_app/models/MedicineInfo.dart';
import 'package:clock_app/services/cardinfoService.dart';
import 'package:clock_app/services/medicineDayService.dart';
import 'package:clock_app/services/medicineService.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class MedicineController {

  final MedicineService _medicineinfoService = MedicineService();


  Future<int> insert(medicine) async {
    return this._medicineinfoService.insert_medicine(medicine);
  }

  Future<int> deleteMedicine(int id) async {
    return this._medicineinfoService.deleteMedicine(id);
  }

  Future<int> deleteselectedMedicine( medicineInfo) async {
    return this._medicineinfoService.deleteselectedMedicine(medicineInfo);
  }

  Future<List<MedicineInfo>> getFMedicine() async {
    return this._medicineinfoService.getFMedicine();

  }

  Future<List<MedicineInfo>> getselectMedicine( name) async {
    return this._medicineinfoService.getselectMedicine(name);

  }

}