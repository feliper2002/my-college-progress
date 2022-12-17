import 'package:flutter/material.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/states/course_states.dart';
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

  Map<String, Color> colors = {
    "1": Colors.pink[100]!,
    "2": Colors.pink[200]!,
    "3": Colors.pink[300]!,
    "4": Colors.pink[400]!,
    "5": Colors.pinkAccent,
    "6": Colors.purple[100]!,
    "7": Colors.purple[200]!,
    "8": Colors.purple[300]!,
    "9": Colors.purple[400]!,
    "10": Colors.purple[500]!,
    "11": Colors.purple[600]!,
    "12": Colors.purpleAccent,
  };

  int semestre = (DateTime.now().month <= 6) ? 1 : 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors["1"],
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
                        "${DateTime.now().year}.$semestre",
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
                      "${DateTime.now().year}.$semestre",
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
                        return ListTile(
                          title: Text(course.name),
                          tileColor: colors["${course.semestre}"],
                          onTap: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SelectedCoursePage(
                                          executeOnClose: () async {
                                            await context
                                                .read<CourseController>()
                                                .getCoursesByStatus("1");
                                          },
                                          name: course.name,
                                          semestre: course.semestre,
                                          backgroundColor:
                                              colors["${course.semestre}"],
                                        )));
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
