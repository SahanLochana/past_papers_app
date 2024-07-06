import 'package:hive_flutter/adapters.dart';
import 'package:past_papers_app/Data/Models/subject.dart';

class GetAllSubjects {
  List<SubjectModel> getAllSubjects() {
    Box subjectBox = Hive.box("subjectsBox");
    List<SubjectModel> returnList = [];
    Map<String, dynamic> allSubjects = subjectBox.get("allSubjects");
    List<String> allSubjectName = allSubjects.keys.toList();
    for (String subject in allSubjectName) {
      String name = subject;
      String sid = allSubjects["sid"];
      SubjectModel subjectModel =
          SubjectModel(subjectName: name, subjectId: sid);
      returnList.add(subjectModel);
    }
    return returnList;
  }
}
