import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_selector.dart';

class ActiveTitle extends StatelessWidget {
  const ActiveTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchHandler searchHandler = SearchHandler.instance;
    final SnatchHandler snatchHandler = SnatchHandler.instance;

    return Obx(() {
      if (snatchHandler.active.value) {
        final bool hasProgress = snatchHandler.total.value != 0;
        final double progress = hasProgress ? (snatchHandler.received.value / snatchHandler.total.value) : 0;
        final String progressText = progress != 0 ? '(${(progress * 100).toStringAsFixed(1).replaceFirst('100.0', '100')}%)' : '';

        return FittedBox(
          fit: BoxFit.fitWidth,
          child: Text('Snatching: ${snatchHandler.status} $progressText'.trim()),
        );
      } else {
        if (searchHandler.list.isEmpty) {
          return const Text('LoliSnatcher');
        } else {
          return TabSelector(
            withBorder: false,
            color: Theme.of(context).appBarTheme.foregroundColor,
          );
        }
      }
    });
  }
}
