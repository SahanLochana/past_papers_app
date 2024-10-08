import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:past_papers_app/Data/Models/recent_pdf_file.dart';
import 'package:past_papers_app/Provider/recent_file_provider.dart';
import 'package:past_papers_app/Routes/router_const.dart';
import 'package:provider/provider.dart';

class FileTile extends StatelessWidget {
  final RecentPdfFile pdfFile;
  const FileTile({super.key, required this.pdfFile});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return GestureDetector(
      onTap: () async {
        GoRouter.of(context).pushNamed(RouterConstants.pdfViewRouteName,
            pathParameters: {'url': pdfFile.url!});

        final reoder = context.read<RecentFilesProvider>();
        reoder.reoderFunc(pdfFile);
      },
      child: Container(
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
                      child: Text(
                        pdfFile.fileName,
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
      ),
    );
  }
}
