import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/loli_sync_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/pages/loli_sync_progress_page.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

enum SyncSide {
  none,
  receiver,
  sender,
}

class LoliSyncPage extends StatefulWidget {
  const LoliSyncPage({super.key});

  @override
  State<LoliSyncPage> createState() => _LoliSyncPageState();
}

class _LoliSyncPageState extends State<LoliSyncPage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final TagHandler tagHandler = TagHandler.instance;

  final TextEditingController ipController = TextEditingController();
  final TextEditingController portController = TextEditingController();
  final TextEditingController favouritesSkipController = TextEditingController();
  final TextEditingController startPortController = TextEditingController();

  final LoliSync testSync = LoliSync();

  StreamSubscription<String>? sub;

  SyncSide syncSide = SyncSide.none;

  bool favourites = false, favouritesv2 = false, settings = false, booru = false, tabs = false, tags = false;
  int favToggleCount = 0;
  String tabsMode = 'Merge';
  String tagsMode = 'PreferTypeIfNone';
  List<String> tabsModesList = ['Merge', 'Replace'];
  // TODO: Will change all these string to enum at some point, also for booru type
  List<String> tagsModesList = ['Overwrite', 'PreferTypeIfNone'];
  int? favCount;

  List<NetworkInterface> ipList = [];
  List<String> ipListNames = ['Auto', 'Localhost'];
  String selectedInterface = 'Auto';
  String? selectedAddress;

  Future<void> _onPopInvoked(bool didPop) async {
    if (didPop) {
      return;
    }

    testSync.killSync();
    settingsHandler.lastSyncIp = ipController.text;
    settingsHandler.lastSyncPort = portController.text;
    final bool result = await settingsHandler.saveSettings(restate: false);
    if (result) {
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    super.initState();

    ipController.text = settingsHandler.lastSyncIp;
    portController.text = settingsHandler.lastSyncPort;
    favouritesSkipController.text = '';

    getFavCount();
    getIPList();
  }

  void updateState() {
    setState(() {});
  }

  @override
  void dispose() {
    testSync.killSync();
    sub?.cancel();
    super.dispose();
  }

  Future<void> getFavCount() async {
    favCount = await settingsHandler.dbHandler.getFavouritesCount();
    updateState();
  }

  Future<void> getIPList() async {
    final List<NetworkInterface> temp = await ServiceHandler.getIPList();
    ipList.addAll(temp);
    ipListNames.addAll(temp.map((e) => e.name).toList());
    updateState();
  }

  Future<void> sendTestRequest() async {
    if (ipController.text.isEmpty || portController.text.isEmpty) {
      FlashElements.showSnackbar(
        context: context,
        title: const Text('Error!', style: TextStyle(fontSize: 20)),
        content: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Please enter IP address and port.'),
          ],
        ),
        sideColor: Colors.red,
        leadingIcon: Icons.error,
        leadingIconColor: Colors.red,
      );
      return;
    }

    testSync.killSync();
    final Stream<String> stream = testSync.startSync(
      ipController.text,
      portController.text,
      ['Test'],
      0,
      'Merge',
      'PreferTypeIfNone',
    );
    sub = stream.listen(
      (data) {
        // print(data);
      },
      onDone: testSync.killSync,
      onError: (e) {
        // print('Error $e');
        testSync.killSync();
      },
      cancelOnError: true,
    );
  }

  Widget selectBuild() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SettingsButton(
          name: 'Select what you want to do',
          icon: Icon(Icons.help_center_outlined),
          enabled: false,
        ),
        const SettingsButton(
          name: '',
          enabled: false,
        ),
        SettingsButton(
          name: 'SEND data TO another device',
          icon: const Icon(Icons.send_to_mobile),
          action: () {
            syncSide = SyncSide.sender;
            updateState();
          },
        ),
        SettingsButton(
          name: 'RECEIVE data FROM another device',
          icon: const Icon(Icons.dns_outlined),
          action: () {
            syncSide = SyncSide.receiver;
            updateState();
          },
        ),
      ],
    );
  }

  Widget senderBuild() {
    return ListView(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: const Text(
            'Start the server on another device it will show an ip and port, fill those in and then hit start sync to send data from this device to the other',
          ),
        ),
        SettingsTextInput(
          controller: ipController,
          title: 'IP Address',
          hintText: 'Host IP Address (i.e. 192.168.1.1)',
          inputType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.]'))],
          clearable: true,
        ),
        SettingsTextInput(
          controller: portController,
          title: 'Port',
          hintText: 'Host Port (i.e. 7777)',
          inputType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
          clearable: true,
        ),
        SettingsToggle(
          value: favouritesv2,
          onChanged: (newValue) {
            if (newValue) {
              favToggleCount++;
            }

            setState(() {
              favouritesv2 = newValue;
            });
          },
          title: 'Send Favourites',
          subtitle: Text('Favorites: ${favCount ?? '...'}'),
          drawBottomBorder: !favouritesv2,
        ),
        if (favToggleCount > 2)
          SettingsToggle(
            value: favourites,
            onChanged: (newValue) {
              setState(() {
                favourites = newValue;
              });
            },
            title: 'Send Favourites (Legacy)',
            subtitle: Text('Favorites: ${favCount ?? '...'}'),
            drawBottomBorder: !favourites,
          ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: (favouritesv2 || favourites)
              ? SettingsTextInput(
                  controller: favouritesSkipController,
                  title: 'Start Favs Sync from #...',
                  hintText: 'Start Favs Sync from #...',
                  inputType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  clearable: true,
                  numberButtons: true,
                  numberStep: 100,
                  numberMin: 0,
                  numberMax: favCount?.toDouble() ?? double.infinity,
                  trailingIcon: IconButton(
                    icon: const Icon(Icons.help_outline),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const SettingsDialog(
                            title: Text('Start Favs Sync from #...'),
                            contentItems: <Widget>[
                              Text('Allows to set from where the sync should start from'),
                              Text('If you want to sync from the beginning leave this field blank'),
                              Text(''),
                              Text('Example: You have X amount of favs, set this field to 100, sync will start from item #100 and go until it reaches X'),
                              Text('Order of favs: From oldest (0) to newest (X)'),
                            ],
                          );
                        },
                      );
                    },
                  ),
                )
              : const SizedBox.shrink(),
        ),
        SettingsToggle(
          value: settings,
          onChanged: (newValue) {
            setState(() {
              settings = newValue;
            });
          },
          title: 'Send Settings',
        ),
        SettingsToggle(
          value: booru,
          onChanged: (newValue) {
            setState(() {
              booru = newValue;
            });
          },
          title: 'Send Booru Configs',
          subtitle: Text('Configs: ${settingsHandler.booruList.length}'),
        ),
        SettingsToggle(
          value: tabs,
          onChanged: (newValue) {
            setState(() {
              tabs = newValue;
            });
          },
          title: 'Send Tabs',
          subtitle: Text('Tabs: ${searchHandler.total}'),
          drawBottomBorder: !tabs,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: tabs
              ? SettingsDropdown(
                  value: tabsMode,
                  items: tabsModesList,
                  onChanged: (String? newValue) {
                    setState(() {
                      tabsMode = newValue!;
                    });
                  },
                  title: 'Tabs Sync Mode',
                  trailingIcon: IconButton(
                    icon: const Icon(Icons.help_outline),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const SettingsDialog(
                            title: Text('Tabs Sync Mode'),
                            contentItems: <Widget>[
                              Text(
                                'Merge: Merge the tabs from this device on the other device, tabs with unknown boorus and already existing tabs will be ignored',
                              ),
                              Text(''),
                              Text('Replace: Completely replace the tabs on the other device with the tabs from this device'),
                            ],
                          );
                        },
                      );
                    },
                  ),
                )
              : const SizedBox.shrink(),
        ),
        SettingsToggle(
          value: tags,
          onChanged: (newValue) {
            setState(() {
              tags = newValue;
            });
          },
          title: 'Send Tags',
          subtitle: Text('Tags: ${tagHandler.tagMap.entries.length}'),
          drawBottomBorder: !tags,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: tags
              ? SettingsDropdown(
                  value: tagsMode,
                  items: tagsModesList,
                  onChanged: (String? newValue) {
                    setState(() {
                      tagsMode = newValue!;
                    });
                  },
                  title: 'Tags Sync Mode',
                  trailingIcon: IconButton(
                    icon: const Icon(Icons.help_outline),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const SettingsDialog(
                            title: Text('Tabs Sync Mode'),
                            contentItems: <Widget>[
                              Text("PreferTypeIfNone: If the tag exists with a tag type on the other device and it doesn't on this device it will be skipped"),
                              Text(''),
                              Text(
                                'Overwrite: Tags will be added, if a tag and tag type exists on the other device it will be overwritten',
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                )
              : const SizedBox.shrink(),
        ),
        const SettingsButton(name: '', enabled: false),
        SettingsButton(
          name: 'Test Connection',
          icon: const Icon(Icons.wifi_tethering),
          action: sendTestRequest,
          trailingIcon: IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const SettingsDialog(
                    title: Text('Test Connection'),
                    contentItems: <Widget>[
                      Text('This will send a test request to the other device.'),
                      Text('There will be a notification stating if the request was successful or not.'),
                    ],
                  );
                },
              );
            },
          ),
        ),
        SettingsButton(
          name: 'Start Sync',
          icon: const Icon(Icons.send_to_mobile),
          action: () async {
            final bool isAddressEntered = ipController.text.isNotEmpty && portController.text.isNotEmpty;
            final bool isAnySyncSelected = favouritesv2 || favourites || settings || booru || tabs || tags;
            final bool syncAllowed = isAddressEntered && isAnySyncSelected;

            if (syncAllowed) {
              await SettingsPageOpen(
                context: context,
                page: () => LoliSyncProgressPage(
                  type: 'sender',
                  ip: ipController.text,
                  port: portController.text,
                  favourites: favourites,
                  favouritesv2: favouritesv2,
                  favSkip: int.tryParse(favouritesSkipController.text) ?? 0,
                  settings: settings,
                  booru: booru,
                  tabs: tabs,
                  tabsMode: tabsMode,
                  tags: tags,
                  tagsMode: tagsMode,
                ),
              ).open();
              updateState();
            } else {
              String errorString = '???';
              if (!isAddressEntered) {
                errorString = 'The Port and IP fields cannot be empty!';
              } else if (!isAnySyncSelected) {
                errorString = "You haven't selected anything to sync!";
              }
              FlashElements.showSnackbar(
                context: context,
                title: const Text('Error!', style: TextStyle(fontSize: 20)),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(errorString),
                  ],
                ),
                sideColor: Colors.red,
                leadingIcon: Icons.error,
                leadingIconColor: Colors.red,
              );
            }
          },
        ),
      ],
    );
  }

  Widget receiverBuild() {
    return ListView(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Stats of this device:'),
              Text("Favourites: ${favCount ?? '...'}"),
              Text('Boorus: ${settingsHandler.booruList.length}'),
              Text('Tabs: ${searchHandler.total}'),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: const Text('Start the server if you want to recieve data from another device, do not use this on public wifi as you might get pozzed'),
        ),
        SettingsDropdown(
          value: selectedInterface,
          items: ipListNames,
          onChanged: (String? newValue) {
            selectedInterface = newValue!;
            final NetworkInterface? findInterface = ipList.firstWhereOrNull((el) => el.name == newValue);

            if (newValue == 'Localhost') {
              selectedAddress = '127.0.0.1';
            } else {
              selectedAddress = findInterface?.addresses.first.address;
            }
            updateState();
          },
          title: 'Available Network Interfaces',
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Text('Selected Interface IP: ${selectedAddress ?? 'none'}'),
        ),
        SettingsTextInput(
          controller: startPortController,
          title: 'Start Server at Port',
          hintText: "Server Port (will default to '8080' if empty)",
          inputType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
          clearable: true,
        ),
        SettingsButton(
          name: 'Start Receiver Server',
          icon: const Icon(Icons.dns_outlined),
          action: () async {
            await SettingsPageOpen(
              context: context,
              page: () => LoliSyncProgressPage(
                type: 'receiver',
                ip: selectedAddress,
                port: startPortController.text.isEmpty ? '8080' : startPortController.text,
              ),
            ).open();
            updateState();
          },
        ),
      ],
    );
  }

  Widget conditionalBuild() {
    if (syncSide == SyncSide.none) {
      return selectBuild();
    } else if (syncSide == SyncSide.sender) {
      return senderBuild();
    } else if (syncSide == SyncSide.receiver) {
      return receiverBuild();
    } else {
      // Should never happen but just in case
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('LoliSync'),
        ),
        body: Center(child: conditionalBuild()),
      ),
    );
  }
}
