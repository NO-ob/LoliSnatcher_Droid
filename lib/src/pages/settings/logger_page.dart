import 'package:flutter/material.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';

import 'package:talker_flutter/talker_flutter.dart';

import 'package:lolisnatcher/src/utils/logger.dart';

class LoggerViewPage extends StatelessWidget {
  const LoggerViewPage({
    required this.talker,
    this.appBarTitle,
    this.theme = const TalkerScreenTheme(),
    this.itemsBuilder,
    super.key,
  });

  final Talker talker;

  final TalkerScreenTheme theme;

  final String? appBarTitle;

  final TalkerDataBuilder? itemsBuilder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primaryContainer: Colors.blue[800],
          ),
        ),
        child: TalkerView(
          controller: Logger.viewController,
          talker: talker,
          theme: theme,
          appBarTitle: appBarTitle ?? context.loc.settings.logging.logger,
        ),
      ),
    );
  }
}
