import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lolisnatcher/src/handlers/loli_sync_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/pages/loli_sync_progress_page.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
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
  final TextEditingController snatchedSkipController = TextEditingController();
  final TextEditingController startPortController = TextEditingController();

  final LoliSync testSync = LoliSync();

  StreamSubscription<String>? sub;

  SyncSide syncSide = SyncSide.none;

  bool favourites = false,
      favouritesv2 = false,
      snatched = false,
      settings = false,
      booru = false,
      tabs = false,
      tags = false;
  int favToggleCount = 0;
  String tabsMode = 'Merge';
  String tagsMode = 'PreferTypeIfNone';
  List<String> tabsModesList = ['Merge', 'Replace'];
  List<String> tagsModesList = ['Overwrite', 'PreferTypeIfNone'];
  int? favCount, snatchedCount;

  List<NetworkInterface> ipList = [];
  List<String> ipListNames = ['Auto', 'Localhost'];
  String selectedInterface = 'Auto';
  String? selectedAddress;

  Future<void> _onPopInvoked(bool didPop, _) async {
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
    getSnatchedCount();
    getIPList();
  }

  void updateState() {
    setState(() {});
  }

  @override
  void dispose() {
    ipController.dispose();
    portController.dispose();
    favouritesSkipController.dispose();
    startPortController.dispose();

    testSync.killSync();
    sub?.cancel();
    super.dispose();
  }

  Future<void> getFavCount() async {
    favCount = await settingsHandler.dbHandler.getFavouritesCount();
    updateState();
  }

  Future<void> getSnatchedCount() async {
    snatchedCount = await settingsHandler.dbHandler.getSnatchedCount();
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
        title: Text(context.loc.settings.sync.errorTitle, style: const TextStyle(fontSize: 20)),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.loc.settings.sync.pleaseEnterIPAndPort),
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
      children: [
        SettingsButton(
          name: context.loc.settings.sync.selectWhatYouWantToDo,
          icon: const Icon(Icons.help_center_outlined),
          enabled: false,
        ),
        const SettingsButton(
          name: '',
          enabled: false,
        ),
        SettingsButton(
          name: context.loc.settings.sync.sendDataToDevice,
          icon: const Icon(Icons.send_to_mobile),
          action: () {
            syncSide = SyncSide.sender;
            updateState();
          },
        ),
        SettingsButton(
          name: context.loc.settings.sync.receiveDataFromDevice,
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
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Text(
            context.loc.settings.sync.senderInstructions,
          ),
        ),
        SettingsTextInput(
          controller: ipController,
          title: context.loc.settings.sync.ipAddress,
          hintText: context.loc.settings.sync.ipAddressPlaceholder,
          inputType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.]'))],
          clearable: true,
          pasteable: true,
        ),
        SettingsTextInput(
          controller: portController,
          title: context.loc.settings.sync.port,
          hintText: context.loc.settings.sync.portPlaceholder,
          inputType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
          clearable: true,
          pasteable: true,
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
          title: context.loc.settings.sync.sendFavourites,
          subtitle: Text(context.loc.settings.sync.favouritesCount(count: favCount?.toString() ?? '...')),
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
            title: context.loc.settings.sync.sendFavouritesLegacy,
            subtitle: Text(context.loc.settings.sync.favouritesCount(count: favCount?.toString() ?? '...')),
            drawBottomBorder: !favourites,
          ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: (favouritesv2 || favourites)
              ? SettingsTextInput(
                  controller: favouritesSkipController,
                  title: context.loc.settings.sync.syncFavsFrom,
                  inputType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  clearable: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
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
                          return SettingsDialog(
                            title: Text(context.loc.settings.sync.syncFavsFrom),
                            contentItems: [
                              Text(
                                context.loc.settings.sync.syncFavsFromHelpText1,
                              ),
                              Text(context.loc.settings.sync.syncFavsFromHelpText2),
                              const Text(''),
                              Text(
                                context.loc.settings.sync.syncFavsFromHelpText3,
                              ),
                              Text(context.loc.settings.sync.syncFavsFromHelpText4),
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
          value: snatched,
          onChanged: (newValue) {
            setState(() {
              snatched = newValue;
            });
          },
          title: context.loc.settings.sync.sendSnatchedHistory,
          subtitle: Text(context.loc.settings.sync.snatchedCount(count: snatchedCount?.toString() ?? '...')),
          drawBottomBorder: !snatched,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: snatched
              ? SettingsTextInput(
                  controller: snatchedSkipController,
                  title: context.loc.settings.sync.syncSnatchedFrom,
                  inputType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  clearable: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  numberButtons: true,
                  numberStep: 100,
                  numberMin: 0,
                  numberMax: snatchedCount?.toDouble() ?? double.infinity,
                  trailingIcon: IconButton(
                    icon: const Icon(Icons.help_outline),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SettingsDialog(
                            title: Text(context.loc.settings.sync.syncSnatchedFrom),
                            contentItems: [
                              Text(
                                context.loc.settings.sync.syncSnatchedFromHelpText1,
                              ),
                              Text(context.loc.settings.sync.syncSnatchedFromHelpText2),
                              const Text(''),
                              Text(
                                context.loc.settings.sync.syncSnatchedFromHelpText3,
                              ),
                              Text(context.loc.settings.sync.syncSnatchedFromHelpText4),
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
          title: context.loc.settings.sync.sendSettings,
        ),
        SettingsToggle(
          value: booru,
          onChanged: (newValue) {
            setState(() {
              booru = newValue;
            });
          },
          title: context.loc.settings.sync.sendBooruConfigs,
          subtitle: Text(context.loc.settings.sync.configsCount(count: settingsHandler.booruList.length.toString())),
        ),
        SettingsToggle(
          value: tabs,
          onChanged: (newValue) {
            setState(() {
              tabs = newValue;
            });
          },
          title: context.loc.settings.sync.sendTabs,
          subtitle: Text(context.loc.settings.sync.tabsCount(count: searchHandler.total.toString())),
          drawBottomBorder: !tabs,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: tabs
              ? SettingsOptionsList(
                  value: tabsMode,
                  items: tabsModesList,
                  onChanged: (String? newValue) {
                    setState(() {
                      tabsMode = newValue!;
                    });
                  },
                  title: context.loc.settings.sync.tabsSyncMode,
                  trailingIcon: IconButton(
                    icon: const Icon(Icons.help_outline),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SettingsDialog(
                            title: Text(context.loc.settings.sync.tabsSyncMode),
                            contentItems: [
                              Text(
                                context.loc.settings.sync.tabsSyncModeMerge,
                              ),
                              const Text(''),
                              Text(
                                context.loc.settings.sync.tabsSyncModeReplace,
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
        SettingsToggle(
          value: tags,
          onChanged: (newValue) {
            setState(() {
              tags = newValue;
            });
          },
          title: context.loc.settings.sync.sendTags,
          subtitle: Text(context.loc.settings.sync.tagsCount(count: tagHandler.tagMap.entries.length.toString())),
          drawBottomBorder: !tags,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: tags
              ? SettingsOptionsList(
                  value: tagsMode,
                  items: tagsModesList,
                  onChanged: (String? newValue) {
                    setState(() {
                      tagsMode = newValue!;
                    });
                  },
                  title: context.loc.settings.sync.tagsSyncMode,
                  trailingIcon: IconButton(
                    icon: const Icon(Icons.help_outline),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SettingsDialog(
                            title: Text(context.loc.settings.sync.tagsSyncMode),
                            contentItems: [
                              Text(
                                context.loc.settings.sync.tagsSyncModePreferTypeIfNone,
                              ),
                              const Text(''),
                              Text(
                                context.loc.settings.sync.tagsSyncModeOverwrite,
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
          name: context.loc.settings.sync.testConnection,
          icon: const Icon(Icons.wifi_tethering),
          action: sendTestRequest,
          trailingIcon: IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SettingsDialog(
                    title: Text(context.loc.settings.sync.testConnection),
                    contentItems: [
                      Text(context.loc.settings.sync.testConnectionHelpText1),
                      Text(context.loc.settings.sync.testConnectionHelpText2),
                    ],
                  );
                },
              );
            },
          ),
        ),
        SettingsButton(
          name: context.loc.settings.sync.startSync,
          icon: const Icon(Icons.send_to_mobile),
          action: () async {
            final bool isAddressEntered = ipController.text.isNotEmpty && portController.text.isNotEmpty;
            final bool isAnySyncSelected = favouritesv2 || favourites || snatched || settings || booru || tabs || tags;
            final bool syncAllowed = isAddressEntered && isAnySyncSelected;

            if (syncAllowed) {
              await SettingsPageOpen(
                context: context,
                page: (_) => LoliSyncProgressPage(
                  type: 'sender',
                  ip: ipController.text,
                  port: portController.text,
                  favourites: favourites,
                  favouritesv2: favouritesv2,
                  favSkip: int.tryParse(favouritesSkipController.text) ?? 0,
                  snatched: snatched,
                  snatchedSkip: int.tryParse(snatchedSkipController.text) ?? 0,
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
                errorString = context.loc.settings.sync.portAndIPCannotBeEmpty;
              } else if (!isAnySyncSelected) {
                errorString = context.loc.settings.sync.nothingSelectedToSync;
              }
              FlashElements.showSnackbar(
                context: context,
                title: Text(context.loc.settings.sync.errorTitle, style: const TextStyle(fontSize: 20)),
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
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.loc.settings.sync.statsOfThisDevice),
              Text(context.loc.settings.sync.favouritesCount(count: favCount?.toFormattedString() ?? '...')),
              Text(context.loc.settings.sync.snatchedCount(count: snatchedCount?.toFormattedString() ?? '...')),
              Text(context.loc.settings.sync.configsCount(count: settingsHandler.booruList.length.toFormattedString())),
              Text(context.loc.settings.sync.tabsCount(count: searchHandler.total.toFormattedString())),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Text(
            context.loc.settings.sync.receiverInstructions,
          ),
        ),
        SettingsOptionsList(
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
          title: context.loc.settings.sync.availableNetworkInterfaces,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Text(context.loc.settings.sync.selectedInterfaceIP(ip: selectedAddress ?? 'none')),
        ),
        SettingsTextInput(
          controller: startPortController,
          title: context.loc.settings.sync.serverPort,
          hintText: context.loc.settings.sync.serverPortPlaceholder,
          inputType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
          clearable: true,
          pasteable: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        SettingsButton(
          name: context.loc.settings.sync.startReceiverServer,
          icon: const Icon(Icons.dns_outlined),
          action: () async {
            await SettingsPageOpen(
              context: context,
              page: (_) => LoliSyncProgressPage(
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
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(context.loc.settings.sync.title),
        ),
        body: Center(child: conditionalBuild()),
      ),
    );
  }
}
