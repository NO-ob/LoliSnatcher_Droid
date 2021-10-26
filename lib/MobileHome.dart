import 'dart:io';

import 'package:LoliSnatcher/widgets/ActiveTitle.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/widgets/TagSearchButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/widgets/BooruSelectorMain.dart';
import 'package:LoliSnatcher/widgets/ImagePreviews.dart';
import 'package:LoliSnatcher/widgets/TabBox.dart';
import 'package:LoliSnatcher/widgets/TabBoxButtons.dart';
import 'package:LoliSnatcher/widgets/TagSearchBox.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/pages/SettingsPage.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/pages/SnatcherPage.dart';
import 'package:LoliSnatcher/getPerms.dart';

class MobileHome extends StatefulWidget {
  @override
  _MobileHomeState createState() => _MobileHomeState();
  MobileHome();
}

class _MobileHomeState extends State<MobileHome> {
  final SnatchHandler snatchHandler = Get.find<SnatchHandler>();
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();

  final GlobalKey<ScaffoldState> mainScaffoldKey = GlobalKey<ScaffoldState>();

  Future<bool> _onBackPressed() async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) {
        return SettingsDialog(
          title: Text('Are you sure?'),
          contentItems: <Widget>[Text('Do you want to exit the App?')],
          actionButtons: <Widget>[
            TextButton(
              child: Text('Yes', style: TextStyle(color: Get.theme.colorScheme.onSurface)),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            TextButton(
              child: Text('No', style: TextStyle(color: Get.theme.colorScheme.onSurface)),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );

    return shouldPop ?? false; //shouldPop != null ? true : false;
  }

  Widget buildDrawer() {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            if (settingsHandler.booruList.isNotEmpty && searchHandler.list.isNotEmpty)
              Container(
                margin: EdgeInsets.fromLTRB(5, 30, 5, 15),
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    //Tags/Search field
                    TagSearchBox(),
                    TagSearchButton(),
                  ],
                ),
              ),

            Expanded(
              child: Listener(
                onPointerDown: (event) {
                  // print("pointer down");
                  if(searchHandler.searchBoxFocus.hasFocus){
                    searchHandler.searchBoxFocus.unfocus();
                  }
                },
                child: ListView(
                  children: [
                    // TODO tabbox and booruselector cause lag when opening a drawer
                    TabBox(),
                    TabBoxButtons(true, MainAxisAlignment.spaceEvenly),
                    BooruSelectorMain(true),

                    if(settingsHandler.booruList.length > 1)
                      SettingsToggle(
                        title: 'Multibooru Mode',
                        value: settingsHandler.mergeEnabled,
                        onChanged: (newValue) {
                          if(settingsHandler.booruList.length < 2) {
                            FlashElements.showSnackbar(
                              context: context,
                              title: Text(
                                "Error!",
                                style: TextStyle(fontSize: 20)
                              ),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('You need at least 2 booru configs to use this feature!'),
                                ],
                              ),
                              leadingIcon: Icons.error,
                              leadingIconColor: Colors.red,
                            );
                          } else {
                            setState(() {
                              settingsHandler.mergeEnabled = newValue;
                              searchHandler.mergeAction(null);
                            });
                          }
                        },
                      ),
                    if(settingsHandler.booruList.length > 1 && settingsHandler.mergeEnabled)
                      BooruSelectorMain(false),

                    if (settingsHandler.booruList.isNotEmpty && searchHandler.list.isNotEmpty)
                      SettingsButton(
                        name: "Snatcher",
                        icon: Icon(Icons.download_sharp),
                        page: () => SnatcherPage(),
                        drawTopBorder: true,
                      ),
                    SettingsButton(
                      name: "Settings",
                      icon: Icon(Icons.settings),
                      page: () => SettingsPage(),
                    ),
                    if(settingsHandler.updateInfo != null)
                      SettingsButton(
                        name: 'Update Available!',
                        icon: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(Icons.update),
                            Positioned(
                              top: 1,
                              left: 1,
                              child: Center(child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ))
                            ),
                          ]
                        ),
                        action: () async {
                          settingsHandler.showUpdate();
                        },
                      ),
                   if(settingsHandler.enableDrawerMascot)
                     Container(
                       child: Align(
                         alignment: FractionalOffset.bottomCenter,
                         child: Container(
                           child: SizedBox(
                             height: (MediaQuery.of(context).size.height * 0.35),
                             child: DrawerHeader(
                               margin: EdgeInsets.zero,
                               decoration: BoxDecoration(
                                 color: Get.theme.colorScheme.primary,
                                 image: DecorationImage(
                                     fit: BoxFit.cover,
                                     image: settingsHandler.drawerMascotPathOverride.isEmpty
                                      ? AssetImage('assets/images/drawer_icon.png')
                                      : FileImage(File(settingsHandler.drawerMascotPathOverride)) as ImageProvider,
                                 ),
                               ),
                               child: null,
                             ),
                           ),
                         ),
                       ),
                     ),
                  ],
                ),
              )
            ),
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mainScaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: ActiveTitle(),
        actions: <Widget>[
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

          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              mainScaffoldKey.currentState?.openEndDrawer();
            },
          )
        ],
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Center(
          child: ImagePreviews(),
        ),
      ),
      drawer: buildDrawer(),
      endDrawer: buildDrawer(),
      // drawerEnableOpenDragGesture: true,
      // endDrawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: MediaQuery.of(context).size.width / 2, // allows to detect horizontal swipes on the whole screen => open drawer by swiping right-to-left
    );
  }
}



