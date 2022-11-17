import 'package:flutter/material.dart';
import 'package:my_college_progress/modules/courses/presenter/course_page.dart';
import 'package:provider/provider.dart';

import '../modules/courses/domain/usecases/get_all_courses.dart';
import '../modules/courses/external/datasource/get_all_courses_datasource_impl.dart';
import '../modules/courses/infra/repositories/get_all_courses_repository_impl.dart';
import '../modules/courses/presenter/controllers/course_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
            create: (_) => CourseController(GetAllCoursesImpl(
                GetAllCoursesRepositoryImpl(GetAllCoursesDatasourceImpl())))),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const CourcePage(),
        },
      ),
    );
  }
}
