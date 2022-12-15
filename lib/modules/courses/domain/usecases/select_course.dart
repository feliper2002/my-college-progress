import 'package:my_college_progress/modules/courses/domain/entities/course_db.dart';
import 'package:my_college_progress/modules/courses/domain/repositories/select_course_repository.dart';
import 'package:my_college_progress/modules/courses/infra/course_types.dart';

abstract class SelectCourse {
  FutureCourse<CourseDB> call(String name);
}

class SelectCourseImpl implements SelectCourse {
  final SelectCourseRepository repository;
  SelectCourseImpl({
    required this.repository,
  });

  @override
  FutureCourse<CourseDB> call(String name) async {
    return repository.selectCourse(name);
  }
}
