import '../../infra/course_types.dart';
import '../entities/course.dart';

abstract class GetAllCoursesRepository {
  FutureCourse<List<Course>> getAllCourses();
}
