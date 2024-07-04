import 'package:flutter/material.dart';
import 'package:past_papers_app/Data/Models/pdf_file.dart';

class FileTile extends StatelessWidget {
  final PdfFile pdfFile;
  const FileTile({super.key, required this.pdfFile});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                color: Theme.of(context)
                    .floatingActionButtonTheme
                    .backgroundColor, //TODO : change this
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // file name
                  SizedBox(
                    width: mediaQuery.size.width - 168,
                    child: const Text(
                      "A/L Combined Mathamatics 2002 I sinhala.pdf",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  // last open time
                  Text(
                    "2024/07/02",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.withOpacity(.75),
                    ),
                  )
                ],
              ),
            ],
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
        ],
      ),
    );
  }
}
