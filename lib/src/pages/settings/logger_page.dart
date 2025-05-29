import 'dart:async';

import 'package:flutter/material.dart';

import 'package:talker_flutter/talker_flutter.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class LoggerPage extends StatefulWidget {
  const LoggerPage({super.key});
  @override
  State<LoggerPage> createState() => _LoggerPageState();
}

class _LoggerPageState extends State<LoggerPage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  List<LogTypes> enabledLogTypes = [];

  @override
  void initState() {
    super.initState();
    enabledLogTypes = [...settingsHandler.enabledLogTypes];
  }

  @override
  void dispose() {
    super.dispose();
  }

  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<void> _onPopInvoked(bool didPop, _) async {
    if (didPop) {
      return;
    }

    settingsHandler.enabledLogTypes.value = enabledLogTypes;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final bool allLogTypesEnabled = enabledLogTypes.toSet().toList().length == LogTypes.values.length;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Logger'),
          actions: [
            Switch(
              value: allLogTypesEnabled,
              onChanged: (bool newValue) {
                setState(() {
                  if (newValue) {
                    enabledLogTypes = [...LogTypes.values];
                    Logger.Inst().log('Enabled all log types', 'LoggerPage', 'build', LogTypes.settingsLoad);
                  } else {
                    enabledLogTypes = [];
                    Logger.Inst().log('Disabled all log types', 'LoggerPage', 'build', LogTypes.settingsLoad);
                  }
                });
              },
            ),
          ],
        ),
        body: Center(
          child: ListView.builder(
            itemCount: LogTypes.values.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return SettingsButton(
                  name: 'Open Logger Output',
                  action: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => LoggerViewPage(talker: Logger.talker),
                      ),
                    );
                  },
                  trailingIcon: const Icon(Icons.print),
                );
              }

              if (index == 1) {
                return const SettingsButton(
                  name: '',
                  enabled: false,
                );
              }

              final LogTypes logType = LogTypes.values[index - 2];

              return SettingsToggle(
                value: enabledLogTypes.contains(logType),
                onChanged: (newValue) {
                  setState(() {
                    if (enabledLogTypes.contains(logType)) {
                      enabledLogTypes.remove(logType);
                      Logger.Inst().log('Disabled logging for $logType', 'LoggerPage', 'build', LogTypes.settingsLoad);
                    } else {
                      enabledLogTypes.add(logType);
                      Logger.Inst().log('Enabled logging for $logType', 'LoggerPage', 'build', LogTypes.settingsLoad);
                    }
                  });
                },
                title: logType.toString().split('.').last,
              );
            },
          ),
        ),
      ),
    );
  }
}

class LoggerViewPage extends StatelessWidget {
  const LoggerViewPage({
    required this.talker,
    this.appBarTitle = 'Logger',
    this.theme = const TalkerScreenTheme(),
    this.itemsBuilder,
    super.key,
  });

  final Talker talker;

  final TalkerScreenTheme theme;

  final String appBarTitle;

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
          appBarTitle: appBarTitle,
        ),
      ),
    );
  }
}
