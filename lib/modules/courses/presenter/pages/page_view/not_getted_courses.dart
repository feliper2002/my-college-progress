import 'package:flutter/material.dart';
import 'package:my_college_progress/modules/courses/presenter/widgets/course_tile.dart';
import 'package:provider/provider.dart';

import '../../controllers/course_controller.dart';
import '../../controllers/states/course_states.dart';
import '../selected_course_page.dart';

class NotGettedCourses extends StatefulWidget {
  const NotGettedCourses({super.key});

  @override
  State<NotGettedCourses> createState() => _NotGettedCoursesState();
}

class _NotGettedCoursesState extends State<NotGettedCourses> {
  @override
  void initState() {
    context.read<CourseController>().getCoursesByStatus("0");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: ValueListenableBuilder(
        valueListenable: context.read<CourseController>(),
        builder: (context, value, child) {
          child = const SizedBox.shrink();

          if (value is LoadingCourseState) {
            child = const Center(child: CircularProgressIndicator());
          }

          if (value is ErrorCourseState) {}

          if (value is SucessGetCoursesByStatusState) {
            if (value.courses.isNotEmpty) {
              child = ListView.builder(
                itemCount: value.courses.length,
                itemBuilder: (_, index) {
                  final course = value.courses[index];
                  return CourseTile(
                    courseDB: course,
                    executeOnClose: () async {
                      await context
                          .read<CourseController>()
                          .getCoursesByStatus("0");
                    },
                  );
                },
              );
            }
          }

          return child;
        },
      ),
    );
  }
}
