import 'package:dartz/dartz.dart';

enum CourseStatus {
  cursando("Cursando", 0),
  concluido("Concluido", 1);

  final String status;
  final int code;

  const CourseStatus(this.status, this.code);
}
