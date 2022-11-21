import 'package:my_college_progress/modules/courses/infra/course_types.dart';

abstract class UpdateCourseRepository {
  FutureCourse<void> updateCourse(String name, String status);
}
