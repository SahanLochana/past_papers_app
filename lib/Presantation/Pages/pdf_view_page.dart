import 'package:flutter/material.dart';
import 'package:past_papers_app/Presantation/Components/pdf_page_nav_btn.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewPage extends StatefulWidget {
  final String fid;
  const PdfViewPage({super.key, required this.fid});

  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  late PdfControllerPinch pdfControllerPinch;
  int currentPage = 1, allPages = 0;

  @override
  void initState() {
    super.initState();
    pdfControllerPinch = PdfControllerPinch(
        // document: PdfDocument.openData(InternetFile.get(
        //     "https://firebasestorage.googleapis.com/v0/b/past-papers-app-fe52a.appspot.com/o/al_papers%2FAl%20Chemistry%202020%20Sinhala%20part%201.pdf?alt=media&token=cac76773-29d2-4bde-951b-677da2265e67")));
        document: PdfDocument.openAsset("assets/01.pdf"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButton: Container(
        height: 40,
        width: 160,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PdfPageNavBtn(
                pdfControllerPinch: pdfControllerPinch,
                isRight: false,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "$currentPage/$allPages",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              PdfPageNavBtn(
                pdfControllerPinch: pdfControllerPinch,
                isRight: true,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: PdfViewPinch(
        scrollDirection: Axis.vertical,
        controller: pdfControllerPinch,
        onDocumentLoaded: (document) {
          setState(() {
            allPages = document.pagesCount;
          });
        },
        onPageChanged: (page) {
          setState(() {
            currentPage = page;
          });
        },
      ),
    );
  }
}
