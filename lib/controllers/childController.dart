import 'package:childrensdiary/models/child.dart';
import 'package:childrensdiary/service/childService.dart';
import 'dart:async';

class ChildController {
  final ChildService childService = new ChildService() ;


  Future<int> saveChild(Child child) async{
  return this.childService.saveChild(child);
  }

  Future<List> getAllChild() async{
    return this.childService.getAllChild();
  }

  Future<int> getChildCount () async{
    return this.childService.getChildCount();
  }

  Future<Child> getChild (int id) async{
    return this.childService.getChild(id);
  }

  Future<int> updateChild(Child child) async{
    return this.childService.updateChild(child);
  }

  Future<int> deleteChild(Child child) async{
    return this.childService.deleteChild(child);
  }

   close() async{
     return this.childService.close();
  }
}