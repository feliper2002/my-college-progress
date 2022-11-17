import 'package:dartz/dartz.dart';
import 'package:my_college_progress/modules/courses/domain/entities/course.dart';
import 'package:my_college_progress/modules/courses/domain/entities/semester.dart';
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
      final courses = Semester.fromMap(data).courses;
      return Right(courses);
    } on CourseDataFetchFailure catch (_) {
      throw Left(CourseDataRetrieveFailure());
    } catch (_) {
      throw Left(CourseDataRetrieveFailure());
    }
  }
}
