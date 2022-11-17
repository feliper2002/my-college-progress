import 'package:my_college_progress/modules/courses/domain/entities/course.dart';

abstract class CourseState {}

class InitialCourseState extends CourseState {}

class LoadingCourseState extends CourseState {}

class SucessGetAllCoursesState extends CourseState {
  final List<Course> courses;

  SucessGetAllCoursesState(this.courses);
}

class ErrorCourseState extends CourseState {}
