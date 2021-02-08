import 'package:childrensdiary/models/development.dart';
import 'package:childrensdiary/service/developmentService.dart';
import 'dart:async';

class DevelopmentController {


  final DevelopmentService developmentService = new DevelopmentService();

  Future<int> saveDevelopment(Development development) async{
    return this.developmentService.saveDevelopment(development);
  }

  Future<List> getAllDevelopments() async{
    return this.developmentService.getAllDevelopments();
  }

  Future<List> getChildDevelopments(int id) async{
    return this.developmentService.getChildDevelopments(id);
  }

  Future<List> getChildDevelopment(int id,int developmentId) async{
    return this.developmentService.getChildDevelopment(id, developmentId);
  }

  Future<int> getDevelopmentsCount () async{
    return this.developmentService.getDevelopmentsCount();
  }

  Future<Development> getDevelopment (int id) async{
    return this.developmentService.getDevelopment(id);
  }

  Future<int> updateDevelopment(Development development) async{
    return this.developmentService.updateDevelopment(development);
  }

  Future<int> deleteDevelopment(Development development) async{
    return this.developmentService.deleteDevelopment(development);
  }

  close() async{
    return this.developmentService.close();
  }
}