
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io';

class DatabaseConfig {
  static Database _honeyBee;
  final String descTable = 'descTable';
  final String cloumnId = 'id';
  final String cloumnHeight = 'height';
  final String cloumnWeight = 'weight';
  final String cloumnBmi = 'bmi';
  final String cloumnDate = 'date';
  final String columnComment = 'comment';

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
    var descsql = "CREATE TABLE $descTable ($cloumnId INTEGER PRIMARY KEY ,"
        "$cloumnHeight TEXT,$cloumnWeight TEXT,$cloumnBmi TEXT,$cloumnDate TEXT,$columnComment TEXT)";
    await db.execute(descsql);
  }
}