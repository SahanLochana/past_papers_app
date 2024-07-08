import 'package:past_papers_app/Data/Local/handle_recent_files/update_recent_data_map.dart';
import 'package:past_papers_app/Data/Models/pdf_file.dart';

class RecentFileHandler extends UpdateRecentFileDataMap {
  List<PdfFile> handleRecent(PdfFile pdfFile) {
    String fileId = pdfFile.fileId;

    List recentfileIds = loadRecentFileList();

    if (isInTheList(fileId, recentfileIds)) {
      int index = indexInlist(fileId, recentfileIds);
      removeTheFile(index, recentfileIds);
    }
    addTheFile(fileId, recentfileIds);

    Map recentfileDetails = loadRecentFileData();
    if (!isAlreadyAvailable(fileId, recentfileDetails)) {
      updateTheMap(pdfFile, recentfileDetails);
    }
    writeToDb(recentfileIds, recentfileDetails);
    List<PdfFile> returnList = [];
    for (String fid in recentfileIds) {
      Map details = recentfileDetails[fid];
      PdfFile file = PdfFile(fileName: details['name'], fileId: details['fid']);
      returnList.add(file);
    }

    return returnList;
  }
}
