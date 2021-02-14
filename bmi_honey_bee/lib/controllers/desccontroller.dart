import 'package:bmi_honey_bee/models/bmimodels.dart';
// import 'package:bmi_honey_bee/controllers/desccontroller.dart';
import 'package:bmi_honey_bee/service/descservice.dart';
import 'dart:async';

class DescController {
  final DescService descService = new DescService();

  Future<int> saveDesc(CardInfo cardInfo) async{
    return this.descService.saveDesc(cardInfo);
  }
  Future<List<CardInfo>> getAll() async{
    return this.descService.getAll();
  }

  Future<int> deleteobj(int i) async{
    return this.descService.deleteobj(i);
  }
  close() async{
    return this.descService.close();
  }
}