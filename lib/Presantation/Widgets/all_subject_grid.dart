import 'package:flutter/material.dart';
import 'package:past_papers_app/Data/Models/subject.dart';
import 'package:past_papers_app/Presantation/Components/subject_tile_vert.dart';
import 'package:past_papers_app/Provider/all_subject_provide.dart';
import 'package:provider/provider.dart';

class AllSubjectGridWidget extends StatefulWidget {
  const AllSubjectGridWidget({super.key});

  @override
  State<AllSubjectGridWidget> createState() => _AllSubjectGridWidgetState();
}

class _AllSubjectGridWidgetState extends State<AllSubjectGridWidget> {
  @override
  Widget build(BuildContext context) {
    final provier = context.watch<AllSubjectProvider>();
    return FutureBuilder(
      future: provier.getAllSubjects(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
            ),
            itemCount: provier.allSubjectsList.length,
            itemBuilder: (BuildContext context, int index) {
              SubjectModel eachSubjectModel = provier.allSubjectsList[index];
              return SubjectTileVert(subjectModel: eachSubjectModel);
            },
          );
        }
      },
    );
  }
}
