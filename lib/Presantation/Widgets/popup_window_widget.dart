import 'package:flutter/material.dart';
import 'package:past_papers_app/Presantation/Components/search_autocomplete.dart';

class PopUpWindow extends StatefulWidget {
  const PopUpWindow({super.key});

  @override
  State<PopUpWindow> createState() => _PopUpWindowState();
}

class _PopUpWindowState extends State<PopUpWindow> {
  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      // title
      title: Text("Search.."),
      // content
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoCompleteWidget(items: [
                "Hello",
                "hi",
                "bye",
              ]),
              SizedBox(
                width: 10,
              ),
              AutoCompleteWidget(items: []),
            ],
          )
        ],
      ),
      // btns
    );
  }
}
