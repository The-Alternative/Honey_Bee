import 'package:childrensdiary/Veiws/AddChild.dart';
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

                  TextField(
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: '',
                      hintStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          width: 10,
                          color: Colors.amberAccent
                        ),
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.all(16),
                      fillColor: Colors.white70,
                      prefixIcon: Icon(Icons.search)
                    ),
                  ),

                ],
              ),
            ),
          ),
                  ),
      ),
    );
  }

}