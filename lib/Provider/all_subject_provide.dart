import 'package:flutter/material.dart';
import 'package:past_papers_app/Data/Local/fetch_all_subjects.dart';
import 'package:past_papers_app/Data/Models/subject.dart';

class AllSubjectProvider extends ChangeNotifier {
  List<SubjectModel> subjectList = [];

  void getAllSubjects() {
    GetAllSubjects getSubjects = GetAllSubjects();
    List<SubjectModel> allSubjects = getSubjects.getAllSubjects();
    subjectList = allSubjects;
    notifyListeners();
  }

  List<SubjectModel> get allSubjectsList => subjectList;
}
