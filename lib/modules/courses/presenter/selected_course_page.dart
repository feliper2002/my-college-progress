import 'package:flutter/material.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/course_controller.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/states/course_states.dart';
import 'package:provider/provider.dart';

class SelectedCoursePage extends StatefulWidget {
  final int semestre;
  final String name;
  final Color? backgroundColor;
  const SelectedCoursePage({
    super.key,
    required this.name,
    this.backgroundColor,
    required this.semestre,
  });

  @override
  State<SelectedCoursePage> createState() => _SelectedCoursePageState();
}

class _SelectedCoursePageState extends State<SelectedCoursePage> {
  @override
  void initState() {
    context.read<CourseController>().selectCourse(widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        context.read<CourseController>().getAllCourses();
        return true;
      },
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        appBar: AppBar(
          backgroundColor: widget.backgroundColor,
          elevation: 0,
          title: Text(widget.name),
        ),
        body: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: context.read<CourseController>(),
              builder: (_, value, child) {
                child = const SizedBox.shrink();

                if (value is SuccessCourseSelectedState) {
                  String status = "";
                  switch (value.course.concluiu) {
                    case 0:
                      status = "Cursando";
                      break;
                    default:
                      status = "Concluído";
                  }
                  child = Center(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          alignment: Alignment.center,
                          height: size.height * .2,
                          width: size.width * .8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Disciplina do ${widget.semestre}º semestre",
                                style: TextStyle(
                                  fontSize: size.height * .024,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "STATUS: $status",
                                style: TextStyle(
                                  fontSize: size.height * .024,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        DropdownButton<String>(
                          value: "${value.course.concluiu}",
                          items: const [
                            DropdownMenuItem(
                              value: "0",
                              child: Text("Cursando"),
                            ),
                            DropdownMenuItem(
                              value: "1",
                              child: Text("Concluído"),
                            ),
                          ],
                          onChanged: (valor) async {
                            await context
                                .read<CourseController>()
                                .updateCourseStatus(widget.name, "$valor");
                          },
                        ),
                      ],
                    ),
                  );
                }

                return child;
              },
            ),
          ],
        ),
      ),
    );
  }
}
