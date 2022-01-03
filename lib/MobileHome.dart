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
import 'package:LoliSnatcher/pages/SnatcherPage.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/widgets/TagSearchButton.dart';
import 'package:LoliSnatcher/widgets/MascotImage.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/widgets/MainAppbar.dart';

class MobileHome extends StatelessWidget {
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

  Future<bool> _onBackPressed(BuildContext context) async {
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

  Widget menuButton(InnerDrawerDirection direction) {
    return GestureDetector(
      onLongPress: () {
        ServiceHandler.vibrate();
        // scroll to start on long press of menu buttons
        searchHandler.gridScrollController.jumpTo(0);
      },
      child: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          _toggleDrawer(direction);

          // if(mainScaffoldKey.currentState?.isEndDrawerOpen == true) {
          // } else {
          //   mainScaffoldKey.currentState?.openEndDrawer();
          // }
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print('!!! main build !!!');

    Widget scaff = Scaffold(
      key: mainScaffoldKey,
      resizeToAvoidBottomInset: true,
      // appBar: MainAppBar(leading: menuButton(InnerDrawerDirection.start), trailing: menuButton(InnerDrawerDirection.end)),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () {
            return _onBackPressed(context);
          },
          child: Stack(
            children: [
              ImagePreviews(),
              MainAppBar(leading: menuButton(InnerDrawerDirection.start), trailing: menuButton(InnerDrawerDirection.end)),
            ],
          )
        ),
      ),
      // Old drawer stuff:
      // drawer: MainDrawer(key: mainDrawerKey),
      // endDrawer: MainDrawer(key: mainDrawerKey),
      // drawerEnableOpenDragGesture: true,
      // endDrawerEnableOpenDragGesture: true,
      // drawerEdgeDragWidth: MediaQuery.of(context).size.width / 2, // allows to detect horizontal swipes on the whole screen => open drawer by swiping right-to-left
    );

    return OrientationBuilder(
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
            left: orientation == Orientation.landscape ? 0 : 0.5,
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

          innerDrawerCallback: (bool isOpen, InnerDrawerDirection? direction) {
            // print('$isOpen $direction');
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
                  margin: EdgeInsets.fromLTRB(2, 15, 2, 15),
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
                  controller: ScrollController(), // needed to avoid exception when list overflows into a scrollable size
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
      ),
    );
  }
}
