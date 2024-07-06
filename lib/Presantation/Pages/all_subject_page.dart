import 'package:flutter/material.dart';
import 'package:past_papers_app/Presantation/Widgets/all_subject_grid.dart';

class AllSubjectPage extends StatefulWidget {
  const AllSubjectPage({super.key});

  @override
  State<AllSubjectPage> createState() => _AllSubjectPageState();
}

class _AllSubjectPageState extends State<AllSubjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: AllSubjectGridWidget(),
      ),
    );
  }
}
