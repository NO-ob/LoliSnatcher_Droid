import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/widgets/BooruSelectorMain.dart';
import 'package:LoliSnatcher/widgets/DesktopImageListener.dart';
import 'package:LoliSnatcher/widgets/ImagePreviews.dart';
import 'package:LoliSnatcher/widgets/TagView.dart';
import 'package:LoliSnatcher/widgets/TabBox.dart';
import 'package:LoliSnatcher/widgets/TabBoxButtons.dart';
import 'package:LoliSnatcher/widgets/TagSearchBox.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/pages/SettingsPage.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/pages/SnatcherPage.dart';
import 'package:LoliSnatcher/getPerms.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';

class DesktopHome extends StatefulWidget {
  @override
  _DesktopHomeState createState() => _DesktopHomeState();
  DesktopHome();
}

class _DesktopHomeState extends State<DesktopHome> {
  final SnatchHandler snatchHandler = Get.find();
  final SettingsHandler settingsHandler = Get.find();
  final SearchHandler searchHandler = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 35,
        actions: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                TagSearchBox(),
                BooruSelectorMain(true),
                IconButton(
                  padding: const EdgeInsets.all(5),
                  icon: Icon(Icons.search),
                  onPressed: () {
                    searchHandler.searchTextController.clearComposing();
                    searchHandler.searchBoxFocus.unfocus();
                    searchHandler.searchAction(searchHandler.searchTextController.text, null);
                  },
                ),
                TabBox(),
                TabBoxButtons(),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0,0,0),
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Get.theme.accentColor),
                      ),
                        backgroundColor: Get.theme.canvasColor,
                    ),
                    onPressed: (){
                      Get.dialog(Dialog(
                        child: Container(
                          width: 500,
                          child: SnatcherPage(searchHandler.searchTextController.text, searchHandler.currentTab.selectedBooru.value),
                        ),
                      ));
                    },
                    child: Text(" Snatcher "),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0,0,0),
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Get.theme.accentColor),
                      ),
                      backgroundColor: Get.theme.canvasColor,
                    ),
                    onPressed: (){
                      Get.dialog(Dialog(
                        child: Container(
                          width: 500,
                          child: SettingsPage(),
                        ),
                      ));
                    },
                    child: Text("Settings"),
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              getPerms();
              // call a function to save the currently viewed image when the save button is pressed
              if (searchHandler.currentTab.selected.length > 0){
                snatchHandler.queue(
                  searchHandler.currentTab.getSelected(),
                  searchHandler.currentTab.selectedBooru.value,
                  settingsHandler.snatchCooldown
                );
                setState(() {
                  searchHandler.currentTab.selected = [];
                });
              } else {
                ServiceHandler.displayToast("No items selected \n (」°ロ°)」");
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: Center(child: ImagePreviews()),
                    flex: 2,
                  ),
                  Expanded(
                    flex: 1,
                    child: Obx(() => searchHandler.list.length == 0
                      ? Center(child: CircularProgressIndicator())
                      : DesktopTagListener(searchHandler.currentTab)
                    )
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: DesktopImageListener(),
            ),
          ]
        )
      ),
    );
  }
}


class DesktopTagListener extends StatefulWidget {
  SearchGlobal searchGlobal;
  DesktopTagListener(this.searchGlobal);
  @override
  _DesktopTagListenerState createState() => _DesktopTagListenerState();
}

class _DesktopTagListenerState extends State<DesktopTagListener> {
  SearchHandler searchHandler = Get.find<SearchHandler>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      BooruItem item = searchHandler.currentTab.currentItem.value;

      return Container(
          child: TagView(item),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: Get.theme.accentColor,width: 2),
          ),
      );
    });
  }
}



