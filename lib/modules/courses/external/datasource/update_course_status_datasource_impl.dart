import 'package:my_college_progress/core/database/database_contract.dart';
import 'package:my_college_progress/modules/courses/infra/course_errors.dart';
import 'package:my_college_progress/modules/courses/infra/datasources/update_course_status_datasource.dart';
import 'package:sqflite/sqflite.dart';

class UpdateCourseStatusDatasourceImpl implements UpdateCourseStatusDatasource {
  final DatabaseContract database;

  UpdateCourseStatusDatasourceImpl(this.database);

  @override
  Future<void> updateCourseStatus(String name, String status) async {
    final db = await database.connect();

    try {
      await db.update(
        "CURSO",
        {"concluiu": status},
        where: "nome = ?",
        whereArgs: [name],
      );
    } on DatabaseException catch (e) {
      throw CourseDatabaseFailure(e.result.toString());
    }
  }
}
