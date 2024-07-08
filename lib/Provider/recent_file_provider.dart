import 'package:flutter/material.dart';
import 'package:past_papers_app/Data/Local/handle_recent_files/get_recent_files.dart';
import 'package:past_papers_app/Data/Local/handle_recent_files/handle_recent_files.dart';
import 'package:past_papers_app/Data/Models/pdf_file.dart';

class RecentFilesProvider extends ChangeNotifier {
  RecentFilesProvider() {
    getRecentfiles();
  }

  List<PdfFile> pdfFiles = [];

  void reoderFunc(PdfFile fileObj) {
    RecentFileHandler handler = RecentFileHandler();
    List<PdfFile> listOfPdfs = handler.handleRecent(fileObj);
    pdfFiles = listOfPdfs;
    notifyListeners();
  }

  void getRecentfiles() {
    GetRecentFiles handler = GetRecentFiles();
    pdfFiles = handler.gettingRecentFiles();
    notifyListeners();
  }

  List<PdfFile> get recentFileList => pdfFiles;
}
