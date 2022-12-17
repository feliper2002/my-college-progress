import 'package:dartz/dartz.dart';
import 'package:my_college_progress/modules/courses/domain/entities/course_db.dart';
import 'package:my_college_progress/modules/courses/domain/repositories/get_courses_by_status_repository.dart';
import 'package:my_college_progress/modules/courses/infra/course_errors.dart';
import 'package:my_college_progress/modules/courses/infra/course_types.dart';
import 'package:my_college_progress/modules/courses/infra/datasources/get_courses_by_status_datasource.dart';

class GetCoursesByStatusRepositoryImpl implements GetCoursesByStatusRepository {
  final GetCoursesByStatusDatasource datasource;

  GetCoursesByStatusRepositoryImpl(this.datasource);

  @override
  FutureCourse<List<CourseDB>> getCoursesByStatus(String status) async {
    try {
      final data = await datasource.getCoursesByStatus(status);

      List<CourseDB> courses = [];

      courses = data.map((e) => CourseDB.fromMap(e)).toList();

      return Right(courses);
    } on CourseDatabaseFailure catch (e) {
      throw Left(CourseDataRetrieveFailure(e.message));
    } catch (e) {
      throw Left(CourseDataRetrieveFailure(e.toString()));
    }
  }
}
