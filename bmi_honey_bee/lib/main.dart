import 'package:bmi_honey_bee/pages/bmi2.dart';
import 'package:bmi_honey_bee/pages/bmi3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bmi_honey_bee/pages/bmi1.dart';

import 'controller/desccontroller.dart';
import 'model/descriptor.dart';


void main(){

  runApp(MyApp(),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Bmi1(),
    );

    }
}







