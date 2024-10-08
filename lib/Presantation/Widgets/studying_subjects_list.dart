import 'package:flutter/material.dart';
import 'package:past_papers_app/Data/Local/fetching_studying_data.dart';
import 'package:past_papers_app/Data/Models/subject.dart';
import 'package:past_papers_app/Presantation/Components/subject_placeholder_tile.dart';
import 'package:past_papers_app/Presantation/Components/subject_tile.dart';

class StudyingSubjectsListWidget extends StatelessWidget {
  const StudyingSubjectsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    FetchingStudyingSubjects fetching = FetchingStudyingSubjects();
    return FutureBuilder(
      future: fetching.fetchingStudyingSubjects(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: SubjectTilePlaceholder(),
              );
            },
          );
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          List<SubjectModel> studyingSubjects = snapshot.data;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: studyingSubjects.length,
            itemBuilder: (BuildContext context, int index) {
              SubjectModel eachSubjectModel = studyingSubjects[index];
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: SubjectTile(subjectModel: eachSubjectModel),
              );
            },
          );
        }
      },
    );
  }
}
