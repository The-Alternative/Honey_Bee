import 'package:childrensdiary/views/AddChild.dart';
import 'package:childrensdiary/controllers/childController.dart';
import 'package:childrensdiary/models/child.dart';
import 'package:childrensdiary/views/ChildInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';






class ChildHabits extends StatefulWidget {
  final Child child;
  ChildHabits(this.child);
  @override
  State<StatefulWidget> createState() {
    return new ChildHabitsState();
  }

}

class ChildHabitsState extends State<ChildHabits>{


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
          body: Center(
            child: Container(
              child: new ListView(
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Stack(
                    children: <Widget>[

                      Container(
                        width: double.infinity,
                        height: 400,
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.amberAccent, width: 1),
                          borderRadius: BorderRadius.circular(5),
                          shape: BoxShape.rectangle,
                        ),
                        child: ListView(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width *0.8,top: 3),
                              child: Icon(Icons.attach_file),
                            ),
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
                                  child: new Text("عادات سلبية",style: TextStyle(color: Colors.white,fontSize: 14),),
                                ),
                                new Padding(padding: EdgeInsets.only(left: 10))

                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            Row(
                              children: [
                                Expanded(child: Text(""),),
                                Text("خمول وحركة قليلة",textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),
                                Padding(padding: EdgeInsets.only(left: 10))
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            Row(
                              children: [
                                Expanded(child: Text(""),),
                                Text("خمول وحركة قليلة",textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),
                                Padding(padding: EdgeInsets.only(left: 10))
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            Row(
                              children: [
                                Expanded(child: Text(""),),
                                Text("خمول وحركة قليلة",textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),
                                Padding(padding: EdgeInsets.only(left: 10))
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 15)),
                            Row(
                              children: [
                                new Expanded(child: Text("")),
                                new Container(
                                  padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom:5),
                                  decoration: BoxDecoration(color: Colors.green,
                                    border: Border.all(
                                        color:  Colors.green, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,),
                                  child: new Text("عادات إيجابية",style: TextStyle(color: Colors.white,fontSize: 14),),
                                ),
                                new Padding(padding: EdgeInsets.only(left: 10))

                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            Row(
                              children: [
                                Expanded(child: Text(""),),
                                Text("خمول وحركة قليلة",textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),
                                Padding(padding: EdgeInsets.only(left: 10))
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            Row(
                              children: [
                                Expanded(child: Text(""),),
                                Text("خمول وحركة قليلة",textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),
                                Padding(padding: EdgeInsets.only(left: 10))
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            Row(
                              children: [
                                Expanded(child: Text(""),),
                                Text("خمول وحركة قليلة",textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),
                                Padding(padding: EdgeInsets.only(left: 10))
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            Row(
                              children: [
                                Expanded(child: Text(""),),
                                Text("خمول وحركة قليلة",textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),
                                Padding(padding: EdgeInsets.only(left: 10))
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            Row(
                              children: [
                                Expanded(child: Text(""),),
                                Text("خمول وحركة قليلة",textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),
                                Padding(padding: EdgeInsets.only(left: 10))
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            Row(
                              children: [
                                Expanded(child: Text(""),),
                                Text("خمول وحركة قليلة",textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),
                                Padding(padding: EdgeInsets.only(left: 10))
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            Row(
                              children: [
                                Expanded(child: Text(""),),
                                Text("خمول وحركة قليلة",textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),
                                Padding(padding: EdgeInsets.only(left: 10))
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            Row(
                              children: [
                                Expanded(child: Text(""),),
                                Text("خمول وحركة قليلة",textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),
                                Padding(padding: EdgeInsets.only(left: 10))
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            Row(
                              children: [
                                Expanded(child: Text(""),),
                                Text("خمول وحركة قليلة",textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),
                                Padding(padding: EdgeInsets.only(left: 10))
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
                              child: Image.asset("assets/images/habits.png",width: 50,)
                          )),
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
              ),
            ),
          ),
          bottomNavigationBar:  new Icon(Icons.home,color: Colors.black12,size: 50.2),

        ),
      ),
    );
  }
}


