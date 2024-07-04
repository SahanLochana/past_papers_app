import 'package:flutter/material.dart';
import 'package:past_papers_app/Data/Models/pdf_file.dart';

class RecentFilesProvider extends ChangeNotifier {
  List<PdfFile> pdfFiles = [
    PdfFile(fileName: "pdf 01", fileId: "1"),
    PdfFile(fileName: "pdf 02", fileId: "1"),
    PdfFile(fileName: "pdf 03", fileId: "1"),
    PdfFile(fileName: "pdf 04", fileId: "1"),
  ];

  void reoderFunc(PdfFile fileObj) {
    // if (pdfFiles.contains(fileObj) == true) {
    //   pdfFiles.remove(fileObj);
    // }
    // pdfFiles.insert(0, fileObj);
    print(pdfFiles.toString());
    pdfFiles.removeAt(2);
    notifyListeners();
  }

  List<PdfFile> get recentFileList => pdfFiles;
}
