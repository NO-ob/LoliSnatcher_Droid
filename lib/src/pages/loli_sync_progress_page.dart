import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/loli_sync_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class LoliSyncProgressPage extends StatefulWidget {
  const LoliSyncProgressPage({
    required this.type, // sender or receiver
    required this.ip,
    required this.port,
    this.favourites = false,
    this.favouritesv2 = false,
    this.favSkip = 0,
    this.snatched = false,
    this.snatchedSkip = 0,
    this.settings = false,
    this.booru = false,
    this.tabs = false,
    this.tabsMode = 'Merge',
    this.tags = false,
    this.tagsMode = 'PreferTypeIfNone',
    super.key,
  });

  final String type, port, tabsMode, tagsMode;
  final String? ip;
  final bool favourites, favouritesv2, snatched, settings, booru, tabs, tags;
  final int favSkip, snatchedSkip;

  @override
  State<LoliSyncProgressPage> createState() => _LoliSyncProgressPageState();
}

class _LoliSyncProgressPageState extends State<LoliSyncProgressPage> {
  final LoliSync loliSync = LoliSync();
  List<String> toSync = [];
  late Stream<String> progressStream;

  List<String> messagesHistory = [];
  int maxHistoryLength = 100;
  bool wakelocked = false;

  void addMessage(String message) {
    // add new message to history but limit it to X items
    if (message.startsWith('Server active at') &&
        messagesHistory.indexWhere((msg) => msg.startsWith('Server active at')) != -1) {
      return;
    }

    messagesHistory.insert(0, message);
    if (messagesHistory.length > maxHistoryLength) {
      messagesHistory.removeLast();
    }
  }

  @override
  // These lines are done in init state as they only need to be run once when the widget is first loaded
  void initState() {
    super.initState();
    if (widget.type == 'sender') {
      if (widget.favourites) {
        toSync.add('Favourites');
      }
      if (widget.favouritesv2) {
        toSync.add('Favouritesv2');
      }
      if (widget.snatched) {
        toSync.add('Snatched');
      }
      if (widget.settings) {
        toSync.add('Settings');
      }
      if (widget.booru) {
        toSync.add('Booru');
      }
      if (widget.tabs) {
        toSync.add('Tabs');
      }
      if (widget.tags) {
        toSync.add('Tags');
      }

      progressStream = loliSync.startSync(
        widget.ip!,
        widget.port,
        toSync,
        widget.favSkip,
        widget.snatchedSkip,
        widget.tabsMode,
        widget.tagsMode,
      );
    } else {
      progressStream = loliSync.startServer(widget.ip, widget.port);
    }
  }

  void toggleWakelock() {
    if (wakelocked) {
      ServiceHandler.enableSleep();
      wakelocked = false;
    } else {
      ServiceHandler.disableSleep(force: true);
      wakelocked = true;
    }
    setState(() {});
  }

  Future<bool?> showPopDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return SettingsDialog(
          title: const Text('Are you sure?'),
          contentItems: [
            Text(
              widget.type == 'sender' ? 'Do you want to stop syncing?' : 'Do you want to stop the server?',
            ),
          ],
          actionButtons: [
            ElevatedButton.icon(
              icon: const Icon(Icons.cancel),
              label: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.exit_to_app),
              label: const Text('Yes'),
              onPressed: () {
                if (widget.type == 'sender') {
                  loliSync.killSync();
                } else {
                  loliSync.killServer();
                }
                ServiceHandler.enableSleep();
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _onPopInvoked(bool didPop, _) async {
    if (didPop) {
      return;
    }

    final bool? shouldPop = await showPopDialog();
    if (shouldPop ?? false) {
      Navigator.of(context).pop();
    }
  }

  Future<bool> _onWillPop() async {
    final bool? shouldPop = await showPopDialog();
    return shouldPop ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('LoliSync'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              if (await _onWillPop()) {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        body: Center(
          child: StreamBuilder<String>(
            stream: progressStream,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              String status = '';
              if (snapshot.hasError) {
                status = 'Error ${snapshot.error}';
              } else {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    status = 'No connection';
                    break;
                  case ConnectionState.waiting:
                    if (widget.type == 'sender') {
                      status = 'Waiting for connection...';
                    } else {
                      status = 'Starting server...';
                    }
                    break;
                  case ConnectionState.active:
                  case ConnectionState.done:
                    status = '${snapshot.data}';
                    break;
                }
              }
              addMessage(status);

              return Center(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Icon(widget.type == 'sender' ? Icons.sync : Icons.dns_outlined, size: 250),
                    const SizedBox(height: 10),
                    if (Platform.isAndroid || Platform.isIOS)
                      SettingsToggle(
                        title: 'Keep the screen awake',
                        value: wakelocked,
                        onChanged: (bool newValue) {
                          toggleWakelock();
                        },
                      ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(status, style: const TextStyle(fontSize: 18)),
                    ),
                    // show history of messages
                    if (messagesHistory.length > 1)
                      Expanded(
                        child: ListView.builder(
                          itemCount: messagesHistory.length - 1,
                          itemBuilder: (BuildContext context, int index) {
                            final int indexWoutStart = index + 1;
                            return Padding(
                              padding: const EdgeInsets.all(4),
                              child: Center(
                                child: Text(
                                  messagesHistory[indexWoutStart],
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
