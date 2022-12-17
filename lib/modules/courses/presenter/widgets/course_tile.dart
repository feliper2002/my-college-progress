import 'package:flutter/material.dart';
import 'package:my_college_progress/modules/courses/domain/entities/course.dart';
import 'package:my_college_progress/modules/courses/domain/entities/course_db.dart';
import '../pages/selected_course_page.dart';

class CourseTile extends StatelessWidget {
  final Course? course;
  final CourseDB? courseDB;
  final Function executeOnClose;
  const CourseTile(
      {super.key, this.course, this.courseDB, required this.executeOnClose})
      : assert((course != null) ? courseDB == null : true),
        assert((course == null) ? courseDB != null : true);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.deepPurpleAccent,
        child: Text(
            "${(course != null ? course!.semester : courseDB!.semestre)}º"),
      ),
      title: Text(
        (course != null ? course!.name : courseDB!.name),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      tileColor: Colors.deepPurpleAccent[100],
      onTap: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => SelectedCoursePage(
                      executeOnClose: executeOnClose as void Function(),
                      name: (course != null ? course!.name : courseDB!.name),
                      semestre: (course != null
                          ? course!.semester
                          : courseDB!.semestre),
                      backgroundColor: Colors.deepPurpleAccent,
                    )));
      },
    );
  }
}
