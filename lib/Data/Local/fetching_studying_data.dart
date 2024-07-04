import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:past_papers_app/Data/Local/getting_subject_details.dart';
import 'package:past_papers_app/Data/Models/subject.dart';

class FetchingStudyingSubjects {
  Future<List<SubjectModel>> fetchingStudyingSubjects() async {
    Box subjectBox = Hive.box("subjectsBox");
    GetSubjectDetails gettingDetails = GetSubjectDetails();

    List<SubjectModel> studyingSubjects = [];

    try {
      List<String> studyingSubjectsList =
          await subjectBox.get("studyingSubjects");
      for (String subject in studyingSubjectsList) {
        SubjectModel studyingSubject =
            gettingDetails.getSubjectDetails(subject);
        studyingSubjects.add(studyingSubject);
      }
      return studyingSubjects;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
