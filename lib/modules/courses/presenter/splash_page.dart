import 'package:flutter/material.dart';
import 'package:my_college_progress/core/database/app_database.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/course_controller.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AppDatabase database = AppDatabase();
  late int cursoList;

  @override
  void initState() {
    database.connect().then((value) {
      value.query("CURSO").then((list) {
        if (list.isEmpty) {
          context.read<CourseController>().insertAllCourses();
        } else {
          Future.delayed(const Duration(milliseconds: 200), () async {
            await Navigator.pushNamedAndRemoveUntil(
                context, '/courses', (route) => false);
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
