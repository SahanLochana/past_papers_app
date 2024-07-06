import 'package:flutter/material.dart';
import 'package:past_papers_app/Presantation/Pages/all_subject_page.dart';
import 'package:past_papers_app/Presantation/Widgets/recent_file_list.dart';
import 'package:past_papers_app/Presantation/Widgets/studying_subjects_list.dart';
import 'package:past_papers_app/Provider/all_subject_provide.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.search_outlined,
          color: Color(0xFF293241),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Subjects",
                          style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontSize: 18,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              final _provider =
                                  context.read<AllSubjectProvider>();
                              _provider.getAllSubjects();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AllSubjectPage()));
                            },
                            style: const ButtonStyle(
                              elevation: MaterialStatePropertyAll(0),
                            ),
                            child: Text(
                              "All Subjects",
                              style: TextStyle(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                fontSize: 12,
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 70,
                      child: StudyingSubjectsListWidget(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recent Opened",
                        style: TextStyle(
                          color: Color(0xFF293241),
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          elevation: MaterialStatePropertyAll(0),
                        ),
                        child: const Text(
                          "See more",
                          style: TextStyle(
                            color: Color(0xFF293241),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const RecentFileListWudget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
