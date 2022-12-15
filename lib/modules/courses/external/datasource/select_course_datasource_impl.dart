import 'package:my_college_progress/core/database/app_database.dart';
import 'package:my_college_progress/modules/courses/infra/datasources/select_course_datasource.dart';
import 'package:sqflite/sqflite.dart';

import '../../infra/course_errors.dart';

class SelectCourseDatasourceImpl implements SelectCourseDatasource {
  final AppDatabase database;

  SelectCourseDatasourceImpl(this.database);

  @override
  Future<Map<String, dynamic>> selectCourse(String name) async {
    final db = await database.connect();
    try {
      final data = await db
          .rawQuery("SELECT concluiu FROM CURSO WHERE NOME = ?", [name]);
      final course = data.first;
      return course;
    } on DatabaseException catch (e) {
      throw CourseDatabaseFailure(e.result.toString());
    }
  }
}
