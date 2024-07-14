import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:past_papers_app/Presantation/Components/pdf_page_nav_btn.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewPage extends StatefulWidget {
  final String url;
  const PdfViewPage({super.key, required this.url});

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
        document: PdfDocument.openData(InternetFile.get(widget.url)));
    // document: PdfDocument.openAsset("assets/01.pdf")
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
