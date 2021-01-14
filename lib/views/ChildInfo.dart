import 'package:childrensdiary/views/AddChild.dart';
import 'package:childrensdiary/controllers/childController.dart';
import 'package:childrensdiary/models/child.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChildInfo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new ChildInfoState();
  }

}
class ChildInfoState extends State<ChildInfo>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Child Information",
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
          body: new Center(
            child: new Container(
              child: new ListView(
                children: [
                  new Padding(padding: EdgeInsets.only(bottom: 25.0)),

                  TextField(
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(width: 1,color: Colors.amberAccent),
                        ),
                      hintText: '',
                      hintStyle: TextStyle(fontSize: 16),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(width: 1,color: Colors.amberAccent),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.amberAccent
                      ),

                      contentPadding: EdgeInsets.only(left: 10,right: 10),
                      fillColor: Colors.white70,
                      prefixIcon: Icon(Icons.search,color: Colors.amberAccent,)
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15.0)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20.0)),
                      new Text('م',style: TextStyle(color: Colors.grey,fontSize: 18.0),) ,
                      Padding(padding: EdgeInsets.only(left: 10.0)),
                      Expanded(
                        child:new Text('08:30',style: TextStyle(color: Colors.grey,fontSize: 18.0),) ,
                      ),
                      new Text('05/01/2021',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                      Padding(padding: EdgeInsets.only(left: 20.0)),
                    ],
                  ),
                  Center(
                    child:  new MaterialButton(
                      onPressed: () {},
                      color: Colors.white,
                      textColor: Colors.grey,
                      child: new Icon(Icons.person,color: Colors.amberAccent,size: 50.0,),
                      padding: EdgeInsets.all(35),
                      shape: CircleBorder(side: BorderSide(
                          color: Colors.amberAccent
                      )),
                      splashColor: Colors.amberAccent,
                      highlightColor: Colors.amberAccent,

                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15.0)),
                  Center(
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.4,)),
                        new Text('ahmad'),
                        Padding(padding: EdgeInsets.only(left: 10.0)),
                        new Icon(Icons.face,color: Colors.blueAccent,)
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15.0)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left:30.0)),
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
                      Padding(padding: EdgeInsets.only(left:30.0)),
                      Text(':',style: TextStyle(color: Colors.black,fontSize: 18.0)),
                      Padding(padding: EdgeInsets.only(left: 1.0)),
                      Text('العمر',style: TextStyle(color: Colors.black,fontSize: 20.0),),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15.0)),
                  new Container(
                    padding: EdgeInsets.all(0.5),
                    margin: EdgeInsets.only(left: 20,right: 20),
                    color: Colors.amberAccent,
                  ),
                  new Row(
                    children: [
                      new Container(
                          padding: EdgeInsets.only(left:30.0,right: 30.0,top: 30.0,bottom: 25.0),
                          child: new Column(
                            children: [
                              Image.asset("assets/images/habits.png",width: 50,height: 50,),
                              new Text('سلوك و عادات')
                            ],
                          )
                      ),
                      new Container(
                          padding: EdgeInsets.only(top: 30.0,bottom: 25.0),
                          child: new Column(
                            children: [
                              Image.asset("assets/images/events.png",width: 50,height: 50,),
                              new Text('احداث هامة')
                            ],
                          )
                      ),
                      new Container(
                          padding: EdgeInsets.only(left:30.0,right: 30.0,top: 30.0,bottom: 25.0),
                          child: new Column(
                            children: [
                              Image.asset("assets/images/developments.png",width: 50,height: 50,),
                              new Text('تطورات')
                            ],
                          )
                      ),
                      new Container(
                          padding: EdgeInsets.only(top: 30.0,bottom: 25.0),
                          child: new Column(
                            children: [
                              Image.asset("assets/images/helth.png",width: 50,height: 50,),
                              new Text('الصحة')
                            ],
                          )
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15.0)),
                  new Container(
                    child: Center(
                      child: Text('استعراض',style: TextStyle(color: Colors.black54,fontSize: 22.0),),
                    ),
                  ),


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