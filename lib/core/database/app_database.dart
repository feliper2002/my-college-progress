import 'package:my_college_progress/core/database/database_contract.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase implements DatabaseContract {
  static const path = "gradecimatec_2.db";
  static const dbVersion = 1;

  static Future<void> dropDatabase() async {
    await deleteDatabase(join(await getDatabasesPath(), path));
  }

  @override
  Future<Database> connect() async {
    final dbpath = await getDatabasesPath();
    return await openDatabase(
      join(dbpath, path),
      version: dbVersion,
      onCreate: (db, version) async {
        await db.execute(
          '''
        CREATE TABLE CURSO(
          nome TEXT primary key not null,
          concluiu INTEGER not null,
          semestre INTEGER not null,
          av1 REAL,
          av2 REAL,
          av3 REAL,
          edag REAL,
          recuperacao REAL,
          media REAL
          );
        
        CREATE TABLE ALUNO(
          nome TEXT primary key not null,
          semestre INTEGER not null
        );
          ''',
        );
      },
    );
  }
}
