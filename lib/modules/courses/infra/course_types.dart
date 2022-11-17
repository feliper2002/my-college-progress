import 'package:dartz/dartz.dart';
import 'package:my_college_progress/modules/courses/domain/entities/course.dart';
import 'package:my_college_progress/modules/courses/infra/course_errors.dart';

typedef FutureCourse<T> = Future<Either<CourseFailure, T>>;
