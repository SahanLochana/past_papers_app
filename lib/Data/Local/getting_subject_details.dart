import 'package:hive/hive.dart';
import 'package:past_papers_app/Data/Models/subject.dart';

class GetSubjectDetails {
  SubjectModel getSubjectDetails(String subjectName) {
    Box allsubjectBox = Hive.box("subjectsBox");
    Map subjectDetails = allsubjectBox.get("allSubjects")[subjectName];
    String sName = subjectDetails["name"];
    String sId = subjectDetails["sid"];
    SubjectModel subjectModel =
        SubjectModel(subjectName: sName, subjectId: sId);
    return subjectModel;
  }
}
