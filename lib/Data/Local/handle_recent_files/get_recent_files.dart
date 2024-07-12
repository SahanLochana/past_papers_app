import 'package:hive/hive.dart';
import 'package:past_papers_app/Data/Models/recent_pdf_file.dart';

class GetRecentFiles {
  List<RecentPdfFile> gettingRecentFiles() {
    List<RecentPdfFile> returnList = [];
    Box recentBox = Hive.box("recentBox");
    List listOfRecentFiles = recentBox.get("recebtFileIdList");

    Map mapOfRecentFileDetails = recentBox.get("recentFileDetailsMap");

    for (String id in listOfRecentFiles) {
      Map details = mapOfRecentFileDetails[id];
      RecentPdfFile file =
          RecentPdfFile(fileName: details['name'], fileId: details['fid']);
      returnList.add(file);
    }
    return returnList;
  }
}
