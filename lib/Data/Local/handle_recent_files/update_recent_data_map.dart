import 'package:hive/hive.dart';
import 'package:past_papers_app/Data/Local/handle_recent_files/update_recent_id_list.dart';
import 'package:past_papers_app/Data/Models/pdf_file.dart';

class UpdateRecentFileDataMap extends UpdateRecentIdListToDb {
  // get saved recent files datas
  Map loadRecentFileData() {
    Box recentBox = Hive.box("recentBox");
    return recentBox.get("recentFileDetailsMap");
  }

  // Check already available
  bool isAlreadyAvailable(String fId, Map detailsMap) {
    if (detailsMap.isEmpty || !detailsMap.containsKey(fId)) {
      return false;
    }
    return true;
  }

  // Update the Map
  void updateTheMap(PdfFile pdf, Map detailsMap) {
    String fileName = pdf.fileName;
    String fileId = pdf.fileId;
    //TODO : add last opened time
    detailsMap[fileId] = {
      "name": fileName,
      "fid": fileId,
    };
  }
}
