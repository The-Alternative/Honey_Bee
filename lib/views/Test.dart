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






class Home1 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new Home1State();
  }

}

class Home1State extends State<Home1>{

  List<Development> childDevelopments =new List();
  List<Child> children =new List();
  Child list ;
  ChildController db = new ChildController();

  @override
  void initState() {
    //  TODO: implement initState
    super.initState();
    db.getAllChild().then((allChildren) {
      setState(() {
        allChildren.forEach((child) {
          children.add(Child.fromeMap(child));
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
          body:Column(
            children: [
              new Padding(padding: EdgeInsets.only(bottom: 50.0)),
              new Center(
                  child: new Container(
                    width: MediaQuery.of(context).size.width *0.7,
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
                        prefixIcon: new DropdownButton<String>(
                          underline: Container(
                            decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.transparent))
                            ),
                          ),
                          icon: new Icon(Icons.keyboard_arrow_down),
                          items: <String>['${children[3].name}', '${children[1].name}','${children[2].name}'].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child:new ListView.builder(
                                  itemCount: children.length,
                                  padding: const EdgeInsets.all(15.0),
                                  itemBuilder: (context,posision){
                                    return Column(
                                      children: [

                                        Divider(height: 5.0,),
                                        ListTile(
                                          title: Text('${children[posision].name}'),
                                          leading: Column(
                                            children: [

                                              CircleAvatar(
                                                backgroundColor: Colors.amberAccent,
                                                child: Text('${children[posision].id}',
                                                  style:TextStyle(fontSize: 22.0,color: Colors.white), ),
                                              )
                                            ],
                                          ),
                                          onTap: () => _navigatToChildInfo(context,children[posision]),
                                        ),
                                      ],

                                    );
                                  }
                              )
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                        hintText: 'الاسم',
                        hintStyle: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
                        hoverColor: Colors.amberAccent,
                        focusColor: Colors.amberAccent,
                      ),
                      onSubmitted: (value) =>  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChildInfo(children[0]))) ,
                    ),
                  )
              ),


            ],
          ),
          bottomNavigationBar:  new Icon(Icons.home,color: Colors.black12,size: 50.2),

        ),
      ),
    );
  }
  void _navigatToChildInfo(BuildContext context,Child child) async{
    await Navigator.push(
        context,
        MaterialPageRoute(builder:(context) => ChildInfo(child)));
  }

}



