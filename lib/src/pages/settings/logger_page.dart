import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:logger_flutter_fork/logger_flutter_fork.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class LoggerPage extends StatefulWidget {
  const LoggerPage({Key? key}) : super(key: key);
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
  Future<bool> _onWillPop() async {
    settingsHandler.enabledLogTypes.value = enabledLogTypes;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    bool allLogTypesEnabled = enabledLogTypes.toSet().toList().length == LogTypes.values.length;

    return WillPopScope(
      onWillPop: _onWillPop,
      child:Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text("Logger"),
          actions: [
            Switch(
              value: allLogTypesEnabled,
              onChanged: (bool newValue) {
                setState(() {
                  if (newValue) {
                    enabledLogTypes = [...LogTypes.values];
                    Logger.Inst().log("Enabled all log types", "LoggerPage", "build", LogTypes.settingsLoad);
                  } else {
                    enabledLogTypes = [];
                    Logger.Inst().log("Disabled all log types", "LoggerPage", "build", LogTypes.settingsLoad);
                  }
                });
              }
            ),
              ],
            ),
        body: Center(
          child: ListView.builder(
            itemCount: LogTypes.values.length + 2,
            itemBuilder: (context, index) {
              if(index == 0) {
                return SettingsButton(
                  name: 'Open Logger Output',
                  action: () {
                    LogConsole.open(
                      context,
                      showCloseButton: true,
                      showClearButton: true,
                      dark: Theme.of(context).brightness == Brightness.dark,
                      onExport: (String text) {
                        Clipboard.setData(ClipboardData(text: text));
                      },
                    );
                  },
                  trailingIcon: const Icon(Icons.print),
                );
              }

              if(index == 1) {
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
                    if (enabledLogTypes.contains(logType)){
                      enabledLogTypes.remove(logType);
                      Logger.Inst().log("Disabled logging for $logType", "LoggerPage", "build", LogTypes.settingsLoad);
                    } else {
                      enabledLogTypes.add(logType);
                      Logger.Inst().log("Enabled logging for $logType", "LoggerPage", "build", LogTypes.settingsLoad);
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

