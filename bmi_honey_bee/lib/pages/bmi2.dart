// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Bmi2 extends StatefulWidget {
  @override
  _Bmi2State createState() => _Bmi2State();
}

class _Bmi2State extends State<Bmi2> {
  double _heightOfUser = 100.0;
  double _weightOfUser = 40.0;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
        Directionality(textDirection: TextDirection.rtl,child:
          Scaffold(
           appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.yellow[700],
            title: Row(
              children: [
                Image.asset("images/group.png",),
                SizedBox(width: 10,),
                Expanded(child:  Text('BMI' ,style: TextStyle(color: Colors.black,),),),
              ],
            ),
           ),

        body:SingleChildScrollView(child:
           Container(
             padding: EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.height,
             width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                   Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("الوزن"),
                      SizedBox(width: 80,),
                      Text("الطول"),
                      SizedBox(width: 80,),
                      Text("BMI"),

                    ],

                  ),

                  Container(
                    width: 300,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex: 1,child:
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.5,color: Colors.orange[100]),
                            boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,)],
                            borderRadius:BorderRadius.circular(5),
                            color: Colors.white,
                          ),

                          child: TextFormField(
                            readOnly: true,

                          ),
                        )),
                        SizedBox(width: 30,),
                        Expanded(flex: 1,child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.5,color: Colors.orange[100]),
                            boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,)],
                            borderRadius:BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child:
                          TextFormField(
                            readOnly: true,
                          ),
                        )),
                        SizedBox(width: 30,),

                        Expanded(flex: 1,child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.5,color: Colors.orange[100]),
                            boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,)],
                            borderRadius:BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child:
                          TextFormField(
                            readOnly: true,
                          ),
                        ))

                      ],

                    ),
                  ),

                 SizedBox(height: 20,),
                 Center(
                  child: Container(
                       padding: EdgeInsets.only(right: 11,left: 11),
                       height: 250,width: 300,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         boxShadow:[ BoxShadow(color: Colors.orange[100],spreadRadius: .1,)],
                       ),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top:10,left: 11,right: 11),
                      child: Column(
                          children: [
                            Form(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("نتائج القياسات الشخصية",textAlign: TextAlign.center,),

                                      Row(
                                        children: [
                                          Padding(padding: EdgeInsets.all(5)),
                                          Expanded(flex:2,child: Text("مؤشر كتلة الجسم الحالي",style: TextStyle(fontSize: 13),)),
                                          Expanded(flex:1,child: TextFormField(
                                            readOnly: true,
                                          ))
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Padding(padding: EdgeInsets.all(5)),
                                          Expanded(flex:2,child: Text("معدل مؤشر كتلة الجسم الصحي",style: TextStyle(fontSize: 13),)),
                                          Expanded(flex:1,child: TextFormField(
                                            readOnly: true,
                                          ))
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Padding(padding: EdgeInsets.all(5)),
                                          Expanded(flex:2,child: Text("الوضع الصحي",style: TextStyle(fontSize: 13),)),
                                          Expanded(flex:1,child: TextFormField(
                                            readOnly: true,
                                          ))
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Padding(padding: EdgeInsets.all(5)),
                                          Expanded(flex:2,child: Text("يفضل أن يكون وزنك بين",style: TextStyle(fontSize: 13),)),
                                          Expanded(flex:1,child: TextFormField(
                                            readOnly: true,

                                          ))
                                        ],
                                      ),
                                    ]
                                )
                            ),

                          ]

                      ),

                    ),
                  ),
                 ),
                SizedBox(height: 20,),

                Text("هل تود الاضافة الى سجل المراقبة BMI ؟",style: TextStyle(),textAlign:TextAlign.center),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      child: Text("الغاء الأمر"),color: Colors.white,
                      onPressed: (){
                        return Navigator.of(context).pop();
                        },
                    ),

                    SizedBox(width: 40,),

                    RaisedButton(
                      child: Text("موافق"),color: Colors.white,
                      onPressed: (){
                        Navigator.of(context).pushNamed('Bmi3');
                        },
                    )
                  ],
                ),
              ]
            ),
           ),
          )
        ),)
     );
  }
}
