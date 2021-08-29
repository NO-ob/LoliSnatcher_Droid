import 'dart:core';
import 'dart:io';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/LoliSync.dart';
import 'package:LoliSnatcher/pages/LoliSyncSendPage.dart';
import 'package:LoliSnatcher/pages/LoliSyncServerPage.dart';

class LoliSyncPage extends StatefulWidget {
  LoliSyncPage();
  @override
  _LoliSyncPageState createState() => _LoliSyncPageState();
}
class _LoliSyncPageState extends State<LoliSyncPage> {
  final SettingsHandler settingsHandler = Get.find();
  final ipController = TextEditingController();
  final portController = TextEditingController();
  bool favourites = false, settings = false, booru = false;
  final LoliSync loliSync = LoliSync();
  List<NetworkInterface> ipList = [];
  List<String> ipListNames = ['Auto'];
  String selectedInterface = 'Auto';
  String? selectedAddress;

  final startPortController = TextEditingController();
  String startPort = '';

  Future<bool> _onWillPop() async {
    settingsHandler.lastSyncIp = ipController.text;
    settingsHandler.lastSyncPort = portController.text;
    settingsHandler.saveSettings();
    return true;
  }

  @override
  void initState() {
    super.initState();
    ipController.text = settingsHandler.lastSyncIp;
    portController.text = settingsHandler.lastSyncPort;
    getIPList();
  }

  void getIPList() async {
    List<NetworkInterface> temp = await ServiceHandler.getIPList();
    ipList.addAll(temp);
    ipListNames.addAll(temp.map((e) => e.name).toList());
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Loli Sync"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () async {
                Get.back();
              }),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text(
                  "Start the server on another device it will show an ip and port, fill those in and then hit start sync to send data from this device to the other"),
                ),
              SettingsTextInput(
                controller: ipController,
                title: 'IP Address',
                hintText: "Host IP Address (i.e. 192.168.1.1)",
                inputType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.]'))],
              ),
              SettingsTextInput(
                controller: portController,
                title: 'Port',
                hintText: "Host Port (i.e. 7777)",
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              ),
              SettingsToggle(
                value: favourites,
                onChanged: (newValue) {
                  setState(() {
                    favourites = newValue;
                  });
                },
                title: 'Send Favourites',
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
              ),

              SettingsButton(name: '', enabled: false),
              SettingsButton(
                name: 'Start Sync',
                icon: Icon(Icons.send_to_mobile),
                page: ((ipController.text.isNotEmpty && portController.text.isNotEmpty) && (favourites || settings || booru)) ? () => LoliSyncSendPage(ipController.text, portController.text, settings, favourites, booru) : null,
                action: !((ipController.text.isNotEmpty && portController.text.isNotEmpty) && (favourites || settings || booru)) ? () {
                  if (ipController.text.isEmpty || portController.text.isEmpty) {
                    ServiceHandler.displayToast("The Port and IP fields cannot be empty");
                  } else if (!favourites && !settings && !booru) {
                    ServiceHandler.displayToast("You haven't selected anything to sync");
                  } else {
                    ServiceHandler.displayToast("${((ipController.text.isNotEmpty && portController.text.isNotEmpty) && (favourites || settings || booru)).toString()}");
                  }
                } : null,
              ),

              SettingsButton(name: '', enabled: false),
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
                  selectedAddress = findInterface?.addresses[0].address;
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
                hintText: "Server Port (will default to '1234' if empty)",
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              ),
              SettingsButton(
                name: 'Start Receiver Server',
                icon: Icon(Icons.dns_outlined),
                page: () => LoliSyncServerPage(selectedAddress, startPortController.text.isEmpty ? '1234' : startPortController.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
