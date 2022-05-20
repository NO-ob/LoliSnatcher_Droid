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

class MobileHome extends StatefulWidget {
  const MobileHome({Key? key}) : super(key: key);

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;

  final GlobalKey<ScaffoldState> mainScaffoldKey = GlobalKey<ScaffoldState>();

  bool isDrawerOpened = false;

  void _toggleDrawer(InnerDrawerDirection? direction) {
    searchHandler.mainDrawerKey.currentState?.toggle(
      // if not set, the last direction will be used
      //InnerDrawerDirection.start OR InnerDrawerDirection.end
      direction: direction,
    );
  }


  @override
  void initState() {
    super.initState();
    searchHandler.mainDrawerKey = GlobalKey<InnerDrawerState>();
  }

  

  Future<bool> _onBackPressed(BuildContext context) async {
    if (isDrawerOpened) {
      // close the drawer if it's opened
      _toggleDrawer(null);
      return false;
    }

    // ... otherwise, ask to close the app
    final bool? shouldPop = await showDialog(
      context: context,
      builder: (context) {
        return SettingsDialog(
          title: const Text('Are you sure?'),
          contentItems: const [
            Text('Do you want to exit the App?')
          ],
          actionButtons: <Widget>[
            ElevatedButton.icon(
              label: const Text('Yes'),
              icon: const Icon(Icons.exit_to_app_sharp),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            ElevatedButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );

    return shouldPop ?? false;
  }

  void _onMenuLongTap () {
    ServiceHandler.vibrate();
    // scroll to start on long press of menu buttons
    searchHandler.gridScrollController.jumpTo(0);
  }

  Widget menuButton(InnerDrawerDirection direction) {
    return GestureDetector(
      onLongPress: _onMenuLongTap,
      onSecondaryTap: _onMenuLongTap,
      child: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          _toggleDrawer(direction);

          // if(mainScaffoldKey.currentState?.isEndDrawerOpen == true) {
          // } else {
          //   mainScaffoldKey.currentState?.openEndDrawer();
          // }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print('!!! main build !!!');

    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return InnerDrawer(
          key: searchHandler.mainDrawerKey,
          onTapClose: true,
          swipe: true,
          swipeChild: true,

          //When setting the vertical offset, be sure to use only top or bottom
          offset: IDOffset.only(
            bottom: 0.0,
            right: orientation == Orientation.landscape ? 0 : 0.5,
            left: orientation == Orientation.landscape ? 0 : 0.5,
          ),
          scale: const IDOffset.horizontal(1),

          proportionalChildArea: true,
          borderRadius: 10,
          leftAnimationType: InnerDrawerAnimation.quadratic,
          rightAnimationType: InnerDrawerAnimation.quadratic,
          backgroundDecoration: BoxDecoration(color: Theme.of(context).colorScheme.background),

          //when a pointer that is in contact with the screen and moves to the right or left
          onDragUpdate: (double val, InnerDrawerDirection? direction) {
            // return values between 1 and 0
            // print(val);
            // check if the swipe is to the right or to the left
            // print(direction==InnerDrawerDirection.start);
          },

          innerDrawerCallback: (bool isOpen, InnerDrawerDirection? direction) {
            // print('$isOpen $direction');
            isDrawerOpened = isOpen;
            if (!isOpen) {
              if (searchHandler.searchBoxFocus.hasFocus) {
                searchHandler.searchBoxFocus.unfocus();
              }
            }
          }, // return  true (open) or false (close)

          leftChild: const MainDrawer(),
          rightChild: const MainDrawer(),

          // Note: use "automaticallyImplyLeading: false" if you do not personalize "leading" of Bar
          scaffold: Scaffold(
            key: mainScaffoldKey,
            resizeToAvoidBottomInset: false,
            // appBar: MainAppBar(leading: menuButton(InnerDrawerDirection.start), trailing: menuButton(InnerDrawerDirection.end)),
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: SafeArea(
              top: false,
              bottom: false,
              child: WillPopScope(
                onWillPop: () {
                  return _onBackPressed(context);
                },
                child: Stack(
                  children: [
                    const ImagePreviews(),
                    MainAppBar(leading: menuButton(InnerDrawerDirection.start), trailing: menuButton(InnerDrawerDirection.end)),
                  ],
                ),
              ),
            ),
            // Old drawer stuff:
            // drawer: MainDrawer(key: mainDrawerKey),
            // endDrawer: MainDrawer(key: mainDrawerKey),
            // drawerEnableOpenDragGesture: true,
            // endDrawerEnableOpenDragGesture: true,
            // drawerEdgeDragWidth: MediaQuery.of(context).size.width / 2, // allows to detect horizontal swipes on the whole screen => open drawer by swiping right-to-left
          ),
        );
      },
    );
  }
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final SearchHandler searchHandler = SearchHandler.instance;

    // print('build drawer');

    return RepaintBoundary(
      child: SafeArea(
        child: Drawer(
          child: Column(
            children: <Widget>[
              Obx(() {
                if (settingsHandler.booruList.isNotEmpty && searchHandler.list.isNotEmpty) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(2, 15, 2, 15),
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const <Widget>[
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
                    if (searchHandler.searchBoxFocus.hasFocus) {
                      searchHandler.searchBoxFocus.unfocus();
                    }
                  },
                  child: ListView(
                    controller: ScrollController(), // needed to avoid exception when list overflows into a scrollable size
                    children: [
                      const TabBox(),
                      const TabBoxButtons(true, WrapAlignment.spaceEvenly),
                      const BooruSelectorMain(true),
                      const MergeBooruToggle(),
                      Obx(() {
                        if (settingsHandler.booruList.length > 1 && settingsHandler.mergeEnabled.value) {
                          return const BooruSelectorMain(false);
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
        
                      Obx(() {
                        if (settingsHandler.booruList.isNotEmpty && searchHandler.list.isNotEmpty) {
                          return SettingsButton(
                            name: "Snatcher",
                            icon: const Icon(Icons.download_sharp),
                            page: () => const SnatcherPage(),
                            drawTopBorder: true,
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
        
                      SettingsButton(
                        name: "Settings",
                        icon: const Icon(Icons.settings),
                        page: () => const SettingsPage(),
                      ),
        
                      Obx(() {
                        if (settingsHandler.updateInfo.value != null) {
                          return SettingsButton(
                            name: 'Update Available!',
                            icon: Stack(
                              alignment: Alignment.center,
                              children: [
                                const Icon(Icons.update),
                                Positioned(
                                  top: 1,
                                  left: 1,
                                  child: Center(
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            action: () async {
                              settingsHandler.showUpdate(true);
                            },
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
        
                      if (settingsHandler.enableDrawerMascot) const MascotImage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MergeBooruToggle extends StatefulWidget {
  const MergeBooruToggle({
    Key? key,
  }) : super(key: key);

  @override
  State<MergeBooruToggle> createState() => _MergeBooruToggleState();
}

class _MergeBooruToggleState extends State<MergeBooruToggle> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;

  @override
  Widget build(BuildContext context) {
    if (settingsHandler.booruList.length < 2) {
      return const SizedBox.shrink();
    }

    return SettingsToggle(
      title: 'Multibooru Mode',
      value: settingsHandler.mergeEnabled.value,
      onChanged: (newValue) {
        if (settingsHandler.booruList.length < 2) {
          FlashElements.showSnackbar(
            context: context,
            title: const Text(
              "Error!",
              style: TextStyle(fontSize: 20),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('You need at least 2 booru configs to use this feature!'),
              ],
            ),
            leadingIcon: Icons.error,
            leadingIconColor: Colors.red,
          );
        } else {
          setState(() {
            settingsHandler.mergeEnabled.value = newValue;
            searchHandler.mergeAction(null);
          });
        }
      },
    );
  }
}
