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
                  icon: Icon(Icons.info, color: Get.theme.accentColor),
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
                  icon: Icon(Icons.info, color: Get.theme.accentColor),
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
                            ServiceHandler.displayToast("Database Deleted! \n An app restart is required!");
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
                                ServiceHandler.displayToast("Snatched Cleared! \n An app restart may be required!");
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
                                ServiceHandler.displayToast("Favourites Cleared! \n An app restart may be required!");
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
                                ServiceHandler.displayToast("Search History Cleared!");
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
            ],
          ),
        ),
      ),
    );
  }
}
