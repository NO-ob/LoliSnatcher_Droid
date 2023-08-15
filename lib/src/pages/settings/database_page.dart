import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/boorus/idol_sankaku_handler.dart';
import 'package:lolisnatcher/src/boorus/sankaku_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/database_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class DatabasePage extends StatefulWidget {
  const DatabasePage({super.key});

  @override
  State<DatabasePage> createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final ScrollController scrollController = ScrollController();

  bool dbEnabled = true, indexesEnabled = true, changingIndexes = false, searchHistoryEnabled = true, isUpdating = false, tagTypeFetchEnabled = true;
  int updatingFailed = 0, updatingDone = 0;
  BooruType? sankakuType;
  CancelToken? cancelToken;
  final TextEditingController sankakuSearchController = TextEditingController();
  List<BooruItem> updatingItems = [], failedItems = [];

  @override
  void initState() {
    super.initState();

    dbEnabled = settingsHandler.dbEnabled;
    indexesEnabled = settingsHandler.indexesEnabled;
    searchHistoryEnabled = settingsHandler.searchHistoryEnabled;
    tagTypeFetchEnabled = settingsHandler.tagTypeFetchEnabled;

    final List<Booru> sankakuBoorus = getSankakuBoorus();
    if (sankakuBoorus.isNotEmpty) {
      sankakuType = sankakuBoorus.first.type;
    }
  }

  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    if (isUpdating) {
      FlashElements.showSnackbar(
        title: const Text("Can't leave the page right now!", style: TextStyle(fontSize: 20)),
        content: const Text('Sankaku data is being updated, wait until it ends or cancel manually at the bottom of the page', style: TextStyle(fontSize: 16)),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.yellow,
        sideColor: Colors.yellow,
      );
      return false;
    }

    if (changingIndexes) {
      FlashElements.showSnackbar(
        title: const Text('Please wait!', style: TextStyle(fontSize: 20)),
        content: const Text('Indexes are being changed', style: TextStyle(fontSize: 16)),
        leadingIcon: Icons.info_outline,
        leadingIconColor: Colors.yellow,
        sideColor: Colors.yellow,
      );
      return false;
    }

    // Set settingshandler values here
    settingsHandler.dbEnabled = dbEnabled;
    settingsHandler.indexesEnabled = indexesEnabled;
    settingsHandler.searchHistoryEnabled = searchHistoryEnabled;
    settingsHandler.tagTypeFetchEnabled = tagTypeFetchEnabled;
    final bool result = await settingsHandler.saveSettings(restate: false);
    return result;
  }

  List<Booru> getSankakuBoorus() {
    final List<Booru> sankakuBoorus = [];

    for (int i = 0; i < settingsHandler.booruList.length; i++) {
      if (settingsHandler.booruList[i].baseURL == 'https://capi-v2.sankakucomplex.com' ||
          settingsHandler.booruList[i].baseURL == 'https://iapi.sankakucomplex.com') {
        sankakuBoorus.add(settingsHandler.booruList[i]);
      }
    }
    return sankakuBoorus;
  }

  Future<bool> updateSankakuItems({List<BooruItem>? customItems}) async {
    if (isUpdating) {
      return false;
    }

    FlashElements.showSnackbar(
      duration: const Duration(seconds: 6),
      title: const Text('Sankaku Favourites Update Started!', style: TextStyle(fontSize: 20)),
      content: const Column(
        children: [
          Text('New image urls will be fetched for Sankaku items in your favourites', style: TextStyle(fontSize: 16)),
          Text("Don't leave this page until the process is complete or stopped", style: TextStyle(fontSize: 14)),
        ],
      ),
      leadingIcon: Icons.info_outline,
      leadingIconColor: Colors.green,
      sideColor: Colors.green,
    );

    setState(() {
      updatingItems = [];
      failedItems = [];
      updatingFailed = 0;
      updatingDone = 0;
      isUpdating = true;
      cancelToken?.cancel();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });

    final List<Booru> sankakuBoorus = getSankakuBoorus().where((e) => e.type == sankakuType).toList();
    if (sankakuBoorus.isEmpty) {
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

    for (final Booru sankakuBooru in sankakuBoorus) {
      final SankakuHandler sankakuHandler =
          sankakuBooru.type == BooruType.IdolSankaku ? IdolSankakuHandler(sankakuBooru, 10) : SankakuHandler(sankakuBooru, 10);
      updatingItems = customItems?.isNotEmpty == true
          ? customItems!
          : await settingsHandler.dbHandler.getSankakuItems(search: sankakuSearchController.text, idol: sankakuBooru.type == BooruType.IdolSankaku);

      safeSetState(() {});

      for (BooruItem item in updatingItems) {
        if (isUpdating) {
          await Future.delayed(const Duration(milliseconds: 100));
          cancelToken = CancelToken();
          final List result = await sankakuHandler.loadItem(item: item, cancelToken: cancelToken);
          if (result[1] == false) {
            safeSetState(() {
              updatingFailed += 1;
              failedItems.add(item);
            });
            Logger.Inst().log('something went wrong updating favourites: ${result[2]}', 'DataBasePage', 'updateSankakuItems', LogTypes.exception);
          } else if (result[1] == true) {
            item = result[0];
            unawaited(settingsHandler.dbHandler.updateBooruItem(item, BooruUpdateMode.urlUpdate));
            safeSetState(() {
              updatingDone += 1;
            });
          } else {
            safeSetState(() {
              updatingFailed += 1;
              failedItems.add(item);
            });
          }
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

    safeSetState(() {
      updatingFailed = 0;
      updatingDone = 0;
      isUpdating = false;
    });

    return true;
  }

  void safeSetState(VoidCallback fn) {
    fn();
    if (mounted) {
      setState(() {});
    }
  }

  Future<bool> purgeFailedSankakuItems() async {
    FlashElements.showSnackbar(
      duration: const Duration(seconds: 6),
      title: const Text('Failed Item Purge Started!', style: TextStyle(fontSize: 20)),
      content: const Column(
        children: [
          Text('Items that failed to update will be removed from the database', style: TextStyle(fontSize: 16)),
        ],
      ),
      leadingIcon: Icons.info_outline,
      leadingIconColor: Colors.green,
      sideColor: Colors.green,
    );

    final List<String> failedIDs = await settingsHandler.dbHandler.getItemIDs(failedItems.map((e) => e.postURL).toList());
    await settingsHandler.dbHandler.deleteItem(failedIDs);
    setState(() {
      failedItems = [];
    });
    return true;
  }

  Future<void> changeIndexes(bool newValue) async {
    changingIndexes = true;
    setState(() {});

    indexesEnabled = newValue;

    if (newValue) {
      await settingsHandler.dbHandler.createIndexes();
    } else {
      await settingsHandler.dbHandler.dropIndexes();
    }

    changingIndexes = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Database'),
        ),
        body: Center(
          child: ListView(
            controller: scrollController,
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
                        return const SettingsDialog(
                          title: Text('Database'),
                          contentItems: [
                            Text('The database will store favourites and also track if an item is snatched'),
                            Text('If an item is snatched it wont be snatched again'),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              if (dbEnabled) ...[
                Stack(
                  children: [
                    IgnorePointer(
                      ignoring: changingIndexes,
                      child: SettingsToggle(
                        value: indexesEnabled,
                        onChanged: changeIndexes,
                        title: 'Enable Indexes',
                        trailingIcon: IconButton(
                          icon: const Icon(Icons.help_outline),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const SettingsDialog(
                                  title: Text('Indexes'),
                                  contentItems: [
                                    Text('Indexes help make searching database faster,'),
                                    Text('but they take up more space on disk (possibly doubling the size of the database)'),
                                    Text("Don't leave the page while indexes are being changed to avoid database corruption"),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    if (changingIndexes) ...[
                      Positioned.fill(
                        child: ColoredBox(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      const Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ],
                  ],
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
                              Text('Requires enabled Database.'),
                              Text('Long press any history entry for additional actions (Delete, Set as Favourite...)'),
                              Text('Favourited entries are pinned to the top of the list and will not be counted towards item limit.'),
                              Text('Records last 5000 search queries.'),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                SettingsToggle(
                  value: tagTypeFetchEnabled,
                  onChanged: (newValue) {
                    setState(() {
                      tagTypeFetchEnabled = newValue;
                    });
                  },
                  title: 'Enable Tag Type Fetching',
                  trailingIcon: IconButton(
                    icon: const Icon(Icons.help_outline),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const SettingsDialog(
                            title: Text('Tag Type Fetching'),
                            contentItems: [
                              Text('Will search for tag types on supported boorus'),
                              Text('This could lead to rate limiting'),
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
                  icon: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
                  action: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SettingsDialog(
                          title: const Text('Are you sure?'),
                          contentItems: const [
                            Text('Delete Database?'),
                          ],
                          actionButtons: [
                            const CancelButton(),
                            ElevatedButton.icon(
                              onPressed: () {
                                ServiceHandler.deleteDB(settingsHandler);

                                FlashElements.showSnackbar(
                                  context: context,
                                  title: const Text('Database Deleted!', style: TextStyle(fontSize: 20)),
                                  content: const Text('An app restart is required!', style: TextStyle(fontSize: 16)),
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
                  icon: Icon(Icons.delete_outline, color: Theme.of(context).colorScheme.error),
                  trailingIcon: const Icon(Icons.save_alt),
                  action: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SettingsDialog(
                          title: const Text('Are you sure?'),
                          contentItems: const [
                            Text('Clear all Snatched items?'),
                          ],
                          actionButtons: [
                            const CancelButton(),
                            ElevatedButton.icon(
                              onPressed: () {
                                if (settingsHandler.dbHandler.db != null) {
                                  settingsHandler.dbHandler.clearSnatched();

                                  for (final tab in searchHandler.list) {
                                    for (final item in tab.booruHandler.fetched) {
                                      if (item.isSnatched.value == true) {
                                        item.isSnatched.value = false;
                                      }
                                    }
                                  }

                                  FlashElements.showSnackbar(
                                    context: context,
                                    title: const Text('Snatched Cleared!', style: TextStyle(fontSize: 20)),
                                    content: const Text('An app restart may be required!', style: TextStyle(fontSize: 16)),
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
                  icon: Icon(Icons.delete_outline, color: Theme.of(context).colorScheme.error),
                  trailingIcon: const Icon(Icons.favorite_outline),
                  action: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SettingsDialog(
                          title: const Text('Are you sure?'),
                          contentItems: const [
                            Text('Clear all Favourited items?'),
                          ],
                          actionButtons: [
                            const CancelButton(),
                            ElevatedButton.icon(
                              onPressed: () {
                                if (settingsHandler.dbHandler.db != null) {
                                  settingsHandler.dbHandler.clearFavourites();

                                  for (final tab in searchHandler.list) {
                                    for (final item in tab.booruHandler.fetched) {
                                      if (item.isFavourite.value == true) {
                                        item.isFavourite.value = false;
                                      }
                                    }
                                  }

                                  FlashElements.showSnackbar(
                                    context: context,
                                    title: const Text('Favourites Cleared!', style: TextStyle(fontSize: 20)),
                                    content: const Text('An app restart may be required!', style: TextStyle(fontSize: 16)),
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
                  icon: Icon(Icons.delete_outline, color: Theme.of(context).colorScheme.error),
                  trailingIcon: const Icon(Icons.history),
                  action: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SettingsDialog(
                          title: const Text('Are you sure?'),
                          contentItems: const [
                            Text('Clear Search History?'),
                          ],
                          actionButtons: [
                            const CancelButton(),
                            ElevatedButton.icon(
                              onPressed: () {
                                if (settingsHandler.dbHandler.db != null) {
                                  settingsHandler.dbHandler.deleteFromSearchHistory(null);
                                  FlashElements.showSnackbar(
                                    context: context,
                                    title: const Text('Search History Cleared!', style: TextStyle(fontSize: 20)),
                                    content: const Text('An app restart may be required!', style: TextStyle(fontSize: 16)),
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
                if (sankakuType != null) ...[
                  const SettingsButton(name: '', enabled: false),
                  const SettingsButton(
                    name: 'Sankaku Favourites Update',
                    // drawBottomBorder: false,
                  ),
                  Stack(
                    children: [
                      IgnorePointer(
                        ignoring: isUpdating,
                        child: Column(
                          children: [
                            SettingsDropdown<BooruType?>(
                              value: sankakuType,
                              items: getSankakuBoorus().map((e) => e.type).toList(),
                              itemTitleBuilder: (BooruType? item) => item?.alias ?? '',
                              onChanged: (BooruType? newValue) {
                                setState(() {
                                  sankakuType = newValue;
                                });
                              },
                              title: 'Sankaku type to update',
                            ),
                            SettingsTextInput(
                              controller: sankakuSearchController,
                              clearable: true,
                              title: 'Search query',
                              hintText: '(optional, may make the process slower)',
                            ),
                            SettingsButton(
                              name: 'Update Sankaku URLs',
                              trailingIcon: const Icon(Icons.image),
                              action: updateSankakuItems,
                            ),
                          ],
                        ),
                      ),
                      if (isUpdating) ...[
                        Positioned.fill(
                          child: ColoredBox(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        const Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (isUpdating) ...[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Updating ${updatingItems.isEmpty ? '...' : updatingItems.length} items:'),
                          Text('Left: ${max(updatingItems.length - updatingDone - updatingFailed, 0)}'),
                          Text('Done: $updatingDone'),
                          Text('Failed/Skipped: $updatingFailed'),
                          const Text(''),
                          const Text(
                            "Stop and try again later if you start seeing 'Failed' number constantly growing, you could have reached rate limit and/or Sankaku blocks requests from your IP.",
                          ),
                        ],
                      ),
                    ),
                    SettingsButton(
                      name: 'Press here to skip current item',
                      subtitle: const Text('Use if item appears to be stuck'),
                      trailingIcon: const Icon(Icons.skip_next),
                      drawTopBorder: true,
                      action: () {
                        cancelToken?.cancel();
                      },
                    ),
                    SettingsButton(
                      name: 'Press here to stop',
                      trailingIcon: const Icon(Icons.cancel),
                      drawTopBorder: true,
                      action: () {
                        setState(() {
                          isUpdating = false;
                          cancelToken?.cancel();
                        });
                      },
                    ),
                  ],
                  if (!isUpdating && failedItems.isNotEmpty) ...[
                    SettingsButton(
                      name: 'Purge Failed Items (${failedItems.length})',
                      trailingIcon: const Icon(Icons.delete_forever),
                      drawTopBorder: true,
                      action: () {
                        setState(purgeFailedSankakuItems);
                      },
                    ),
                    SettingsButton(
                      name: 'Retry Failed Items (${failedItems.length})',
                      trailingIcon: const Icon(Icons.refresh),
                      drawTopBorder: true,
                      action: () {
                        updateSankakuItems(customItems: [...failedItems]);
                      },
                    ),
                  ],
                  const SettingsButton(name: '', enabled: false),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}
