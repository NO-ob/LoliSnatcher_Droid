import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/DBHandler.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
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

  void showSnackbar(BuildContext context, String text, bool isError) {
    FlashElements.showSnackbar(
      context: context,
      title: Text(
        isError ? 'Error!' : 'Success!',
        style: TextStyle(fontSize: 20)
      ),
      content: Text(
        text,
        style: TextStyle(fontSize: 16)
      ),
      leadingIcon: isError ? Icons.error_outline : Icons.done,
      leadingIconColor: isError ? Colors.red : Colors.green,
      sideColor: isError ? Colors.red : Colors.green,
    );
  }

  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    bool result = await settingsHandler.saveSettings(restate: true);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    if(!Platform.isAndroid) {
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
                child: Text("This feature is only available on Android, on Desktop builds you can just copy/paste files from/to app's data folder, respective to your system"),
              )
            ]
          )
        )
      )
      );
    }

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
                    showSnackbar(context, 'Settings saved to settings.json', false);
                  } else {
                    showSnackbar(context, 'No Access to backup folder!', true);
                  }
                },
                drawTopBorder: true,
              ),
              SettingsButton(
                name: 'Restore Settings',
                subtitle: Text('settings.json'),
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
                      showSnackbar(context, 'Settings restored from backup!', false);
                    } else {
                      showSnackbar(context, 'No Restore File Found!', true);
                    }
                  } else {
                    showSnackbar(context, 'No Access to backup folder!', true);
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
                    showSnackbar(context, 'Database saved to store.db', false);
                  } else {
                    showSnackbar(context, 'No Access to backup folder!', true);
                  }
                },
              ),
              SettingsButton(
                name: 'Restore Database',
                subtitle: Text('store.db'),
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
                      showSnackbar(context, 'Database restored from backup!', false);
                    } else {
                      showSnackbar(context, 'No Restore File Found!', true);
                    }
                  } else {
                    showSnackbar(context, 'No Access to backup folder!', true);
                  }
                },
              ),

              SettingsButton(name: '', enabled: false),

              SettingsButton(
                name: 'Backup Boorus',
                action: () async {
                  Directory? dlDir = (await getExternalStorageDirectories())?.first;
                  if(dlDir != null) {
                    String configBoorusPath = await serviceHandler.getConfigDir() + 'boorus/';
                    Directory configBoorusDir = Directory(configBoorusPath);
                    if(await configBoorusDir.exists()) {
                      String restoreBoorusPath = dlDir.path + '/boorus/';
                      Directory restoreBoorusDir = await Directory(restoreBoorusPath).create(recursive:true);
                      List files = configBoorusDir.listSync();
                      if (files.length > 0) {
                        for (int i = 0; i < files.length; i++) {
                          if (files[i].path.contains(".json")) {
                            Booru booruFromFile = Booru.fromJSON(files[i].readAsStringSync());
                            File booruFile = File(restoreBoorusPath + "${booruFromFile.name}.json");
                            var writer = booruFile.openWrite();
                            writer.write(jsonEncode(booruFromFile.toJSON()));
                            writer.close();
                          }
                        }
                        showSnackbar(context, 'Boorus saved in /boorus folder', false);
                      }
                    }
                  } else {
                    showSnackbar(context, 'No Access to backup folder!', true);
                  }
                },
              ),
              SettingsButton(
                name: 'Restore Boorus',
                subtitle: Text('/boorus/[Booru Name].json'),
                action: () async {
                  Directory? dlDir = (await getExternalStorageDirectories())?.first;
                  if(dlDir != null) {
                    String restoreBoorusPath = dlDir.path + '/boorus/';
                    Directory restoreBoorusDir = Directory(restoreBoorusPath);
                    if(await restoreBoorusDir.exists()) {
                      String configBoorusPath = await serviceHandler.getConfigDir() + 'boorus/';
                      Directory configBoorusDir = await Directory(configBoorusPath).create(recursive:true);
                      List files = restoreBoorusDir.listSync();
                      if (files.length > 0) {
                        for (int i = 0; i < files.length; i++) {
                          if (files[i].path.contains(".json")) {
                            Booru booruFromFile = Booru.fromJSON(files[i].readAsStringSync());
                            bool alreadyExists = settingsHandler.booruList.indexWhere((el) => el.baseURL == booruFromFile.baseURL && el.name == booruFromFile.name) != -1;
                            if(!alreadyExists) {
                              File booruFile = File(configBoorusDir.path + "${booruFromFile.name}.json");
                              var writer = booruFile.openWrite();
                              writer.write(jsonEncode(booruFromFile.toJSON()));
                              writer.close();
                            }
                          }
                        }
                        settingsHandler.loadBoorus();
                        showSnackbar(context, 'Boorus restored from backup!', false);
                      }
                    }
                  } else {
                    showSnackbar(context, 'No Access to backup folder!', true);
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

