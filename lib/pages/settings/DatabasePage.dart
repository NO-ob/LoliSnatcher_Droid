import 'package:LoliSnatcher/widgets/InfoDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ServiceHandler.dart';
import '../../SettingsHandler.dart';

class DatabasePage extends StatefulWidget {
  SettingsHandler settingsHandler;
  DatabasePage(this.settingsHandler);
  @override
  _DatabasePageState createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  ServiceHandler serviceHandler = new ServiceHandler();
  bool dbEnabled = true, searchHistoryEnabled = true;
  @override
  void initState(){
    dbEnabled = widget.settingsHandler.dbEnabled;
    searchHistoryEnabled = widget.settingsHandler.searchHistoryEnabled;
    super.initState();
  }
  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    // Set settingshandler values here
    widget.settingsHandler.dbEnabled = dbEnabled;
    widget.settingsHandler.searchHistoryEnabled = searchHistoryEnabled;
    bool result = await widget.settingsHandler.saveSettings();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child:Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Database"),
        ),
        body: Center(
          child: ListView(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(children: [
                    Text("Enable Database: "),
                    Checkbox(
                      value: dbEnabled,
                      onChanged: (newValue) {
                        setState(() {
                          dbEnabled = newValue!;
                        });
                      },
                      activeColor: Get.context!.theme.primaryColor,
                    ),
                    IconButton(
                      icon: Icon(Icons.info, color: Get.context!.theme.accentColor),
                      onPressed: () {
                        Get.dialog(
                            InfoDialog("Database",
                              [
                                Text("The database will store favourites and also track if an item is snatched"),
                                Text("If an item is snatched it wont be snatched again"),
                              ],
                              CrossAxisAlignment.start,
                            )
                        );
                      },
                    ),
                  ],)
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(children: [
                    Text("Enable Search History: "),
                    Checkbox(
                      value: searchHistoryEnabled,
                      onChanged: (newValue) {
                        setState(() {
                          searchHistoryEnabled = newValue!;
                        });
                      },
                      activeColor: Get.context!.theme.primaryColor,
                    ),
                    IconButton(
                      icon: Icon(Icons.info, color: Get.context!.theme.accentColor),
                      onPressed: () {
                        Get.dialog(
                            InfoDialog("Search History",
                              [
                                Text("Database is required"),
                              ],
                              CrossAxisAlignment.start,
                            )
                        );
                      },
                    ),
                  ],)
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(20,10,20,10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                  ),
                  onPressed: (){
                    serviceHandler.deleteDB(widget.settingsHandler);
                    ServiceHandler.displayToast("Database Deleted! \n An app restart is required!");
                    //Get.snackbar("Cache cleared!","Restart may be required!",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
                  },
                  child: Text("Delete Database", style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(20,10,20,10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                  ),
                  onPressed: (){
                    if (widget.settingsHandler.dbHandler.db != null){
                      widget.settingsHandler.dbHandler.clearSnatched();
                      ServiceHandler.displayToast("Snatched Cleared! \n An app restart may be required!");
                    }
                  },
                  child: Text("Clear Snatched", style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(20,10,20,10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                  ),
                  onPressed: (){
                    if (widget.settingsHandler.dbHandler.db != null){
                      widget.settingsHandler.dbHandler.clearFavourites();
                      ServiceHandler.displayToast("Favourites Cleared! \n An app restart may be required!");
                    }
                  },
                  child: Text("Clear Favourites", style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(20,10,20,10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                  ),
                  onPressed: (){
                    if (widget.settingsHandler.dbHandler.db != null){
                      widget.settingsHandler.dbHandler.deleteFromSearchHistory(null);
                      ServiceHandler.displayToast("Search History Cleared!");
                    }
                  },
                  child: Text("Clear Search History", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
