

import 'package:bmi_honey_bee/bmimodel/bmimodels.dart';
import 'package:bmi_honey_bee/controller/desccontroller.dart';
import 'package:bmi_honey_bee/model/descriptor.dart';
import 'package:bmi_honey_bee/utils/Database.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bmi_honey_bee/pages/bmi2.dart';


class Bmi1 extends StatefulWidget  {

  @override
  _Bmi1State createState() => _Bmi1State();

}
class _Bmi1State extends State<Bmi1> {
  DescController db = new DescController();

  int count =0;
  String value;//weight
  String val;//height
  String sbmi='';

  double result = 0;
  BmiModel _bmiModel;
  double res = 0;
  double reso =0 ;

  TextEditingController _heightController;
  TextEditingController _weightController ;

  DateTime now = DateTime.now();

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _heightController = new TextEditingController(text: "");
    _weightController = new TextEditingController(text: "");
  }


  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.yellow[700],
              title: Row(
                children: [
                  Center(
                    child: Image.asset("images/group.png",)),
                  SizedBox(width: 10,),
                  Expanded(child:  Text('BMI' ,style: TextStyle(
                    color: Colors.black,
                  ),
                  ),),

                ],
              ),

            ),

            body:ListView(
              children: <Widget>[
              Container(
                height: 600,
                color: Colors.grey[200],

                child: Center(
                  child: Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,

                    child: Card(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Center(
                            child: Column(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center, children: [
                                  Padding(padding: EdgeInsets.all(10)),
                                  Expanded(flex:1,
                                      child: Text("أدخل الطول",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)),
                                    Expanded(
                                    child: Padding(padding: EdgeInsets.only(top:20, left: 0, right: 0),
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1,color: Colors.amber),
                                            boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,
                                            )],
                                            color: Colors.white,
                                          ),
                                          child: TextFormField(
                                              controller:_heightController,
                                              keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(14),
                                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.amber),
                                              ),
                                            ),
                                            ),
                                        ),
                                        )),
                                  Padding(padding: EdgeInsets.all(10)),
                                  Expanded(flex:1,child: Text("سم",style: TextStyle(fontSize: 16),))
                                ],
                                ),


                                Padding(padding: EdgeInsets.only(top: 30)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(padding: EdgeInsets.all(10)),
                                    Expanded(flex:1,child: Text(" أدخل الوزن", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),)),

                                    Expanded(
                                      child: Padding(
                                          padding: const EdgeInsets.only(top:20, left: 0, right: 0),
                                            child: Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                border: Border.all(width: 1,color: Colors.amber),
                                                boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,
                                                )
                                                ],
                                                color: Colors.white,
                                              ),
                                              child: TextFormField(
                                                controller:_weightController,
                                                keyboardType: TextInputType.number,
                                                decoration: InputDecoration(
                                                 contentPadding: EdgeInsets.all(14),
                                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.yellow[600]),
                                                  ),
                                                ),

                                                ),
                                            )),
                                            ),

                                    Padding(padding: EdgeInsets.all(10)),

                                    Expanded(flex:1,child: Text("كغ",style: TextStyle(fontSize: 16),))
                                  ],
                                ),

                                Container(
                                  margin: EdgeInsets.only(top:60,left: 120),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FlatButton(
                                        child: Text("احسب",style: TextStyle(fontSize: 15,color: Colors.white),),
                                        color: Colors.blue[700],
                                        onPressed: () async {
                                          calculateBMI();
                                          result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return Bmi2(bmiModel: _bmiModel);
                                          }));
                                        },

                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),


                          ),


                        ],
                      ),
                    ),
                  ),
                ),),



            ],)),),
    );
  }
  void calculateBMI() async {

    setState(()  {
      double height = double.parse(_heightController.text)/100 ;
      double weight = double.parse(_weightController.text);

      double heightSquare = height * height;
      double result = weight / heightSquare;

      double res = heightSquare * 18.5;
      double reso = heightSquare * 25 ;

      result = result ;
      res = res;
      reso = reso;

      if(result >= 18.5 && result <= 25 ){
        _bmiModel = BmiModel(result: result, isNormal: true, comment: "وزن صحي", res: res, reso: reso, wight:_weightController.text, length: _heightController.text );

      }else
      if(result < 18.5){
        _bmiModel = BmiModel(result: result, isNormal: true, comment: "نحيف", res: res, reso: reso, wight:_weightController.text, length: _heightController.text );

      }else
      if(result > 25 && result<= 30){
        _bmiModel = BmiModel(result: result, isNormal: true, comment: "وزن زائد", res: res, reso: reso, wight:_weightController.text, length: _heightController.text );        }
      else
      {
        _bmiModel = BmiModel(result: result, isNormal: true, comment: "سمنة مفرطة", res: res, reso: reso, wight:_weightController.text, length: _heightController.text );
      }
     sbmi = result.toStringAsFixed(2);
    });

    int a =await db.saveDesc(
        CardInfo(
          length:_bmiModel.length ,
          wight:_bmiModel.wight ,
          bmi:sbmi,
          datt:now.toString()
              .substring(0,16),
          comment:_bmiModel.comment,
        ));
        print(a);
       }
}