import 'dart:convert';

import 'package:my_college_progress/modules/courses/domain/entities/semester.dart';

class Course {
  final String name;
  final int hours;
  final bool concluded;
  final Semester semester;
  Course({
    required this.name,
    required this.hours,
    required this.concluded,
    required this.semester,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'hours': hours,
      'concluded': concluded,
      'semester': semester.toMap(),
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      name: map['name'] ?? '',
      hours: map['hours']?.toInt() ?? 0,
      concluded: map['concluded'] ?? false,
      semester: Semester.fromMap(map['semester']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));
}
