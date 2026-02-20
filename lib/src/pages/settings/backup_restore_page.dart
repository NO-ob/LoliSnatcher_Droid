import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/database_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
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

  bool inProgress = false;
  int progress = 0, total = 0;

  @override
  void initState() {
    super.initState();
    backupPath = settingsHandler.backupPath;
    validateBackupPathAccess();
  }

  Future<void> validateBackupPathAccess() async {
    if (!Platform.isAndroid || backupPath.isEmpty) {
      return;
    }

    try {
      final success = await ServiceHandler.testSAFPersistence(backupPath);
      if (!success) {
        Logger.Inst().log(
          'Invalid backup path',
          'BackupRestorePage',
          'validateBackupPathAccess',
          LogTypes.exception,
        );
        setState(() {
          backupPath = '';
          settingsHandler.backupPath = '';
        });
        await settingsHandler.saveSettings(restate: false);
      }
    } catch (_) {}
  }

  void showSnackbar(
    String text, {
    required bool isError,
  }) {
    FlashElements.showSnackbar(
      context: context,
      title: Text(
        isError ? context.loc.errorExclamation : context.loc.successExclamation,
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
          title: Text(context.loc.settings.backupAndRestore.duplicateFileDetectedTitle),
          content: Text(context.loc.settings.backupAndRestore.duplicateFileDetectedMsg(fileName: fileName)),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(context.loc.no),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
                await ServiceHandler.deleteFileFromSAFDirectory(backupPath, fileName);
              },
              child: Text(context.loc.yes),
            ),
          ],
        );
      },
    );

    return res ?? false;
  }

  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<void> _onPopInvoked(bool didPop, _) async {
    if (didPop) {
      return;
    }

    if (inProgress) {
      FlashElements.showSnackbar(
        title: Text(context.loc.pleaseWait),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.yellow,
        sideColor: Colors.yellow,
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!Platform.isAndroid) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SettingsAppBar(title: context.loc.settings.backupAndRestore.title),
        body: Center(
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.infinity,
                child: Text(context.loc.settings.backupAndRestore.androidOnlyFeatureMsg),
              ),
            ],
          ),
        ),
      );
    }

    return PopScope(
      canPop: !inProgress,
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SettingsAppBar(title: context.loc.settings.backupAndRestore.title),
        body: Center(
          child: Stack(
            children: [
              ListView(
                children: [
                  SettingsButton(
                    name: context.loc.settings.backupAndRestore.selectBackupDir,
                    icon: const Icon(Icons.folder),
                    action: () async {
                      final String path = await ServiceHandler.getSAFDirectoryAccess();
                      if (path.isNotEmpty) {
                        setState(() {
                          backupPath = path;
                          settingsHandler.backupPath = path;
                          settingsHandler.saveSettings(restate: false);
                        });
                      } else {
                        showSnackbar(
                          context.loc.settings.backupAndRestore.failedToGetBackupPath,
                          isError: true,
                        );
                      }
                    },
                    drawTopBorder: true,
                  ),
                  //
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    width: double.infinity,
                    child: Text(
                      backupPath.isNotEmpty
                          ? context.loc.settings.backupAndRestore.backupPathMsg(backupPath: backupPath)
                          : context.loc.settings.backupAndRestore.noBackupDirSelected,
                    ),
                  ),
                  //
                  if (backupPath.isNotEmpty) ...[
                    SettingsButton(
                      name: context.loc.settings.backupAndRestore.resetBackupDir,
                      icon: const Icon(Icons.refresh_rounded),
                      action: () async {
                        setState(() {
                          backupPath = '';
                          settingsHandler.backupPath = '';
                          settingsHandler.saveSettings(restate: false);
                        });
                      },
                      drawTopBorder: true,
                    ),
                    const SettingsButton(name: '', enabled: false),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      width: double.infinity,
                      child: Text(context.loc.settings.backupAndRestore.restoreInfoMsg),
                    ),
                    SettingsButton(
                      name: context.loc.settings.backupAndRestore.backupSettings,
                      icon: const Icon(Icons.settings),
                      action: () async {
                        inProgress = true;
                        setState(() {});
                        try {
                          final File file = File('${await ServiceHandler.getConfigDir()}settings.json');
                          if (await ServiceHandler.existsFileFromSAFDirectory(backupPath, 'settings.json')) {
                            final bool res = await detectedDuplicateFile('settings.json');
                            if (!res) {
                              showSnackbar(
                                context.loc.settings.backupAndRestore.backupCancelled,
                                isError: true,
                              );
                              inProgress = false;
                              setState(() {});
                              return;
                            }
                          }

                          await ServiceHandler.writeImage(
                            await file.readAsBytes(),
                            'settings',
                            'text/json',
                            'json',
                            backupPath,
                          );
                          showSnackbar(
                            context.loc.settings.backupAndRestore.settingsBackedUp,
                            isError: false,
                          );
                        } catch (e, s) {
                          showSnackbar(
                            context.loc.settings.backupAndRestore.backupSettingsError,
                            isError: true,
                          );
                          Logger.Inst().log(
                            e.toString(),
                            'BackupRestorePage',
                            'backupSettings',
                            LogTypes.exception,
                            s: s,
                          );
                        }
                        inProgress = false;
                        setState(() {});
                      },
                      drawTopBorder: true,
                    ),
                    SettingsButton(
                      name: context.loc.settings.backupAndRestore.restoreSettings,
                      icon: const Icon(null),
                      subtitle: const Text('settings.json'),
                      action: () async {
                        inProgress = true;
                        setState(() {});
                        try {
                          final Uint8List? settingsFileBytes = await ServiceHandler.getFileFromSAFDirectory(
                            backupPath,
                            'settings.json',
                          );
                          if (settingsFileBytes != null) {
                            final File newFile = File('${await ServiceHandler.getConfigDir()}settings.json');
                            if (!(await newFile.exists())) {
                              await newFile.create();
                            }
                            await newFile.writeAsBytes(settingsFileBytes);
                            await settingsHandler.loadSettingsJson();
                            showSnackbar(
                              context.loc.settings.backupAndRestore.settingsRestored,
                              isError: false,
                            );
                          } else {
                            showSnackbar(
                              context.loc.settings.backupAndRestore.backupFileNotFound,
                              isError: true,
                            );
                          }
                        } catch (e, s) {
                          showSnackbar(
                            context.loc.settings.backupAndRestore.restoreSettingsError,
                            isError: true,
                          );
                          Logger.Inst().log(
                            e.toString(),
                            'BackupRestorePage',
                            'restoreSettings',
                            LogTypes.exception,
                            s: s,
                          );
                        }
                        inProgress = false;
                        setState(() {});
                      },
                    ),
                    const SettingsButton(name: '', enabled: false),
                    SettingsButton(
                      name: context.loc.settings.backupAndRestore.backupBoorus,
                      icon: const Icon(Icons.image_search),
                      action: () async {
                        inProgress = true;
                        setState(() {});
                        try {
                          final List<Booru> booruList = settingsHandler.booruList
                              .where((e) => BooruType.saveable.contains(e.type))
                              .toList();
                          if (await ServiceHandler.existsFileFromSAFDirectory(backupPath, 'boorus.json')) {
                            final bool res = await detectedDuplicateFile('boorus.json');
                            if (!res) {
                              showSnackbar(
                                context.loc.settings.backupAndRestore.backupCancelled,
                                isError: true,
                              );
                              inProgress = false;
                              setState(() {});
                              return;
                            }
                          }

                          await ServiceHandler.writeImage(
                            utf8.encode(json.encode(booruList)),
                            'boorus',
                            'text',
                            'json',
                            backupPath,
                          );
                          showSnackbar(
                            context.loc.settings.backupAndRestore.boorusBackedUp,
                            isError: false,
                          );
                        } catch (e, s) {
                          showSnackbar(
                            context.loc.settings.backupAndRestore.backupBoorusError,
                            isError: true,
                          );
                          Logger.Inst().log(
                            e.toString(),
                            'BackupRestorePage',
                            'backupBoorus',
                            LogTypes.exception,
                            s: s,
                          );
                        }
                        inProgress = false;
                        setState(() {});
                      },
                    ),
                    SettingsButton(
                      name: context.loc.settings.backupAndRestore.restoreBoorus,
                      icon: const Icon(null),
                      subtitle: const Text('boorus.json'),
                      action: () async {
                        inProgress = true;
                        setState(() {});
                        try {
                          final Uint8List? booruFileBytes = await ServiceHandler.getFileFromSAFDirectory(
                            backupPath,
                            'boorus.json',
                          );
                          String boorusJSONString = '';
                          if (booruFileBytes != null) {
                            boorusJSONString = String.fromCharCodes(booruFileBytes);

                            if (boorusJSONString.isNotEmpty) {
                              final List<dynamic> json = jsonDecode(boorusJSONString);
                              final String configBoorusPath = '${await ServiceHandler.getConfigDir()}boorus/';
                              final Directory configBoorusDir = await Directory(
                                configBoorusPath,
                              ).create(recursive: true);
                              if (json.isNotEmpty) {
                                for (int i = 0; i < json.length; i++) {
                                  final Booru booru = Booru.fromMap(json[i]);
                                  final bool alreadyExists =
                                      settingsHandler.booruList.indexWhere(
                                        (el) => el.baseURL == booru.baseURL && el.name == booru.name,
                                      ) !=
                                      -1;
                                  final bool isAllowed = BooruType.saveable.contains(booru.type);
                                  if (!alreadyExists && isAllowed) {
                                    final File booruFile = File('${configBoorusDir.path}${booru.name}.json');
                                    final writer = booruFile.openWrite();
                                    writer.write(jsonEncode(booru.toJson()));
                                    await writer.close();
                                  }
                                }
                                await settingsHandler.loadBoorus();
                                showSnackbar(
                                  context.loc.settings.backupAndRestore.boorusRestored,
                                  isError: false,
                                );
                              }
                            } else {
                              showSnackbar(
                                context.loc.settings.backupAndRestore.backupFileNotFound,
                                isError: true,
                              );
                            }
                          } else {
                            showSnackbar(
                              context.loc.settings.backupAndRestore.backupFileNotFound,
                              isError: true,
                            );
                          }
                        } catch (e, s) {
                          showSnackbar(
                            context.loc.settings.backupAndRestore.restoreBoorusError,
                            isError: true,
                          );
                          Logger.Inst().log(
                            e.toString(),
                            'BackupRestorePage',
                            'restoreBoorus',
                            LogTypes.exception,
                            s: s,
                          );
                        }
                        inProgress = false;
                        setState(() {});
                      },
                    ),
                    const SettingsButton(name: '', enabled: false),
                    SettingsButton(
                      name: context.loc.settings.backupAndRestore.backupDatabase,
                      icon: const Icon(Icons.list_alt),
                      action: () async {
                        inProgress = true;
                        setState(() {});
                        try {
                          final File file = File('${await ServiceHandler.getConfigDir()}store.db');
                          if (!await file.exists()) {
                            showSnackbar(
                              context.loc.settings.backupAndRestore.databaseFileNotFound,
                              isError: true,
                            );
                            inProgress = false;
                            setState(() {});
                            return;
                          }
                          if (await ServiceHandler.existsFileFromSAFDirectory(backupPath, 'store.db')) {
                            final bool res = await detectedDuplicateFile('store.db');
                            if (!res) {
                              showSnackbar(
                                context.loc.settings.backupAndRestore.backupCancelled,
                                isError: true,
                              );
                              inProgress = false;
                              setState(() {});
                              return;
                            }
                          }

                          await ServiceHandler.copyFileToSafDir(
                            await ServiceHandler.getConfigDir(),
                            'store.db',
                            backupPath,
                            'application/x-sqlite3',
                          );
                          showSnackbar(
                            context.loc.settings.backupAndRestore.databaseBackedUp,
                            isError: false,
                          );
                        } catch (e, s) {
                          showSnackbar(
                            context.loc.settings.backupAndRestore.backupDatabaseError,
                            isError: true,
                          );
                          Logger.Inst().log(
                            e.toString(),
                            'BackupRestorePage',
                            'backupDatabase',
                            LogTypes.exception,
                            s: s,
                          );
                        }
                        inProgress = false;
                        setState(() {});
                      },
                    ),
                    SettingsButton(
                      name: context.loc.settings.backupAndRestore.restoreDatabase,
                      icon: const Icon(null),
                      subtitle: Text('store.db (${context.loc.settings.backupAndRestore.restoreDatabaseInfo})'),
                      action: () async {
                        inProgress = true;
                        setState(() {});
                        try {
                          final fileExists = await ServiceHandler.existsFileFromSAFDirectory(
                            backupPath,
                            'store.db',
                          );
                          if (!fileExists) {
                            showSnackbar(
                              context.loc.settings.backupAndRestore.backupFileNotFound,
                              isError: true,
                            );
                            inProgress = false;
                            setState(() {});
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
                              context.loc.settings.backupAndRestore.restoreDatabaseError,
                              isError: true,
                            );
                            searchHandler.canBackup.value = true;
                            inProgress = false;
                            setState(() {});
                            return;
                          }

                          final File newFile = File('${await ServiceHandler.getConfigDir()}store.db');
                          if (!(await newFile.exists())) {
                            showSnackbar(
                              context.loc.settings.backupAndRestore.restoreDatabaseError,
                              isError: true,
                            );
                            searchHandler.canBackup.value = true;
                            inProgress = false;
                            setState(() {});
                            return;
                          }

                          settingsHandler.dbHandler = DBHandler();
                          await settingsHandler.dbHandler.dbConnect(newFile.path);
                          //
                          showSnackbar(
                            context.loc.settings.backupAndRestore.databaseRestored,
                            isError: false,
                          );
                          await Future.delayed(const Duration(seconds: 3));
                          unawaited(ServiceHandler.restartApp());
                        } catch (e, s) {
                          showSnackbar(
                            context.loc.settings.backupAndRestore.restoreDatabaseError,
                            isError: true,
                          );
                          Logger.Inst().log(
                            e.toString(),
                            'BackupRestorePage',
                            'restoreDatabase',
                            LogTypes.exception,
                            s: s,
                          );
                          searchHandler.canBackup.value = true;
                        }
                        inProgress = false;
                        setState(() {});
                      },
                    ),
                    const SettingsButton(name: '', enabled: false),
                    if (settingsHandler.isDebug.value) ...[
                      SettingsButton(
                        name: context.loc.settings.backupAndRestore.backupTags,
                        icon: const Icon(CupertinoIcons.tag),
                        action: () async {
                          inProgress = true;
                          setState(() {});
                          try {
                            if (await ServiceHandler.existsFileFromSAFDirectory(backupPath, 'tags.json')) {
                              final bool res = await detectedDuplicateFile('tags.json');
                              if (!res) {
                                showSnackbar(
                                  context.loc.settings.backupAndRestore.backupCancelled,
                                  isError: true,
                                );
                                inProgress = false;
                                setState(() {});
                                return;
                              }
                            }

                            await ServiceHandler.writeImage(
                              utf8.encode(json.encode(tagHandler.toList())),
                              'tags',
                              'text',
                              'json',
                              backupPath,
                            );
                            showSnackbar(
                              context.loc.settings.backupAndRestore.tagsBackedUp,
                              isError: false,
                            );
                          } catch (e, s) {
                            showSnackbar(
                              context.loc.settings.backupAndRestore.backupTagsError,
                              isError: true,
                            );
                            Logger.Inst().log(
                              e.toString(),
                              'BackupRestorePage',
                              'backupTags',
                              LogTypes.exception,
                              s: s,
                            );
                          }
                          inProgress = false;
                          setState(() {});
                        },
                      ),
                      SettingsButton(
                        name: context.loc.settings.backupAndRestore.restoreTags,
                        icon: const Icon(null),
                        subtitle: Text('tags.json (${context.loc.settings.backupAndRestore.restoreTagsInfo})'),
                        action: () async {
                          inProgress = true;
                          setState(() {});
                          try {
                            final Uint8List? tagFileBytes = await ServiceHandler.getFileFromSAFDirectory(
                              backupPath,
                              'tags.json',
                            );
                            String tagJSONString = '';
                            if (tagFileBytes != null) {
                              tagJSONString = String.fromCharCodes(tagFileBytes);

                              if (tagJSONString.isNotEmpty) {
                                await tagHandler.loadFromJSON(
                                  tagJSONString,
                                  onProgress: (newProgress, newTotal) {
                                    progress = newProgress;
                                    total = newTotal;
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  },
                                );
                                showSnackbar(
                                  context.loc.settings.backupAndRestore.tagsRestored,
                                  isError: false,
                                );
                              } else {
                                showSnackbar(
                                  context.loc.settings.backupAndRestore.tagsFileNotFound,
                                  isError: true,
                                );
                              }
                            } else {
                              showSnackbar(
                                context.loc.settings.backupAndRestore.tagsFileNotFound,
                                isError: true,
                              );
                            }
                          } catch (e, s) {
                            showSnackbar(
                              context.loc.settings.backupAndRestore.restoreTagsError,
                              isError: true,
                            );
                            Logger.Inst().log(
                              e.toString(),
                              'BackupRestorePage',
                              'restoreTags',
                              LogTypes.exception,
                              s: s,
                            );
                          }
                          inProgress = false;
                          progress = 0;
                          total = 0;
                          if (mounted) {
                            setState(() {});
                          }
                        },
                      ),
                    ],
                  ],
                ],
              ),
              //
              if (inProgress)
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    color: Colors.black38,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(height: 10),
                        Text(context.loc.pleaseWait),
                        if (progress != 0 && total != 0) ...[
                          Text('$progress / $total'),
                          Text(context.loc.settings.backupAndRestore.operationTakesTooLongMsg),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            child: Text(context.loc.hide),
                            onPressed: () async {
                              inProgress = false;
                              setState(() {});
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
