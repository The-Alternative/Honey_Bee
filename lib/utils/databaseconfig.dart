import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DatabaseConfig {
  static Database _honeyBee;
  final String courses = 'courses';
  final String columnid = 'id';
  final String columnnamecourse = 'namecourse';
  final String columnnameteachar = 'nameteachar';
  final String columnemail = 'email';
  final String columnteacharnumber = 'teacharnumber';

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
    var myOwnDb = await openDatabase(path, version: 1, onCreate: _oncreate);
    return myOwnDb;
  }

  void _oncreate(Database db, int newVersion) async {
    var coursesql =
        "CREATE TABLE $courses($columnid INTEGER PRIMARY KEY, $columnnamecourse TEXT ,$columnnameteachar TEXT , $columnemail TEXT , $columnteacharnumber TEXT)";
    await db.execute(coursesql);
  }
}
