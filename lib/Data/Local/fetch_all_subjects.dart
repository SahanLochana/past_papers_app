import 'package:hive_flutter/adapters.dart';
import 'package:past_papers_app/Data/Models/subject.dart';

class GetAllSubjects {
  List<SubjectModel> getAllSubjects() {
    Box subjectBox = Hive.box("subjectsBox");
    List<SubjectModel> returnList = [];
    Map<dynamic, dynamic> allSubjects = subjectBox.get("allSubjects");
    List<dynamic> allSubjectName = allSubjects.keys.toList();
    for (String subject in allSubjectName) {
      String name = subject;
      String sid = allSubjects[subject]["sid"];
      SubjectModel subjectModel =
          SubjectModel(subjectName: name, subjectId: sid);
      returnList.add(subjectModel);
    }
    return returnList;
  }
}
