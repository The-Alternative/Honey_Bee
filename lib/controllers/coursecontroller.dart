import 'package:honeybee_study/model/course.dart';
import 'package:honeybee_study/service/courseservice.dart';

class CourseController {
  final CourseService courseService = new CourseService();

  Future<int> savecourse(Course course) async {
    return this.courseService.savecourse(course);
  }

  Future<List<Course>> getAll() async {
    return this.courseService.getAll();
  }

  Future<int> updateCourse(Course course) async {
    return this.courseService.updateCourse(course);
  }

  Future<int> deleteCourse(Course course) async {
    return this.courseService.deleteCourse(course);
  }

  close() async {
    return await this.courseService.close();
  }
}
