import 'package:my_college_progress/modules/courses/domain/entities/course_db.dart';

import '../../infra/course_types.dart';

abstract class GetCoursesByStatusRepository {
  FutureCourse<List<CourseDB>> getCoursesByStatus(String status);
}
