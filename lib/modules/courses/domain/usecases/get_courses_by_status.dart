import 'package:my_college_progress/modules/courses/domain/entities/course_db.dart';

import '../../infra/course_types.dart';
import '../repositories/get_courses_by_status_repository.dart';

abstract class GetCoursesByStatus {
  FutureCourse<List<CourseDB>> call(String status);
}

class GetCoursesByStatusImpl implements GetCoursesByStatus {
  final GetCoursesByStatusRepository repository;

  GetCoursesByStatusImpl(this.repository);

  @override
  FutureCourse<List<CourseDB>> call(String status) {
    return repository.getCoursesByStatus(status);
  }
}
