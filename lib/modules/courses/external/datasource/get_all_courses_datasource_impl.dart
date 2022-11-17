import 'dart:convert';

import 'package:my_college_progress/modules/courses/infra/datasources/get_all_courses_datasource.dart';

import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

class GetAllCoursesDatasourceImpl implements GetAllCoursesDatasource {
  @override
  Future<List<Map<String, dynamic>>> getAllCourses() async {
    final response =
        await rootBundle.loadString('lib/utils/grade_cimatec.json');

    final json = jsonDecode(response) as List<Map<String, dynamic>>;

    return json;
  }
}
