import 'package:childrensdiary/views/AddChild.dart';
import 'package:childrensdiary/controllers/childController.dart';
import 'package:childrensdiary/models/child.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Habits.dart';


class Search extends StatefulWidget{
  final Child child;
  Search(this.child);
  @override
  State<StatefulWidget> createState() {
    return new SearchState();
  }

}
class SearchState extends State<Search>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Search",
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
                  new Padding(padding: EdgeInsets.only(bottom: 40.0)),

                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20.0)),
                      Padding(padding: EdgeInsets.only(left: 10.0)),
                      Expanded(
                        child:new Text('',style: TextStyle(color: Colors.grey,fontSize: 18.0),) ,
                      ),
                      new Text('اختر',style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                      Padding(padding: EdgeInsets.only(left: 30.0)),
                    ],
                  ),
                  new Row(
                    children: [
                      new Expanded(child: Text("")),
                      new Container(
                          padding: EdgeInsets.only(top: 30.0,bottom: 25.0),
                          child: new Column(
                            children: [
                              new MaterialButton(
                                onPressed:() => _childHabits(context) ,
                                color: Colors.white,
                                child: Image.asset("assets/images/habits.png",width: 50,height: 50),
                                shape: CircleBorder(side: BorderSide(
                                    color: Colors.white
                                )),

                              ),

                              new Text('سلوك و عادات')
                            ],
                          )
                      ),
                      new Container(
                          padding: EdgeInsets.only(top: 30.0,bottom: 25.0),
                          child: new Column(
                            children: [
                              new MaterialButton(
                                onPressed: null,
                                color: Colors.white,
                                child: Image.asset("assets/images/events.png",width: 50,height: 50,),
                                shape: CircleBorder(side: BorderSide(
                                    color: Colors.white
                                )),
                                splashColor: Colors.white,
                                highlightColor: Colors.white,

                              ),


                              new Text('احداث هامة')
                            ],
                          )
                      ),
                      new Container(
                          padding: EdgeInsets.only(top: 30.0,bottom: 25.0),
                          child: new Column(
                            children: [
                              new MaterialButton(
                                onPressed: null,
                                color: Colors.white,
                                child: Image.asset("assets/images/developments.png",width: 50,height: 50,),
                                shape: CircleBorder(side: BorderSide(
                                    color: Colors.white
                                )),
                                splashColor: Colors.white,
                                highlightColor: Colors.white,

                              ),

                              new Text('تطورات')
                            ],
                          )
                      ),
                      new Container(
                          padding: EdgeInsets.only(top: 30.0,bottom: 25.0),
                          child: new Column(
                            children: [
                              new MaterialButton(
                                onPressed: null ,
                                color: Colors.white,
                                child: Image.asset("assets/images/helth.png",width: 50,height: 50,),
                                shape: CircleBorder(side: BorderSide(
                                    color: Colors.white
                                )),
                                splashColor: Colors.white,
                                highlightColor: Colors.white,

                              ),

                              new Text('الصحة')
                            ],
                          )
                      ),
                      new Expanded(child: Text("")),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15.0)),
                  Center(
                      child: new Container(
                        width: MediaQuery.of(context).size.width *0.9,
                        child: new TextField(
                          textAlign: TextAlign.right,

                          style: TextStyle(fontSize: 18.0 , color: Colors.amberAccent,),cursorColor: Colors.amberAccent,
                          decoration: InputDecoration(
                            labelStyle: new TextStyle(
                              color: Colors.amberAccent,

                            ),
                            focusedBorder:UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.amberAccent, width: 1.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.amberAccent),
                            ),
                            hintText: 'من تاريخ',
                            hintStyle: TextStyle(color: Colors.black12,fontSize: 20.0,fontWeight: FontWeight.bold),
                            hoverColor: Colors.amberAccent,
                            focusColor: Colors.amberAccent,
                          ),
                        ),
                      )
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15.0)),
                  Center(
                      child: new Container(
                        width: MediaQuery.of(context).size.width *0.9,
                        child: new TextField(
                          textAlign: TextAlign.right,

                          style: TextStyle(fontSize: 18.0 , color: Colors.amberAccent,),cursorColor: Colors.amberAccent,
                          decoration: InputDecoration(
                            labelStyle: new TextStyle(
                              color: Colors.amberAccent,

                            ),
                            focusedBorder:UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.amberAccent, width: 1.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.amberAccent),
                            ),
                            hintText: 'الى تاريخ',
                            hintStyle: TextStyle(color: Colors.black12,fontSize: 20.0,fontWeight: FontWeight.bold),
                            hoverColor: Colors.amberAccent,
                            focusColor: Colors.amberAccent,
                          ),
                        ),
                      )
                  ),
                  new Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height *0.15)),
                  new Center(
                    child: new Container(
                      width: MediaQuery.of(context).size.width *0.7,
                      child: new Row(
                        children: [
                          new FlatButton(
                            child:new Text('اسنعراض',style: new TextStyle(fontSize: 19.0,color: Colors.black45)),
                          ),
                          new Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width *0.15 )),
                          new FlatButton(
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

        ),
      ),
    );
  }
  void _childHabits(BuildContext context) async{
    String result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Habits()));
  }
}