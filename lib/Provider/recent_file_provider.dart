import 'package:flutter/material.dart';
import 'package:past_papers_app/Data/Local/handle_recent_files/get_recent_files.dart';
import 'package:past_papers_app/Data/Local/handle_recent_files/handle_recent_files.dart';
import 'package:past_papers_app/Data/Models/recent_pdf_file.dart';

class RecentFilesProvider extends ChangeNotifier {
  RecentFilesProvider() {
    getRecentfiles();
  }

  List<RecentPdfFile> pdfFiles = [];

  void reoderFunc(RecentPdfFile fileObj) {
    RecentFileHandler handler = RecentFileHandler();
    List<RecentPdfFile> listOfPdfs = handler.handleRecent(fileObj);
    pdfFiles = listOfPdfs;
    notifyListeners();
  }

  void getRecentfiles() {
    GetRecentFiles handler = GetRecentFiles();
    pdfFiles = handler.gettingRecentFiles();
    notifyListeners();
  }

  List<RecentPdfFile> get recentFileList => pdfFiles;
}
