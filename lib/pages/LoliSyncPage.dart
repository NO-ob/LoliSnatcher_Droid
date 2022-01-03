import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/pages/LoliSyncSendPage.dart';
import 'package:LoliSnatcher/pages/LoliSyncServerPage.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';

enum SyncSide {
  none,
  receiver,
  sender,
}

class LoliSyncPage extends StatefulWidget {
  LoliSyncPage();
  @override
  _LoliSyncPageState createState() => _LoliSyncPageState();
}
class _LoliSyncPageState extends State<LoliSyncPage> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();

  final TextEditingController ipController = TextEditingController();
  final TextEditingController portController = TextEditingController();
  final TextEditingController favouritesSkipController = TextEditingController();
  final TextEditingController startPortController = TextEditingController();

  SyncSide syncSide = SyncSide.none;

  bool favourites = false, settings = false, booru = false, tabs = false;
  String tabsMode = 'Merge';
  List<String> tabsModesList = ['Merge', 'Replace'];
  int? favCount;

  List<NetworkInterface> ipList = [];
  List<String> ipListNames = ['Auto', 'Localhost'];
  String selectedInterface = 'Auto';
  String? selectedAddress;

  Future<bool> _onWillPop() async {
    settingsHandler.lastSyncIp = ipController.text;
    settingsHandler.lastSyncPort = portController.text;
    bool result = await settingsHandler.saveSettings(restate: false);
    return result;
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

  void getFavCount() async {
    favCount = await settingsHandler.dbHandler.getFavouritesCount();
    setState(() { });
  }

  void getIPList() async {
    List<NetworkInterface> temp = await ServiceHandler.getIPList();
    ipList.addAll(temp);
    ipListNames.addAll(temp.map((e) => e.name).toList());
    setState(() { });
  }

  Widget selectBuild() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SettingsButton(
          name: 'Select what you want to do',
          icon: Icon(Icons.help_center_outlined),
          enabled: false,
        ),
        SettingsButton(
          name: '',
          enabled: false,
        ),

        SettingsButton(
          name: 'SEND data TO another device',
          icon: Icon(Icons.send_to_mobile),
          action: () {
            syncSide = SyncSide.sender;
            setState(() { });
          },
        ),
        SettingsButton(
          name: 'RECEIVE data FROM another device',
          icon: Icon(Icons.dns_outlined),
          action: () {
            syncSide = SyncSide.receiver;
            setState(() { });
          },
        ),
      ],
    );
  }

  Widget senderBuild() {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Text("Start the server on another device it will show an ip and port, fill those in and then hit start sync to send data from this device to the other"),
        ),
        SettingsTextInput(
          controller: ipController,
          title: 'IP Address',
          hintText: "Host IP Address (i.e. 192.168.1.1)",
          inputType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.]'))],
          clearable: true,
        ),
        SettingsTextInput(
          controller: portController,
          title: 'Port',
          hintText: "Host Port (i.e. 7777)",
          inputType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
          clearable: true,
        ),
        SettingsToggle(
          value: favourites,
          onChanged: (newValue) {
            setState(() {
              favourites = newValue;
            });
          },
          title: 'Send Favourites',
          subtitle: Text('Favorites: ${favCount ?? '...'}'),
          drawBottomBorder: favourites == true ? false : true,
        ),

        AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          child: favourites
          ? SettingsTextInput(
              controller: favouritesSkipController,
              title: 'Start Favs Sync from #...',
              hintText: "Start Favs Sync from #...",
              inputType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              clearable: true,
              numberButtons: true,
              numberStep: 100,
              numberMin: 0,
              numberMax: favCount?.toDouble() ?? double.infinity,
              trailingIcon: IconButton(
                icon: Icon(Icons.help_outline),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SettingsDialog(
                        title: Text('Start Favs Sync from #...'),
                        contentItems: <Widget>[
                          Text('Allows to set from where the sync should start from'),
                          Text('If you want to sync from the beginning leave this field blank'),
                          Text(''),
                          Text('Example: You have X amount of favs, set this field to 100, sync will start from item #100 and go until it reaches X'),
                          Text('Order of favs: From oldest (0) to newest (X)')
                        ],
                      );
                    }
                  );
                },
              ),
            )
          : Container()
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
          subtitle: Text('Tabs: ${searchHandler.list.length}'),
          drawBottomBorder: tabs == true ? false : true,
        ),

        AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          child: tabs
          ? SettingsDropdown(
              selected: tabsMode,
              values: tabsModesList,
              onChanged: (String? newValue) {
                setState(() {
                  tabsMode = newValue!;
                });
              },
              title: 'Tabs Sync Mode',
              trailingIcon: IconButton(
                icon: Icon(Icons.help_outline),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SettingsDialog(
                        title: Text('Tabs Sync Mode'),
                        contentItems: <Widget>[
                          Text('Merge: Merge the tabs from this device on the other device, tabs with unknown boorus and already existing tabs will be ignored'),
                          Text(''),
                          Text('Replace: Completely replace the tabs on the other device with the tabs from this device'),
                        ],
                      );
                    }
                  );
                },
              ),
            )
          : Container()
        ),

        SettingsButton(name: '', enabled: false),
        SettingsButton(
          name: 'Start Sync',
          icon: Icon(Icons.send_to_mobile),
          action: () {
            bool isAddressEntered = ipController.text.isNotEmpty && portController.text.isNotEmpty;
            bool isAnySyncSelected = favourites || settings || booru || tabs;
            bool syncAllowed = isAddressEntered && isAnySyncSelected;

            if(syncAllowed) {
              var page = () => LoliSyncSendPage(
                ip: ipController.text,
                port: portController.text,
                settings: settings,
                favourites: favourites,
                booru: booru,
                tabs: tabs,
                tabsMode: tabsMode,
                favSkip: int.tryParse(favouritesSkipController.text) ?? 0,
              );
              SettingsPageOpen(context: context, page: page);
            } else {
              String errorString = '???';
              if (!isAddressEntered) {
                errorString = 'The Port and IP fields cannot be empty!';
              } else if (!isAnySyncSelected) {
                errorString = "You haven't selected anything to sync!";
              }
              FlashElements.showSnackbar(
                context: context,
                title: Text(
                  "Error!",
                  style: TextStyle(fontSize: 20)
                ),
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
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Stats of this device:"),
              Text("Favourites: ${favCount ?? '...'}"),
              Text("Boorus: ${settingsHandler.booruList.length}"),
              Text("Tabs: ${searchHandler.list.length}"),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Text("Start the server if you want your device to recieve data from another, do not use this on public wifi as you might get pozzed"),
        ),
        SettingsDropdown(
          selected: selectedInterface,
          values: ipListNames,
          onChanged: (String? newValue) {
            selectedInterface = newValue!;
            NetworkInterface? findInterface;
            try {
              findInterface = ipList.firstWhere((el) => el.name == newValue);
            } catch (e) {
              
            }
            if(newValue == 'Localhost') {
              selectedAddress = '127.0.0.1';
            } else {
              selectedAddress = findInterface?.addresses[0].address;
            }
            setState(() { });
          },
          title: 'Available Network Interfaces'
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
          icon: Icon(Icons.dns_outlined),
          page: () => LoliSyncServerPage(selectedAddress, startPortController.text.isEmpty ? '8080' : startPortController.text),
        ),
      ],
    );
  }

  Widget conditionalBuild() {
    if(syncSide == SyncSide.none) {
      return selectBuild();
    } else if(syncSide == SyncSide.sender) {
      return senderBuild();
    } else if(syncSide == SyncSide.receiver) {
      return receiverBuild();
    } else {
      // Should never happen but just in case
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("LoliSync"),
        ),
        body: Center(child: conditionalBuild()),
      ),
    );
  }
}
