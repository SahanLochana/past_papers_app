import 'package:flutter/material.dart';
import 'package:past_papers_app/Data/Models/recent_pdf_file.dart';
import 'package:past_papers_app/Data/Remote/firebase_sevices.dart';
import 'package:past_papers_app/Presantation/Components/file_tile.dart';

class PdfsListWidget extends StatefulWidget {
  final String sId;
  const PdfsListWidget({super.key, required this.sId});

  @override
  State<PdfsListWidget> createState() => _PdfsListWidgetState();
}

class _PdfsListWidgetState extends State<PdfsListWidget> {
  @override
  Widget build(BuildContext context) {
    FirebaseServices fbServices = FirebaseServices();
    return FutureBuilder(
      future: fbServices.getPdf(widget.sId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          List<RecentPdfFile> pdfList = snapshot.data;
          return ListView.builder(
            itemCount: pdfList.length,
            itemBuilder: (BuildContext context, int index) {
              RecentPdfFile eachPdfFile = pdfList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: FileTile(pdfFile: eachPdfFile),
              );
            },
          );
        }
      },
    );
  }
}
