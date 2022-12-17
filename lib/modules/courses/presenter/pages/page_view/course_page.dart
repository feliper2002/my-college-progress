import 'package:flutter/material.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/course_controller.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/states/course_states.dart';
import 'package:my_college_progress/modules/courses/presenter/pages/selected_course_page.dart';
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

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CourseController>();
    return Scaffold(
      backgroundColor: colors["1"],
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
                    tileColor: colors["${course.semester}"],
                    subtitle: Text("${course.hours} horas"),
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SelectedCoursePage(
                                  executeOnClose: () async {
                                    await controller.getAllCourses();
                                  },
                                  name: course.name,
                                  semestre: course.semester,
                                  backgroundColor:
                                      colors["${course.semester}"])));
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
