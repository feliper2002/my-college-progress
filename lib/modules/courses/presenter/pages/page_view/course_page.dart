import 'package:flutter/material.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/course_controller.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/states/course_states.dart';
import 'package:my_college_progress/modules/courses/presenter/pages/selected_course_page.dart';
import 'package:my_college_progress/modules/courses/presenter/widgets/course_tile.dart';
import 'package:provider/provider.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  void initState() {
    if (mounted) {
      context.read<CourseController>().getAllCourses();
      context.read<CourseController>().courseTextController.addListener(() {
        context.read<CourseController>().getAllCourses();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CourseController>();
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
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
                  return CourseTile(
                    course: course,
                    executeOnClose: () async {
                      await controller.getAllCourses();
                    },
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
