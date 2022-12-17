import 'package:flutter/material.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/course_controller.dart';
import 'package:my_college_progress/modules/courses/presenter/pages/page_view/completed_courses.dart';
import 'package:my_college_progress/modules/courses/presenter/pages/page_view/course_page.dart';
import 'package:my_college_progress/modules/courses/presenter/pages/page_view/doing_courses.dart';
import 'package:my_college_progress/modules/courses/presenter/pages/page_view/not_getted_courses.dart';
import 'package:my_college_progress/modules/courses/presenter/widgets/custom_tab_bar.dart';
import 'package:my_college_progress/modules/courses/presenter/widgets/custom_tab_bar_item.dart';
import 'package:provider/provider.dart';

class CoursesPageView extends StatefulWidget {
  const CoursesPageView({super.key});

  @override
  State<CoursesPageView> createState() => _CoursesPageViewState();
}

class _CoursesPageViewState extends State<CoursesPageView> {
  bool visibleSearch = false;

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CourseController>();
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: Visibility(
          visible: !visibleSearch,
          replacement: SizedBox(
            height: 35,
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              maxLines: 1,
              minLines: 1,
              controller: controller.courseTextController,
              autofocus: true,
              onFieldSubmitted: (_) {
                setState(() {
                  if (controller.courseTextController.text.isEmpty) {
                    visibleSearch = !visibleSearch;
                  }
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.deepPurpleAccent[100],
                hintText: "Disciplina",
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 90, 59, 133),
                  fontSize: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(100),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
          child: const Text("Grade Eng. Computação"),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              /// Open dialog
            },
            icon: const Icon(Icons.info_outline),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                visibleSearch = !visibleSearch;
                controller.courseTextController.clear();
              });
            },
            icon: Icon(!visibleSearch ? Icons.search : Icons.close),
          ),
        ],
      ),
      body: Column(
        children: [
          CustomTabBar(
            controller: pageController,
            items: const [
              CustomTabBarItem(
                title: "Todos",
                index: 0,
              ),
              CustomTabBarItem(
                title: "Cursando",
                index: 1,
              ),
              CustomTabBarItem(
                title: "Concluídos",
                index: 2,
              ),
              CustomTabBarItem(
                title: "Pendentes",
                index: 3,
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                CoursePage(),
                DoingCourses(),
                CompletedCourses(),
                NotGettedCourses(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
