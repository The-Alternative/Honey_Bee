

import 'package:bmi_honey_bee/bmimodel/bmimodels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bmi_honey_bee/pages/bmi2.dart';
import 'package:bmi_honey_bee/pages/bmi3.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bmi_honey_bee/utils/DatabaseConf.dart';
import 'package:bmi_honey_bee/models/contact.dart';
import 'dart:async';


class Bmi1 extends StatefulWidget {



  @override
  _Bmi1State createState() => _Bmi1State();

}
class _Bmi1State extends State<Bmi1> {

//  DatabaseConfig config = new DatabaseConfig();
  List<Contact> contactlist;

  int count =0;
  String value;
  String val;

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double result = 0;
  BmiModel _bmiModel;
  double res = 0;
  double reso =0 ;

  void _onItemTapped(int index) {
    setState(() {
     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bmi1()));

    });}

  @override
  Widget build(BuildContext context) {


    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Directionality(textDirection: TextDirection.rtl,
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(child: Text("حساب BMI",style:TextStyle(color: Colors.black)),),
                    Tab(child: Text("سجلات ",style:TextStyle(color: Colors.black)),)
                  ],
                ),
          toolbarHeight: 110,
          backgroundColor: Colors.yellow[700],
             title: Row(
              children: [
              Center(child: Image.asset("images/group.png",)),
              SizedBox(width: 10,),
              Expanded(child:  Text('BMI' ,style: TextStyle(
                color: Colors.black,
              ),
              ),),

            ],
          ),

        ),

             body:Padding(
               padding: EdgeInsets.only(top: 15.0,left: 10.0,right: 10.0),
                child: TabBarView(
               children: [
             SingleChildScrollView(
              child:
                Center(
                  child: Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(image: DecorationImage(
                      image: AssetImage("images/body.png",),
                      alignment: Alignment.bottomCenter,
                  ),
                  ),

                  child: Container(
                    margin: EdgeInsets.only(right:11 ,left: 11),
                    child: Column(
                     children: [
                       SizedBox(height: 60,),
                       Center(
                       child: Container(
                         margin: EdgeInsets.only(top: 60,right:11 ,left: 11),
                         height: 280,
                         width: 330,

                                 child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center, children: [
                                            Padding(padding: EdgeInsets.all(10)),
                                            Expanded(flex:1,child: Text("أدخل الوزن",style: TextStyle(fontSize: 16),)),
                                            SizedBox(width: 20,),

                                            Expanded(flex: 1, child: Container(
                                              height: 35,
                                              decoration: BoxDecoration(
                                                border: Border.all(width: 1,color: Colors.orange[100]),
                                                boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,
                                                    )],
                                                // borderRadius:BorderRadius.circular(5),
                                                color: Colors.white,
                                              ),
                                              child: TextFormField(
                                                controller: _weightController,
                                                keyboardType: TextInputType.number,
                                                decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.all(14),
                                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange[100])),
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.orange[100]),
                                                  ),
                                                ),
                                                onChanged: (text){
                                                  value = text;
                                                },
                                              ),
                                            )
                                            ),
                                            SizedBox(width: 10,),
                                            Padding(padding: EdgeInsets.all(10)),
                                            Expanded(flex:1,child: Text("كغ",style: TextStyle(fontSize: 16),))
                                              ],
                                            ),


                                          Padding(padding: EdgeInsets.only(top: 30)),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Padding(padding: EdgeInsets.all(10)),
                                              Expanded(flex:1,child: Text("أدخل الطول",style: TextStyle(fontSize: 16),)),
                                              SizedBox(width: 20,),

                                              Expanded(flex: 1, child: Container(
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  border: Border.all(width: 1,color: Colors.orange[100]),
                                                  boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,
                                                  )],

                                                  color: Colors.white,
                                                ),
                                                child: TextFormField(
                                                  controller: _heightController,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.all(14),
                                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange[100])),
                                                    enabledBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.orange[100]),
                                                    ),
                                                  ),
                                                  onChanged: (text){
                                                    val = text;
                                                  },
                                                ),
                                              )
                                              ),
                                            SizedBox(width: 10,),
                                            Padding(padding: EdgeInsets.all(10)),
                                            Expanded(flex:1,child: Text("سم",style: TextStyle(fontSize: 16),))
                                            ],
                                          ),

                                          Container(
                                           margin: EdgeInsets.only(top:120,left: 110),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                               FlatButton(
                                                  child: Text("احسب",style: TextStyle(fontSize: 15,color: Colors.white),),
                                                  color: Colors.blue[700],
                                                  onPressed: (){
                                                    calculateBMI();
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Bmi2(
                                                      bmiModel: _bmiModel,
                                                      value:value,
                                                      val: val,
                                                    )
                                                    )
                                                    );
                                                  },

                                                ),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    // ),

                                  // ),
                                // ],


                         ),
                       ),

                     ],
               ),
                  ),
                ),),),
                Text("data"),
                // getContactList(),
          ],
        ),),


             bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Center(
                    child: Image(image: AssetImage('images/hom.png'),)),
               label: "home"
            ),

          ],
          onTap: _onItemTapped,
        ),
      ),),)
    );
  }
  void calculateBMI() {

    setState(() {
      double height = double.parse(_heightController.text)/100 ;
      double weight = double.parse(_weightController.text);

      double heightSquare = height * height;
      double res = heightSquare *18.5;
      double reso =heightSquare * 25 ;
      double result = weight / heightSquare;
      result = result;
      res = res;
      reso = reso;

       if(result >= 18.5 && result <= 25 ){
         _bmiModel = BmiModel(result: result,isNormal: true, comment: "وزن صحي",res: res,reso: reso,);
      }else
        if(result < 18.5){
          _bmiModel =BmiModel(result: result,isNormal: true,comment: "نحيف ",res: res,reso: reso);
        }else
        if(result > 25 && result<= 30){
          _bmiModel =BmiModel(result: result,isNormal: true,comment: "وزن زائد",res: res,reso: reso);
        }else
       {
          _bmiModel =BmiModel(result: result,isNormal: true,comment: "سمنة مفرطة ",res: res , reso: reso);
        }
    });

  }
}
