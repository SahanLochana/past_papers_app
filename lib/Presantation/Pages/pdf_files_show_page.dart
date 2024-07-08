import 'package:flutter/material.dart';

class resultViewPage extends StatefulWidget {
  final String sId;
  const resultViewPage({super.key, required this.sId});

  @override
  State<resultViewPage> createState() => _resultViewPageState();
}

class _resultViewPageState extends State<resultViewPage> {
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
