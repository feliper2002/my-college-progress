import 'package:my_college_progress/modules/courses/domain/repositories/insert_all_courses_repository.dart';
import 'package:my_college_progress/modules/courses/infra/course_types.dart';

abstract class InsertAllCourses {
  FutureCourse<void> call();
}

class InsertAllCoursesImpl implements InsertAllCourses {
  final InsertAllCoursesRepository repository;

  InsertAllCoursesImpl(this.repository);

  @override
  FutureCourse<void> call() async {
    return repository.insertAllCourses();
  }
}
