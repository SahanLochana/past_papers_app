import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:past_papers_app/Presantation/Theme/app_theme.dart';
import 'package:past_papers_app/Provider/all_subject_provide.dart';
import 'package:past_papers_app/Provider/recent_file_provider.dart';
import 'package:past_papers_app/Routes/route_config.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init firebase
  await Firebase.initializeApp();

  // caching enabled
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  // init hive flutter
  await Hive.initFlutter();

  // open box for store subject details
  await Hive.openBox("subjectsBox");

  // openr box for store recent files details
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
