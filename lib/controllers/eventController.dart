import 'package:childrensdiary/models/event.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:childrensdiary/utils/databaseConfig.dart';

class EventController {

  final String eventTable = 'eventTable';
  final String cloumnId = 'id';
  final String cloumnName = 'name';
  final String cloumnNote = 'note';
  final String cloumnTall = 'tall';
  final String cloumnWeight = 'weight';
  final String cloumnTempreture = 'tempreture';
  final String cloumnIsActive = 'isActive';
  final String cloumnCreatedDate = 'createdDate';
  final String cloumnChildId = 'childId';
  final DatabaseConfig db = new DatabaseConfig();

  Future<int> saveEvent(Event event) async{
    var dbClient = await db.honeyBee;
    int result = await dbClient.insert("$eventTable", event.toMap());
    return result;
  }

  Future<List> getAllEvents() async{
    var dbClient = await db.honeyBee;
    var sql ="SELECT * FROM $eventTable";
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }

  Future<int> getEventsCount () async{
    var dbClient = await db.honeyBee;
    var sql ="SELECT COUNT(*) FROM $eventTable";
    return Sqflite.firstIntValue(
        await dbClient.rawQuery(sql)
    );
  }

  Future<Event> getEvent (int id) async{
    var dbClient = await db.honeyBee;
    var sql ="SELECT * FROM $eventTable WHERE $cloumnId = $id";
    var result = await dbClient.rawQuery(sql);
    if(result.length == 0) return null;
    return new Event.fromeMap(result.first);
  }

  Future<int> updateEvent(Event event) async{
    var dbClient = await db.honeyBee;
    return await dbClient.update(
        eventTable, event.toMap(),where: "$cloumnId",whereArgs: [event.id]
    );
  }

  Future<int> deleteEvent(Event event) async{
    var dbClient = await db.honeyBee;
    Event devent = new Event(event.name, event.note, event.tall, event.weight, event.tempreture,
        0, event.childId, event.createdDate);
    return await dbClient.update(
        eventTable, devent.toMap(),where: "$cloumnId",whereArgs: [event.id]
    );
  }

  close() async{
    var dbClient = await db.honeyBee;
    return await dbClient.close();
  }
}