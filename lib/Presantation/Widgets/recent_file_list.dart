import 'package:flutter/material.dart';
import 'package:past_papers_app/Data/Models/recent_pdf_file.dart';
import 'package:past_papers_app/Presantation/Components/file_tile.dart';
import 'package:past_papers_app/Provider/recent_file_provider.dart';
import 'package:provider/provider.dart';

class RecentFileListWudget extends StatefulWidget {
  const RecentFileListWudget({super.key});

  @override
  State<RecentFileListWudget> createState() => _RecentFileListWudgetState();
}

class _RecentFileListWudgetState extends State<RecentFileListWudget> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RecentFilesProvider>();
    // to change hight dynamically
    double getWidgetHeight(List itemList) {
      int listLength = itemList.length;
      const double tileHeight = 80;
      if (listLength == 0) {
        return tileHeight * 2;
      }
      if (listLength <= 5) {
        return tileHeight * listLength;
      } else {
        return tileHeight * 5;
      }
    }

    return SizedBox(
      height: getWidgetHeight(provider.pdfFiles),
      child: provider.pdfFiles.isEmpty
          ? const Center(
              child: Text("No recent files"),
            )
          : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.pdfFiles.length,
              itemBuilder: (BuildContext context, int index) {
                RecentPdfFile eachPdfFile = provider.pdfFiles[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: FileTile(
                    pdfFile: eachPdfFile,
                  ),
                );
              },
            ),
    );
  }
}
