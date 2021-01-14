import 'package:childrensdiary/controllers/childController.dart';
import 'package:childrensdiary/models/child.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class AddChild extends StatefulWidget {
  final Child child;
  AddChild(this.child);
  @override
  State<StatefulWidget> createState() {
    return new AddChildState();
  }

}

class AddChildState extends State<AddChild>{

  ChildController db = new ChildController();
  TextEditingController _nameController;
  TextEditingController _sexController;
  TextEditingController _birthDateController;
  TextEditingController _imageController;
  TextEditingController _isActiveController;

@override
void initState(){
  // TODO: implement initState
  super.initState();
  _nameController = new TextEditingController(text: widget.child.name);
  _sexController = new TextEditingController(text: widget.child.sex);
  _birthDateController = new TextEditingController(text:"${widget.child.birthDate}" );
  _imageController = new TextEditingController(text: widget.child.image);
  _isActiveController = new TextEditingController(text:"${widget.child.isActive}" );
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
            child: new ListView(
              children: [
                new Padding(padding: EdgeInsets.only(bottom: 50.0)),
                new MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: new Text('تحميل صورة'),
                  padding: EdgeInsets.all(50),
                  shape: CircleBorder(side: BorderSide(
                      color: Colors.amberAccent
                  )),
                  splashColor: Colors.amberAccent,
                  highlightColor: Colors.amberAccent,

                ),
                new Center(
                    child: new Container(
                      width: MediaQuery.of(context).size.width *0.9,
                      child: new TextField(
                        controller: _nameController,
                        textAlign: TextAlign.right,

                        style: TextStyle(fontSize: 18.0 , color: Colors.amberAccent,),cursorColor: Colors.amberAccent,
                        decoration: InputDecoration(
                          labelStyle: new TextStyle(
                              color: Colors.amberAccent
                          ),
                          focusedBorder:UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.amberAccent, width: 1.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.amberAccent),
                          ),
                          hintText: 'الاسم',
                          hintStyle: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                ),
                new Center(
                    child: new Container(
                      width: MediaQuery.of(context).size.width *0.9,
                      child: new TextField(
                        controller: _sexController,
                        textAlign: TextAlign.right,

                        style: TextStyle(fontSize: 18.0 , color: Colors.amberAccent,),cursorColor: Colors.amberAccent,
                        decoration: InputDecoration(
                          labelStyle: new TextStyle(
                              color: Colors.amberAccent
                          ),
                          focusedBorder:UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.amberAccent, width: 1.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.amberAccent),
                          ),
                          hintText: 'الجنس',
                          hintStyle: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
                          prefixIcon: new DropdownButton<String>(
                            underline: Container(
                              decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.transparent))
                              ),
                            ),
                            icon: new Icon(Icons.keyboard_arrow_down),
                            items: <String>['ذكر', 'انثى',].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ),
                      ),
                    )
                ),
                new Center(
                    child: new Container(
                      width: MediaQuery.of(context).size.width *0.9,
                      child: new TextField(
                        controller: _birthDateController,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.datetime ,
                        style: TextStyle(fontSize: 18.0 , color: Colors.amberAccent,),cursorColor: Colors.amberAccent,
                        decoration: InputDecoration(
                          labelStyle: new TextStyle(
                              color: Colors.amberAccent
                          ),
                          focusedBorder:UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.amberAccent, width: 1.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.amberAccent),
                          ),
                          hintText: 'تاريخ الميلاد',
                          hintStyle: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                ),
                new Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height *0.1)),
                new Center(
                  child: new Container(
                    width: MediaQuery.of(context).size.width *0.7,
                    child: new Row(
                      children: [
                        new FlatButton(
                          child:(widget.child.id != null) ? new Text('update',style:  TextStyle(fontSize: 19.0,color: Colors.black)):  Text('موافق',style: new TextStyle(fontSize: 19.0,color: Colors.black)),
                          onPressed: (){
                            if(widget.child.id != null){
                              db.updateChild(Child.fromeMap({
                                'id' : widget.child.id,
                                'name' : _nameController.text,
                                'sex' : _sexController.text,
                                'birthDate' : int.parse(_birthDateController.text),
                                'image' : 'sssssssss',
                                'isActive' : 1,
                              })).then((_) {
                                Navigator.pop(context,'update');
                              });
                            }else{
                              db.saveChild(Child(
                                  _nameController.text,
                                  _sexController.text,
                                  int.parse(_birthDateController.text),
                                  'sssssssss',
                                  1)).then((_) {
                                    Navigator.pop(context,'save');
                                  });
                            }
                          },
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
          bottomNavigationBar: new Icon(Icons.home,color: Colors.black12,size: 50.2,),
        ),
      ),
    );
  }
}