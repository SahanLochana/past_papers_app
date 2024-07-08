import 'package:hive/hive.dart';

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
  int indexInlist(String fId, List recentList) {
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

  void writeToDb(List newList, Map newMap) {
    Box recentBox = Hive.box("recentBox");
    recentBox.put("recebtFileIdList", newList);
    recentBox.put("recentFileDetailsMap", newMap);
  }
}
