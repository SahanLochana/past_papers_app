import 'package:flutter/material.dart';
import 'package:past_papers_app/Data/Local/fetching_studying_data.dart';
import 'package:past_papers_app/Data/Models/subject.dart';
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
              return Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Container(
                  width: 150,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          );
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: SubjectTile(
                  subjectModel: Subject(
                      subjectName: "Combined Mathamatics", subjectId: "19"),
                ),
              );
            },
          );
        }
      },
    );
  }
}
