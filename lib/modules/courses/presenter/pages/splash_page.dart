import 'package:flutter/material.dart';
import 'package:my_college_progress/core/database/app_database.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/course_controller.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/states/course_states.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AppDatabase database;

  navToCourses() async {
    await Future.delayed(const Duration(milliseconds: 200), () async {
      await Navigator.pushNamedAndRemoveUntil(
          context, '/courses', (route) => false);
    });
  }

  @override
  void initState() {
    database = AppDatabase();
    database.connect().then((value) async {
      await value.query("CURSO").then((list) async {
        if (list.isEmpty) {
          context.read<CourseController>().insertAllCourses();
        } else {
          await navToCourses();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: ValueListenableBuilder(
          valueListenable: context.read<CourseController>(),
          builder: (context, state, child) {
            if (state is SuccessCourseInsertState) {
              navToCourses();
            }

            child = const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );

            return child;
          }),
    );
  }
}
