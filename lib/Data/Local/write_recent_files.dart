import 'package:hive/hive.dart';
import 'package:past_papers_app/Data/Models/pdf_file.dart';

class UpdateRecentIdListToDb {
  // Load the recent file list from db
  List loadRecentFileList() {
    Box recentBox = Hive.box("recentBox");
    return recentBox.get("recebtFileIdList");
  }

  // check fid in the list
  bool isInTheList(String fId, List recentfileList) {
    if (recentfileList.isEmpty || !recentfileList.contains(fId)) {
      return false;
    }

    return true;
  }

  // check file in th db
  int isInDb(String fId, List recentList) {
    return recentList.indexOf(fId);
  }

  // remove it
  void removeTheFile(int idx, List recentList) {
    recentList.removeAt(idx);
  }

  // Add to top
  void addTheFile(String fId, List recentList) {
    recentList.insert(0, fId);
  }
}

class UpdateRecentFileDataMap extends UpdateRecentIdListToDb {
  // get saved recent files datas
  Map loadRecentFileData() {
    Box recentBox = Hive.box("recentBox");
    return recentBox.get("recentFileDetailsMap");
  }

  // get recent files ids(keys) to list
  // List getSavedIds(Map detailsMap) {
  //   if (detailsMap.isEmpty) {
  //     return [];
  //   }

  //   return detailsMap.keys.toList();
  // }

  // Check already available
  bool isAlreadyAvailable(String fId, Map detailsMap) {
    if (detailsMap.isEmpty || !detailsMap.containsKey(fId)) {
      return false;
    }
    return true;
  }

  // Update the Map
  void updateTheMap(bool isAvailable, PdfFile pdf, Map detailsMap) {
    if (isAvailable) {
      return;
    }

    String fileName = pdf.fileName;
    String fileId = pdf.fileId;
    //TODO : add last opened time
    detailsMap[fileId] = {
      "name": fileName,
      "fid": fileId,
    };
  }
}
