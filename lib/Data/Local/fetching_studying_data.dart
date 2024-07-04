import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FetchingStudyingSubjects {
  Future<List<String>> fetchingStudyingSubjects() async {
    Box subjectBox = Hive.box("subjectsBox");

    try {
      List<String> studyingSubjectsList =
          await subjectBox.get("studyingSubjects");
      return studyingSubjectsList;
    } catch (e) {
      debugPrint(e.toString());
      return [e.toString()];
    }
  }
}
