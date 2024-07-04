import 'package:flutter/material.dart';
import 'package:past_papers_app/Data/Models/pdf_file.dart';
import 'package:past_papers_app/Presantation/Components/file_tile.dart';

class RecentFileListWudget extends StatefulWidget {
  const RecentFileListWudget({super.key});

  @override
  State<RecentFileListWudget> createState() => _RecentFileListWudgetState();
}

class _RecentFileListWudgetState extends State<RecentFileListWudget> {
  @override
  Widget build(BuildContext context) {
    // to change hight dynamically

    return SizedBox(
      height: 500,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: FileTile(
              pdfFile: PdfFile(fileName: "testing file.pdf", fileId: "01"),
            ),
          );
        },
      ),
    );
  }
}
