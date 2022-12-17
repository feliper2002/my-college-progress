import 'package:my_college_progress/modules/courses/domain/entities/course_db.dart';
import 'package:my_college_progress/modules/courses/infra/course_types.dart';

abstract class SelectCourseRepository {
  FutureCourse<CourseDB> selectCourse(String name);
}
