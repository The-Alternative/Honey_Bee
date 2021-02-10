import 'package:childrensdiary/models/event.dart';
import 'package:childrensdiary/service/eventService.dart';
import 'dart:async';

class EventController {


  final EventService eventService =new EventService();

  Future<int> saveEvent(Event event) async{
    return this.eventService.saveEvent(event);
  }

  Future<List> getAllEvents() async{
    return this.eventService.getAllEvents();
  }

  Future<List> getChildEvents(int id) async{
    return this.eventService.getChildEvents(id);
  }

  Future<List> searchChildEvents(int id,String text) async{
    return this.eventService.searchChildEvents(id, text);
  }

  Future<List> getChildEvent(int id,int eventId) async{
    return this.eventService.getChildEvent(id, eventId);
  }

  Future<int> getEventsCount () async{
    return this.eventService.getEventsCount();
  }

  Future<Event> getEvent (int id) async{
    return this.eventService.getEvent(id);
  }

  Future<int> updateEvent(Event event) async{
    return this.eventService.updateEvent(event);
  }

  Future<int> deleteEvent(Event event) async{
    return this.eventService.deleteEvent(event);
  }

  close() async{
    return this.eventService.close();
  }
}