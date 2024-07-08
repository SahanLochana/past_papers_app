import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:past_papers_app/Presantation/Theme/app_theme.dart';
import 'package:past_papers_app/Provider/all_subject_provide.dart';
import 'package:past_papers_app/Provider/recent_file_provider.dart';
import 'package:past_papers_app/Routes/route_config.dart';
import 'package:provider/provider.dart';

void main() async {
  // init hive flutter
  await Hive.initFlutter();

  // open box for store subject details
  await Hive.openBox("subjectsBox");
  await Hive.openBox("recentBox");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RecentFilesProvider>(
          create: (context) => RecentFilesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AllSubjectProvider(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        routerConfig: MyRouteConfig().router,
      ),
    );
  }
}
