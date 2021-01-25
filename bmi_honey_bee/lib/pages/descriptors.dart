import 'package:bmi_honey_bee/home.dart';
import 'dart:async';

class Descriptors{
  int height;
  int weight;
  double bmi;
  double average_healthy;
  String healthy_state;
  double best;
  Descriptors(this.height,this.weight,this.bmi,this.average_healthy,this.healthy_state,this.best);
  Map<String,dynamic> toMap(){
    var map = <String, dynamic>{
      'height':height,
      'weight':weight,
      'bmi':bmi,
      'average_healthy':average_healthy,
      'healthy_state':healthy_state,
      'best':best,
    };
    return map;
  }
  Descriptors.fromMap( Map <String, dynamic> map){
    height = map['height'];
    weight = map['weight'];
    bmi = map['bmi'];
    average_healthy = map['average_healthy'];
    healthy_state = map['healthy_state'];
    best = map['best'];
  }
}
