import 'package:flutter/material.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/course_controller.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/states/course_states.dart';
import 'package:provider/provider.dart';

class CourcePage extends StatefulWidget {
  const CourcePage({super.key});

  @override
  State<CourcePage> createState() => _CourcePageState();
}

class _CourcePageState extends State<CourcePage> {
  @override
  void initState() {
    context.read<CourseController>().getAllCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CourseController>();
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: ((context, value, child) {
          child = const SizedBox.shrink();

          if (value is LoadingCourseState) {
            child = const Center(child: CircularProgressIndicator());
          }

          if (value is ErrorCourseState) {}

          if (value is SucessGetAllCoursesState) {
            if (value.courses.isNotEmpty) {
              child = ListView.builder(
                itemCount: value.courses.length,
                itemBuilder: (_, index) {
                  final course = value.courses[index];
                  return ListTile(
                    title: Text(course.name),
                    subtitle: Text("${course.hours} horas"),
                  );
                },
              );
            }
          }

          return child;
        }),
      ),
    );
  }
}
