import 'package:my_college_progress/modules/courses/infra/course_types.dart';

abstract class UpdateCourseGradesRepository {
  FutureCourse<void> updateCourseGrades(
    String name,
    String status, {
    double? av1,
    double? av2,
    double? av3,
    int? edag,
    double? recuperacao,
  });
}
