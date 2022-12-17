import 'package:dartz/dartz.dart';
import 'package:my_college_progress/modules/courses/domain/repositories/insert_all_courses_repository.dart';
import 'package:my_college_progress/modules/courses/infra/course_errors.dart';
import 'package:my_college_progress/modules/courses/infra/course_types.dart';

import '../datasources/insert_all_courses_datasource.dart';

class InsertAllCoursesRepositoryImpl implements InsertAllCoursesRepository {
  final InsertAllCoursesDatasource datasource;

  InsertAllCoursesRepositoryImpl(this.datasource);

  @override
  FutureCourse<void> insertAllCourses() async {
    try {
      final data = await datasource.insertAllCourses();
      return Right(data);
    } on CourseDatabaseFailure catch (e) {
      throw Left(CourseDataRetrieveFailure(e.message));
    } catch (e) {
      throw Left(CourseDataRetrieveFailure(e.toString()));
    }
  }
}
