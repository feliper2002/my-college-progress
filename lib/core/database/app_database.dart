import 'package:my_college_progress/core/database/database_contract.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase implements DatabaseContract {
  static const path = "courses.db";

  static Future<void> dropDatabase() async {
    await deleteDatabase(join(await getDatabasesPath(), path));
  }

  @override
  Future<Database> connect() async {
    return await openDatabase(
      join(await getDatabasesPath(), path),
      onCreate: (db, version) async {
        await db.execute(
          '''
        CREATE TABLE CURSO(
          nome varchar(30) primary key not null,
          concluiu integer not null,
          semestre integer not null
          );
        
        CREATE TABLE ALUNO(
          nome varchar(30) primary key not null,
          semestre integer not null
        );

        CREATE TABLE USERSETTING(
          adicionouCursos integer primary key not null
        );
          ''',
        );
      },
    );
  }
}
