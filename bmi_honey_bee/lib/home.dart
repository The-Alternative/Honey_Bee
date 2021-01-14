
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:bmi_honey_bee/size_config.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    });
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight =MediaQuery.of(context);
    final screenWidth = MediaQuery.of(context);

    return LayoutBuilder(builder: (context , constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: DevicePreview.appBuilder,
          home:Directionality(textDirection: TextDirection.rtl,
            child:
            Scaffold(
              appBar: AppBar(
                toolbarHeight: 60,
                backgroundColor: Colors.yellow[700],
                title: Row(
                  children: [
                    Image.asset("images/group.png",),
                    SizedBox(width: 10,),
                    Text('BMI' ,style: TextStyle(
                      color: Colors.black,
                      fontSize: 20 ,
                    ),
                    ),
                  ],
                ),
              ),

              body:SingleChildScrollView(child:
              Container(
                height: screenHeight.size.height,
                width: screenWidth.size.width,
                child: Column(
                  children: [
                    Container(width: screenWidth.size.width/1.3,
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "الاسم",
                          labelStyle: TextStyle(color: Colors.black),
                          suffixIcon: Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow[700])
                          )
                        ),
                        cursorColor: Colors.yellow[700],
                      ),
                    ),


                    SizedBox(height: 60,),


                    Container(

                      width: screenWidth.size.width/1.5,
                      height: screenHeight.size.height/3,
                      child: Center(
                          child: Image(image: AssetImage("images/body.png",),
                            alignment: Alignment.center,
                          )
                      ),
                    ),
                  ],
                ),
              ),),

              floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
              floatingActionButton:SingleChildScrollView(child:
              Container(
                height: screenWidth.size.height/7,
                width: screenWidth.size.width/7,
                margin: EdgeInsets.only(left: 20),
                child: FloatingActionButton(
                  child: Icon(Icons.add,size: 40,),
                  onPressed: (){
                    Navigator.of(context).pushNamed('Bmi1');
                  },
                  backgroundColor: Colors.green,
                ),
              ),),

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

          ),

        );
      }
      );
    }
    );

  }
}

