import 'package:flutter/material.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/course_controller.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/states/course_states.dart';
import 'package:my_college_progress/modules/courses/presenter/widgets/grade_input.dart';
import 'package:provider/provider.dart';

class SelectedCoursePage extends StatefulWidget {
  final int semestre;
  final String name;
  final Color? backgroundColor;
  final Function executeOnClose;
  const SelectedCoursePage({
    super.key,
    required this.name,
    this.backgroundColor,
    required this.semestre,
    required this.executeOnClose,
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
        widget.executeOnClose.call();
        return true;
      },
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        appBar: AppBar(
          backgroundColor: widget.backgroundColor,
          elevation: 0,
          title: Text(widget.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ValueListenableBuilder(
                valueListenable: context.read<CourseController>(),
                builder: (_, value, child) {
                  child = const SizedBox.shrink();

                  if (value is SuccessCourseSelectedState) {
                    String status = "";
                    switch (value.course.concluiu) {
                      case 0:
                        status = "Pendente";
                        break;
                      case 1:
                        status = "Cursando";
                        break;
                      default:
                        status = "Concluído";
                        break;
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
                                child: Text("Pendente"),
                              ),
                              DropdownMenuItem(
                                value: "1",
                                child: Text("Cursando"),
                              ),
                              DropdownMenuItem(
                                value: "2",
                                child: Text("Concluído"),
                              ),
                            ],
                            onChanged: (valor) async {
                              await context
                                  .read<CourseController>()
                                  .updateCourseStatus(widget.name, "$valor");
                            },
                          ),
                          const SizedBox(height: 50),
                          Visibility(
                            visible: (value.course.concluiu != 0),
                            child: SizedBox(
                              height: size.height,
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .25),
                                shrinkWrap: true,
                                children: [
                                  GradeInput(
                                    controller: context
                                        .read<CourseController>()
                                        .av1Controller,
                                    hintText: "Av. 1",
                                  ),
                                  const SizedBox(height: 15),
                                  GradeInput(
                                    controller: context
                                        .read<CourseController>()
                                        .av2Controller,
                                    hintText: "Av. 2",
                                  ),
                                  const SizedBox(height: 15),
                                  GradeInput(
                                    controller: context
                                        .read<CourseController>()
                                        .av3Controller,
                                    hintText: "Av. 3",
                                  ),
                                  const SizedBox(height: 15),
                                  GradeInput(
                                    controller: context
                                        .read<CourseController>()
                                        .edagController,
                                    hintText: "EDAG",
                                  ),
                                  const SizedBox(height: 15),
                                  GradeInput(
                                    controller: context
                                        .read<CourseController>()
                                        .recuperacaoController,
                                    hintText: "Recuperação",
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }
}
