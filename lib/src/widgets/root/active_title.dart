import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_selector.dart';

class ActiveTitle extends StatelessWidget {
  const ActiveTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchHandler searchHandler = SearchHandler.instance;

    return ValueListenableBuilder(
      valueListenable: searchHandler.tabs,
      builder: (context, tabs, child) {
        if (tabs.isEmpty) {
          return Text(SettingsHandler.instance.appAlias.locName);
        }

        return child!;
      },
      child: Theme(
        data: Theme.of(context).copyWith(
          inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(filled: false),
        ),
        child: TabSelector(
          withBorder: false,
          color: Theme.of(context).appBarTheme.foregroundColor,
        ),
      ),
    );
  }
}
