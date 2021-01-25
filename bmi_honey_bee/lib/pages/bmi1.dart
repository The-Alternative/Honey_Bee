import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bmi_honey_bee/pages/bmi2.dart';


class BMIModel{
  double bmi;
  bool isNormal;
  String Comments;
  BMIModel({this.bmi,this.isNormal,this.Comments,});
}


class Bmi1 extends StatefulWidget {

  @override
  _Bmi1State createState() => _Bmi1State();

}
class _Bmi1State extends State<Bmi1> {

  double _heightonuser =100.0;
  double _weightofuser = 40.0;
  double _bmi = 0;
  BMIModel _bmiModel;

  TextEditingController heightonuser =TextEditingController();
  TextEditingController weightonuser =TextEditingController();


  void _onItemTapped(int index) {
    setState(() {
     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bmi1()));

    });}

  @override
  Widget build(BuildContext context) {
    final screenHeight =MediaQuery.of(context);
    final screenWidth = MediaQuery.of(context);
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

        body: TabBarView(
          children: [
            SingleChildScrollView(
              child:
                Center(
                  child: Container(
                  height: 450,
                  width: 400,
                  decoration: BoxDecoration(image: DecorationImage(
                      image: AssetImage("images/body.png",),
                      alignment: Alignment.bottomCenter,

                  ),
                  ),
                  child: ListView(

                   children: [
                     SizedBox(height: 40,),
                    Center(
                     child: Container(
                       padding: EdgeInsets.only(right: 11,left: 11),
                       height: 250,
                       width: 330,
                       decoration: BoxDecoration(

                         color: Colors.white,
                         boxShadow:[ BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 3,offset: Offset(2,2))],
                       ),
                       child: Container(

                         padding: EdgeInsets.only(top:30,left: 11,right: 11),
                         child: Column(
                              children: [
                                SingleChildScrollView(
                                  child: Form(
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center, children: [
                                          Padding(padding: EdgeInsets.all(10)),
                                          Expanded(flex:2,child: Text("أدخل الوزن",style: TextStyle(fontSize: 15),)),
                                          Container(
                                            height: 40,width: 100,
                                            child: Slider(
                                                min: 30.0,
                                                max: 120.0,

                                                onChanged: (height){
                                                  setState(() {
                                                    _weightofuser = height;
                                                  });
                                                },
                                              value: _weightofuser,
                                              divisions: 100,
                                              label: '$_weightofuser',
                                              activeColor: Colors.yellow[700],
                                            ),
                                          ),
                                          Text("$_weightofuser"),
                                          // Expanded(flex: 2, child: Container(
                                          //   decoration: BoxDecoration(
                                          //     border: Border.all(width: 1,color: Colors.orange[100]),
                                          //     boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,
                                          //         )],
                                          //     borderRadius:BorderRadius.circular(5),
                                          //     color: Colors.white,
                                          //   ),
                                          //
                                          //   child:
                                          //   TextFormField(
                                          //     controller: weightonuser,
                                          //     cursorColor: Colors.yellow[400],
                                          //     keyboardType: TextInputType.number,
                                          //
                                          //   ),
                                          // )),
                                          Padding(padding: EdgeInsets.all(10)),
                                          Expanded(flex:1,child: Text("كغ",style: TextStyle(fontSize: 15),))
                                            ],
                                          ),
                                        Padding(padding: EdgeInsets.only(top: 30)),
                                        Row(crossAxisAlignment: CrossAxisAlignment.center,

                                          children: [
                                            Padding(padding: EdgeInsets.all(10)),
                                            Expanded(flex:2,child: Text("أدخل الطول",style: TextStyle(fontSize: 15),)),
                                            Container(
                                              height: 50,width: 90,

                                              child: Slider(
                                                min: 80.0,
                                                max: 250.0,
                                                onChanged: (height){
                                                  setState(() {
                                                    _heightonuser = height;
                                                  });
                                                },
                                                value: _heightonuser,
                                                divisions: 100,
                                                label: '$_heightonuser',
                                                activeColor: Colors.yellow[700],
                                              ),
                                            ),
                                            Text("$_heightonuser"),
                                            // Expanded(flex: 2, child: Container(
                                            //   decoration: BoxDecoration(
                                            //     border: Border.all(width: 1,color: Colors.orange[100]),
                                            //     boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,
                                            //     )],
                                            //     borderRadius:BorderRadius.circular(5),
                                            //     color: Colors.white,
                                            //   ),
                                            //   child:
                                            //   TextFormField(
                                            //     controller: heightonuser,
                                            //
                                            //     keyboardType: TextInputType.number,
                                            //   ),
                                            // )),
                                          Padding(padding: EdgeInsets.all(10)),
                                          Expanded(flex:1,child: Text("سم",style: TextStyle(fontSize: 15),))
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(top: 20)),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            FlatButton(
                                              child: Text("الغاء الأمر",),color: Colors.white,
                                              onPressed: (){
                                                return Navigator.of(context).pop();
                                              },),
                                            SizedBox(width: 40,),
                                            FlatButton(
                                              child: Text("احسب"),color: Colors.white,
                                              onPressed: (){

                                                setState(() {
                                                  _bmi = _weightofuser/(_heightonuser*_heightonuser/10000);
                                                  if(_bmi>= 18.5 && _bmi<=25){
                                                    _bmiModel = BMIModel(bmi: _bmi,isNormal: true, Comments :"طبيعي");
                                                  }
                                                  else if(_bmi< 18.5){
                                                    _bmiModel = BMIModel(bmi: _bmi,isNormal: true, Comments :" وزن ناقص");
                                                  }
                                                  else if(_bmi> 25&& _bmi <= 30){
                                                    _bmiModel = BMIModel(bmi: _bmi,isNormal: true, Comments :"وزن زائد");
                                                  }
                                                  else{
                                                    _bmiModel = BMIModel(bmi: _bmi,isNormal: true, Comments :" سمين");

                                                  }
                                                });

                                                Navigator.push(context, MaterialPageRoute(
                                                    builder: (context)=> Bmi2(
                                                      bmiModel: _bmiModel,
                                                    )));
                                              },)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                       ),
                     ),
                   ),
                   ],
               ),
                ),),),
            Text("hi")
          ],
        ),


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
}
// home(){
//
// }

