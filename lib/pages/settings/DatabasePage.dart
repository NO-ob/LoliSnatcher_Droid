import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/SankakuHandler.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ServiceHandler.dart';
import '../../SettingsHandler.dart';

class DatabasePage extends StatefulWidget {
  DatabasePage();
  @override
  _DatabasePageState createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  final SettingsHandler settingsHandler = Get.find();
  final ServiceHandler serviceHandler = ServiceHandler();
  bool dbEnabled = true, searchHistoryEnabled = true;
  @override
  void initState(){
    dbEnabled = settingsHandler.dbEnabled;
    searchHistoryEnabled = settingsHandler.searchHistoryEnabled;
    super.initState();
  }
  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    // Set settingshandler values here
    settingsHandler.dbEnabled = dbEnabled;
    settingsHandler.searchHistoryEnabled = searchHistoryEnabled;
    bool result = await settingsHandler.saveSettings();
    return result;
  }
  Booru? getSankakuBooru(){
    for (int i = 0; i < settingsHandler.booruList.length; i++){
      if (settingsHandler.booruList[i].baseURL == "https://capi-v2.sankakucomplex.com"){
        return settingsHandler.booruList[i];
      }
    }
    return null;
  }
  Future<bool> updateSankakuItems() async{
    FlashElements.showSnackbar(
      context: Get.context,
      title: Text(
          'Sancucku Url Update Started!',
          style: TextStyle(fontSize: 20)
      ),
      content: Text(
          'New image urls will be fetched for Sancucku items in your favourites',
          style: TextStyle(fontSize: 16)
      ),
      leadingIcon: Icons.info_outline,
      leadingIconColor: Colors.green,
      sideColor: Colors.green,
    );
    print("something went wrong updating favourites");
    List<BooruItem> items = await settingsHandler.dbHandler.getSankakuItems();
    Booru? sankakuBooru = getSankakuBooru();
    SankakuHandler sankakuHandler = new SankakuHandler(sankakuBooru!, 10);
    List result = await sankakuHandler.updateFavourites(items);
    if (result[1] == false){
      FlashElements.showSnackbar(
        context: Get.context,
        title: Text(
            'Sancucku Url Update Failed!',
            style: TextStyle(fontSize: 20)
        ),
        content: Text(
            'Something went wrong when requesting new urls from the api',
            style: TextStyle(fontSize: 16)
        ),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.red,
        sideColor: Colors.red,
      );
      print("something went wrong updating favourites");
    } else {
      items = result[0];
      for(int i = 0; i < items.length; i++){
        print("Updating $i");
        settingsHandler.dbHandler.updateBooruItem(items[i], "urlUpdate");
      }
      FlashElements.showSnackbar(
        context: Get.context,
        title: Text(
            'Sancucku Url Update Complete!',
            style: TextStyle(fontSize: 20)
        ),
        leadingIcon: Icons.check,
        leadingIconColor: Colors.green,
        sideColor: Colors.green,
      );
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Widget cancelButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop(true);
      },
      child: Text('Cancel')
    );

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Database"),
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
                  icon: Icon(Icons.info, color: Get.theme.colorScheme.secondary),
                  onPressed: () {
                    Get.dialog(
                      SettingsDialog(
                        title: const Text('Database'),
                        contentItems: [
                          Text("The database will store favourites and also track if an item is snatched"),
                          Text("If an item is snatched it wont be snatched again"),
                        ]
                      ),
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
                  icon: Icon(Icons.info, color: Get.theme.colorScheme.secondary),
                  onPressed: () {
                    Get.dialog(
                      SettingsDialog(
                        title: const Text('Search History'),
                        contentItems: [
                          Text("Requires enabled Database."),
                          Text("Long press any history entry for additional actions (Delete, Set as Favourite...)"),
                          Text("Favourited entries are pinned to the top of the list and will not be counted towards item limit."),
                          Text("Records last 5000 search queries."),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SettingsButton(name: '', enabled: false),
              SettingsButton(
                name: 'Delete Database',
                icon: Icon(Icons.delete_forever, color: Get.theme.errorColor),
                action: () {
                  Get.dialog(
                    SettingsDialog(
                      title: const Text('Are you sure?'),
                      contentItems: [
                        Text("Delete Database?"),
                      ],
                      actionButtons: [
                        cancelButton,
                        TextButton(
                          onPressed: () {
                            serviceHandler.deleteDB(settingsHandler);

                            FlashElements.showSnackbar(
                              context: context,
                              title: Text(
                                "Database Deleted!",
                                style: TextStyle(fontSize: 20)
                              ),
                              content: Text(
                                "An app restart is required!",
                                style: TextStyle(fontSize: 16)
                              ),
                              leadingIcon: Icons.delete_forever,
                              leadingIconColor: Colors.red,
                              sideColor: Colors.yellow,
                            );
                            Navigator.of(context).pop(true);
                          },
                          child: Text('Delete', style: TextStyle(color: Get.theme.errorColor))
                        ),
                      ]
                    ),
                  );
                }
              ),
              SettingsButton(
                name: 'Clear Snatched Items',
                icon: Icon(Icons.delete_outline, color: Get.theme.errorColor),
                trailingIcon: Icon(Icons.save_alt),
                action: () {
                  Get.dialog(
                      SettingsDialog(
                        title: const Text('Are you sure?'),
                        contentItems: [
                          Text("Clear all Snatched items?"),
                        ],
                        actionButtons: [
                          cancelButton,
                          TextButton(
                            onPressed: () {
                              if (settingsHandler.dbHandler.db != null){
                                settingsHandler.dbHandler.clearSnatched();

                                FlashElements.showSnackbar(
                                  context: context,
                                  title: Text(
                                    "Snatched Cleared!",
                                    style: TextStyle(fontSize: 20)
                                  ),
                                  content: Text(
                                    "An app restart may be required!",
                                    style: TextStyle(fontSize: 16)
                                  ),
                                  leadingIcon: Icons.delete_forever,
                                  leadingIconColor: Colors.red,
                                  sideColor: Colors.yellow,
                                );
                              }
                              Navigator.of(context).pop(true);
                            },
                            child: Text('Clear', style: TextStyle(color: Get.theme.errorColor))
                          ),
                        ]
                      ),
                    );
                }
              ),
              SettingsButton(
                name: 'Clear Favourited Items',
                icon: Icon(Icons.delete_outline, color: Get.theme.errorColor),
                trailingIcon: Icon(Icons.favorite_outline),
                action: () {
                  Get.dialog(
                      SettingsDialog(
                        title: const Text('Are you sure?'),
                        contentItems: [
                          Text("Clear all Favourited items?"),
                        ],
                        actionButtons: [
                          cancelButton,
                          TextButton(
                            onPressed: () {
                              if (settingsHandler.dbHandler.db != null){
                                settingsHandler.dbHandler.clearFavourites();
                                FlashElements.showSnackbar(
                                  context: context,
                                  title: Text(
                                    "Favourites Cleared!",
                                    style: TextStyle(fontSize: 20)
                                  ),
                                  content: Text(
                                    "An app restart may be required!",
                                    style: TextStyle(fontSize: 16)
                                  ),
                                  leadingIcon: Icons.delete_forever,
                                  leadingIconColor: Colors.red,
                                  sideColor: Colors.yellow,
                                );
                              }
                              Navigator.of(context).pop(true);
                            },
                            child: Text('Clear', style: TextStyle(color: Get.theme.errorColor))
                          ),
                        ]
                      ),
                    );
                }
              ),
              SettingsButton(
                name: 'Clear Search History',
                icon: Icon(Icons.delete_outline, color: Get.theme.errorColor),
                trailingIcon: Icon(Icons.history),
                action: () {
                  Get.dialog(
                      SettingsDialog(
                        title: const Text('Are you sure?'),
                        contentItems: [
                          Text("Clear Search History?"),
                        ],
                        actionButtons: [
                          cancelButton,
                          TextButton(
                            onPressed: () {
                              if (settingsHandler.dbHandler.db != null){
                                settingsHandler.dbHandler.deleteFromSearchHistory(null);
                                FlashElements.showSnackbar(
                                  context: context,
                                  title: Text(
                                    "Search History Cleared!",
                                    style: TextStyle(fontSize: 20)
                                  ),
                                  content: Text(
                                    "An app restart may be required!",
                                    style: TextStyle(fontSize: 16)
                                  ),
                                  leadingIcon: Icons.delete_forever,
                                  leadingIconColor: Colors.red,
                                  sideColor: Colors.yellow,
                                );
                              }
                              Navigator.of(context).pop(true);
                            },
                            child: Text('Clear', style: TextStyle(color: Get.theme.errorColor))
                          ),
                        ]
                      ),
                    );
                }
              ),
              SettingsButton(
                  name: 'Update Sankaku URLs',
                  trailingIcon: Icon(Icons.image),
                  action: () {
                    updateSankakuItems();
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
