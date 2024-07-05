import 'package:flutter/material.dart';
import 'package:past_papers_app/Data/Models/pdf_file.dart';
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

    return SizedBox(
      height: 500,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: provider.pdfFiles.length,
        itemBuilder: (BuildContext context, int index) {
          PdfFile eachPdfFile = provider.pdfFiles[index];
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
