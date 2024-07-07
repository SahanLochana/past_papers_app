import 'package:flutter/material.dart';
import 'package:past_papers_app/Data/Local/fetch_all_subjects.dart';
import 'package:past_papers_app/Data/Models/subject.dart';

class AllSubjectProvider extends ChangeNotifier {
  List<SubjectModel> subjectList = [];

  Future<List<SubjectModel>> getAllSubjects() async {
    GetAllSubjects getSubjects = GetAllSubjects();
    subjectList = getSubjects.getAllSubjects();
    // subjectList = allSubjects;
    // notifyListeners();
    return subjectList;
  }

  List<SubjectModel> get allSubjectsList => subjectList;
}
