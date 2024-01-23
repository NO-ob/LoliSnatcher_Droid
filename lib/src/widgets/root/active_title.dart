import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_selector.dart';

class ActiveTitle extends StatelessWidget {
  const ActiveTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchHandler searchHandler = SearchHandler.instance;

    return Obx(() {
      if (searchHandler.list.isEmpty) {
        return const Text('LoliSnatcher');
      } else {
        return TabSelector(
          withBorder: false,
          color: Theme.of(context).appBarTheme.foregroundColor,
        );
      }
    });
  }
}
