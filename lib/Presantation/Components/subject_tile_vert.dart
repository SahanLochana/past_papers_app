import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:past_papers_app/Data/Models/subject.dart';
import 'package:past_papers_app/Routes/router_const.dart';

class SubjectTileVert extends StatelessWidget {
  final SubjectModel subjectModel;
  const SubjectTileVert({super.key, required this.subjectModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(RouterConstants.resultViewRouteName,
            pathParameters: {"sId": subjectModel.subjectId});
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.airplay_rounded,
              size: 32,
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 48,
              child: SingleChildScrollView(
                child: Text(
                  subjectModel.subjectName,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
