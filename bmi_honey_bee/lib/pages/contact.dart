import 'package:bmi_honey_bee/home.dart';
import 'dart:async';

class Contact {
  int id;
  String name;
  double average;
  Contact(this.id,this.name,this.average);
  Map<String,dynamic> toMap(){
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'average':average,
    };
    return map;
  }
  Contact.fromMap( Map <String, dynamic> map){
    id = map['id'];
    name = map['name'];
    average = map['average'];
  }
}