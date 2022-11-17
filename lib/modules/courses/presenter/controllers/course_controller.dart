import 'package:flutter/cupertino.dart';
import 'package:my_college_progress/modules/courses/domain/usecases/get_all_courses.dart';
import 'package:my_college_progress/modules/courses/presenter/controllers/states/course_states.dart';

class CourseController extends ValueNotifier<CourseState> {
  CourseController(this._getAllCoursesUsecase) : super(InitialCourseState());

  final GetAllCourses _getAllCoursesUsecase;

  Future<void> getAllCourses() async {
    final usecase = await _getAllCoursesUsecase();

    value = LoadingCourseState();

    usecase.fold((failure) {
      value = ErrorCourseState();
    }, (courses) {
      value = SucessGetAllCoursesState(courses);
    });
  }
}
