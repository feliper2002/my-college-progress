import 'package:my_college_progress/core/database/app_database.dart';
import 'package:my_college_progress/modules/courses/domain/usecases/insert_all_courses.dart';
import 'package:my_college_progress/modules/courses/domain/usecases/update_course_status.dart';
import 'package:my_college_progress/modules/courses/external/datasource/insert_all_courses_datasource_impl.dart';
import 'package:my_college_progress/modules/courses/external/datasource/update_course_status_datasource_impl.dart';
import 'package:my_college_progress/modules/courses/infra/repositories/insert_all_courses_repository_impl.dart';
import 'package:my_college_progress/modules/courses/infra/repositories/update_course_status_repository_impl.dart';

import '../domain/usecases/get_all_courses.dart';
import '../external/datasource/get_all_courses_datasource_impl.dart';
import '../infra/repositories/get_all_courses_repository_impl.dart';

final getAllCoursesProvider = GetAllCoursesImpl(
    GetAllCoursesRepositoryImpl(GetAllCoursesDatasourceImpl()));

final insertAllCoursesProvider = InsertAllCoursesImpl(
    InsertAllCoursesRepositoryImpl(
        InsertAllCoursesDatasourceImpl(AppDatabase())));

final updateCourseStatusProvider = UpdateCourseStatusImpl(
    UpdateCourseStatusRepositoryImpl(
        UpdateCourseStatusDatasourceImpl(AppDatabase())));
