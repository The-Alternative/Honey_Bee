import 'package:honeybee_study/model/course.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();
  static Database _db;

  Future<Database> createDatabase() async {
    if (_db != null) {
      return _db;
    }
    String path = join(await getDatabasesPath(), 'school.db');
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
      db.execute(
          'create table courses(id integer primary key autoincrement, namecourse varchar(50), nameteachar varchar(50), email varchar(50), teacharnumber integer)');
    });
    return _db;
  }

  Future<int> creatCourse(Course course) async {
    Database db = await createDatabase();
    return db.insert('courses', course.toMap());
  }

  Future<List> allCourses() async {
    Database db = await createDatabase();
    return db.query('courses');
  }

  Future<int> delete(int id) async {
    Database db = await createDatabase();
    return db.delete('courses', where: 'id = ?', whereArgs: [id]);
  }
}
