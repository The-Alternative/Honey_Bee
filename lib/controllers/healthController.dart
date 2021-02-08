import 'package:childrensdiary/models/health.dart';
import 'package:childrensdiary/service/healthService.dart';
import 'dart:async';

class HealthController {
  final HealthService healthService = new HealthService();


  Future<int> saveHealth(Health health) async{
    return this.healthService.saveHealth(health);
  }

  Future<List> getAllHealth() async{
    return this.healthService.getAllHealth();
  }

  Future<List> getChildHealths(int id) async{
    return this.healthService.getChildHealths(id);
  }

  Future<List> getChildHealth(int id,int healthId) async{
    return this.healthService.getChildHealth(id, healthId);
  }

  Future<int> getHealthCount () async{
    return this.healthService.getHealthCount();
  }

  Future<Health> getHealth (int id) async{
    return this.healthService.getHealth(id);
  }

  Future<int> updateHealth(Health health) async{
    return this.healthService.updateHealth(health);
  }

  Future<int> deleteHealth(Health health) async{
    return this.healthService.deleteHealth(health);
  }

  close() async{
    return this.healthService.close();
  }
}