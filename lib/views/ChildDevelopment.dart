import 'package:childrensdiary/controllers/developmentController.dart';
import 'package:childrensdiary/controllers/eventController.dart';
import 'package:childrensdiary/models/development.dart';
import 'package:childrensdiary/models/event.dart';
import 'package:childrensdiary/views/AddChild.dart';
import 'package:childrensdiary/controllers/childController.dart';
import 'package:childrensdiary/models/child.dart';
import 'package:childrensdiary/views/ChildInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';






class ChildDevelopments extends StatefulWidget {
  final Child child;
  ChildDevelopments(this.child);
  @override
  State<StatefulWidget> createState() {
    return new ChildDevelopmentsState();
  }

}

class ChildDevelopmentsState extends State<ChildDevelopments>{

  List<Development> childDevelopments =new List();
  Development list ;
  DevelopmentController db = new DevelopmentController();
  String birthDate = '';
  DateTime now = DateTime.now();
  int age;
  int month;
  int dayes;
  DateTime birth;

  @override
  void initState() {
    //  TODO: implement initState
    super.initState();
    db.getChildDevelopments(widget.child.id).then((allChildren) {
      setState(() {
        allChildren.forEach((development) {
          childDevelopments.add(Development.fromeMap(development));
        });

      });

    });
    birthDate= widget.child.birthDate;
    birth = DateTime.parse(birthDate);
    age = calculateAge(birth);
    month = calculateAgeMonth(birth);
    dayes = calculateAgedays(birth);
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
              new Image(image: AssetImage("assets/images/111.png"), width: 100.0,),
            ],
          ),
          backgroundColor: Colors.white,
          body:new Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage("assets/images/background.png"), fit: BoxFit.contain,
              ),
            ),
//            color: Colors.white12,
            child: (childDevelopments.length > 0)? new ListView.builder(
                itemCount: childDevelopments.length,
                padding: const EdgeInsets.all(15.0),
                itemBuilder: (context,posision){
                  return Column(
                    children: [


                      Stack(
                        children: <Widget>[

                          Container(
                            width: double.infinity,
                            height: 350,
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                            padding: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.greenAccent, width: 1),
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                            ),
                            child: ListView(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width *0.5,top: 5,left: 5),
                                  child: Text("${childDevelopments[posision].createdDate}"),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 15)),
                                Row(
                                  children: [
                                    Expanded(child: Text("")),
                                    Text("${childDevelopments[posision].name}"),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(child: Text("")),
                                    Text("${childDevelopments[posision].note}"),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 15)),
                                Row(
                                  children: [
                                    Expanded(child: Text("")),
                                    Image.asset("assets/images/111.png",width: 100,),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    Image.asset("assets/images/helth.png",width: 100,),
                                    Expanded(child: Text("")),
                                  ],
                                ),

                                Padding(padding: EdgeInsets.only(bottom: 15.0)),
                                Row(
                                  children: [
                                    new Expanded(child: Text("")),
                                    Text('يوم',style: TextStyle(color: Colors.black,fontSize: 18.0)),
                                    Padding(padding: EdgeInsets.only(left: 10.0)),
                                    Text('$dayes',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                                    Padding(padding: EdgeInsets.only(left:15.0)),
                                    Text('أشهر',style: TextStyle(color: Colors.black,fontSize: 18.0)),
                                    Padding(padding: EdgeInsets.only(left: 10.0)),
                                    Text('$month',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                                    Padding(padding: EdgeInsets.only(left:15.0)),
                                    Text('سنوات',style: TextStyle(color: Colors.black,fontSize: 18.0)),
                                    Padding(padding: EdgeInsets.only(left: 10.0)),
                                    Text('$age',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                                    new Expanded(child: Text("")),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              right:20 ,
                              top: -5,
                              child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  color: Colors.white,
                                  child: Image.asset("assets/images/developments.png",width: 50,)
                              )),
                        ],
                      ),

                      (posision == childDevelopments.length-1) ?  new Center(
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
                      ) :  Text(""),

                    ],

                  );
                }
            ) : new Center(
              child: new Container(
                width: MediaQuery.of(context).size.width *0.7,
                child:new Column(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 30),),
                    new Center(
                      child: Text("No Developments For this child"),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 30),),
                    new Row(
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
                  ],
                ),
              ),
            ),

          ),
          bottomNavigationBar:  new Icon(Icons.home,color: Colors.black12,size: 50.2),

        ),
      ),
    );
  }
  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
  calculateAgeMonth(DateTime birthDate) {
    if (birthDate != '') {


      final now = new DateTime.now();

      int years = now.year - birthDate.year;
      int months = now.month - birthDate.month;
      int days = now.day - birthDate.day;

      if (months < 0 || (months == 0 && days < 0)) {
        years--;
        months += (days < 0 ? 11 : 12);
      }

      if (days < 0) {
        final monthAgo = new DateTime(now.year, now.month - 1, birthDate.day);
        days = now.difference(monthAgo).inDays + 1;
      }


      return months;
    } else {
      print('getTheKidsAge: date is empty');
    }
    return 0;
  }
  calculateAgedays(DateTime birthDate) {
    if (birthDate != '') {


      final now = new DateTime.now();

      int years = now.year - birthDate.year;
      int months = now.month - birthDate.month;
      int days = now.day - birthDate.day;

      if (months < 0 || (months == 0 && days < 0)) {
        years--;
        months += (days < 0 ? 11 : 12);
      }

      if (days < 0) {
        final monthAgo = new DateTime(now.year, now.month - 1, birthDate.day);
        days = now.difference(monthAgo).inDays + 1;
      }


      return days;
    } else {
      print('getTheKidsAge: date is empty');
    }
    return 0;
  }
}


