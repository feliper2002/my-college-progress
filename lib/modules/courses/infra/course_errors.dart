abstract class CourseFailure {}

class CourseDataRetrieveFailure extends CourseFailure {}

class CourseDataFetchFailure extends CourseFailure {
  final String message;

  CourseDataFetchFailure(this.message);
}

class CourseDatabaseFailure extends CourseFailure {
  final String message;

  CourseDatabaseFailure(this.message);
}

class CourseUsecaseFailure extends CourseFailure {
  final String message;

  CourseUsecaseFailure(this.message);
}
