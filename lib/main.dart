import 'package:childrensdiary/Veiws/ChildInfo.dart';
import 'package:childrensdiary/Veiws/Home.dart';
import 'package:childrensdiary/controllers/childController.dart';
import 'package:childrensdiary/controllers/healthController.dart';
import 'package:childrensdiary/models/child.dart';
import 'package:childrensdiary/models/health.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:childrensdiary/Routes.dart';

//List list1;
void main() async{
//  var db = new ChildController();
//  WidgetsFlutterBinding.ensureInitialized();
////  int childSaved = await db.saveChild(
////    new Child('Ali', 'male',1, 'glfdmklghd', 0)
////  );
////  print("saved child : $childSaved");
//  Child list=await db.getChild(5);
//  print(list.name);
//
//  print('----------------------');
//  var db2 = new HealthController();
//  WidgetsFlutterBinding.ensureInitialized();
//  int healthSaved = await db2.saveHealth(
//      new Health('ssssssss', 'ssssss', 143, 54, 37, 15, 15, 453)
//  );
//  print("saved health : $healthSaved");
//  Health list1=await db2.getHealth(1);
//  print(list1.childId);
//   list1=await db2.getAllHealth();
//  for(int i=5; i <list1.length; i++)
////    Health x = Health.map(list1[i]);
//  print('id: ${Health.map(list1[i]).id}');
  runApp(new MaterialApp(
    home:new ChildInfo(),
  ));
}


