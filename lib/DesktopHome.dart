import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/widgets/BooruSelectorMain.dart';
import 'package:LoliSnatcher/widgets/DesktopImageListener.dart';
import 'package:LoliSnatcher/widgets/ImagePreviews.dart';
import 'package:LoliSnatcher/widgets/TagView.dart';
import 'package:LoliSnatcher/widgets/TabBox.dart';
import 'package:LoliSnatcher/widgets/TabBoxButtons.dart';
import 'package:LoliSnatcher/widgets/TagSearchBox.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
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
          Obx(() {
            if (settingsHandler.booruList.isNotEmpty && searchHandler.list.isNotEmpty) {
              return Expanded(
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
              );
            } else {
              return const SizedBox();
            }
          }),

          Obx(() {
            if (settingsHandler.booruList.isNotEmpty && searchHandler.list.isNotEmpty) {
              return SettingsButton(
                name: 'Snatcher',
                icon: Icon(Icons.download),
                iconOnly: true,
                page: () => SnatcherPage(),
              );
            } else {
              return const SizedBox();
            }
          }),

          Obx(() {
            if (settingsHandler.booruList.isEmpty || searchHandler.list.isEmpty) {
              return Center(child: Text('Add Boorus in Settings'));
            } else {
              return const SizedBox();
            }
          }),

          SettingsButton(
            name: 'Settings',
            icon: Icon(Icons.settings),
            iconOnly: true,
            page: () => SettingsPage(),
          ),

          Obx(() {
            if(searchHandler.list.isNotEmpty) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SettingsButton(
                    name: 'Save',
                    icon: Icon(Icons.save),
                    iconOnly: true,
                    action: () {
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

                  if(searchHandler.currentTab.selected.isNotEmpty)
                    Positioned(
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
                    )
                ]
              );
            } else {
              return const SizedBox();
            }
          }),

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
                    child: DesktopTagListener(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Obx(() => searchHandler.list.isEmpty ? const SizedBox() : DesktopImageListener(searchHandler.currentTab)),
            ),
          ]
        )
      ),
    );
  }
}


class DesktopTagListener extends StatefulWidget {
  DesktopTagListener();
  @override
  _DesktopTagListenerState createState() => _DesktopTagListenerState();
}

class _DesktopTagListenerState extends State<DesktopTagListener> {
  SearchHandler searchHandler = Get.find<SearchHandler>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(searchHandler.list.isEmpty) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Get.theme.colorScheme.secondary)
          )
        );
      }

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



