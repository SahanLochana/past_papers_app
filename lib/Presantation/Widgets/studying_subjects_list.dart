import 'package:flutter/material.dart';
import 'package:past_papers_app/Data/Models/subject.dart';
import 'package:past_papers_app/Presantation/Components/subject_tile.dart';

class StudyingSubjectsListWidget extends StatelessWidget {
  const StudyingSubjectsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 20),
          child: SubjectTile(
            subjectModel:
                Subject(subjectName: "Combined Mathamatics", subjectId: "19"),
          ),
        );
      },
    );
  }
}
