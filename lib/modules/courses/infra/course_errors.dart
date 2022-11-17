abstract class CourseFailure {}

class CourseDataRetrieveFailure extends CourseFailure {}

class CourseDataFetchFailure extends CourseFailure {
  final String message;

  CourseDataFetchFailure(this.message);
}
