import 'package:dartz/dartz.dart';
import 'package:my_college_progress/modules/courses/domain/repositories/update_course_repository.dart';
import 'package:my_college_progress/modules/courses/infra/course_errors.dart';
import 'package:my_college_progress/modules/courses/infra/course_types.dart';

abstract class UpdateCourseStatus {
  FutureCourse<void> call(String name, String status);
}

class UpdateCourseStatusImpl implements UpdateCourseStatus {
  final UpdateCourseRepository repository;

  UpdateCourseStatusImpl(this.repository);

  @override
  FutureCourse<void> call(String name, String status) async {
    if (name.isEmpty) {
      return Left(CourseUsecaseFailure("Nome do curso é obrigatório!"));
    }

    if (status.isEmpty) {
      return Left(CourseUsecaseFailure(
          "Status que deseja atualizar para o curso é obrigatório!"));
    }

    return repository.updateCourse(name, status);
  }
}
