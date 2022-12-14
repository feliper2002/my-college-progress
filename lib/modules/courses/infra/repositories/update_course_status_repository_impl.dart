import 'package:dartz/dartz.dart';
import 'package:my_college_progress/modules/courses/domain/repositories/update_course_repository.dart';
import 'package:my_college_progress/modules/courses/infra/course_types.dart';
import 'package:my_college_progress/modules/courses/infra/datasources/update_course_status_datasource.dart';

class UpdateCourseStatusRepositoryImpl implements UpdateCourseRepository {
  final UpdateCourseStatusDatasource datasource;

  UpdateCourseStatusRepositoryImpl(this.datasource);

  @override
  FutureCourse<void> updateCourse(String name, String status) async {
    try {
      final data = await datasource.updateCourseStatus(name, status);
      return Right(data);
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
