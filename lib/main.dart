import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:past_papers_app/Presantation/Pages/home_page.dart';
import 'package:past_papers_app/Presantation/Theme/app_theme.dart';
import 'package:past_papers_app/Provider/recent_file_provider.dart';
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
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: const HomePage(),
      ),
    );
  }
}
