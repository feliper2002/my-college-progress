import 'package:my_college_progress/modules/courses/infra/course_types.dart';

abstract class InsertAllCoursesRepository {
  FutureCourse<void> insertAllCourses();
}
