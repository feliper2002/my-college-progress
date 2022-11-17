import 'package:flutter/material.dart';
import 'package:my_college_progress/modules/courses/domain/usecases/get_all_courses.dart';
import 'package:my_college_progress/modules/courses/external/datasource/get_all_courses_datasource_impl.dart';
import 'package:my_college_progress/modules/courses/infra/repositories/get_all_courses_repository_impl.dart';
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
    return MultiProvider(
      providers: [
        Provider(create: (_) => GetAllCoursesDatasourceImpl()),
        Provider(
            create: (_) => GetAllCoursesRepositoryImpl(
                context.read<GetAllCoursesDatasourceImpl>())),
        Provider(
            create: (_) =>
                GetAllCoursesImpl(context.read<GetAllCoursesRepositoryImpl>())),
        Provider(
            create: (_) => CourseController(context.read<GetAllCoursesImpl>())),
      ],
      child: Scaffold(
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
      ),
    );
  }
}
