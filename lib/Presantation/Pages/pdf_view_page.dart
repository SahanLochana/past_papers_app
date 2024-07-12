import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewPage extends StatefulWidget {
  final String fid;
  const PdfViewPage({super.key, required this.fid});

  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  late PdfControllerPinch pdfControllerPinch;

  @override
  void initState() {
    super.initState();
    pdfControllerPinch = PdfControllerPinch(
        // document: PdfDocument.openData(InternetFile.get(
        //     'https://github.com/ScerIO/packages.flutter/raw/fd0c92ac83ee355255acb306251b1adfeb2f2fd6/packages/native_pdf_renderer/example/assets/sample.pdf')));
        document: PdfDocument.openData(InternetFile.get(
            "https://firebasestorage.googleapis.com/v0/b/past-papers-app-fe52a.appspot.com/o/al_papers%2FAl%20Chemistry%202020%20Sinhala%20part%201.pdf?alt=media&token=cac76773-29d2-4bde-951b-677da2265e67")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PdfViewPinch(
        controller: pdfControllerPinch,
      ),
    );
  }
}
