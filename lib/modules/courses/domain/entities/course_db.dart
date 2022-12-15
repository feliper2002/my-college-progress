import 'dart:convert';

class CourseDB {
  final String name;
  final int concluiu;
  final int semestre;
  CourseDB({
    required this.name,
    required this.concluiu,
    required this.semestre,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'concluiu': concluiu,
      'semestre': semestre,
    };
  }

  factory CourseDB.fromMap(Map<String, dynamic> map) {
    return CourseDB(
      name: map['nome'] ?? '',
      concluiu: map['concluiu']?.toInt() ?? 0,
      semestre: map['semestre']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseDB.fromJson(String source) =>
      CourseDB.fromMap(json.decode(source));

  CourseDB copyWith({
    String? name,
    int? concluiu,
    int? semestre,
  }) {
    return CourseDB(
      name: name ?? this.name,
      concluiu: concluiu ?? this.concluiu,
      semestre: semestre ?? this.semestre,
    );
  }

  @override
  String toString() =>
      'CourseDB(name: $name, concluiu: $concluiu, semestre: $semestre)';
}
