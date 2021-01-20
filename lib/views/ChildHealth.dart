import 'package:childrensdiary/views/AddChild.dart';
import 'package:childrensdiary/controllers/childController.dart';
import 'package:childrensdiary/models/child.dart';
import 'package:childrensdiary/views/ChildInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';






class ChildHealth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ChildHealthState();
  }

}

class ChildHealthState extends State<ChildHealth>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new  MaterialApp(
      title: 'Welcome to Flutter',
      home: Container(
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
              new Image(image: AssetImage("assets/images/111.png"), width: 100.0,),
            ],
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              child: new ListView(
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Center (
                    child: Text("أحمد"),
                  ),
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
                              child: Text("05/12/2020"),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 15)),
                            Row(
                              children: [
                                Expanded(child: Text("")),
                                Text("ssn aaa sdsf",textDirection: TextDirection.rtl),
                                Padding(padding: EdgeInsets.only(left: 10)),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(child: Text("")),
                                Text("ssn aaa sdsf",textDirection: TextDirection.rtl),
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
                                    new Text('37',style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                                new Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.2)),
                                new Column(
                                  children: [
                                    new Text('الوزن',style: TextStyle(fontSize: 18),),
                                    new Padding(padding: EdgeInsets.only(bottom: 15.0)),
                                    new Text('35',style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                                new Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.2)),
                                new Column(
                                  children: [
                                    new Text('الطول',style: TextStyle(fontSize: 18),),
                                    new Padding(padding: EdgeInsets.only(bottom: 15.0)),
                                    new Text('105',style: TextStyle(fontSize: 18),),

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
                                Text('20',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                                Padding(padding: EdgeInsets.only(left:15.0)),
                                Text('أشهر',style: TextStyle(color: Colors.black,fontSize: 18.0)),
                                Padding(padding: EdgeInsets.only(left: 10.0)),
                                Text('6',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                                Padding(padding: EdgeInsets.only(left:15.0)),
                                Text('سنوات',style: TextStyle(color: Colors.black,fontSize: 18.0)),
                                Padding(padding: EdgeInsets.only(left: 10.0)),
                                Text('5',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
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
                              child: Text("05/12/2020"),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 15)),
                            Row(
                              children: [
                                Expanded(child: Text("")),
                                Text("ssn aaa sdsf",textDirection: TextDirection.rtl),
                                Padding(padding: EdgeInsets.only(left: 10)),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(child: Text("")),
                                Text("ssn aaa sdsf",textDirection: TextDirection.rtl),
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
                                    new Text('37',style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                                new Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.2)),
                                new Column(
                                  children: [
                                    new Text('الوزن',style: TextStyle(fontSize: 18),),
                                    new Padding(padding: EdgeInsets.only(bottom: 15.0)),
                                    new Text('35',style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                                new Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.2)),
                                new Column(
                                  children: [
                                    new Text('الطول',style: TextStyle(fontSize: 18),),
                                    new Padding(padding: EdgeInsets.only(bottom: 15.0)),
                                    new Text('105',style: TextStyle(fontSize: 18),),

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
                                Text('20',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                                Padding(padding: EdgeInsets.only(left:15.0)),
                                Text('أشهر',style: TextStyle(color: Colors.black,fontSize: 18.0)),
                                Padding(padding: EdgeInsets.only(left: 10.0)),
                                Text('6',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                                Padding(padding: EdgeInsets.only(left:15.0)),
                                Text('سنوات',style: TextStyle(color: Colors.black,fontSize: 18.0)),
                                Padding(padding: EdgeInsets.only(left: 10.0)),
                                Text('5',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
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


