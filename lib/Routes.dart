import 'package:childrensdiary/models/child.dart';
import 'package:flutter/material.dart';
import 'package:childrensdiary/views/Home.dart';
import 'package:childrensdiary/views/AddChild.dart';

class Navigation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Navigation',
      routes: <String , WidgetBuilder>{
        '/Home': (BuildContext context) => new Home(),
        '/AddChild': (BuildContext context) => new AddChild(Child('', '', 0, '', 1)),
      },
      home: new Home(),
    );
//    throw UnimplementedError();
  }
}
