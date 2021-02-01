import 'package:bmi_honey_bee/pages/bmi2.dart';
import 'package:bmi_honey_bee/pages/bmi3.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bmi_honey_bee/pages/bmi1.dart';



void main() {
  runApp(DevicePreview(builder: (context) => MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      home: Bmi1(),
      routes: {
      'Bmi1' :(context){
        return Bmi1();
      },
        'Bmi2':(context){
        return Bmi2();
        },
        'Bmi3' :(context){
        return Bmi3();
        },

      },
    );

    }
}







