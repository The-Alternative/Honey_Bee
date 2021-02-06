
import 'dart:ui';
import 'package:bmi_honey_bee/model/descriptor.dart';
import 'package:bmi_honey_bee/pages/bmi1.dart';
import 'package:bmi_honey_bee/pages/bmi3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:bmi_honey_bee/utils/Database.dart';

class Bmi2 extends StatefulWidget{
  final Descriptors descriptors;
  String value;
  String val;
  final bmiModel;
  Bmi2( {this.bmiModel,this.value, this.val,this.descriptors});


  @override
  _Bmi2State createState() => _Bmi2State(value: value,val: val);
}

class _Bmi2State extends State<Bmi2> {

   String value;
  String val;
_Bmi2State({this.value,this.val});




  void _onItemTapped(int index) {
    setState(() {
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bmi1()));
    });
  }

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
       debugShowCheckedModeBanner: false,
       home:
       Directionality(
         textDirection: TextDirection.rtl,
         child:
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

         body: Container(
           alignment:Alignment.center,
              color: Colors.grey[200],
              padding: EdgeInsets.only(top: 40),
              height:MediaQuery.of(context).size.height,
              width:MediaQuery.of(context).size.width,
             child: Column(
               children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       SizedBox(width: 25,),
                       Padding(padding: EdgeInsets.all(10)),
                       Expanded(flex: 3,child:  Text("الوزن(كغ)"),),

                       SizedBox(width: 10,),
                       Padding(padding: EdgeInsets.all(10)),
                       Expanded(flex: 3,child:   Text("الطول(سم)"),),
                       Padding(padding: EdgeInsets.all(10)),

                       SizedBox(width: 30,),
                       Expanded(flex: 3,child: Text("BMI"),)


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
                                   child: Text(val),)
                           )
                           ),

                         SizedBox(width: 30,),

                         Expanded(flex: 1,child: Container(
                           height: 35,
                           decoration: BoxDecoration(
                             border: Border.all(width: 0.5,color: Colors.orange[100]),
                             boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,)],
                             color: Colors.white,
                           ),

                           child: Center(
                             child: Text( "${widget.bmiModel.result.toStringAsFixed(2)}",
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
                        height: 304,width: 320,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow:[ BoxShadow(color: Colors.orange[100],spreadRadius: .1,)],
                        ),
                     child: Container(
                       height: MediaQuery.of(context).size.height,
                       width: MediaQuery.of(context).size.width,
                       child: Column(
                           children: [
                             Form(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Padding(padding: EdgeInsets.only(top: 20)),
                                       Text("نتائج القياسات الشخصية",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w900),),

                                       SizedBox(height: 20,),
                                       Divider(color: Colors.yellow[700],),
                                       SizedBox(height: 10,),
                                       Row(
                                         children: [
                                           Padding(padding: EdgeInsets.all(5)),
                                           Expanded(flex:2,child: Text("مؤشر كتلة الجسم الحالي",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),)),
                                           Padding(padding: EdgeInsets.all(5)),
                                           Expanded(flex:1,
                                            child: Center(
                                              child: Text("${widget.bmiModel.result.toStringAsFixed(2)}",
                                                style: TextStyle(fontSize: 13,fontWeight: FontWeight.w900,
                                                  color: color(),)

                                           ),
                                            )
                                           ),

                                         ],
                                       ),
                                       SizedBox(height: 10,),
                                       Divider(color: Colors.yellow[700],),
                                       SizedBox(height: 10,),
                                       Row(
                                         children: [
                                           Padding(padding: EdgeInsets.all(5)),
                                           Expanded(flex:2,child: Text("معدل مؤشر كتلة الجسم الصحي",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),)),

                                           Expanded(flex:1,child: Center(
                                             child: Text("25-18.5 كجم/م" ,style: TextStyle(fontSize: 13),
                                             ),
                                           ))
                                         ],
                                       ),
                                       SizedBox(height: 10,),
                                       Divider(color: Colors.yellow[700],),
                                      SizedBox(height: 10,),
                                       Row(
                                         children: [
                                           Padding(padding: EdgeInsets.all(5)),

                                           Expanded(flex:2,child: Text("الوضع الصحي",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),)),
                                           SizedBox(width: 10,),
                                           Expanded(flex:1,
                                               child: Center(

                                                   child: Text("${widget.bmiModel.comment}",

                                                     style: TextStyle(fontSize: 13,
                                                       fontWeight: FontWeight.w900,
                                                       color: color(),
                                                     ),
                                                   )
                                               ),
                                           )
                                         ],
                                       ),
                                       SizedBox(height: 10,),
                                       Divider(color: Colors.yellow[700],),
                                       SizedBox(height: 10,),
                                       Row(
                                         children: [
                                           Padding(padding: EdgeInsets.all(5)),
                                           Expanded(flex:2,child: Text("يفضل أن يكون وزنك بين",
                                             style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),)),
                                          // SizedBox(width: 16,),
                                           Expanded(flex:1,

                                            child: Center(
                                              child: Text("${widget.bmiModel.reso.toStringAsFixed(2)}كغ"+"-"+"${widget.bmiModel.res.toStringAsFixed(2)}كغ",
                                                style: TextStyle(fontSize: 13,
                                                ),),
                                            ),
                                          )
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
                 SizedBox(height: 30,),

                     FlatButton(
                       child: Text("موافق",style: TextStyle(color: Colors.white),),
                       color: Colors.blue[700],
                       onPressed: (){


                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bmi3()));
                         },


                     )
                   ],
                 ),

           ),
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
       ),));
  }
Color color(){
    if(widget.bmiModel.result >=18.5 && widget.bmiModel.result <=25){
      return Colors.green;
    }else if(widget.bmiModel.result > 25 && widget.bmiModel.result <=30){
      return Colors.orange;
    }
    else if(widget.bmiModel.result > 30){
      return Colors.red;
    }
    else if(widget.bmiModel.result < 18.5){
      return Colors.blue;
    }
}
// void save() async{
// int result;
// if(descriptors.id != null){
//   result = await helper.insertDescriptors(descriptors);
// }
// if(result!=0){
//   showAlertDialog('saved','desc has been saved successfuly');
// }
// }

// void showAlertDialog(String title, String msg){
// AlertDialog alertDialog = AlertDialog(
//   title: Text(title),
//   content: Text(msg),
// );
// showDialog(context: context, builder: (_) => alertDialog);
// }
}