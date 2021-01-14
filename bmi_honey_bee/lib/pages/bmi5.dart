import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi5 extends StatefulWidget {
  @override
  _Bmi5State createState() => _Bmi5State();
}

class _Bmi5State extends State<Bmi5> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold);
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
    // final screenHeight =MediaQuery.of(context);
    final screenWidth = MediaQuery.of(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Directionality(textDirection: TextDirection.rtl,
          child:
          Scaffold(
            appBar: AppBar(
              toolbarHeight: 60,
              backgroundColor: Colors.yellow[700],
              title: Row(
                children: [
                  Image.asset("images/group.png",),

                  SizedBox(width: 10,),

                  Text('BMI', style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  ),
                ],
              ),
            ),
            body:SingleChildScrollView(child:
            Container(
              height: 450, width: 400,
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
                      padding: EdgeInsets.only(right: 11, left: 11),
                      height: 250,
                      width: 300,
                      decoration: BoxDecoration(

                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey[400],
                              spreadRadius: .1,
                              blurRadius: 3,
                              offset: Offset(2, 2))
                        ],
                      ),
                      child: Container(

                        padding: EdgeInsets.only(top: 30, left: 11, right: 11),
                        child: Column(
                          children: [
                            Form(
                                child: Column(
                                    children: [

                                      Container(
                                        width: 250,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(
                                                  10),
                                              labelText: "الاسم",
                                              labelStyle: TextStyle(
                                                  color: Colors.black),
                                              suffixIcon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Colors.black,),
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.yellow[700])
                                              )
                                          ),
                                          cursorColor: Colors.yellow[700],
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 40)),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          RaisedButton(
                                            child: Text("الغاء الأمر"),
                                            color: Colors.white,
                                            onPressed: () {
                                              return Navigator.of(context)
                                                  .pop();
                                            },),
                                          SizedBox(width: 40,),
                                          RaisedButton(
                                            child: Text("موافق"),
                                            color: Colors.white,
                                            onPressed: () {
                                              setState(() {});
                                            },)
                                        ],
                                      )
                                    ]
                                )
                            ),
                            // Text(_calcresult!= null? '$_calcresult':''),
                            // Text(_result!= null? _result: ''),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),),


            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined, size: 30, color: Colors.grey,),
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