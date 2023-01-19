import 'package:dartz/dartz.dart';
import 'package:my_college_progress/modules/courses/domain/repositories/update_course_grades_repository.dart';
import 'package:my_college_progress/modules/courses/infra/course_errors.dart';
import 'package:my_college_progress/modules/courses/infra/course_types.dart';

abstract class UpdateCourseGrades {
  FutureCourse<void> call(
    String name,
    String status, {
    double? av1,
    double? av2,
    double? av3,
    int? edag,
    double? recuperacao,
  });
}

class UpdateCourseGradesImpl implements UpdateCourseGrades {
  final UpdateCourseGradesRepository repository;

  UpdateCourseGradesImpl(this.repository);

  _validateGrande(num? grade) {
    if ((grade != null)) {
      if (grade < 0 || grade > 10) {
        return Left(CourseUsecaseFailure("Nota inválida!"));
      }
    }
  }

  @override
  FutureCourse<void> call(
    String name,
    String status, {
    double? av1,
    double? av2,
    double? av3,
    int? edag,
    double? recuperacao,
  }) async {
    if (name.isEmpty) {
      return Left(CourseUsecaseFailure("Nome do curso é obrigatório!"));
    }

    _validateGrande(av1);
    _validateGrande(av2);
    _validateGrande(av3);
    _validateGrande(edag);
    _validateGrande(recuperacao);

    if (status.isEmpty) {
      return Left(CourseUsecaseFailure("Status do curso é obrigatório!"));
    }

    if (int.parse(status) == 0) {
      return Left(CourseUsecaseFailure(
          "Não pode atualizar notas de um curso pendente!"));
    }

    return repository.updateCourseGrades(name, status,
        av1: av1, av2: av2, av3: av3, edag: edag, recuperacao: recuperacao);
  }
}
