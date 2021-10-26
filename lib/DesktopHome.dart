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
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/pages/SettingsPage.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/pages/SnatcherPage.dart';
import 'package:LoliSnatcher/getPerms.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/TagSearchButton.dart';

class DesktopHome extends StatefulWidget {
  @override
  _DesktopHomeState createState() => _DesktopHomeState();
  DesktopHome();
}

class _DesktopHomeState extends State<DesktopHome> {
  final SnatchHandler snatchHandler = Get.find<SnatchHandler>();
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 60,
        actions: <Widget>[
          if (settingsHandler.booruList.isNotEmpty && searchHandler.list.isNotEmpty)
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const SizedBox(width: 15),
                  TagSearchBox(),
                  TagSearchButton(),
                  Expanded(child: BooruSelectorMain(true)),
                  Expanded(child: TabBox()),
                  Expanded(child: TabBoxButtons(false, MainAxisAlignment.start)),
                ],
              ),
            ),

          if (settingsHandler.booruList.isNotEmpty && searchHandler.list.isNotEmpty)
            IconButton(
              icon: Icon(Icons.download),
              onPressed: (){
                Get.dialog(Dialog(
                  child: Container(
                    width: 500,
                    child: SnatcherPage(),
                  ),
                ));
              },
            ),

          if (settingsHandler.booruList.isEmpty || searchHandler.list.isEmpty)
            Center(child: Text('Add Boorus in Settings')),

          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){
              Get.dialog(Dialog(
                child: Container(
                  width: 500,
                  child: SettingsPage(),
                ),
              ));
            },
          ),

          if(searchHandler.list.isNotEmpty)
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    getPerms();
                    // call a function to save the currently viewed image when the save button is pressed
                    if (searchHandler.currentTab.selected.length > 0){
                      snatchHandler.queue(
                        searchHandler.currentTab.getSelected(),
                        searchHandler.currentTab.selectedBooru.value,
                        settingsHandler.snatchCooldown
                      );
                      searchHandler.currentTab.selected.value = [];
                    } else {
                      FlashElements.showSnackbar(
                        context: context,
                        title: Text(
                          "No items selected",
                          style: TextStyle(fontSize: 20)
                        ),
                        overrideLeadingIconWidget: Text(
                          " (」°ロ°)」 ",
                          style: TextStyle(fontSize: 18)
                        ),
                      );
                    }
                  },
                ),

                Obx(() {
                  if(searchHandler.currentTab.selected.isEmpty) {
                    return const SizedBox();
                  } else {
                    return Positioned(
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Get.theme.colorScheme.secondary,
                          border: Border.all(color: Get.theme.colorScheme.secondary, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              '${searchHandler.currentTab.selected.length}',
                              style: TextStyle(color: Get.theme.colorScheme.onSecondary)
                            ),
                          )
                        )
                      ),
                      right: 2,
                      bottom: 5,
                    );
                  }
                })
              ]
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
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Get.theme.colorScheme.secondary)
                          )
                        )
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
              border: Border.all(color: Get.theme.colorScheme.secondary,width: 2),
          ),
      );
    });
  }
}



