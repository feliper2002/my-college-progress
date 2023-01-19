import 'package:dartz/dartz.dart';
import 'package:my_college_progress/modules/courses/infra/course_types.dart';

import '../../domain/repositories/update_course_grades_repository.dart';
import '../course_errors.dart';
import '../datasources/update_course_grades_datasource.dart';

class UpdateCourseGradesRepositoryImpl implements UpdateCourseGradesRepository {
  final UpdateCourseGradesDatasource datasource;

  UpdateCourseGradesRepositoryImpl(this.datasource);

  @override
  FutureCourse<void> updateCourseGrades(String name, String status,
      {double? av1,
      double? av2,
      double? av3,
      int? edag,
      double? recuperacao}) async {
    try {
      final data = await datasource.updateCourseGrades(name, status,
          av1: av1, av2: av2, av3: av3, edag: edag, recuperacao: recuperacao);
      return Right(data);
    } on CourseDatabaseFailure catch (e) {
      throw Left(CourseDataRetrieveFailure(e.message));
    } catch (e) {
      throw Left(CourseDataRetrieveFailure(e.toString()));
    }
  }
}
