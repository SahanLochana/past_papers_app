import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FetchingStudyingSubjects {
  Future<List<String>> fetchingStudyingSubjects() async {
    Box _subjectBox = Hive.box("subjectsBox");

    try {
      List<String> _studyingSubjectsList =
          await _subjectBox.get("studyingSubjects");
      await _subjectBox.close();
      await Future.delayed(Duration(seconds: 5));
      return _studyingSubjectsList;
    } catch (e) {
      debugPrint(e.toString());
      _subjectBox.close();
      return [e.toString()];
    }
  }
}
