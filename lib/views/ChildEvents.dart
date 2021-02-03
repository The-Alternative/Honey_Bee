import 'package:childrensdiary/controllers/eventController.dart';
import 'package:childrensdiary/models/event.dart';
import 'package:childrensdiary/views/AddChild.dart';
import 'package:childrensdiary/controllers/childController.dart';
import 'package:childrensdiary/models/child.dart';
import 'package:childrensdiary/views/ChildInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';






class ChildEvents extends StatefulWidget {
  final Child child;
  ChildEvents(this.child);
  @override
  State<StatefulWidget> createState() {
    return new ChildEventsState();
  }

}

class ChildEventsState extends State<ChildEvents>{

  List<Event> childEvents =new List();
  Event list ;
  EventController db = new EventController();
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
    db.getChildEvents(widget.child.id).then((allChildren) {
      setState(() {
        allChildren.forEach((event) {
          childEvents.add(Event.fromeMap(event));
        });

      });

    });
    birthDate= widget.child.birthDate;
    birth = DateTime.parse(birthDate);
//    age = calculateAge(birth);
//    month = calculateAgeMonth(birth);
//    dayes = calculateAgedays(birth);
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
              child: (childEvents.length > 0)? new ListView.builder(
                  itemCount: childEvents.length,
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
                                    color: Colors.redAccent, width: 1),
                                borderRadius: BorderRadius.circular(5),
                                shape: BoxShape.rectangle,
                              ),
                              child: ListView(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: MediaQuery.of(context).size.width *0.5,top: 5,left: 5),
                                    child: Text("${convertFormatOfCreatedDate(DateTime.parse(childEvents[posision].createdDate))}"),
                                  ),
                                  Padding(padding: EdgeInsets.only(bottom: 15)),
                                  Row(
                                    children: [
                                      Expanded(child: Text("")),
                                      Text("${childEvents[posision].name}",),
                                      Padding(padding: EdgeInsets.only(left: 10)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child: Text("")),
                                      Text("${childEvents[posision].note}",),
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
                                      Text('${calculateAgedays(DateTime.parse(widget.child.birthDate),DateTime.parse(childEvents[posision].createdDate))}',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                                      Padding(padding: EdgeInsets.only(left:15.0)),
                                      Text('أشهر',style: TextStyle(color: Colors.black,fontSize: 18.0)),
                                      Padding(padding: EdgeInsets.only(left: 10.0)),
                                      Text('${calculateAgeMonth(DateTime.parse(widget.child.birthDate),DateTime.parse(childEvents[posision].createdDate))}',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                                      Padding(padding: EdgeInsets.only(left:15.0)),
                                      Text('سنوات',style: TextStyle(color: Colors.black,fontSize: 18.0)),
                                      Padding(padding: EdgeInsets.only(left: 10.0)),
                                      Text('${calculateAge(DateTime.parse(widget.child.birthDate),DateTime.parse(childEvents[posision].createdDate))}',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
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
                                    child: Image.asset("assets/images/events.png",width: 50,)
                                )),
                          ],
                        ),
                        
                        (posision == childEvents.length-1) ?  new Center(
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
                                    onPressed: () {Navigator.pop(context);},
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
                        child: Text("No Events For this child"),
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
                              onPressed: () {Navigator.pop(context);},
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
  calculateAge(DateTime birthDate,DateTime createdDate) {
    DateTime currentDate = createdDate;
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
  calculateAgeMonth(DateTime birthDate,DateTime createdDate) {
    if (birthDate != '') {


      final now = createdDate;

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
  calculateAgedays(DateTime birthDate,DateTime createdDate) {
    if (birthDate != '') {


      final now = createdDate;

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

  convertFormatOfCreatedDate(DateTime createdDate) {
    final x = DateFormat("dd/MM/yyyy").format(createdDate);
    return x;
  }

}


