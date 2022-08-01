import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_selector.dart';

class ActiveTitle extends StatelessWidget {
  const ActiveTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchHandler searchHandler = SearchHandler.instance;
    final SnatchHandler snatchHandler = SnatchHandler.instance;

    return Obx(() {
      if (snatchHandler.snatchActive.value) {
        return FittedBox(
          fit: BoxFit.fitWidth,
          child: Text("Snatching: ${snatchHandler.snatchStatus}"),
        );
      } else {
        if (searchHandler.list.isEmpty) {
          return const Text('LoliSnatcher');
        } else {
          return const TabSelectorHeader();
        }
      }
    });
  }
}
