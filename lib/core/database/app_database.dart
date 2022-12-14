import 'package:my_college_progress/core/database/database_contract.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase implements DatabaseContract {
  static const path = "gradecimatec.db";

  static Future<void> dropDatabase() async {
    await deleteDatabase(join(await getDatabasesPath(), path));
  }

  @override
  Future<Database> connect() async {
    final dbpath = await getDatabasesPath();
    return await openDatabase(
      join(dbpath, path),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''
        CREATE TABLE CURSO(
          nome TEXT primary key not null,
          concluiu integer not null,
          semestre integer not null
          );
        
        CREATE TABLE ALUNO(
          nome TEXT primary key not null,
          semestre integer not null
        );
          ''',
        );
      },
    );
  }
}
