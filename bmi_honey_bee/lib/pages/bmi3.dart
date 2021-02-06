
import 'package:bmi_honey_bee/controller/desccontroller.dart';
import 'package:bmi_honey_bee/pages/bmi1.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:bmi_honey_bee/pages/bmi3.dart';
import 'package:bmi_honey_bee/utils/Database.dart';
import 'package:bmi_honey_bee/model/descriptor.dart';

List myDesc ;
class Bmi3 extends StatefulWidget {


  @override
  _Bmi3State createState() => _Bmi3State();
}

class _Bmi3State extends State<Bmi3> {
  DescController db = new DescController();

  @override
  void initState() {
    //  TODO: implement initState
    super.initState();
    db.getAllDesc();
    for (int i = 0; i < myDesc.length; i++) {
      Descriptors descriptors = Descriptors.map(myDesc[i]);
      print('height:${descriptors.height} - weight:${descriptors.weight}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Directionality(textDirection: TextDirection.rtl,
          child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 60, backgroundColor: Colors.yellow[700],
                title: Row(
                  children: [
                    Image.asset("images/group.png",),
                    SizedBox(width: 10,),
                    Text('BMI', style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    ),
                  ],
                ),
              ),

              body: new ListView.builder(
                  itemCount: myDesc.length,
                  itemBuilder: (BuildContext context, int position) {
                    return Card(
                      child: ListTile(
                        title: Card(
                          child: ListTile(

                            title: Row(
                              children: [
                                Expanded(flex: 1, child: Text("الوزن")),
                                Expanded(flex: 1, child: Text("الطول")),
                                Expanded(flex: 1, child: Text("BMI")),
                                Expanded(flex: 1, child: Text('${Descriptors.fromeMap(myDesc[position]).date}')),

                              ],
                            ),

                            subtitle: Card(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text('${Descriptors
                                      .fromeMap(myDesc[position])
                                      .weight}')),
                                  Expanded(flex: 1, child: Text('${Descriptors
                                      .fromeMap(myDesc[position])
                                      .height}')),
                                  Expanded(flex: 1, child: Text('${Descriptors
                                      .fromeMap(myDesc[position])
                                      .bmi}')),

                                ],
                              ),

                            ),
                            trailing: GestureDetector(child:
                            Icon(Icons.delete),
                              onTap: () {},
                            ),
                          ),),),);
                  })
          ),

        ));
  }

}