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






class ChildDevelopment extends StatefulWidget {
  final Child child;
  ChildDevelopment(this.child);
  @override
  State<StatefulWidget> createState() {
    return new ChildDevelopmentState();
  }

}

class ChildDevelopmentState extends State<ChildDevelopment>{

  List<Development> childDevelopments =new List();
  Development list ;
  DevelopmentController db = new DevelopmentController();

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
  }

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
                                    Text("${childDevelopments[posision].name}",textDirection: TextDirection.rtl),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(child: Text("")),
                                    Text("${childDevelopments[posision].note}",textDirection: TextDirection.rtl),
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
                                  child: Image.asset("assets/images/events.png",width: 50,)
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
}


