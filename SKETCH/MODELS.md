- [ ] Semester
- [ ] Course
- [ ] Student

```dart
class Course {
    final String name; // [Salva info no banco]
    final int hours; // [Salva info no banco]
    final bool concluded; // [Salva info no banco como integer {0: false / 1: true}]
    final Semester semester;
}

```dart
class Semester {
    final int number; // [Salva info no banco]
    final int totalHours; // [Salva info no banco]
}
```

```dart
class Student {
    final String name; // [Salva info no banco]
    final List<Courses> actualCourses;
    final List<Courses> concludedCourses;
    final List<Semester> concludedSemesters;
}
```