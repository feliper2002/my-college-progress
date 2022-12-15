import 'package:my_college_progress/modules/courses/domain/entities/course.dart';
import 'package:my_college_progress/modules/courses/domain/entities/course_db.dart';

abstract class CourseState {}

class InitialCourseState extends CourseState {}

class LoadingCourseState extends CourseState {}

class SuccessCourseSelectedState extends CourseState {
  final CourseDB course;

  SuccessCourseSelectedState(this.course);
}

class SuccessCourseInsertState extends CourseState {}

class SuccessCourseUpdateState extends CourseState {}

class SucessGetAllCoursesState extends CourseState {
  final List<Course> courses;

  SucessGetAllCoursesState(this.courses);
}

class ErrorCourseState extends CourseState {}
