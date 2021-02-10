import 'package:childrensdiary/controllers/developmentController.dart';
import 'package:childrensdiary/controllers/eventController.dart';
import 'package:childrensdiary/controllers/healthController.dart';
import 'package:childrensdiary/models/development.dart';
import 'package:childrensdiary/models/event.dart';
import 'package:childrensdiary/models/health.dart';
import 'package:childrensdiary/views/AddChild.dart';
import 'package:childrensdiary/controllers/childController.dart';
import 'package:childrensdiary/models/child.dart';
import 'package:childrensdiary/views/ChildInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';






class SearchResult extends StatefulWidget {
  final Child child;
  final String text;
  SearchResult(this.child,this.text);
  @override
  State<StatefulWidget> createState() {
    return new SearchResultState();
  }

}

class SearchResultState extends State<SearchResult>{

  List<Health> childHealths =new List();
  List<Event> childEvents =new List();
  List<Development> childDevelopments =new List();
//  Health list ;
  HealthController db = new HealthController();
  EventController eventdb = new EventController();
  DevelopmentController devdb = new DevelopmentController();
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
    db.searchChildHealths(widget.child.id,widget.text).then((allChildren) {
      setState(() {
        allChildren.forEach((health) {
          childHealths.add(Health.fromeMap(health));
        });
        print("111");
      });
    });
    eventdb.searchChildEvents(widget.child.id,widget.text).then((allEvents) {
      setState(() {
        allEvents.forEach((event) {
          childEvents.add(Event.fromeMap(event));
        });
        print("222");
      });
    });
    devdb.searchChildDevelopments(widget.child.id,widget.text).then((allDevelopments) {
      setState(() {
        allDevelopments.forEach((development) {
          childDevelopments.add(Development.fromeMap(development));
        });
        print("333");
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
//        decoration: BoxDecoration(
//          color: Colors.black,
//          image: DecorationImage(
//              image:AssetImage("assets/images/222.png"), fit: BoxFit.cover,
//          ),
//        ),

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
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage("assets/images/background.png"), fit: BoxFit.contain,
              ),
            ),
//            color: Colors.white12,
            child: Center(
              child: ListView(
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
                        child: new Text("الصحة",style: TextStyle(color: Colors.white,fontSize: 18),),
                      ),
                      new Expanded(child: Text("")),
                    ],
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width *0.8,
                          height: 300,
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          padding: EdgeInsets.only(bottom: 10,top: 1),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:  Colors.redAccent, width: 1),
                            borderRadius: BorderRadius.circular(5),
                            shape: BoxShape.rectangle,
                          ),
                          child: (childHealths.length > 0) ? ListView.builder(
                            itemCount: childHealths.length,
                              itemBuilder: (context,posision){
                              return new Column(
                                children: [
                                  new Padding(padding: EdgeInsets.only(bottom: 10)),
                                  ListTile(
                                    title: Text("${childHealths[posision].name}"),
                                    subtitle: Text("${childHealths[posision].note}"),
                                    onTap: () => _showHealthDialog(childHealths[posision]),

                                  ),
                                ],
                              );
                              }
                          ):Text("noooooo"),
                        ),
                      ),
                    ],
                  ),
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
                        child: new Text("الاحداث الهامة",style: TextStyle(color: Colors.white,fontSize: 18),),
                      ),
                      new Expanded(child: Text("")),
                    ],
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width *0.8,
                          height: 300,
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          padding: EdgeInsets.only(bottom: 10,top: 1),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:  Colors.redAccent, width: 1),
                            borderRadius: BorderRadius.circular(5),
                            shape: BoxShape.rectangle,
                          ),
                          child: (childEvents.length > 0) ? ListView.builder(
                              itemCount: childEvents.length,
                              itemBuilder: (context,posision){
                                return new Column(
                                  children: [
                                    new Padding(padding: EdgeInsets.only(bottom: 10)),
                                    ListTile(
                                      title: Text("${childEvents[posision].name}"),
                                      subtitle: Text("${childEvents[posision].note}"),
                                      onTap: () => _showEventDialog(childEvents[posision]),

                                    ),
                                  ],
                                );
                              }
                          ):Text("noooooo"),
                        ),
                      ),
                    ],
                  ),
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
                        child: new Text("التطورات",style: TextStyle(color: Colors.white,fontSize: 18),),
                      ),
                      new Expanded(child: Text("")),
                    ],
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width *0.8,
                          height: 300,
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          padding: EdgeInsets.only(bottom: 10,top: 1),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:  Colors.redAccent, width: 1),
                            borderRadius: BorderRadius.circular(5),
                            shape: BoxShape.rectangle,
                          ),
                          child: (childDevelopments.length > 0) ? ListView.builder(
                              itemCount: childDevelopments.length,
                              itemBuilder: (context,posision){
                                return new Column(
                                  children: [
                                    new Padding(padding: EdgeInsets.only(bottom: 10)),
                                    ListTile(
                                      title: Text("${childDevelopments[posision].name}"),
                                      subtitle: Text("${childDevelopments[posision].note}"),
                                      hoverColor: Colors.redAccent,
                                      onTap: () => _showDevelopmentDialog(childDevelopments[posision]),

                                    ),
                                  ],
                                );
                              }
                          ):Text("noooooo"),
                        ),
                      ),
                    ],
                  ),
                  new Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height *0.1)),
                  new Center(
                    child: new Container(
                      width: MediaQuery.of(context).size.width *0.7,
                      child: new Row(
                        children: [
                          new FlatButton(
                            child:new Text('موافق',style: new TextStyle(fontSize: 19.0,color: Colors.black45)),
                            onPressed:() => _back(context) ,
                          ),
                          new Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width *0.15 )),
                          new FlatButton(
                              onPressed:() => _back(context) ,
                              child: new Text('إلغاء الأمر',style: new TextStyle(fontSize: 19.0,color: Colors.black45),)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          bottomNavigationBar:  new Icon(Icons.home,color: Colors.black12,size: 50.2),

//          new Icon(Icons.home,color: Colors.black12,size: 50.2),

        ),
      ),
    );
  }



//  void _childInfo(BuildContext context) async{
//     await Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => ChildInfo(children[0])));
//  }

  void _navigatToChildInfo(BuildContext context,Child child) async{
    await Navigator.push(
        context,
        MaterialPageRoute(builder:(context) => ChildInfo(child)));
  }
  void _back(BuildContext context) async{
    Navigator.pop(context);
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

  void _childInfo(BuildContext context) async{
    await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChildInfo(widget.child)));

  }

  _showHealthDialog(Health health) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Center(
            child: Text("${health.name}"),
          ),
          content: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.redAccent, width: 1),
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                    ),
                    child: ListView(
                      children: [
                        Container(
                          child: Text("${convertFormatOfCreatedDate(DateTime.parse(health.createdDate))}"),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 25)),
                        Row(
                          children: [
                            Expanded(child: Text("")),
                            Text("${health.name}"),
                            Padding(padding: EdgeInsets.only(left: 10)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Text("")),
                            Text("${health.note}"),
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
                        new Row(
                          children: [
                            new Expanded(child: Text("")),
                            new Column(
                              children: [

                                new Text('الحرارة',style: TextStyle(fontSize: 18),),
                                new Padding(padding: EdgeInsets.only(bottom: 15.0)),
                                new Text('${health.tempreture}',style: TextStyle(fontSize: 18),),
                              ],
                            ),
                            new Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.05)),
                            new Column(
                              children: [
                                new Text('الوزن',style: TextStyle(fontSize: 18),),
                                new Padding(padding: EdgeInsets.only(bottom: 15.0)),
                                new Text('${health.weight}',style: TextStyle(fontSize: 18),),
                              ],
                            ),
                            new Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.05)),
                            new Column(
                              children: [
                                new Text('الطول',style: TextStyle(fontSize: 18),),
                                new Padding(padding: EdgeInsets.only(bottom: 15.0)),
                                new Text('${health.tall}',style: TextStyle(fontSize: 18),),

                              ],
                            ),
                            new Expanded(child: Text("")),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 15.0)),
                        Row(
                          children: [
                            new Expanded(child: Text("")),
                            Text('يوم',style: TextStyle(color: Colors.black,fontSize: 18.0)),
                            Padding(padding: EdgeInsets.only(left: 10.0)),
                            Text('${calculateAgedays(DateTime.parse(widget.child.birthDate),DateTime.parse(health.createdDate))}',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                            Padding(padding: EdgeInsets.only(left:15.0)),
                            Text('أشهر',style: TextStyle(color: Colors.black,fontSize: 18.0)),
                            Padding(padding: EdgeInsets.only(left: 10.0)),
                            Text('${calculateAgeMonth(DateTime.parse(widget.child.birthDate),DateTime.parse(health.createdDate))}',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                            Padding(padding: EdgeInsets.only(left:15.0)),
                            Text('سنوات',style: TextStyle(color: Colors.black,fontSize: 18.0)),
                            Padding(padding: EdgeInsets.only(left: 10.0)),
                            Text('${calculateAge(DateTime.parse(widget.child.birthDate),DateTime.parse(health.createdDate))}',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
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
                          child: Image.asset("assets/images/helth.png",width: 50,)
                      )),
                ],
              ),

            ],

          ),
          actions: <Widget>[
            FlatButton(
              child: Text('حسنا'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }
  _showEventDialog(Event event) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title:new Center(
            child: Text("${event.name}"),
          ),
          content: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.blueAccent, width: 1),
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                    ),
                    child: ListView(
                      children: [
                        Container(
                          child: Text("${convertFormatOfCreatedDate(DateTime.parse(event.createdDate))}"),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 25)),
                        Row(
                          children: [
                            Expanded(child: Text("")),
                            Text("${event.name}"),
                            Padding(padding: EdgeInsets.only(left: 10)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Text("")),
                            Text("${event.note}"),
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
                            Text('${calculateAgedays(DateTime.parse(widget.child.birthDate),DateTime.parse(event.createdDate))}',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                            Padding(padding: EdgeInsets.only(left:15.0)),
                            Text('أشهر',style: TextStyle(color: Colors.black,fontSize: 18.0)),
                            Padding(padding: EdgeInsets.only(left: 10.0)),
                            Text('${calculateAgeMonth(DateTime.parse(widget.child.birthDate),DateTime.parse(event.createdDate))}',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                            Padding(padding: EdgeInsets.only(left:15.0)),
                            Text('سنوات',style: TextStyle(color: Colors.black,fontSize: 18.0)),
                            Padding(padding: EdgeInsets.only(left: 10.0)),
                            Text('${calculateAge(DateTime.parse(widget.child.birthDate),DateTime.parse(event.createdDate))}',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
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

            ],

          ),
          actions: <Widget>[
            FlatButton(
              child: Text('حسنا'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }

  _showDevelopmentDialog(Development development) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Center(
            child: Text("${development.name}"),
          ),
          content: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.greenAccent, width: 1),
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                    ),
                    child: ListView(
                      children: [
                        Container(
                          child: Text("${convertFormatOfCreatedDate(DateTime.parse(development.createdDate))}"),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 25)),
                        Row(
                          children: [
                            Expanded(child: Text("")),
                            Text("${development.name}"),
                            Padding(padding: EdgeInsets.only(left: 10)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Text("")),
                            Text("${development.note}"),
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
                            Text('${calculateAgedays(DateTime.parse(widget.child.birthDate),DateTime.parse(development.createdDate))}',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                            Padding(padding: EdgeInsets.only(left:15.0)),
                            Text('أشهر',style: TextStyle(color: Colors.black,fontSize: 18.0)),
                            Padding(padding: EdgeInsets.only(left: 10.0)),
                            Text('${calculateAgeMonth(DateTime.parse(widget.child.birthDate),DateTime.parse(development.createdDate))}',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                            Padding(padding: EdgeInsets.only(left:15.0)),
                            Text('سنوات',style: TextStyle(color: Colors.black,fontSize: 18.0)),
                            Padding(padding: EdgeInsets.only(left: 10.0)),
                            Text('${calculateAge(DateTime.parse(widget.child.birthDate),DateTime.parse(development.createdDate))}',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
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

            ],

          ),
          actions: <Widget>[
            FlatButton(
              child: Text('حسنا'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }

}


