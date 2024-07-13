import 'package:flutter/material.dart';

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
      appBar: AppBar(),
      body: Center(
        child: Text(widget.sId),
      ),
    );
  }
}
