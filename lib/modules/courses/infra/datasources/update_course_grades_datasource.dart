abstract class UpdateCourseGradesDatasource {
  Future<void> updateCourseGrades(String name, String status,
      {double? av1, double? av2, double? av3, int? edag, double? recuperacao});
}
