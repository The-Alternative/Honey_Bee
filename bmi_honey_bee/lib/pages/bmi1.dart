

import 'package:bmi_honey_bee/bmimodel/bmimodels.dart';
import 'package:bmi_honey_bee/controller/desccontroller.dart';
import 'package:bmi_honey_bee/model/descriptor.dart';
import 'package:bmi_honey_bee/utils/Database.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bmi_honey_bee/pages/bmi2.dart';
// import 'package:intl/intl.dart';

class Bmi1 extends StatefulWidget  {

  @override
  _Bmi1State createState() => _Bmi1State();

}
class _Bmi1State extends State<Bmi1> {
  DescController db = new DescController();


 // var db = DatabaseConfig();
  int count =0;
  String value;
  String val;


  double result = 0;
  BmiModel _bmiModel;
  double res = 0;
  double reso =0 ;

  TextEditingController _heightController;
  TextEditingController _weightController ;

  DateTime now = DateTime.now();
  String formattedDate;

  void _onItemTapped(int index) {
    setState(() {
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bmi1()));

    });}
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _heightController = new TextEditingController(text: "");
    _weightController = new TextEditingController(text: "");

    // formattedDate = DateFormat("yyyy-MM-dd hh:mm:ss").format(now);
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
              Center(child: Image.asset("images/group.png",)),
              SizedBox(width: 10,),
              Expanded(child:  Text('BMI' ,style: TextStyle(
                color: Colors.black,
              ),
              ),),

            ],
          ),

        ),

             body:
                  Container(
                    color: Colors.grey[200],
                    child: Center(
                      child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,

                      child: Container(

                        margin: EdgeInsets.only(right:11 ,left: 11),
                        child: Column(
                         children: [
                           SizedBox(height: 60,),
                           Center(
                           child: Container(
                             margin: EdgeInsets.only(top: 60,right:11 ,left: 11),
                             height: 320,
                             width: 330,
                             decoration: BoxDecoration(
                               border: Border.all(width: 0.5,color: Colors.orange[100]),
                               boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,)],
                               color: Colors.white,
                             ),


                             child: Column(
                                            children: [
                                              Padding(padding: EdgeInsets.only(top: 50)),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                Padding(padding: EdgeInsets.all(10)),
                                                Expanded(flex:1,child: Text("أدخل الوزن",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),)),
                                                SizedBox(width: 20,),

                                                Expanded(flex: 1, child: Container(
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(width: 1,color: Colors.yellow[600]),
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
                                                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.yellow[600])),
                                                      enabledBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.yellow[600]),
                                                      ),
                                                    ),
                                                    onChanged: (text){
                                                      value = text;

                                                      },
                                                  ),
                                                )
                                                ),
                                                //SizedBox(width: 10,),
                                                Padding(padding: EdgeInsets.all(10)),
                                                Expanded(flex:1,child: Text("كغ",style: TextStyle(fontSize: 16),))
                                                  ],
                                                ),


                                              Padding(padding: EdgeInsets.only(top: 30)),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Padding(padding: EdgeInsets.all(10)),
                                                  Expanded(flex:1,child: Text("أدخل الطول",
                                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,),)),
                                                  SizedBox(width: 20,),

                                                  Expanded(flex: 1, child: Container(
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(width: 1,color: Colors.yellow[600]),
                                                      boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,
                                                      )],

                                                      color: Colors.white,
                                                    ),
                                                    child: TextFormField(
                                                      controller: _heightController,
                                                      keyboardType: TextInputType.number,
                                                      decoration: InputDecoration(
                                                        contentPadding: EdgeInsets.all(14),
                                                        focusedBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(color: Colors.yellow[700])),
                                                        enabledBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.yellow[600]),
                                                        ),
                                                      ),
                                                      onChanged: (text){
                                                        val = text;
                                                      },
                                                    ),
                                                  )
                                                  ),

                                                Padding(padding: EdgeInsets.all(10)),
                                                Expanded(flex:1,child: Text("سم",style: TextStyle(fontSize: 16),))
                                                ],
                                              ),

                                              Container(
                                               margin: EdgeInsets.only(top:60,left: 105),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                   FlatButton(
                                                      child: Text("احسب",style: TextStyle(fontSize: 15,color: Colors.white),),
                                                      color: Colors.blue[700],
                                                      onPressed: (){
                                                        double bm = result;
                                                        String bmiString = "$bm";
                                                        db.saveDesc(Descriptors(
                                                           _heightController.text,
                                                           _weightController.text,
                                                            bmiString,
                                                            formattedDate,
                                                        ),

                                                        );

                                                        calculateBMI();
                                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Bmi2(
                                                          bmiModel: _bmiModel,
                                                          value:value,
                                                          val: val,
                                                        ),

                                                        )
                                                        );
                                                      },

                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),


                             ),
                           ),

                         ],
               ),
                    ),
        ),
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
      ),),
    );
  }
  void calculateBMI() {

    setState(() {
      double height = double.parse(_heightController.text)/100 ;
      double weight = double.parse(_weightController.text);

      double heightSquare = height * height;
      double res = heightSquare * 18.5;
      double reso = heightSquare * 25 ;
      double result = weight / heightSquare;
      result = result ;
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
    // void save() async{
    // int result;
    // if(descriptors.id != null){
    //   result = await helper.insertDescriptors(descriptors);
    // }
    // if(result!=0){
    //   showAlertDialog('saved','desc has been saved successfuly');
    // }
    // }
    //
    // void showAlertDialog(String title, String msg){
    // AlertDialog alertDialog = AlertDialog(
    //   title: Text(title),
    //   content: Text(msg),
    // );
    // showDialog(context: context, builder: (_) => alertDialog);
    // }
}