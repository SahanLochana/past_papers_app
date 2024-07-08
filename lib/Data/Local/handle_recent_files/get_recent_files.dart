import 'package:hive/hive.dart';
import 'package:past_papers_app/Data/Models/pdf_file.dart';

class GetRecentFiles {
  List<PdfFile> gettingRecentFiles() {
    List<PdfFile> returnList = [];
    Box recentBox = Hive.box("recentBox");
    List listOfRecentFiles = recentBox.get("recebtFileIdList");

    Map mapOfRecentFileDetails = recentBox.get("recentFileDetailsMap");

    for (String id in listOfRecentFiles) {
      Map details = mapOfRecentFileDetails[id];
      PdfFile file = PdfFile(fileName: details['name'], fileId: details['fid']);
      returnList.add(file);
    }
    return returnList;
  }
}
