import 'package:childrensdiary/views/AddChild.dart';
import 'package:childrensdiary/controllers/childController.dart';
import 'package:childrensdiary/models/child.dart';
import 'package:childrensdiary/views/ChildInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';






class Habits extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HabitsState();
  }

}

class HabitsState extends State<Habits>{
  bool _value =false;
  bool _value1 =false;
  bool _value2 =false;
  bool _value3 =false;
  bool _value4 =false;
  bool _value5 =false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new  MaterialApp(
      title: 'Welcome to Flutter',
      home: Container(
//        decoration: BoxDecoration(
//          color: Colors.black,
//          image: DecorationImage(
//              image:AssetImage("assets/images/222.png"), fit: BoxFit.cover,
//          ),
//        ),

        child: Scaffold(
          appBar:new AppBar(title: new Text('',textDirection: TextDirection.rtl,
              style: new TextStyle(color: Colors.black)),
            backgroundColor: Colors.amberAccent,
            actions: [

              new Column(
                children: [
                  new Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  new Text('يوميات الاولاد',style: new TextStyle(color: Colors.black,fontSize: 22.2,fontWeight: FontWeight.bold))
                ],
              ),
//              new Padding(padding: new EdgeInsets.only(left: 30.0)),
              new Image(image: AssetImage("assets/images/111.png"), width: 100.0,),
//              new Padding(padding: new EdgeInsets.only(left: 30.0)),

            ],
          ),
          backgroundColor: Colors.white,
          body: new Container(
            child:  Center(
                child:new ListView(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                    Row(
                      children: [
                        new Expanded(child: Text("")),
                        new Container(
                          padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom:5),
                          decoration: BoxDecoration(color: Colors.redAccent,
                            border: Border.all(
                                color:  Colors.redAccent, width: 1),
                            borderRadius: BorderRadius.circular(5),
                            shape: BoxShape.rectangle,),
                          child: new Text("عادات سلبية",style: TextStyle(color: Colors.white,fontSize: 18),),
                        ),
                        new Expanded(child: Text("")),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width *0.8,
                            height: 300,
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                            padding: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:  Colors.redAccent, width: 1),
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                            ),
                            child: new ListView(
                              children: [
                                new Padding(padding: EdgeInsets.only(bottom: 10)),
                                new Row(
                                  children: [
                                    new Expanded(child: Text("")),
                                    new Text('ssssssssssss'),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _value = !_value;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent),
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.1),
                                          child: _value
                                              ? Icon(
                                            Icons.check,
                                            size: 30.0,
                                            color: Colors.white,
                                          )
                                              : Icon(
                                            Icons.brightness_1,
                                            size: 30.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                  ],
                                ),
                                new Padding(padding: EdgeInsets.only(bottom: 10)),
                                new Row(
                                  children: [
                                    new Expanded(child: Text("")),
                                    new Text('ssssssssssss'),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _value1 = !_value1;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent),
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.1),
                                          child: _value1
                                              ? Icon(
                                            Icons.check,
                                            size: 30.0,
                                            color: Colors.white,
                                          )
                                              : Icon(
                                            Icons.brightness_1,
                                            size: 30.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                  ],
                                ),
                                new Padding(padding: EdgeInsets.only(bottom: 10)),
                                new Row(
                                  children: [
                                    new Expanded(child: Text("")),
                                    new Text('ssssssssssss'),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _value2 = !_value2;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent),
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.1),
                                          child: _value2
                                              ? Icon(
                                            Icons.check,
                                            size: 30.0,
                                            color: Colors.white,
                                          )
                                              : Icon(
                                            Icons.brightness_1,
                                            size: 30.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                  ],
                                ),
                                new Padding(padding: EdgeInsets.only(bottom: 10)),
                                new Row(
                                  children: [
                                    new Expanded(child: Text("")),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _value1 = !_value1;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent),
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.1),
                                          child: Icon(Icons.add_circle,color: Colors.white,size: 30.0,)
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                  ],
                                ),

                              ],
                            ) ,
                          ),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                    Row(
                      children: [
                        new Expanded(child: Text("")),
                        new Container(
                          padding: EdgeInsets.only(left: 10,right: 15,top: 5,bottom:5),
                          decoration: BoxDecoration(color: Colors.green,
                            border: Border.all(
                                color:  Colors.green, width: 1),
                            borderRadius: BorderRadius.circular(5),
                            shape: BoxShape.rectangle,),
                          child: new Text("عادات إيجابية",style: TextStyle(color: Colors.white,fontSize: 18),),
                        ),
                        new Expanded(child: Text("")),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Center(
                          child:Container(
                            width: MediaQuery.of(context).size.width *0.8,
                            height: 300,
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                            padding: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:  Colors.green, width: 1),
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                            ),
                            child: new ListView(
                              children: [
                                new Padding(padding: EdgeInsets.only(bottom: 10)),
                                new Row(
                                  children: [
                                    new Expanded(child: Text("")),
                                    new Text('ssssssssssss'),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _value3 = !_value3;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.1),
                                          child: _value3
                                              ? Icon(
                                            Icons.check,
                                            size: 30.0,
                                            color: Colors.white,
                                          )
                                              : Icon(
                                            Icons.brightness_1,
                                            size: 30.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                  ],
                                ),
                                new Padding(padding: EdgeInsets.only(bottom: 10)),
                                new Row(
                                  children: [
                                    new Expanded(child: Text("")),
                                    new Text('ssssssssssss'),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _value4 = !_value4;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.1),
                                          child: _value4
                                              ? Icon(
                                            Icons.check,
                                            size: 30.0,
                                            color: Colors.white,
                                          )
                                              : Icon(
                                            Icons.brightness_1,
                                            size: 30.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                  ],
                                ),
                                new Padding(padding: EdgeInsets.only(bottom: 10)),
                                new Row(
                                  children: [
                                    new Expanded(child: Text("")),
                                    new Text('ssssssssssss'),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _value5 = !_value5;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.1),
                                          child: _value5
                                              ? Icon(
                                            Icons.check,
                                            size: 30.0,
                                            color: Colors.white,
                                          )
                                              : Icon(
                                            Icons.brightness_1,
                                            size: 30.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                  ],
                                ),
                                new Padding(padding: EdgeInsets.only(bottom: 10)),
                                new Row(
                                  children: [
                                    new Expanded(child: Text("")),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _value1 = !_value1;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                                        child: Padding(
                                            padding: const EdgeInsets.all(0.1),
                                            child: Icon(Icons.add_circle,color: Colors.white,size: 30.0,)
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                  ],
                                ),

                              ],
                            ) ,
                          ) ,
                        ),

                      ],
                    ),
                    new Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height *0.05)),
                    new Center(
                      child: new Container(
                        width: MediaQuery.of(context).size.width *0.7,
                        child: new Row(
                          children: [
                            new FlatButton(
                                child:new Text('موافق',style: new TextStyle(fontSize: 19.0,color: Colors.black)),
                                onPressed: null
                            ),
                            new Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width *0.15 )),
                            new FlatButton(
                                onPressed: () {Navigator.of(context).pushNamed('/Home');},
                                child: new Text('إلغاء الأمر',style: new TextStyle(fontSize: 19.0,color: Colors.black),)),
                          ],
                        ),
                      ),
                    )
                  ],
                )
            ),

          ),

          bottomNavigationBar:  new Icon(Icons.home,color: Colors.black12,size: 50.2),

                  ),
      ),
    );
  }
}


