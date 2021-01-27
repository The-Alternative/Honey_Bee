import 'package:childrensdiary/controllers/eventController.dart';
import 'package:childrensdiary/controllers/habitController.dart';
import 'package:childrensdiary/controllers/healthController.dart';
import 'package:childrensdiary/models/child.dart';
import 'package:childrensdiary/models/event.dart';
import 'package:childrensdiary/models/habit.dart';
import 'package:childrensdiary/models/health.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class AddNegativeHabit extends StatefulWidget {
//  final Health health;

  @override
  State<StatefulWidget> createState() {
    return new AddNegativeHabitState();
  }

}

class AddNegativeHabitState extends State<AddNegativeHabit>{

  HabitController db = new HabitController();
  TextEditingController _noteController;
  DateTime now = DateTime. now();
  String formattedDate ;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _noteController = new TextEditingController(text: "");
    formattedDate = DateFormat("dd/MM/yyyy").format(now);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new  MaterialApp(
      title: 'Welcome to Flutter',
      home: Container(
        child: Scaffold(
          appBar:new AppBar(title: new Text('',
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
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                image:AssetImage("assets/images/background.png"), fit: BoxFit.contain,
//              ),
//            ),
//            color: Colors.white12,
            child: new ListView(
              children: [
                new Padding(padding: EdgeInsets.only(bottom: 50.0)),

                new Center(
                    child: new Container(
                      width: MediaQuery.of(context).size.width *0.9,
                      child: new TextField(
                        controller: _noteController,
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 16.0 , color: Colors.redAccent,),cursorColor: Colors.redAccent,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(width: 1,color: Colors.redAccent),
                            ),
                            hintText: 'إضافة عادة سلبية',
                            hintStyle: TextStyle(fontSize: 16),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(width: 1,color: Colors.redAccent),
                            ),
                            labelStyle: TextStyle(
                                color: Colors.redAccent
                            ),

                            contentPadding: EdgeInsets.only(top: 30,bottom: 30,right: 20,left: 10),
                            fillColor: Colors.white70,


                        ),
                      ),
                    )
                ),
                new Padding(padding: EdgeInsets.only(bottom: 50.0)),

                new Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height *0.3)),
                new Center(
                  child: new Container(
                    width: MediaQuery.of(context).size.width *0.7,
                    child: new Row(
                      children: [
                        new FlatButton(
                          child:new Text('موافق',style: new TextStyle(fontSize: 19.0,color: Colors.black)),
                          onPressed: (){
//                            if(widget.health.id != null){
//                              db.updateChild(Health.fromeMap({
//                                'id' : widget.health.id,
//                                'name' : _nameController.text,
//                                'note' : _noteController.text,
//                                'tall' : int.parse(_tallController.text),
//                                'weight' : int.parse(_weightController.text),
//                                'tempreture' : int.parse(_tempretureController.text),
//                              })).then((_) {
//                                Navigator.pop(context,'update');
//                              });
//                            }else{
                            db.savehabit(Habit(
                                _noteController.text,
                                1,
                                1,
                                formattedDate)).then((_) {
                              Navigator.pop(context,'save');
                            });

                          },
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
            ),
          ),
          bottomNavigationBar: new Icon(Icons.home,color: Colors.black12,size: 50.2,),
        ),
      ),
    );
  }
}