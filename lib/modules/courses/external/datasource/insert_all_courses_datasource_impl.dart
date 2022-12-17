import 'package:my_college_progress/core/database/database_contract.dart';
import 'package:my_college_progress/modules/courses/infra/course_errors.dart';
import 'package:sqflite/sqflite.dart';

import '../../infra/datasources/insert_all_courses_datasource.dart';

class InsertAllCoursesDatasourceImpl implements InsertAllCoursesDatasource {
  final DatabaseContract database;

  InsertAllCoursesDatasourceImpl(this.database);

  @override
  Future<void> insertAllCourses() async {
    try {
      final db = await database.connect();
      final tableLength = (await db.query('CURSO')).length;
      if (tableLength == 0) {
        final inserts = _script.split(";");
        for (var query in inserts) {
          await db.rawInsert(query);
        }
      }
    } on DatabaseException catch (e) {
      throw CourseDatabaseFailure(e.result.toString());
    }
  }
}

String get _script {
  return '''
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Cálculo A", 0, 1);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Introdução à Engenharia de Computação", 0, 1);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Introdução à Lógica de Programação", 0, 1);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Metodologia da Pesquisa", 0, 1);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Meio Ambiente e Sustentabilidade", 0, 1);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Geometria Analítica", 0, 1);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Sistemas Digitais", 0, 1);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Relações Humanas no Trabalho", 0, 1);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Fundamentos de Estatística", 0, 1);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Cálculo B", 0, 2);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Física A", 0, 2);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Física A Prática", 0, 2);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Teoria da Computação", 0, 2);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Interação Humano Máquina", 0, 2);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Álgebra Linear", 0, 2);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Algoritmos e Estrutura de Dados I", 0, 2);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Fundamentos de Administração", 0, 2);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Cálculo C", 0, 3);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Física B", 0, 3);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Física B Prática", 0, 3);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Banco de Dados I", 0, 3);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Linguagem de Programação I", 0, 3);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Higiene e Segurança no Trabalho", 0, 3);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Algoritimos e Estrutura de Dados II", 0, 3);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Gestão de Projetos", 0, 3);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Circuitos Elétricos I", 0, 4);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Física C", 0, 4);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Física C Prática", 0, 4);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Banco de Dados II", 0, 4);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Linguagem de Programação II", 0, 4);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Arquitetura e Organização de Computadores I", 0, 4);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Engenharia de Software I", 0, 4);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Linguagem de Programação III", 0, 5);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Sinais e Sistemas I", 0, 5);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Engenharia de Software II", 0, 5);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Princípios de Eletrônica Analógica", 0, 5);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Sistemas Microprocessados I", 0, 5);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Desenvolvimento de Aplicativos Móveis", 0, 5);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Sistemas Operacionais", 0, 6);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Sinais e Sistemas II", 0, 6);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Redes de Computadores I", 0, 6);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Arquitetura e Organização de Computadores II", 0, 6);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Teoria dos Grafos", 0, 6);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Modelagem e Construção de Sistemas I", 0, 7);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Computadores", 0, 7);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Redes de Computadores II", 0, 7);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Sistemas Distribuídos", 0, 7);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Fundamentos de Programação de Sistemas", 0, 7);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Métodos Computacionais Iterativos", 0, 8);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Tópicos Avançados em Engenharia de Software", 0, 8);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Redes de Computadores III", 0, 8);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Fundamentos de Programação Paralela", 0, 8);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Tópicos Avançados em Banco de Dados", 0, 8);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Robótica Industrial", 0, 9);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Dispositivos Lógicos Programáveis", 0, 9);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Inteligência Computacional", 0, 9);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Economia", 0, 9);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Processamento Digital de Sinais", 0, 9);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Visão Computacional", 0, 10);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Tópicos Avançados em Inteligência Computacional", 0, 10);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Fundamentos de Robótica Móvel", 0, 10);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Redes Industriais", 0, 10);
INSERT INTO CURSO(nome, concluiu, semestre) VALUES ("Padrões e Projeto de Sistemas", 0, 10);
''';
}
