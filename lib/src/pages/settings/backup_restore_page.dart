import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/database_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class BackupRestorePage extends StatefulWidget {
  const BackupRestorePage({Key? key}) : super(key: key);

  @override
  State<BackupRestorePage> createState() => _BackupRestorePageState();
}

class _BackupRestorePageState extends State<BackupRestorePage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final TagHandler tagHandler = TagHandler.instance;
  String backupPath = "";

  void showSnackbar(BuildContext context, String text, bool isError) {
    FlashElements.showSnackbar(
      context: context,
      title: Text(
        isError ? 'Error!' : 'Success!',
        style: const TextStyle(fontSize: 20)
      ),
      content: Text(
        text,
        style: const TextStyle(fontSize: 16)
      ),
      leadingIcon: isError ? Icons.error_outline : Icons.done,
      leadingIconColor: isError ? Colors.red : Colors.green,
      sideColor: isError ? Colors.red : Colors.green,
    );
  }

  Future<bool> detectedDuplicateFile(String fileName) async {
    bool? res = await showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text('Duplicate file detected!'),
        content: Text('The file "$fileName" already exists. Do you want to overwrite it? If you choose no, the backup will be cancelled.'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop(true);
              await ServiceHandler.deleteFileFromSAFDirectory(backupPath, fileName);
            },
            child: const Text('Yes'),
          ),
        ],
      );
    });

    return res ?? false;
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
          title: const Text("Backup & Restore"),
        ),
        body: Center(
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.infinity,
                child: const Text("This feature is only available on Android, on Desktop builds you can just copy/paste files from/to app's data folder, respective to your system"),
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
          title: const Text("Backup & Restore"),
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
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.infinity,
                child: Text(backupPath.isNotEmpty ? 'Backup path is: $backupPath' : 'No backup directory selected'),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.infinity,
                child: const Text('Restore will work only if the files are placed in the same directory.'),
              ),
              ] +
                (backupPath.isNotEmpty ? [
              SettingsButton(
                name: 'Backup Settings',
                action: () async {
                  try {
                    File file = File('${await ServiceHandler.getConfigDir()}settings.json');
                    if(await ServiceHandler.existsFileFromSAFDirectory(backupPath, 'settings.json')) {
                      final bool res = await detectedDuplicateFile('settings.json');
                      if(!res) {
                        showSnackbar(context, 'Backup cancelled!', true);
                        return;
                      }
                    }
                    if(backupPath.isNotEmpty) {
                      ServiceHandler.writeImage(await file.readAsBytes(), "settings", "text/json", "json", backupPath);
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
                subtitle: const Text('settings.json'),
                action: () async {
                  try {
                    if(backupPath.isNotEmpty) {
                      Uint8List? settingsFileBytes = await ServiceHandler.getFileFromSAFDirectory(backupPath,"settings.json");
                      if(settingsFileBytes != null){
                        File newFile = File('${await ServiceHandler.getConfigDir()}settings.json');
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

              const SettingsButton(name: '', enabled: false),

              SettingsButton(
                name: 'Backup Database',
                action: () async {
                  try {
                    File file = File('${await ServiceHandler.getConfigDir()}store.db');
                    if(await ServiceHandler.existsFileFromSAFDirectory(backupPath, 'store.db')) {
                      final bool res = await detectedDuplicateFile('store.db');
                      if(!res) {
                        showSnackbar(context, 'Backup cancelled!', true);
                        return;
                      }
                    }
                    if(backupPath.isNotEmpty) {
                      ServiceHandler.writeImage(await file.readAsBytes(), "store", "application/x-sqlite3", "db", backupPath);
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
                subtitle: const Text('store.db'),
                action: () async {
                  try {
                    if(backupPath.isNotEmpty) {
                      Uint8List? dbFileBytes = await ServiceHandler.getFileFromSAFDirectory(backupPath,"store.db");
                      if(dbFileBytes != null){
                        File newFile = File('${await ServiceHandler.getConfigDir()}store.db');
                        if (!(await newFile.exists())) {
                          await newFile.create();
                        }
                        // disable backupping while restoring the db
                        searchHandler.canBackup.value = false;
                        // 
                        await newFile.writeAsBytes(dbFileBytes);
                        settingsHandler.dbHandler = DBHandler();
                        await settingsHandler.dbHandler.dbConnect(newFile.path);
                        // 
                        showSnackbar(context, 'Database restored from backup! App will restart in a few seconds!', false);
                        await Future.delayed(const Duration(seconds: 3));
                        ServiceHandler.restartApp();
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

              const SettingsButton(name: '', enabled: false),

              SettingsButton(
                name: 'Backup Boorus',
                action: () async {
                  try {
                    print(json.encode(settingsHandler.booruList));
                    List<Booru> booruList = settingsHandler.booruList.where((e) => e.type != 'Favourites').toList();
                    if(await ServiceHandler.existsFileFromSAFDirectory(backupPath, 'boorus.json')) {
                      final bool res = await detectedDuplicateFile('boorus.json');
                      if(!res) {
                        showSnackbar(context, 'Backup cancelled!', true);
                        return;
                      }
                    }
                    if(backupPath.isNotEmpty) {
                      await ServiceHandler.writeImage(utf8.encode(json.encode(booruList)), "boorus", "text", "json", backupPath);
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
                subtitle: const Text('boorus.json'),
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
                        String configBoorusPath = '${await ServiceHandler.getConfigDir()}boorus/';
                        Directory configBoorusDir = await Directory(configBoorusPath).create(recursive:true);
                        if (json.isNotEmpty) {
                          for (int i = 0; i < json.length; i++) {
                              Booru booru = Booru.fromJsonObject(json[i]);
                              bool alreadyExists = settingsHandler.booruList.indexWhere((el) => el.baseURL == booru.baseURL && el.name == booru.name) != -1;
                              bool isAllowed = booru.type != 'Favourites';
                              if(!alreadyExists && isAllowed) {
                                File booruFile = File("${configBoorusDir.path}${booru.name}.json");
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

              const SettingsButton(name: '', enabled: false),

              SettingsButton(
                name: 'Backup Tags',
                action: () async {
                  try {
                    print(json.encode(settingsHandler.booruList));
                    if(await ServiceHandler.existsFileFromSAFDirectory(backupPath, 'tags.json')) {
                      final bool res = await detectedDuplicateFile('tags.json');
                      if(!res) {
                        showSnackbar(context, 'Backup cancelled!', true);
                        return;
                      }
                    }
                    if(backupPath.isNotEmpty) {
                      await ServiceHandler.writeImage(utf8.encode(json.encode(tagHandler.toList())), "tags", "text", "json", backupPath);
                      showSnackbar(context, 'Tags saved to tags.json', false);
                    } else {
                      showSnackbar(context, 'No Access to backup folder!', true);
                    }
                  } catch (e) {
                    showSnackbar(context, 'Error while saving tags! $e', true);
                    print(e);
                  }
                },
              ),
              SettingsButton(
                name: 'Restore Tags',
                subtitle: const Text('tags.json'),
                action: () async {

                  try {
                    if(backupPath.isNotEmpty) {
                      Uint8List? tagFileBytes = await ServiceHandler.getFileFromSAFDirectory(backupPath,"tags.json");
                      String tagJSONString = "";
                      if (tagFileBytes != null){
                        tagJSONString = String.fromCharCodes(tagFileBytes);
                      }
                      if(tagJSONString.isNotEmpty) {
                        await tagHandler.loadFromJSON(tagJSONString);
                        showSnackbar(context, 'Tags restored from backup!', false);
                      }
                    } else {
                      showSnackbar(context, 'No Access to backup folder!', true);
                    }
                  } catch (e) {
                    showSnackbar(context, 'Error while restoring tags! $e', true);
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

