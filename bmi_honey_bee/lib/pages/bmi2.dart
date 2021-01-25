

import 'package:bmi_honey_bee/pages/bmi1.dart';
import 'package:bmi_honey_bee/pages/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';



// class BMIModel{
//   double bmi;
//   bool isNormal;
//   String Comments;
//   BMIModel({this.bmi,this.isNormal,this.Comments,});
// }



class Bmi2 extends StatefulWidget{

  final bmiModel;

  const Bmi2( {this.bmiModel});

  @override
  _Bmi2State createState() => _Bmi2State();
}

class _Bmi2State extends State<Bmi2> {


  void _onItemTapped(int index) {
    setState(() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bmi1()));
    });
  }
  @override
  Widget build(BuildContext context) {

    double _heightOfUser = 100.0;
    double _weightOfUser = 40.0;
    double _bmi = 0;
    BMIModel _bmiModel;

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
         body: SingleChildScrollView(
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
                           decoration: BoxDecoration(
                             border: Border.all(width: 0.5,color: Colors.orange[100]),
                             boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,)],
                             borderRadius:BorderRadius.circular(5),
                             color: Colors.white,
                           ),
                           child: Text(""),
                         )),

                           SizedBox(width: 30,),
                           Expanded(flex: 1,child: Container(decoration: BoxDecoration(border: Border.all(width: 0.5,color: Colors.orange[100]), boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,)], borderRadius:BorderRadius.circular(5), color: Colors.white,
                             ),
                               child:Text("")
                           )),
                         SizedBox(width: 30,),

                         Expanded(flex: 1,child: Container(
                           decoration: BoxDecoration(
                             border: Border.all(width: 0.5,color: Colors.orange[100]),
                             boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,)],
                             borderRadius:BorderRadius.circular(5),
                             color: Colors.white,
                           ),

                           child: Text("${widget.bmiModel.bmi}")
                         ),
                         )
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
                                       Text("نتائج القياسات الشخصية",textAlign: TextAlign.center,),
                                       SizedBox(height: 30,),

                                       Row(
                                         children: [
                                           Padding(padding: EdgeInsets.all(5)),
                                           Expanded(flex:2,child: Text("مؤشر كتلة الجسم الحالي",style: TextStyle(fontSize: 13),)),
                                           Padding(padding: EdgeInsets.all(5)),
                                           Expanded(flex:1,
                                            child: Text(
                                             "${widget.bmiModel.bmi}",
                                           )
                                           ),

                                         ],
                                       ),
                                       SizedBox(height: 20,),
                                       Row(
                                         children: [
                                           Padding(padding: EdgeInsets.all(5)),
                                           Expanded(flex:2,child: Text("معدل مؤشر كتلة الجسم الصحي",style: TextStyle(fontSize: 13),)),
                                           Expanded(flex:1,child: Text(
                                         "${DBHelper.Average}"
                                           ))
                                         ],
                                       ),
                                       SizedBox(height: 20,),
                                       Row(
                                         children: [
                                           Padding(padding: EdgeInsets.all(5)),

                                           Expanded(flex:2,child: Text("الوضع الصحي",style: TextStyle(fontSize: 13),)),
                                           Expanded(flex:1,
                                               child: Text("${widget.bmiModel.Comments}")
                                           )
                                         ],
                                       ),
                                       SizedBox(height: 20,),
                                       Row(
                                         children: [
                                           Padding(padding: EdgeInsets.all(5)),
                                           Expanded(flex:2,child: Text("يفضل أن يكون وزنك بين",style: TextStyle(fontSize: 13),)),
                                           Text(""),
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
           ),
         bottomNavigationBar: BottomNavigationBar(
           items:  <BottomNavigationBarItem>[
             BottomNavigationBarItem(
                 icon: Icon(Icons.home_outlined,
                   size: 30,
                   color: Colors.grey,
                 ),
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