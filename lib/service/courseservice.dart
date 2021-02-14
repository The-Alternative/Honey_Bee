import 'package:honeybee_study/model/course.dart';
import 'package:honeybee_study/utils/databaseconfig.dart';
import 'package:sqflite/sqflite.dart';

class CourseService {
  static Database _honeyBee;
  final String courses = 'courses';
  final String columnid = 'id';
  final String columnnamecourse = 'namecourse';
  final String columnnameteachar = 'nameteachar';
  final String columnemail = 'email';
  final String columnteacharnumber = 'teacharnumber';

  final DatabaseConfig db = new DatabaseConfig();

  Future<int> savecourse(Course course) async {
    var dbClient = await db.honeyBee;
    int result = await dbClient.insert("$courses", course.toMap());
    return result;
  }

  Future<List<Course>> getAll() async {
    List<Course> _courselist = [];
    var dbClient = await db.honeyBee;
    var result = await dbClient.query(courses);
    result.forEach((element) {
      var course = Course.fromMap(element);
      _courselist.add(course);
    });
    return _courselist;
  }

  Future<int> updateCourse(Course course) async {
    var dbClient = await db.honeyBee;
    return await dbClient.update(courses, course.toMap(),
        where: "$columnid", whereArgs: [course.id]);
  }

  Future<int> deleteCourse(Course course) async {
    var dbClient = await db.honeyBee;
    return await dbClient.delete(courses, where: "$columnid = ${course.id}");
  }

  close() async {
    var dbClient = await db.honeyBee;
    return await dbClient.close();
  }
}
