import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

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
import 'package:LoliSnatcher/widgets/ActiveTitle.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/widgets/TagSearchButton.dart';
import 'package:LoliSnatcher/widgets/MascotImage.dart';

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
  final GlobalKey<InnerDrawerState> mainDrawerKey = GlobalKey<InnerDrawerState>();  

  void _toggleDrawer(InnerDrawerDirection direction) {
    mainDrawerKey.currentState?.toggle(
      // if not set, the last direction will be used
      //InnerDrawerDirection.start OR InnerDrawerDirection.end                        
      direction: direction
    );
  }

  Future<bool> _onBackPressed() async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) {
        return SettingsDialog(
          title: Text('Are you sure?'),
          contentItems: <Widget>[Text('Do you want to exit the App?')],
          actionButtons: <Widget>[
            ElevatedButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            ElevatedButton(
              child: Text('No'),
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

  @override
  Widget build(BuildContext context) {
    // print('!!! main build !!!');

    Widget scaff = Scaffold(
      key: mainScaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: ActiveTitle(),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _toggleDrawer(InnerDrawerDirection.start);
          }
        ),
        actions: <Widget>[
          Obx(() {
            if(searchHandler.list.isNotEmpty) {
              return Stack(
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
                    ),
                ]
              );
            } else {
              return const SizedBox.shrink();
            }
          }),

          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // if(mainScaffoldKey.currentState?.isEndDrawerOpen == true) {
              // } else {
              //   mainScaffoldKey.currentState?.openEndDrawer();
              // }
              _toggleDrawer(InnerDrawerDirection.end);
            },
          )
        ],
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: ImagePreviews(),
      ),
      // Old drawer stuff:
      // drawer: MainDrawer(key: mainDrawerKey),
      // endDrawer: MainDrawer(key: mainDrawerKey),
      // drawerEnableOpenDragGesture: true,
      // endDrawerEnableOpenDragGesture: true,
      // drawerEdgeDragWidth: MediaQuery.of(context).size.width / 2, // allows to detect horizontal swipes on the whole screen => open drawer by swiping right-to-left
    );

    return NotificationListener(
      onNotification: (SizeChangedLayoutNotification notification) {
        // WidgetsBinding.instance!.addPostFrameCallback((_) {
        //   // Do something when screen size changes
        //   setState(() { });
        //   searchHandler.rootRestate();
        // });
        
        return true;
      },
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return InnerDrawer(
            key: mainDrawerKey,
            onTapClose: true,
            swipe: true,
            swipeChild: true,
            
            //When setting the vertical offset, be sure to use only top or bottom
            offset: IDOffset.only(
              bottom: 0.0,
              right: orientation == Orientation.landscape ? 0 : 0.5,
              left: orientation == Orientation.landscape ? 0 : 0.5
            ),
            scale: IDOffset.horizontal(1),
            
            proportionalChildArea: true,
            borderRadius: 10,
            leftAnimationType: InnerDrawerAnimation.quadratic,
            rightAnimationType: InnerDrawerAnimation.quadratic,
            backgroundDecoration: BoxDecoration(color: Get.theme.colorScheme.background),
            
            //when a pointer that is in contact with the screen and moves to the right or left
            onDragUpdate: (double val, InnerDrawerDirection? direction) {
                // return values between 1 and 0
                // print(val);
                // check if the swipe is to the right or to the left
                // print(direction==InnerDrawerDirection.start);
            },

            innerDrawerCallback: (isOpen) {
              if(!isOpen) {
                if(searchHandler.searchBoxFocus.hasFocus) {
                  searchHandler.searchBoxFocus.unfocus();
                }
              }
            }, // return  true (open) or false (close)

            leftChild: MainDrawer(),
            rightChild: MainDrawer(),
            
            // Note: use "automaticallyImplyLeading: false" if you do not personalize "leading" of Bar
            scaffold: scaff,
          );
        }
      )
    );
  }
}


class MainDrawer extends StatefulWidget {
  MainDrawer({Key? key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();

  @override
  Widget build(BuildContext context) {
    // print('build drawer');

    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            Obx(() {
              if (settingsHandler.booruList.isNotEmpty && searchHandler.list.isNotEmpty) {
                return Container(
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
                );
              } else {
                return const SizedBox.shrink();
              }
            }),

            Expanded(
              child: Listener(
                onPointerDown: (event) {
                  // print("pointer down");
                  if(searchHandler.searchBoxFocus.hasFocus) {
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

                    Obx(() {
                      if (settingsHandler.booruList.isNotEmpty && searchHandler.list.isNotEmpty) {
                        return SettingsButton(
                          name: "Snatcher",
                          icon: Icon(Icons.download_sharp),
                          page: () => SnatcherPage(),
                          drawTopBorder: true,
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),

                    SettingsButton(
                      name: "Settings",
                      icon: Icon(Icons.settings),
                      page: () => SettingsPage(),
                    ),

                    Obx(() {
                      if(settingsHandler.updateInfo.value != null) {
                        return SettingsButton(
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
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),

                    if(settingsHandler.enableDrawerMascot)
                      MascotImage(),

                  ],
                ),
              )
            ),
          ],
        ),
      )
    );
  }
}
