import 'package:clock_app/services/cardinfoService.dart';
import 'package:clock_app/services/diagonService.dart';
import 'dart:async';

class DiagonController {

  final DiagonService _diagonService =  DiagonService();

  Future<int> insertDiagon(diagon ) async{
    return this._diagonService.insertDiagon(diagon);
  }

}