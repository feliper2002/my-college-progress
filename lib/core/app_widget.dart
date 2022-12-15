import 'package:flutter/material.dart';
import 'package:my_college_progress/modules/courses/presenter/course_page.dart';
import 'package:my_college_progress/modules/courses/presenter/selected_course_page.dart';
import 'package:my_college_progress/modules/courses/presenter/splash_page.dart';
import 'package:my_college_progress/modules/courses/providers/course_providers.dart';
import 'package:provider/provider.dart';

import '../modules/courses/presenter/controllers/course_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
            create: (_) => CourseController(
                  getAllCoursesProvider,
                  selectCourseProvider,
                  insertAllCoursesProvider,
                  updateCourseStatusProvider,
                )),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/courses': (context) => const CourcePage(),
        },
      ),
    );
  }
}
