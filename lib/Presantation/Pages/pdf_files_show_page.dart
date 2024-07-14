import 'package:flutter/material.dart';
import 'package:past_papers_app/Presantation/Widgets/pdfs_list_widget.dart';

class ResultViewPage extends StatefulWidget {
  final String sId;
  const ResultViewPage({super.key, required this.sId});

  @override
  State<ResultViewPage> createState() => _ResultViewPageState();
}

class _ResultViewPageState extends State<ResultViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: PdfsListWidget(sId: widget.sId),
      ),
    );
  }
}
