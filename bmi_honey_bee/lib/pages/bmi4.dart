
import 'package:bmi_honey_bee/pages/bmi1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi4 extends StatefulWidget {
  final bmiModel;

  const Bmi4( {this.bmiModel});
  @override
  _Bmi4State createState() => _Bmi4State();
}

class _Bmi4State extends State<Bmi4> {


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
                Image.asset("images/group.png",),
                SizedBox(width: 10,),
                Expanded(child:  Text('BMI' ,style: TextStyle(color: Colors.black,),),),
              ],
            ),
          ),

          body: SingleChildScrollView(
            child: Center(
              child: Container(
                height: 380, width: 400,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/body.png"), alignment: Alignment.bottomCenter,)
                ),
                   child: Column(
                     children: [
                       Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Image(image: AssetImage('images/group.png')),
                             Text(""),
                           ],
                         ),
                       Container(
                       margin: EdgeInsets.only(top: 30,left: 11,right: 11),
                         height: 180,
                         width: 300,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow:[ BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 3,)],),

                      child: Center(
                        child: Container(
                          padding: EdgeInsets.only(top:30,left: 20,right: 11),
                          child: Column(
                              children: [
                                Form(
                                    child: Column(
                                        children: [
                                          Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Padding(padding: EdgeInsets.all(20)),
                                              Expanded(flex:2,child: Text("الوزن",style: TextStyle(fontSize: 15),)),
                                              SizedBox(width: 30,),
                                              Expanded(flex:2,child: Text("الطول",style: TextStyle(fontSize: 15),)),
                                              SizedBox(width: 30,),
                                              Expanded(flex:2,child: Text("BMI",style: TextStyle(fontSize: 15),)),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Padding(padding: EdgeInsets.all(5)),
                                              Expanded(flex:1,child:TextFormField(
                                                readOnly: true,
                                              )
                                              ),
                                              Expanded(flex:1,child: TextFormField(
                                                readOnly: true,
                                              )
                                              ),
                                              Expanded(flex:1,child: TextFormField(
                                                readOnly: true,
                                              )
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Padding(padding: EdgeInsets.all(5)),
                                              Expanded(flex:1,child:Text("")),
                                              FlatButton(
                                                child:InkWell(
                                               onTap: (){},
                                               child: Image(image: AssetImage('images/trash.png'),),) ,

                                             ),
                        ]
                                          ),
                                        ]
                                    )
                                ),

                              ]

                          ),

                        ),
                      ),
              ),]
                   ),
                 ),
            ),),
            floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
            floatingActionButton:SingleChildScrollView(
              child: Container(

                margin: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    FloatingActionButton(
                      child: Icon(Icons.add,size: 50,),
                      backgroundColor: Colors.green,
                      onPressed: () {
                      Navigator.of(context).pushNamed('Bmi5');
                      },
                    ),
                    SizedBox(height: 5,),
                    Text("إضافة")
                  ],
                ),

              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items:  <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Center(child: Image(image: AssetImage('images/hom.png'),)),
                    label: "home"
                ),
              ],
              onTap: _onItemTapped,
            ),
        ),)

    );
  }
}
