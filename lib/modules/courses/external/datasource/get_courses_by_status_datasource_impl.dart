import 'package:my_college_progress/core/database/database_contract.dart';
import 'package:my_college_progress/modules/courses/infra/datasources/get_courses_by_status_datasource.dart';
import 'package:sqflite/sqflite.dart';

import '../../infra/course_errors.dart';

class GetCoursesByStatusDatasourceImpl implements GetCoursesByStatusDatasource {
  final DatabaseContract database;

  GetCoursesByStatusDatasourceImpl(this.database);

  @override
  Future<List<Map<String, dynamic>>> getCoursesByStatus(String status) async {
    String query = "SELECT * FROM CURSO WHERE CONCLUIU = ?";
    try {
      assert(int.tryParse(status) != null);
      final db = await database.connect();
      final courses = await db.rawQuery(query, [int.parse(status)]);
      return courses;
    } on DatabaseException catch (e) {
      throw CourseDatabaseFailure(e.result.toString());
    } on AssertionError catch (e) {
      throw CourseDatabaseFailure(e.message.toString());
    }
  }
}
