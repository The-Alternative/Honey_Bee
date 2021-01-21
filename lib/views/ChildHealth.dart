import 'package:childrensdiary/controllers/healthController.dart';
import 'package:childrensdiary/models/health.dart';
import 'package:childrensdiary/views/AddChild.dart';
import 'package:childrensdiary/controllers/childController.dart';
import 'package:childrensdiary/models/child.dart';
import 'package:childrensdiary/views/ChildInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';






class ChildHealth extends StatefulWidget {
  final Child child;
  ChildHealth(this.child);
  @override
  State<StatefulWidget> createState() {
    return new ChildHealthState();
  }

}

class ChildHealthState extends State<ChildHealth>{

  List<Health> childHealths =new List();
  Health list ;
  HealthController db = new HealthController();


  @override
  void initState() {
    //  TODO: implement initState
    super.initState();
    db.getChildHealths(widget.child.id).then((allChildren) {
      setState(() {
        allChildren.forEach((health) {
          childHealths.add(Health.fromeMap(health));
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
          body: new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:AssetImage("assets/images/background.png"), fit: BoxFit.contain,
                ),
              ),
//            color: Colors.white12,
              child:(childHealths.length > 0)? new ListView.builder(
                  itemCount: childHealths.length,
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
                                      Text("${childHealths[posision].name}",textDirection: TextDirection.rtl),
                                      Padding(padding: EdgeInsets.only(left: 10)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child: Text("")),
                                      Text("${childHealths[posision].note}",textDirection: TextDirection.rtl),
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
                                          new Text('${childHealths[posision].tempreture}',style: TextStyle(fontSize: 18),),
                                        ],
                                      ),
                                      new Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.2)),
                                      new Column(
                                        children: [
                                          new Text('الوزن',style: TextStyle(fontSize: 18),),
                                          new Padding(padding: EdgeInsets.only(bottom: 15.0)),
                                          new Text('${childHealths[posision].weight}',style: TextStyle(fontSize: 18),),
                                        ],
                                      ),
                                      new Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.2)),
                                      new Column(
                                        children: [
                                          new Text('الطول',style: TextStyle(fontSize: 18),),
                                          new Padding(padding: EdgeInsets.only(bottom: 15.0)),
                                          new Text('${childHealths[posision].tall}',style: TextStyle(fontSize: 18),),

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
                        (posision == childHealths.length-1) ?  new Center(
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
                        child: Text("No Health Note For this child"),
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

}


//Column(
//children: [
//new Padding(padding: EdgeInsets.only(bottom: 50.0)),
//new Center(
//child: new Container(
//width: MediaQuery.of(context).size.width *0.7,
//child: new TextField(
//textAlign: TextAlign.right,
//
//style: TextStyle(fontSize: 18.0 , color: Colors.amberAccent,),cursorColor: Colors.amberAccent,
//decoration: InputDecoration(
//labelStyle: new TextStyle(
//color: Colors.amberAccent,
//
//),
//focusedBorder:UnderlineInputBorder(
//borderSide: const BorderSide(color: Colors.amberAccent, width: 1.0),
//),
//enabledBorder: UnderlineInputBorder(
//borderSide: BorderSide(
//color: Colors.amberAccent),
//),
//prefixIcon: new DropdownButton<String>(
//underline: Container(
//decoration: const BoxDecoration(
//border: Border(bottom: BorderSide(color: Colors.transparent))
//),
//),
//icon: new Icon(Icons.keyboard_arrow_down),
//items: <String>['${children[3].name}', '${children[1].name}','${children[2].name}'].map((String value) {
//return new DropdownMenuItem<String>(
//value: value,
//child: FlatButton(
//child: Text('$value'),
//onPressed:() => _childInfo(context) ,
//),
//);
//}).toList(),
//onChanged: (_) {},
//),
//hintText: 'الاسم',
//hintStyle: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
//hoverColor: Colors.amberAccent,
//focusColor: Colors.amberAccent,
//),
//onSubmitted: (value) =>  Navigator.push(
//context,
//MaterialPageRoute(builder: (context) => ChildInfo(children[0]))) ,
//),
//)
//),
//
//
//],${childHealths[posision].note}
//),