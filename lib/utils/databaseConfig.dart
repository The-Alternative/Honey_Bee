import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io';

class DatabaseConfig {
  static Database _honeyBee;

  final String childTable = 'childTable';
  final String cloumnId = 'id';
  final String cloumnName = 'name';
  final String cloumnSex = 'sex';
  final String cloumnBirthDate = 'birthDate';
  final String cloumnImage = 'image';
  final String cloumnIsActive = 'isActive';
  final String healthTable = 'healthTable';
  final String eventTable = 'eventTable';
  final String tablesTable = 'tablesTable';
  final String developmentTable = 'developmentTable';
  final String habitTable = 'habitTable';
  final String habitTypeTable = 'habitTypeTable';
  final String childHabitTable = 'childHabitTable';
  final String mediaTable = 'mediaTable';
  final String cloumnNote = 'note';
  final String cloumnTall = 'tall';
  final String cloumnWeight = 'weight';
  final String cloumnTempreture = 'tempreture';
  final String cloumnCreatedDate = 'createdDate';
  final String cloumnChildId = 'childId';
  final String cloumnTypeId = 'typeId';
  final String cloumnHabitId = 'habitId';
  final String cloumnMediaUrl = 'mediaUrl';
  final String cloumnTableId = 'tableId';
  final String cloumnItemId = 'itemId';

  Future<Database> get honeyBee async {
    if (_honeyBee != null) {
      return _honeyBee;
    }
    _honeyBee = await intDb();
    return _honeyBee;
  }

  intDb() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String path = join(appDirectory.path, 'honeyBee.db');
    var myOwnDb = await openDatabase(path, version: 1,
        onCreate: _oncreate);
    return myOwnDb;
  }

  void _oncreate(Database db, int newVersion) async {
    var childSql = "CREATE TABLE $childTable ($cloumnId INTEGER PRIMARY KEY ,"
        "$cloumnName TEXT,$cloumnSex TEXT,$cloumnBirthDate TEXT,$cloumnImage TEXT,$cloumnIsActive INTEGER)";
    await db.execute(childSql);
    var healthSql = "CREATE TABLE $healthTable ($cloumnId INTEGER PRIMARY KEY ,"
        "$cloumnName TEXT , $cloumnNote TEXT , $cloumnTall INTEGER , $cloumnWeight INTEGER ,"
        "$cloumnTempreture INTEGER , $cloumnIsActive INTEGER , $cloumnCreatedDate TEXT , $cloumnChildId INTEGER ,"
        "FOREIGN KEY ($cloumnChildId) REFERENCES $childTable ($cloumnId))";
    await db.execute(healthSql);
    var eventSql = "CREATE TABLE $eventTable ($cloumnId INTEGER PRIMARY KEY ,"
        "$cloumnName TEXT , $cloumnNote TEXT , $cloumnTall INTEGER , $cloumnWeight INTEGER ,"
        "$cloumnTempreture INTEGER , $cloumnIsActive INTEGER , $cloumnCreatedDate TEXT , $cloumnChildId INTEGER ,"
        "FOREIGN KEY ($cloumnChildId) REFERENCES $childTable ($cloumnId))";
    await db.execute(eventSql);
    var developmentSql = "CREATE TABLE $developmentTable ($cloumnId INTEGER PRIMARY KEY ,"
        "$cloumnName TEXT , $cloumnNote TEXT , $cloumnTall INTEGER , $cloumnWeight INTEGER ,"
        "$cloumnTempreture INTEGER , $cloumnIsActive INTEGER , $cloumnCreatedDate TEXT , $cloumnChildId INTEGER ,"
        "FOREIGN KEY ($cloumnChildId) REFERENCES $childTable ($cloumnId))";
    await db.execute(developmentSql);
    var habitSql = "CREATE TABLE $habitTable ($cloumnId INTEGER PRIMARY KEY ,"
        "$cloumnName TEXT ,"
        " $cloumnIsActive INTEGER , $cloumnCreatedDate TEXT , $cloumnTypeId INTEGER ,"
        "FOREIGN KEY ($cloumnTypeId) REFERENCES $habitTypeTable ($cloumnId))";
    await db.execute(habitSql);
    var habitTypeSql = "CREATE TABLE $habitTypeTable ($cloumnId INTEGER PRIMARY KEY ,$cloumnName TEXT )";
    await db.execute(habitTypeSql);
    var childHabitSql = "CREATE TABLE $childHabitTable ($cloumnId INTEGER PRIMARY KEY ,"
        " $cloumnIsActive INTEGER , $cloumnCreatedDate TEXT , $cloumnHabitId INTEGER ,$cloumnChildId INTEGER )";
    await db.execute(childHabitSql);
   var mediaSql = "CREATE TABLE $mediaTable ($cloumnId INTEGER PRIMARY KEY ,"
       "$cloumnMediaUrl TEXT ,"
       " $cloumnCreatedDate INTEGER , $cloumnTableId INTEGER ,$cloumnItemId INTEGER ,"
       "FOREIGN KEY ($cloumnTableId) REFERENCES $tablesTable ($cloumnId))";
   await db.execute(mediaSql);
  }
}