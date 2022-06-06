import 'dart:math';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/boorus/sankaku_handler.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class DatabasePage extends StatefulWidget {
  const DatabasePage({Key? key}) : super(key: key);

  @override
  State<DatabasePage> createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  bool dbEnabled = true, searchHistoryEnabled = true, isUpdating = false;
  int updatingFailed = 0, updatingDone = 0;
  List<BooruItem> updatingItems = [];
  List<String> failedURLs = [];

  @override
  void initState() {
    dbEnabled = settingsHandler.dbEnabled;
    searchHistoryEnabled = settingsHandler.searchHistoryEnabled;
    super.initState();
  }

  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    // Set settingshandler values here
    settingsHandler.dbEnabled = dbEnabled;
    settingsHandler.searchHistoryEnabled = searchHistoryEnabled;
    bool result = await settingsHandler.saveSettings(restate: false);
    return result;
  }

  Booru? getSankakuBooru() {
    for (int i = 0; i < settingsHandler.booruList.length; i++) {
      if (settingsHandler.booruList[i].baseURL == "https://capi-v2.sankakucomplex.com") {
        return settingsHandler.booruList[i];
      }
    }
    return null;
  }

  Future<bool> updateSankakuItems() async {
    FlashElements.showSnackbar(
      duration: const Duration(seconds: 6),
      title: const Text('Sankaku Favourites Update Started!', style: TextStyle(fontSize: 20)),
      content: Column(
        children: const [
          Text("New image urls will be fetched for Sankaku items in your favourites", style: TextStyle(fontSize: 16)),
          Text("Don't leave this page until the process is complete or stopped", style: TextStyle(fontSize: 14)),
        ],
      ),
      leadingIcon: Icons.info_outline,
      leadingIconColor: Colors.green,
      sideColor: Colors.green,
    );

    setState(() {
      updatingItems = [];
      failedURLs = [];
      updatingFailed = 0;
      updatingDone = 0;
      isUpdating = true;
    });

    updatingItems = await settingsHandler.dbHandler.getSankakuItems();
    Booru? sankakuBooru = getSankakuBooru();
    if (sankakuBooru == null) {
      FlashElements.showSnackbar(
        title: const Text('No Sankaku config found!', style: TextStyle(fontSize: 20)),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.red,
        sideColor: Colors.red,
      );

      setState(() {
        updatingFailed = 0;
        updatingDone = 0;
        isUpdating = false;
      });
      return true;
    }

    SankakuHandler sankakuHandler = SankakuHandler(sankakuBooru, 10);
    for (BooruItem item in updatingItems) {
      if (isUpdating) {
        await Future.delayed(const Duration(milliseconds: 100));
        List result = await sankakuHandler.updateItem(item);
        if (result[1] == false) {
          setState(() {
            updatingFailed += 1;
            failedURLs.add(item.postURL);
          });
          print("something went wrong updating favourites: ${result[2]}");
        } else {
          item = result[0];
          settingsHandler.dbHandler.updateBooruItem(item, "urlUpdate");
          setState(() {
            updatingDone += 1;
          });
        }
      }
    }

    if (isUpdating) {
      FlashElements.showSnackbar(
        title: const Text('Sankaku Favourites Update Complete!', style: TextStyle(fontSize: 20)),
        leadingIcon: Icons.check,
        leadingIconColor: Colors.green,
        sideColor: Colors.green,
      );
    }
    setState(() {
      updatingFailed = 0;
      updatingDone = 0;
      isUpdating = false;
    });

    return true;
  }

  Future<bool> purgeFailedSankakuItems() async {
    FlashElements.showSnackbar(
      duration: const Duration(seconds: 6),
      title: const Text('Failed Item Purge Started!', style: TextStyle(fontSize: 20)),
      content: Column(
        children: const [
          Text("Items that failed to update will be removed from the database", style: TextStyle(fontSize: 16)),
        ],
      ),
      leadingIcon: Icons.info_outline,
      leadingIconColor: Colors.green,
      sideColor: Colors.green,
    );

    List<String> failedIDs = await settingsHandler.dbHandler.getItemIDs(failedURLs);
    settingsHandler.dbHandler.deleteItem(failedIDs);
    setState(() {
      failedURLs = [];
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text("Database"),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsToggle(
                value: dbEnabled,
                onChanged: (newValue) {
                  setState(() {
                    dbEnabled = newValue;
                  });
                },
                title: 'Enable Database',
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const SettingsDialog(title: Text('Database'), contentItems: [
                          Text("The database will store favourites and also track if an item is snatched"),
                          Text("If an item is snatched it wont be snatched again"),
                        ]);
                      },
                    );
                  },
                ),
              ),
              SettingsToggle(
                value: searchHistoryEnabled,
                onChanged: (newValue) {
                  setState(() {
                    searchHistoryEnabled = newValue;
                  });
                },
                title: 'Enable Search History',
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const SettingsDialog(
                          title: Text('Search History'),
                          contentItems: [
                            Text("Requires enabled Database."),
                            Text("Long press any history entry for additional actions (Delete, Set as Favourite...)"),
                            Text("Favourited entries are pinned to the top of the list and will not be counted towards item limit."),
                            Text("Records last 5000 search queries."),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              const SettingsButton(name: '', enabled: false),
              SettingsButton(
                name: 'Delete Database',
                icon: Icon(Icons.delete_forever, color: Theme.of(context).errorColor),
                action: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SettingsDialog(
                        title: const Text('Are you sure?'),
                        contentItems: const [
                          Text("Delete Database?"),
                        ],
                        actionButtons: [
                          const CancelButton(),
                          ElevatedButton.icon(
                            onPressed: () {
                              ServiceHandler.deleteDB(settingsHandler);

                              FlashElements.showSnackbar(
                                context: context,
                                title: const Text("Database Deleted!", style: TextStyle(fontSize: 20)),
                                content: const Text("An app restart is required!", style: TextStyle(fontSize: 16)),
                                leadingIcon: Icons.delete_forever,
                                leadingIconColor: Colors.red,
                                sideColor: Colors.yellow,
                              );
                              Navigator.of(context).pop(true);
                            },
                            label: const Text('Delete'),
                            icon: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              SettingsButton(
                name: 'Clear Snatched Items',
                icon: Icon(Icons.delete_outline, color: Theme.of(context).errorColor),
                trailingIcon: const Icon(Icons.save_alt),
                action: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SettingsDialog(
                        title: const Text('Are you sure?'),
                        contentItems: const [
                          Text("Clear all Snatched items?"),
                        ],
                        actionButtons: [
                          const CancelButton(),
                          ElevatedButton.icon(
                            onPressed: () {
                              if (settingsHandler.dbHandler.db != null) {
                                settingsHandler.dbHandler.clearSnatched();

                                FlashElements.showSnackbar(
                                  context: context,
                                  title: const Text("Snatched Cleared!", style: TextStyle(fontSize: 20)),
                                  content: const Text("An app restart may be required!", style: TextStyle(fontSize: 16)),
                                  leadingIcon: Icons.delete_forever,
                                  leadingIconColor: Colors.red,
                                  sideColor: Colors.yellow,
                                );
                              }
                              Navigator.of(context).pop(true);
                            },
                            label: const Text('Clear'),
                            icon: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              SettingsButton(
                name: 'Clear Favourited Items',
                icon: Icon(Icons.delete_outline, color: Theme.of(context).errorColor),
                trailingIcon: const Icon(Icons.favorite_outline),
                action: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SettingsDialog(
                        title: const Text('Are you sure?'),
                        contentItems: const [
                          Text("Clear all Favourited items?"),
                        ],
                        actionButtons: [
                          const CancelButton(),
                          ElevatedButton.icon(
                            onPressed: () {
                              if (settingsHandler.dbHandler.db != null) {
                                settingsHandler.dbHandler.clearFavourites();
                                FlashElements.showSnackbar(
                                  context: context,
                                  title: const Text("Favourites Cleared!", style: TextStyle(fontSize: 20)),
                                  content: const Text("An app restart may be required!", style: TextStyle(fontSize: 16)),
                                  leadingIcon: Icons.delete_forever,
                                  leadingIconColor: Colors.red,
                                  sideColor: Colors.yellow,
                                );
                              }
                              Navigator.of(context).pop(true);
                            },
                            label: const Text('Clear'),
                            icon: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              SettingsButton(
                name: 'Clear Search History',
                icon: Icon(Icons.delete_outline, color: Theme.of(context).errorColor),
                trailingIcon: const Icon(Icons.history),
                action: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SettingsDialog(
                        title: const Text('Are you sure?'),
                        contentItems: const [
                          Text("Clear Search History?"),
                        ],
                        actionButtons: [
                          const CancelButton(),
                          ElevatedButton.icon(
                            onPressed: () {
                              if (settingsHandler.dbHandler.db != null) {
                                settingsHandler.dbHandler.deleteFromSearchHistory(null);
                                FlashElements.showSnackbar(
                                  context: context,
                                  title: const Text("Search History Cleared!", style: TextStyle(fontSize: 20)),
                                  content: const Text("An app restart may be required!", style: TextStyle(fontSize: 16)),
                                  leadingIcon: Icons.delete_forever,
                                  leadingIconColor: Colors.red,
                                  sideColor: Colors.yellow,
                                );
                              }
                              Navigator.of(context).pop(true);
                            },
                            label: const Text('Clear'),
                            icon: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              // SettingsButton(name: '', enabled: false),
              // SettingsButton(
              //     name: 'Drop Indexes',
              //     trailingIcon: Icon(Icons.image),
              //     action: () async {
              //       await settingsHandler.dbHandler.dropIndexes();
              //       FlashElements.showSnackbar(
              //         context: context,
              //         title: Text(
              //           "Indexes dropped!",
              //           style: TextStyle(fontSize: 20)
              //         ),
              //         content: Text(
              //           "An app restart may be required!",
              //           style: TextStyle(fontSize: 16)
              //         ),
              //         leadingIcon: Icons.delete_forever,
              //         leadingIconColor: Colors.red,
              //         sideColor: Colors.yellow,
              //       );
              //     }
              // ),

              const SettingsButton(name: '', enabled: false),
              SettingsButton(
                name: 'Update Sankaku URLs',
                trailingIcon: const Icon(Icons.image),
                action: () {
                  if (!isUpdating) {
                    updateSankakuItems();
                  }
                },
              ),
              if (isUpdating)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Updating ${updatingItems.isEmpty ? '...' : updatingItems.length} items:'),
                      Text('Left: ${max(updatingItems.length - updatingDone - updatingFailed, 0)}'),
                      Text('Done: $updatingDone'),
                      Text('Failed: $updatingFailed'),
                      const Text(''),
                      const Text(
                          "Stop and try again later if you start seeing 'Failed' number constantly growing, you could have reached rate limit and/or Sankaku blocks requests from your IP."),
                    ],
                  ),
                ),
              if (isUpdating)
                SettingsButton(
                  name: 'Press here to stop',
                  drawTopBorder: true,
                  action: () {
                    setState(() {
                      isUpdating = false;
                    });
                  },
                ),
              if (!isUpdating && failedURLs.isNotEmpty)
                SettingsButton(
                  name: 'Purge Items That Failed to Update',
                  trailingIcon: const Icon(Icons.delete_forever),
                  drawTopBorder: true,
                  action: () {
                    setState(() {
                      purgeFailedSankakuItems();
                    });
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
