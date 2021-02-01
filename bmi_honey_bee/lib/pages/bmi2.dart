import 'dart:ui';

import 'package:bmi_honey_bee/pages/bmi1.dart';
import 'package:bmi_honey_bee/utils/DatabaseConf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Bmi2 extends StatefulWidget{
  String value;
  String val;
  final bmiModel;
  Bmi2( {this.bmiModel,this.value, this.val});

  @override
  _Bmi2State createState() => _Bmi2State(value: value,val: val);
}

class _Bmi2State extends State<Bmi2> {
String value;
String val;
_Bmi2State({this.value,this.val});

  void _onItemTapped(int index) {
    setState(() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bmi1()));
    });
  }
  @override
  Widget build(BuildContext context) {

   return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Directionality(textDirection: TextDirection.rtl,
         child: Scaffold(
         appBar: AppBar(
           toolbarHeight: 60,
           backgroundColor: Colors.yellow[700],
           title: Row(
             children: [
               Center(child: Image.asset("images/group.png",)),
               SizedBox(width: 10,),
               Expanded(child:  Text('BMI' ,style: TextStyle(color: Colors.black,),),),
             ],
           ),
         ),
         body:Padding(
    padding: EdgeInsets.only(left: 10.0,right: 10.0),
        child: SingleChildScrollView(
           child:
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
                         Expanded(flex: 1,child: Container(
                           height: 35,
                           decoration: BoxDecoration(
                             border: Border.all(width: 0.5,color: Colors.orange[100]),
                             boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,)],
                             color: Colors.white,
                           ),
                           child: Center(child: Text(value)),
                         )),

                           SizedBox(width: 30,),
                           Expanded(flex: 1,child: Container(
                               height: 35,
                               decoration: BoxDecoration(
                                 border: Border.all(width: 0.5,color: Colors.orange[100]),
                                 boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,)],
                                 color: Colors.white,
                             ),
                               child:Center(
                                   child: Text(val))
                           )),
                         SizedBox(width: 30,),

                         Expanded(flex: 1,child: Container(
                           height: 35,
                           decoration: BoxDecoration(
                             border: Border.all(width: 0.5,color: Colors.orange[100]),
                             boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,)],
                           //  borderRadius:BorderRadius.circular(5),
                             color: Colors.white,
                           ),

                           child: Center(
                             child: Text( "${widget.bmiModel.result.toStringAsFixed(2)}"

                         ),
                           ),
                         ),)
                       ],
                     ),
                   ),

                  SizedBox(height: 20,),
                  Center(
                   child: Container(
                        padding: EdgeInsets.only(right: 11,left: 11),
                        height: 250,width: 310,
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
                                       Text("نتائج القياسات الشخصية",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w900),),

                                       SizedBox(height: 40,),
                                       Divider(color: Colors.yellow[700],),

                                       Row(
                                         children: [
                                           Padding(padding: EdgeInsets.all(5)),
                                           Expanded(flex:2,child: Text("مؤشر كتلة الجسم الحالي",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),)),
                                           Padding(padding: EdgeInsets.all(5)),
                                           Expanded(flex:1,
                                            child: Center(
                                              child: Text("${widget.bmiModel.result.toStringAsFixed(2)}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900),

                                           ),
                                            )
                                           ),

                                         ],
                                       ),
                                       Divider(color: Colors.yellow[700],),
                                      // SizedBox(height: 20,),
                                       Row(
                                         children: [
                                           Padding(padding: EdgeInsets.all(5)),
                                           Expanded(flex:2,child: Text("معدل مؤشر كتلة الجسم الصحي",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),)),
                                           Expanded(flex:1,child: Center(
                                             child: Text("18.5-25 كجم/م" ,style: TextStyle(fontSize: 13),
                                             ),
                                           ))
                                         ],
                                       ),
                                       Divider(color: Colors.yellow[700],),
                                     //  SizedBox(height: 20,),
                                       Row(
                                         children: [
                                           Padding(padding: EdgeInsets.all(5)),

                                           Expanded(flex:2,child: Text("الوضع الصحي",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),)),
                                           Expanded(flex:1,
                                               child: Center(child: Text("${widget.bmiModel.comment}",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w900),)),
                                           )
                                         ],
                                       ),
                                       Divider(color: Colors.yellow[700],),
                                       //SizedBox(height: 20,),
                                       Row(
                                         children: [
                                           Padding(padding: EdgeInsets.all(5)),
                                           Expanded(flex:2,child: Text("يفضل أن يكون وزنك بين",
                                             style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),)),
                                           Expanded(flex:1,
                                          child: Text("${widget.bmiModel.res.toStringAsFixed(2)}"+" - "+"${widget.bmiModel.reso.toStringAsFixed(2)}",style: TextStyle(fontSize: 13),)),
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

                 Text("هل تود الاضافة الى سجل المراقبة BMI    ؟",style: TextStyle(),textAlign:TextAlign.center),

                 SizedBox(height: 20,),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     FlatButton(
                       child: Text("الغاء الأمر"),
                       onPressed: (){
                         return Navigator.of(context).pop();
                         },
                     ),

                     SizedBox(width: 40,),

                     FlatButton(
                       child: Text("موافق"),
                       onPressed: (){
                         Navigator.of(context).pushNamed('Bmi3');
                         },


                     )
                   ],
                 ),
               ]
             ),
            ),
           ),),
         bottomNavigationBar: BottomNavigationBar(
           items:  <BottomNavigationBarItem>[
             BottomNavigationBarItem(
                 icon: Center(
                     child: Image(image: AssetImage('images/hom.png'),)),
                label: "home"
             ),
           ],
           onTap: _onItemTapped,
         ),
       ),
       )
   );
  }
}