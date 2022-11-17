import 'package:my_college_progress/modules/courses/domain/repositories/get_all_courses_repository.dart';
import 'package:my_college_progress/modules/courses/infra/course_types.dart';

import '../entities/course.dart';

abstract class GetAllCourses {
  FutureCourse<List<Course>> call();
}

class GetAllCoursesImpl implements GetAllCourses {
  final GetAllCoursesRepository repository;

  GetAllCoursesImpl(this.repository);

  @override
  FutureCourse<List<Course>> call() {
    return repository.getAllCourses();
  }
}
