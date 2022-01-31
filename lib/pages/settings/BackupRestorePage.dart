import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/DBHandler.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';

class BackupRestorePage extends StatefulWidget {
  BackupRestorePage();
  @override
  _BackupRestorePageState createState() => _BackupRestorePageState();
}

class _BackupRestorePageState extends State<BackupRestorePage> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  ServiceHandler serviceHandler = ServiceHandler();
  String backupPath = "";
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
    bool result = await settingsHandler.saveSettings(restate: false);
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
              SettingsButton(
                name: 'Select Backup Directory',
                action: () async {
                  String path = await ServiceHandler.getSAFDirectoryAccess();
                  if (path.isNotEmpty){
                    setState(() {
                      backupPath = path;
                    });
                  } else {
                    showSnackbar(context, 'Failed to get backup path!', true);
                  }
                },
                drawTopBorder: true,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.infinity,
                child: Text(backupPath.isNotEmpty ? 'Backup path is: $backupPath' : 'No backup directory selected'),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.infinity,
                child: Text('Restore will work only if the files are placed in the same directory.'),
              ),
              ] +
                (backupPath.isNotEmpty ? [SettingsButton(
                name: 'Backup Settings',
                action: () async {
                  try {
                    File file = File(await serviceHandler.getConfigDir() + 'settings.json');
                    if(backupPath.isNotEmpty) {
                      serviceHandler.writeImage(file.readAsBytesSync(), "settings", "text/json", "json", backupPath);
                      showSnackbar(context, 'Settings saved to settings.json', false);
                    } else {
                      showSnackbar(context, 'No Access to backup folder!', true);
                    }
                  } catch (e) {
                    showSnackbar(context, 'Error while saving settings! $e', true);
                  }
                },
                drawTopBorder: true,
              ),
              SettingsButton(
                name: 'Restore Settings',
                subtitle: Text('settings.json'),
                action: () async {
                  try {
                    if(backupPath.isNotEmpty) {
                      Uint8List? settingsFileBytes = await ServiceHandler.getFileFromSAFDirectory(backupPath,"settings.json");
                      if(settingsFileBytes != null){
                        File newFile = File(await serviceHandler.getConfigDir() + 'settings.json');
                        if (!(await newFile.exists())) {
                          await newFile.create();
                        }
                        await newFile.writeAsBytes(settingsFileBytes);
                        settingsHandler.loadSettingsJson();
                        showSnackbar(context, 'Settings restored from backup!', false);
                      } else {
                        showSnackbar(context, 'No Restore File Found!', true);
                      }
                    } else {
                      showSnackbar(context, 'No Access to backup folder!', true);
                    }
                  } catch (e) {
                    showSnackbar(context, 'Error while restoring settings! $e', true);
                  }
                },
              ),

              SettingsButton(name: '', enabled: false),

              SettingsButton(
                name: 'Backup Database',
                action: () async {
                  try {
                    File file = File(await serviceHandler.getConfigDir() + 'store.db');
                    if(backupPath.isNotEmpty) {
                      serviceHandler.writeImage(file.readAsBytesSync(), "store", "application/x-sqlite3", "db", backupPath);
                      showSnackbar(context, 'Database saved to store.db', false);
                    } else {
                      showSnackbar(context, 'No Access to backup folder!', true);
                    }
                  } catch (e) {
                    showSnackbar(context, 'Error while saving database! $e', true);
                  }
                },
              ),
              SettingsButton(
                name: 'Restore Database',
                subtitle: Text('store.db'),
                action: () async {
                  try {
                    if(backupPath.isNotEmpty) {
                      Uint8List? dbFileBytes = await ServiceHandler.getFileFromSAFDirectory(backupPath,"store.db");
                      if(dbFileBytes != null){
                        File newFile = File(await serviceHandler.getConfigDir() + 'store.db');
                        if (!(await newFile.exists())) {
                          await newFile.create();
                        }
                        await newFile.writeAsBytes(dbFileBytes);
                        settingsHandler.dbHandler = DBHandler();
                        await settingsHandler.dbHandler.dbConnect(newFile.path);
                        showSnackbar(context, 'Database restored from backup!', false);
                      } else {
                        showSnackbar(context, 'No Restore File Found!', true);
                      }
                    } else {
                      showSnackbar(context, 'No Access to backup folder!', true);
                    }
                  } catch (e) {
                    showSnackbar(context, 'Error while restoring database! $e', true);
                  }
                },
              ),

              SettingsButton(name: '', enabled: false),

              SettingsButton(
                name: 'Backup Boorus',
                action: () async {
                  try {
                    print(json.encode(settingsHandler.booruList));
                    if(backupPath.isNotEmpty) {
                      await serviceHandler.writeImage(utf8.encode(json.encode(settingsHandler.booruList)), "boorus", "text", "json", backupPath);
                      showSnackbar(context, 'Boorus saved to boorus.json', false);
                    } else {
                      showSnackbar(context, 'No Access to backup folder!', true);
                    }
                  } catch (e) {
                    showSnackbar(context, 'Error while saving boorus! $e', true);
                    print(e);
                  }
                },
              ),
              SettingsButton(
                name: 'Restore Boorus',
                subtitle: Text('boorus.json'),
                action: () async {

                  try {
                    if(backupPath.isNotEmpty) {
                      Uint8List? booruFileBytes = await ServiceHandler.getFileFromSAFDirectory(backupPath,"boorus.json");
                      String boorusJSONString = "";
                      if (booruFileBytes != null){
                        boorusJSONString = String.fromCharCodes(booruFileBytes);
                      }
                      if(boorusJSONString.isNotEmpty) {
                        List<dynamic> json = jsonDecode(boorusJSONString);
                        String configBoorusPath = await serviceHandler.getConfigDir() + 'boorus/';
                        Directory configBoorusDir = await Directory(configBoorusPath).create(recursive:true);
                        if (json.length > 0) {
                          for (int i = 0; i < json.length; i++) {
                              Booru booru = Booru.fromJson(json[i]);
                              bool alreadyExists = settingsHandler.booruList.indexWhere((el) => el.baseURL == booru.baseURL && el.name == booru.name) != -1;
                              if(!alreadyExists) {
                                File booruFile = File(configBoorusDir.path + "${booru.name}.json");
                                var writer = booruFile.openWrite();
                                writer.write(jsonEncode(booru.toJson()));
                                writer.close();
                              }
                          }
                          settingsHandler.loadBoorus();
                          showSnackbar(context, 'Boorus restored from backup!', false);
                        }
                      }
                    } else {
                      showSnackbar(context, 'No Access to backup folder!', true);
                    }
                  } catch (e) {
                    showSnackbar(context, 'Error while restoring boorus! $e', true);
                    print(e);
                  }
                },
              ),
              ]:[])
          ),
        ),
      ),
    );
  }
}

