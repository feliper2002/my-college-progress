import 'package:my_college_progress/core/database/database_contract.dart';
import 'package:my_college_progress/modules/courses/infra/course_errors.dart';
import 'package:sqflite/sqflite.dart';

import '../../infra/datasources/update_course_grades_datasource.dart';

class UpdateCourseGradesDatasourceImpl implements UpdateCourseGradesDatasource {
  final DatabaseContract database;

  UpdateCourseGradesDatasourceImpl(this.database);

  @override
  Future<void> updateCourseGrades(String name, String status,
      {double? av1,
      double? av2,
      double? av3,
      int? edag,
      double? recuperacao}) async {
    final db = await database.connect();

    String query = "";

    try {
      int intStatus = int.parse(status);

      if (av1 != null) {
        query = "UPDATE CURSO SET av1 = ? WHERE NOME = ? AND CONCLUIU = ?";
        await db.rawUpdate(query, [av1, name, intStatus]);
      }
      if (av2 != null) {
        query = "UPDATE CURSO SET av2 = ? WHERE NOME = ? AND CONCLUIU = ?";
        await db.rawUpdate(query, [av2, name, intStatus]);
      }
      if (av3 != null) {
        query = "UPDATE CURSO SET av3 = ? WHERE NOME = ? AND CONCLUIU = ?";
        await db.rawUpdate(query, [av3, name, intStatus]);
      }
      if (edag != null) {
        query = "UPDATE CURSO SET edag = ? WHERE NOME = ? AND CONCLUIU = ?";
        await db.rawUpdate(query, [edag, name, intStatus]);
      }
      if (recuperacao != null) {
        query =
            "UPDATE CURSO SET recuperacao = ? WHERE NOME = ? AND CONCLUIU = ?";
        await db.rawUpdate(query, [recuperacao, name, intStatus]);
      }
    } on DatabaseException catch (e) {
      throw CourseDatabaseFailure(e.result.toString());
    }
  }
}
