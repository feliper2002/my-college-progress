import 'package:my_college_progress/core/database/database_contract.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase implements DatabaseContract {
  static const path = "courses.db";

  @override
  Future<Database> connect() async {
    return await openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE CURSO(
          nome varchar(30) primary key not null,
          concluiu integer not null,
          semestre integer not null
          );
          ''');
      },
    );
  }
}
