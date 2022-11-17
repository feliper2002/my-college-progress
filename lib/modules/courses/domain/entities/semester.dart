import 'dart:convert';

class Semester {
  final int number;
  final int totalHours;
  Semester({
    required this.number,
    required this.totalHours,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'totalHours': totalHours,
    };
  }

  factory Semester.fromMap(Map<String, dynamic> map) {
    return Semester(
      number: map['number']?.toInt() ?? 0,
      totalHours: map['totalHours']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Semester.fromJson(String source) =>
      Semester.fromMap(json.decode(source));
}
