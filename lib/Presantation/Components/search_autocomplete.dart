import 'package:flutter/material.dart';

class AutoCompleteWidget extends StatelessWidget {
  final List<String> items;
  const AutoCompleteWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Autocomplete(
        optionsBuilder: (textEditingValue) {
          if (textEditingValue.text == '') {
            return items;
          }
          return items.where((String item) {
            return item
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: (option) {},
      ),
    );
  }
}
