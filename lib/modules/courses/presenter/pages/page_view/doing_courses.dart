import 'package:flutter/material.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/states/course_states.dart';
import 'package:my_college_progress/modules/courses/presenter/widgets/course_tile.dart';
import 'package:provider/provider.dart';

import '../../controllers/course_controller.dart';
import '../selected_course_page.dart';

class DoingCourses extends StatefulWidget {
  const DoingCourses({super.key});

  @override
  State<DoingCourses> createState() => _DoingCoursesState();
}

class _DoingCoursesState extends State<DoingCourses> {
  @override
  void initState() {
    context.read<CourseController>().getCoursesByStatus("1");
    super.initState();
  }

  int semestre = (DateTime.now().month <= 6) ? 1 : 2;

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
            if (value.courses.isEmpty) {
              child = Column(
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Semestre letivo de ${DateTime.now().year}.$semestre",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }

            if (value.courses.isNotEmpty) {
              child = Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "Semestre letivo de ${DateTime.now().year}.$semestre",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.courses.length,
                      itemBuilder: (_, index) {
                        final course = value.courses[index];
                        return CourseTile(
                          courseDB: course,
                          executeOnClose: () async {
                            await context
                                .read<CourseController>()
                                .getCoursesByStatus("1");
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          }

          return child;
        },
      ),
    );
  }
}
