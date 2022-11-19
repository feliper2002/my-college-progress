import 'dart:convert';

class Course {
  final String name;
  final int hours;
  final int semester;
  Course({
    required this.name,
    required this.hours,
    required this.semester,
  });

  Map<String, dynamic> toMap() {
    return {
      'disciplina': name,
      'carga': hours,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      name: map['disciplina'] ?? '',
      hours: map['carga']?.toInt() ?? 0,
      semester: 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));

  Course copyWith({
    String? name,
    int? hours,
    int? semester,
  }) {
    return Course(
      name: name ?? this.name,
      hours: hours ?? this.hours,
      semester: semester ?? this.semester,
    );
  }
}
