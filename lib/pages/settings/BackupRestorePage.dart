import 'dart:async';
import 'dart:io';

import 'package:LoliSnatcher/libBooru/DBHandler.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:path_provider/path_provider.dart';

class BackupRestorePage extends StatefulWidget {
  BackupRestorePage();
  @override
  _BackupRestorePageState createState() => _BackupRestorePageState();
}

class _BackupRestorePageState extends State<BackupRestorePage> {
  final SettingsHandler settingsHandler = Get.find();
  ServiceHandler serviceHandler = ServiceHandler();

  @override
  void initState() {
    super.initState();
  }

  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    bool result = await settingsHandler.saveSettings();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Backup & Restore"),
        ),
        body: Center(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.infinity,
                child: Text('Files backup to "/storage/Android/data/com.noaisu.loliSnatcher/files".'),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.infinity,
                child: Text('Restore will work only if the files are placed in the same directory.'),
              ),
              SettingsButton(
                name: 'Backup Settings',
                action: () async {
                  File file = File(await serviceHandler.getConfigDir() + 'settings.json');
                  Directory? dlDir = (await getExternalStorageDirectories())?.first;
                  if(dlDir != null) {
                    File newFile = File(dlDir.path + '/settings.json');
                    if(!(await newFile.exists())) {
                      await newFile.create();
                    }
                    newFile.writeAsBytes(await file.readAsBytes());
                    ServiceHandler.displayToast('Saved!');
                  } else {
                    ServiceHandler.displayToast('No Access!');
                  }
                },
                drawTopBorder: true,
              ),
              SettingsButton(
                name: 'Restore Settings',
                action: () async {
                  Directory? dlDir = (await getExternalStorageDirectories())?.first;
                  if(dlDir != null) {
                    File file = File(dlDir.path + '/settings.json');
                    if (await file.exists()) {
                      File newFile = File(await serviceHandler.getConfigDir() + 'settings.json');
                      if (!(await newFile.exists())) {
                        await newFile.create();
                      }
                      newFile.writeAsBytes(await file.readAsBytes());
                      settingsHandler.loadSettingsJson();
                      ServiceHandler.displayToast('Restored!');
                    } else {
                      ServiceHandler.displayToast('No Restore File Found!');
                    }
                  } else {
                    ServiceHandler.displayToast('No Access!');
                  }
                },
              ),

              SettingsButton(name: '', enabled: false),

              SettingsButton(
                name: 'Backup Database',
                action: () async {
                  File file = File(await serviceHandler.getConfigDir() + 'store.db');
                  Directory? dlDir = (await getExternalStorageDirectories())?.first;
                  if(dlDir != null) {
                    File newFile = File(dlDir.path + '/store.db');
                    if(!(await newFile.exists())) {
                      await newFile.create();
                    }
                    newFile.writeAsBytes(await file.readAsBytes());
                    ServiceHandler.displayToast('Saved!');
                  } else {
                    ServiceHandler.displayToast('No Access!');
                  }
                },
              ),
              SettingsButton(
                name: 'Restore Database',
                action: () async {
                  Directory? dlDir = (await getExternalStorageDirectories())?.first;
                  if(dlDir != null) {
                    File file = File(dlDir.path + '/store.db');
                    if (await file.exists()) {
                      File newFile = File(await serviceHandler.getConfigDir() + 'store.db');
                      if (!(await newFile.exists())) {
                        await newFile.create();
                      }
                      await newFile.writeAsBytes(await file.readAsBytes());
                      settingsHandler.dbHandler = DBHandler();
                      await settingsHandler.dbHandler.dbConnect(newFile.path);
                      ServiceHandler.displayToast('Restored!');
                    } else {
                      ServiceHandler.displayToast('No Restore File Found!');
                    }
                  } else {
                    ServiceHandler.displayToast('No Access!');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

