import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class Bmi1 extends StatefulWidget {

  @override
  _Bmi1State createState() => _Bmi1State();

}

class _Bmi1State extends State<Bmi1> {
  double _calculation;
  double _calcresult;
  double _result;
  TextEditingController _ageFieldController = new TextEditingController();
  TextEditingController _heightFeildController = new TextEditingController();
  TextEditingController _weightFeildController = new TextEditingController();

  void _bmi(){
    double height = double.parse(_heightFeildController.text);
    double weight = double.parse(_weightFeildController.text);

    if (height != null && weight != null){
      setState(() {
        height=height*12;
        _calculation = (weight/(height*height))*703;
        _calcresult = _calculation.toStringAsFixed(2) as double;
        if(_calculation < 18.5){
          _result = 'underweight' as double;
        }
        else if(_calculation >= 18.5 && _calculation <= 24.9){
          _result ='Good Fit' as double;
        }
          else if(_calculation >= 25.0 && _calculation<=29.9){
            _result = 'overweight' as double;
        }else{
            _result = 'obese' as double;
        }

      });
    }
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

    });}
  @override
  Widget build(BuildContext context) {
    final screenHeight =MediaQuery.of(context);
    final screenWidth = MediaQuery.of(context);
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Directionality(textDirection: TextDirection.rtl,child:
      Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.yellow[700],
          title: Row(
            children: [
              Image.asset("images/group.png",),
              SizedBox(width: 10,),

              Expanded(child:  Text('BMI' ,style: TextStyle(
                color: Colors.black,
              ),
              ),),

            ],
          ),

        ),

        body:SingleChildScrollView(child:
            Center(child: Container(
              height: 400,
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
                   width: 300,
                   decoration: BoxDecoration(

                     color: Colors.white,
                     boxShadow:[ BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 3,offset: Offset(2,2))],
                   ),
                   child: Container(

                     padding: EdgeInsets.only(top:30,left: 11,right: 11),
                     child: Column(
                          children: [
                            Form(
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center, children: [
                                    Padding(padding: EdgeInsets.all(10)),
                                    Expanded(flex:2,child: Text("أدخل الوزن",style: TextStyle(fontSize: 18),)),
                                    Expanded(flex: 2, child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 1,color: Colors.orange[100]),
                                        boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,
                                            )],
                                        borderRadius:BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),

                                      child:
                                      TextFormField(
                                        cursorColor: Colors.yellow[400],
                                        controller: _weightFeildController,
                                        keyboardType: TextInputType.number,

                                      ),
                                    )),
                                    Padding(padding: EdgeInsets.all(10)),
                                    Expanded(flex:1,child: Text("كغ",style: TextStyle(fontSize: 18),))
                                      ],
                                    ),
                                  Padding(padding: EdgeInsets.only(top: 30)),
                                  Row(crossAxisAlignment: CrossAxisAlignment.center,

                                    children: [
                                      Padding(padding: EdgeInsets.all(10)),
                                      Expanded(flex:2,child: Text("أدخل الطول",style: TextStyle(fontSize: 18),)),
                                      Expanded(flex: 2, child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1,color: Colors.orange[100]),
                                          boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,
                                          )],
                                          borderRadius:BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        child:
                                        TextFormField(
                                          controller: _heightFeildController,
                                          keyboardType: TextInputType.number,
                                        ),
                                      )),
                                    Padding(padding: EdgeInsets.all(10)),
                                    Expanded(flex:1,child: Text("م",style: TextStyle(fontSize: 18),))
                                    ],
                                  ),
                                Padding(padding: EdgeInsets.only(top: 20)),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RaisedButton(
                                        child: Text("الغاء الأمر"),color: Colors.white,
                                        onPressed: (){
                                          return Navigator.of(context).pop();
                                        },),
                                      SizedBox(width: 40,),
                                      RaisedButton(
                                        child: Text("احسب"),color: Colors.white,
                                        onPressed: (){
                                          setState(() {
                                          });
                                          Navigator.of(context).pushNamed('Bmi2');
                                        },)
                                    ],
                                  )
                                ],
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



        bottomNavigationBar:
        BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 30, color: Colors.grey,),
                label: "home"
            ),

          ],
          onTap: _onItemTapped,
        ),
      ),)
    );
  }
}
