import 'package:dartz/dartz.dart';
import 'package:my_college_progress/modules/courses/domain/entities/course.dart';
import 'package:my_college_progress/modules/courses/domain/repositories/get_all_courses_repository.dart';
import 'package:my_college_progress/modules/courses/infra/datasources/get_all_courses_datasource.dart';
import 'package:my_college_progress/modules/courses/infra/course_errors.dart';
import 'package:my_college_progress/modules/courses/infra/course_types.dart';

class GetAllCoursesRepositoryImpl implements GetAllCoursesRepository {
  final GetAllCoursesDatasource datasource;

  GetAllCoursesRepositoryImpl(this.datasource);

  @override
  FutureCourse<List<Course>> getAllCourses() async {
    try {
      final data = await datasource.getAllCourses();
      final courses = data.map((c) => Course.fromMap(c)).toList();
      return Right(courses);
    } catch (_) {
      throw Left(CourseDataRetrieveFailure());
    }
  }
}
