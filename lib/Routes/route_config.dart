import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:past_papers_app/Presantation/Pages/all_subject_page.dart';
import 'package:past_papers_app/Presantation/Pages/home_page.dart';
import 'package:past_papers_app/Presantation/Pages/pdf_view_page.dart';
import 'package:past_papers_app/Routes/router_const.dart';

class MyRouteConfig {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: RouterConstants.homeRouteName,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomePage());
        },
      ),
      GoRoute(
        name: RouterConstants.allSubjectsRouteName,
        path: '/allSubjects',
        pageBuilder: (context, state) {
          return const MaterialPage(child: AllSubjectPage());
        },
      ),
      GoRoute(
        name: RouterConstants.pdfViewRouteName,
        path: '/pdfView/:fId',
        pageBuilder: (context, state) {
          return MaterialPage(
              child: PdfViewPage(fid: state.pathParameters['fId']!));
        },
      ),
      // TODO ; create pdfview page and add to here
    ],
  );
}
