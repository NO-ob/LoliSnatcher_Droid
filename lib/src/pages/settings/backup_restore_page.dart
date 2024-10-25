import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:lolisnatcher/l10n/generated/app_localizations.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/database_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class BackupRestorePage extends StatefulWidget {
  const BackupRestorePage({super.key});

  @override
  State<BackupRestorePage> createState() => _BackupRestorePageState();
}

class _BackupRestorePageState extends State<BackupRestorePage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final TagHandler tagHandler = TagHandler.instance;
  String backupPath = '';

  void showSnackbar(BuildContext context, String text, bool isError) {
    FlashElements.showSnackbar(
      context: context,
      title: Text(
        isError ? AppLocalizations.of(context).snackBar_backupRestore_title_error : AppLocalizations.of(context).snackBar_backupRestore_title_success,
        style: const TextStyle(fontSize: 20),
      ),
      content: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
      leadingIcon: isError ? Icons.error_outline : Icons.done,
      leadingIconColor: isError ? Colors.red : Colors.green,
      sideColor: isError ? Colors.red : Colors.green,
    );
  }

  Future<bool> detectedDuplicateFile(String fileName) async {
    final bool? res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).alert_backupRestore_duplicateFile_title),
          content: Text(AppLocalizations.of(context).alert_backupRestore_duplicateFile_body(fileName)),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(AppLocalizations.of(context).alert_action_no),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
                await ServiceHandler.deleteFileFromSAFDirectory(backupPath, fileName);
              },
              child: Text(AppLocalizations.of(context).alert_action_yes),
            ),
          ],
        );
      },
    );

    return res ?? false;
  }

  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<void> _onPopInvoked(bool didPop) async {
    if (didPop) {
      return;
    }

    final bool result = await settingsHandler.saveSettings(restate: false);
    if (result) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!Platform.isAndroid) {
      return PopScope(
        canPop: false,
        onPopInvoked: _onPopInvoked,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).title_backupRestoreBeta),
          ),
          body: Center(
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  width: double.infinity,
                  child: Text(
                    AppLocalizations.of(context).backupRestore_featureMessage,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return PopScope(
      canPop: false,
      onPopInvoked: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).title_backupRestoreBeta),
        ),
        body: Center(
          child: ListView(
            children: [
                  SettingsButton(
                    name: AppLocalizations.of(context).backupRestore_selectBackupDir,
                    action: () async {
                      final String path = await ServiceHandler.getSAFDirectoryAccess();
                      if (path.isNotEmpty) {
                        setState(() {
                          backupPath = path;
                        });
                      } else {
                        showSnackbar(context, AppLocalizations.of(context).backupRestore_backupFailed, true);
                      }
                    },
                    drawTopBorder: true,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    width: double.infinity,
                    child: Text(
                      backupPath.isNotEmpty
                          ? AppLocalizations.of(context).backupRestore_backupPathMessage(backupPath)
                          : AppLocalizations.of(context).backupRestore_noBackupDirMessage,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    width: double.infinity,
                    child: Text(AppLocalizations.of(context).backupRestore_restoreInfoMessage),
                  ),
                ] +
                (backupPath.isNotEmpty
                    ? [
                        SettingsButton(
                          name: 'Backup Settings',
                          action: () async {
                            try {
                              final File file = File('${await ServiceHandler.getConfigDir()}settings.json');
                              if (await ServiceHandler.existsFileFromSAFDirectory(backupPath, 'settings.json')) {
                                final bool res = await detectedDuplicateFile('settings.json');
                                if (!res) {
                                  showSnackbar(context, AppLocalizations.of(context).backupRestore_backupCancelled, true);
                                  return;
                                }
                              }
                              if (backupPath.isNotEmpty) {
                                await ServiceHandler.writeImage(await file.readAsBytes(), 'settings', 'text/json', 'json', backupPath);
                                showSnackbar(context, AppLocalizations.of(context).backupRestore_settingsSaved, false);
                              } else {
                                showSnackbar(context, AppLocalizations.of(context).backupRestore_backupNoAccess, true);
                              }
                            } catch (e) {
                              showSnackbar(context, AppLocalizations.of(context).backupRestore_settingsSaveError(e.toString()), true);
                            }
                          },
                          drawTopBorder: true,
                        ),
                        SettingsButton(
                          name: 'Restore Settings',
                          subtitle: const Text('settings.json'),
                          action: () async {
                            try {
                              if (backupPath.isNotEmpty) {
                                final Uint8List? settingsFileBytes = await ServiceHandler.getFileFromSAFDirectory(backupPath, 'settings.json');
                                if (settingsFileBytes != null) {
                                  final File newFile = File('${await ServiceHandler.getConfigDir()}settings.json');
                                  if (!(await newFile.exists())) {
                                    await newFile.create();
                                  }
                                  await newFile.writeAsBytes(settingsFileBytes);
                                  await settingsHandler.loadSettingsJson();
                                  showSnackbar(context, AppLocalizations.of(context).backupRestore_settingsRestored, false);
                                } else {
                                  showSnackbar(context, AppLocalizations.of(context).backupRestore_noRestoreFileFound, true);
                                }
                              } else {
                                showSnackbar(context, AppLocalizations.of(context).backupRestore_backupNoAccess, true);
                              }
                            } catch (e) {
                              showSnackbar(context, AppLocalizations.of(context).backupRestore_settingsRestoreError(e.toString()), true);
                            }
                          },
                        ),
                        const SettingsButton(name: '', enabled: false),
                        SettingsButton(
                          name: 'Backup Boorus',
                          action: () async {
                            try {
                              final List<Booru> booruList =
                                  settingsHandler.booruList.where((e) => e.type != BooruType.Favourites && e.type != BooruType.Downloads).toList();
                              if (await ServiceHandler.existsFileFromSAFDirectory(backupPath, 'boorus.json')) {
                                final bool res = await detectedDuplicateFile('boorus.json');
                                if (!res) {
                                  showSnackbar(context, AppLocalizations.of(context).backupRestore_backupCancelled, true);
                                  return;
                                }
                              }
                              if (backupPath.isNotEmpty) {
                                await ServiceHandler.writeImage(utf8.encode(json.encode(booruList)), 'boorus', 'text', 'json', backupPath);
                                showSnackbar(context, AppLocalizations.of(context).backupRestore_boorusSavedMessage, false);
                              } else {
                                showSnackbar(context, AppLocalizations.of(context).backupRestore_backupNoAccess, true);
                              }
                            } catch (e) {
                              showSnackbar(context, AppLocalizations.of(context).backupRestore_boorusSaveError(e.toString()), true);
                            }
                          },
                        ),
                        SettingsButton(
                          name: AppLocalizations.of(context).backupRestore_restoreBoorus,
                          subtitle: const Text('boorus.json'),
                          action: () async {
                            try {
                              if (backupPath.isNotEmpty) {
                                final Uint8List? booruFileBytes = await ServiceHandler.getFileFromSAFDirectory(backupPath, 'boorus.json');
                                String boorusJSONString = '';
                                if (booruFileBytes != null) {
                                  boorusJSONString = String.fromCharCodes(booruFileBytes);
                                }
                                if (boorusJSONString.isNotEmpty) {
                                  final List<dynamic> json = jsonDecode(boorusJSONString);
                                  final String configBoorusPath = '${await ServiceHandler.getConfigDir()}boorus/';
                                  final Directory configBoorusDir = await Directory(configBoorusPath).create(recursive: true);
                                  if (json.isNotEmpty) {
                                    for (int i = 0; i < json.length; i++) {
                                      final Booru booru = Booru.fromMap(json[i]);
                                      final bool alreadyExists =
                                          settingsHandler.booruList.indexWhere((el) => el.baseURL == booru.baseURL && el.name == booru.name) != -1;
                                      final bool isAllowed = booru.type != BooruType.Favourites && booru.type != BooruType.Downloads;
                                      if (!alreadyExists && isAllowed) {
                                        final File booruFile = File('${configBoorusDir.path}${booru.name}.json');
                                        final writer = booruFile.openWrite();
                                        writer.write(jsonEncode(booru.toJson()));
                                        await writer.close();
                                      }
                                    }
                                    await settingsHandler.loadBoorus();
                                    showSnackbar(context, AppLocalizations.of(context).backupRestore_boorusRestoredMessage, false);
                                  }
                                }
                              } else {
                                showSnackbar(context, AppLocalizations.of(context).backupRestore_backupNoAccess, true);
                              }
                            } catch (e) {
                              showSnackbar(context, AppLocalizations.of(context).backupRestore_booruRestoreError(e.toString()), true);
                            }
                          },
                        ),
                        const SettingsButton(name: '', enabled: false),
                        SettingsButton(
                          name: AppLocalizations.of(context).backupRestore_backupTags,
                          action: () async {
                            try {
                              if (await ServiceHandler.existsFileFromSAFDirectory(backupPath, 'tags.json')) {
                                final bool res = await detectedDuplicateFile('tags.json');
                                if (!res) {
                                  showSnackbar(context, AppLocalizations.of(context).backupRestore_backupCancelled, true);
                                  return;
                                }
                              }
                              if (backupPath.isNotEmpty) {
                                await ServiceHandler.writeImage(utf8.encode(json.encode(tagHandler.toList())), 'tags', 'text', 'json', backupPath);
                                showSnackbar(context, AppLocalizations.of(context).backupRestore_tagsSavedMessage, false);
                              } else {
                                showSnackbar(context, AppLocalizations.of(context).backupRestore_backupNoAccess, true);
                              }
                            } catch (e) {
                              showSnackbar(context, AppLocalizations.of(context).backupRestore_tagSaveError(e.toString()), true);
                            }
                          },
                        ),
                        SettingsButton(
                          name: AppLocalizations.of(context).backupRestore_restoreTags,
                          subtitle: const Text('tags.json'),
                          action: () async {
                            try {
                              if (backupPath.isNotEmpty) {
                                final Uint8List? tagFileBytes = await ServiceHandler.getFileFromSAFDirectory(backupPath, 'tags.json');
                                String tagJSONString = '';
                                if (tagFileBytes != null) {
                                  tagJSONString = String.fromCharCodes(tagFileBytes);
                                }
                                if (tagJSONString.isNotEmpty) {
                                  await tagHandler.loadFromJSON(tagJSONString);
                                  showSnackbar(context, AppLocalizations.of(context).backupRestore_tagsRestoredMessage, false);
                                }
                              } else {
                                showSnackbar(context, AppLocalizations.of(context).backupRestore_backupNoAccess, true);
                              }
                            } catch (e) {
                              showSnackbar(context, AppLocalizations.of(context).backupRestore_tagRestoreError(e.toString()), true);
                            }
                          },
                        ),
                        const SettingsButton(name: '', enabled: false),
                        SettingsButton(
                          name: AppLocalizations.of(context).backupRestore_backupDatabase,
                          action: () async {
                            try {
                              final File file = File('${await ServiceHandler.getConfigDir()}store.db');
                              if (await ServiceHandler.existsFileFromSAFDirectory(backupPath, 'store.db')) {
                                final bool res = await detectedDuplicateFile('store.db');
                                if (!res) {
                                  showSnackbar(context, AppLocalizations.of(context).backupRestore_backupCancelled, true);
                                  return;
                                }
                              }
                              if (backupPath.isNotEmpty) {
                                await ServiceHandler.writeImage(await file.readAsBytes(), 'store', 'application/x-sqlite3', 'db', backupPath);
                                showSnackbar(context, AppLocalizations.of(context).backupRestore_databaseSaved, false);
                              } else {
                                showSnackbar(context, AppLocalizations.of(context).backupRestore_backupNoAccess, true);
                              }
                            } catch (e) {
                              showSnackbar(context, AppLocalizations.of(context).backupRestore_databaseSaveError(e.toString()), true);
                            }
                          },
                        ),
                        SettingsButton(
                          name: AppLocalizations.of(context).backupRestore_restoreDatabase,
                          subtitle: const Text('store.db'),
                          action: () async {
                            try {
                              if (backupPath.isNotEmpty) {
                                final fileExists = await ServiceHandler.existsFileFromSAFDirectory(backupPath, 'store.db');
                                if (!fileExists) {
                                  showSnackbar(context, AppLocalizations.of(context).backupRestore_noRestoreFileFound, true);
                                  return;
                                }

                                // disable backupping while restoring the db
                                searchHandler.canBackup.value = false;

                                final bool res = await ServiceHandler.copySafFileToDir(
                                  backupPath,
                                  'store.db',
                                  await ServiceHandler.getConfigDir(),
                                );

                                if (!res) {
                                  showSnackbar(
                                    context,
                                    AppLocalizations.of(context).backupRestore_databaseRestoreError('False result when db file with SAF'),
                                    true,
                                  );
                                  return;
                                }

                                final File newFile = File('${await ServiceHandler.getConfigDir()}store.db');
                                if (!(await newFile.exists())) {
                                  showSnackbar(context, AppLocalizations.of(context).backupRestore_databaseRestoreError('New db file does not exist'), true);
                                  return;
                                }

                                settingsHandler.dbHandler = DBHandler();
                                await settingsHandler.dbHandler.dbConnect(newFile.path);
                                //
                                showSnackbar(context, AppLocalizations.of(context).backupRestore_databaseRestored, false);
                                await Future.delayed(const Duration(seconds: 3));
                                unawaited(ServiceHandler.restartApp());
                              } else {
                                showSnackbar(context, AppLocalizations.of(context).backupRestore_backupNoAccess, true);
                              }
                            } catch (e) {
                              showSnackbar(context, AppLocalizations.of(context).backupRestore_databaseRestoreError(e.toString()), true);
                            }
                          },
                        ),
                      ]
                    : []),
          ),
        ),
      ),
    );
  }
}
