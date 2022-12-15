import 'package:dartz/dartz.dart';
import 'package:my_college_progress/modules/courses/domain/entities/course_db.dart';
import 'package:my_college_progress/modules/courses/domain/repositories/select_course_repository.dart';
import 'package:my_college_progress/modules/courses/infra/course_types.dart';
import 'package:my_college_progress/modules/courses/infra/datasources/select_course_datasource.dart';

class SelectCourseRepositoryImpl implements SelectCourseRepository {
  final SelectCourseDatasource datasource;

  SelectCourseRepositoryImpl(this.datasource);

  @override
  FutureCourse<CourseDB> selectCourse(String name) async {
    try {
      final data = await datasource.selectCourse(name);
      final model = CourseDB.fromMap(data);
      return Right(model);
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
