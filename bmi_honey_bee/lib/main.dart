

import 'package:bmi_honey_bee/pages/bmi2.dart';
import 'package:bmi_honey_bee/pages/bmi3.dart';
import 'package:bmi_honey_bee/pages/bmi4.dart';
import 'package:bmi_honey_bee/pages/bmi5.dart';
// import 'package:bmi_honey_bee/size_config.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bmi_honey_bee/pages/bmi1.dart';


import 'home.dart';


void main() {
  runApp(DevicePreview(builder: (context) => MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var mediaQueryData = MediaQuery.of(context);
    // final screenHeight =MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    // return LayoutBuilder(builder: (context , constraints){
    //
    // return OrientationBuilder(builder: (context, orientation){
    //   SizeConfig().init(constraints, orientation);

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
        'Bmi4' :(context){
        return Bmi4();
        },
        'Bmi5':(context){
        return Bmi5();
        },

      },
    );

    }
}







