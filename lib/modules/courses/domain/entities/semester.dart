import 'dart:convert';

import 'package:my_college_progress/modules/courses/domain/entities/course.dart';

class Semester {
  final int number;
  final int totalHours;
  final List<Course> courses;
  Semester({
    required this.number,
    required this.totalHours,
    required this.courses,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'totalHours': totalHours,
      'courses': courses.map((x) => x.toMap()).toList(),
    };
  }

  factory Semester.fromMap(Map<String, dynamic> map) {
    return Semester(
      number: map['number']?.toInt() ?? 0,
      totalHours: map['totalHours']?.toInt() ?? 0,
      courses: List<Course>.from(map['courses']?.map((x) => Course.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Semester.fromJson(String source) =>
      Semester.fromMap(json.decode(source));
}
