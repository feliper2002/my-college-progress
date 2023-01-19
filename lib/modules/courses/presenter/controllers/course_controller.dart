import 'package:flutter/cupertino.dart';
import 'package:my_college_progress/modules/courses/domain/usecases/get_all_courses.dart';
import 'package:my_college_progress/modules/courses/domain/usecases/get_courses_by_status.dart';
import 'package:my_college_progress/modules/courses/domain/usecases/insert_all_courses.dart';
import 'package:my_college_progress/modules/courses/domain/usecases/select_course.dart';
import 'package:my_college_progress/modules/courses/domain/usecases/update_course_grades.dart';
import 'package:my_college_progress/modules/courses/domain/usecases/update_course_status.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/states/course_states.dart';

class CourseController extends ValueNotifier<CourseState> {
  CourseController(
    this._getAllCoursesUsecase,
    this._selectCourseUsecase,
    this._insertAllCoursesUsecase,
    this._updateCourseStatusUsecase,
    this._getCoursesByStatusUsecase,
    this._updateCourseGradesUsecase,
  ) : super(InitialCourseState());

  final GetAllCourses _getAllCoursesUsecase;

  /// [SQFlite Database]
  final SelectCourse _selectCourseUsecase;
  final InsertAllCourses _insertAllCoursesUsecase;
  final UpdateCourseStatus _updateCourseStatusUsecase;
  final GetCoursesByStatus _getCoursesByStatusUsecase;
  final UpdateCourseGrades _updateCourseGradesUsecase;

  final courseTextController = TextEditingController();

  Future<void> getAllCourses() async {
    final usecase = await _getAllCoursesUsecase();

    value = LoadingCourseState();

    usecase.fold((failure) {
      value = ErrorCourseState();
    }, (courses) {
      final cursos = courses
          .where((element) => element.name
              .toLowerCase()
              .contains(courseTextController.text.toLowerCase()))
          .toList();
      if (cursos.isEmpty) {
        value = SucessGetAllCoursesState(courses);
      } else {
        value = SucessGetAllCoursesState(cursos);
      }
    });
  }

  Future<void> selectCourse(String name) async {
    final usecase = await _selectCourseUsecase(name);

    value = LoadingCourseState();

    usecase.fold((failure) {
      value = ErrorCourseState();
    }, (course) async {
      value = SuccessCourseSelectedState(course);
    });
  }

  Future<void> insertAllCourses() async {
    final usecase = await _insertAllCoursesUsecase();

    value = LoadingCourseState();

    usecase.fold((failure) {
      value = ErrorCourseState();
    }, (_) async {
      value = SuccessCourseInsertState();
    });
  }

  Future<void> updateCourseStatus(String name, String status) async {
    final usecase = await _updateCourseStatusUsecase(name, status);

    value = LoadingCourseState();

    usecase.fold((failure) {
      value = ErrorCourseState();
    }, (_) async {
      value = SuccessCourseUpdateState();
      await selectCourse(name);
    });
  }

  Future<void> getCoursesByStatus(String status) async {
    final usecase = await _getCoursesByStatusUsecase(status);

    value = LoadingCourseState();

    usecase.fold((failure) {
      value = ErrorCourseState();
    }, (courses) async {
      value = SucessGetCoursesByStatusState(courses);
    });
  }

  Future<void> updateCourseGrades(String course, String status) async {
    final usecase = await _updateCourseGradesUsecase(
      course,
      status,
      av1: double.parse(av1Controller.text),
      av2: double.parse(av2Controller.text),
      av3: double.parse(av3Controller.text),
      edag: int.parse(edagController.text),
      recuperacao: double.parse(recuperacaoController.text),
    );

    value = LoadingCourseState();

    usecase.fold((failure) {
      value = ErrorCourseState();
    }, (_) async {
      ///
    });
  }

  //#//#//#//#//#//#//#//#//#//#//#//#//#//#//#//#//#//#//#//#//#//#//

  final av1Controller = TextEditingController();
  final av2Controller = TextEditingController();
  final av3Controller = TextEditingController();
  final edagController = TextEditingController();
  final recuperacaoController = TextEditingController();
}
