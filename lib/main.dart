import 'dart:async';
import 'dart:ui';
import 'dart:io';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart' show SchedulerBinding;
import 'package:get/get.dart';
import 'package:statsfl/statsfl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/getPerms.dart';
import 'package:LoliSnatcher/pages/SnatcherPage.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/pages/SettingsPage.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/DesktopHome.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/widgets/ActiveTitle.dart';
import 'package:LoliSnatcher/widgets/TagSearchBox.dart';
import 'package:LoliSnatcher/ThemeItem.dart';
import 'package:LoliSnatcher/widgets/BooruSelectorMain.dart';
import 'package:LoliSnatcher/widgets/ImagePreviews.dart';
import 'package:LoliSnatcher/widgets/TabBox.dart';
import 'package:LoliSnatcher/widgets/TabBoxButtons.dart';
import 'package:LoliSnatcher/widgets/ImageStats.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if(Platform.isWindows || Platform.isLinux) {
    DartVLC.initialize();
  }

  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
  MainApp();
}

class _MainAppState extends State<MainApp> {
  late final SettingsHandler settingsHandler;
  late final SearchHandler searchHandler;
  late final SnatchHandler snatchHandler;
  int maxFps = 60;

  @override
  void initState() {
    super.initState();
    settingsHandler = Get.put(SettingsHandler());
    searchHandler = Get.put(SearchHandler(updateState));
    snatchHandler = Get.put(SnatchHandler());

    if(Platform.isAndroid || Platform.isIOS) {
      var window = WidgetsBinding.instance!.window;
      window.onPlatformBrightnessChanged = () {
        // This callback is called every time the brightness changes and forces the app root to restate.
        // This allows to not use darkTheme to avoid coloring bugs on AppBars
        updateState();
      };

      // force always on display
      // TODO force it only when in gallery
      ServiceHandler.disableSleep();

      // enable higher fps
      // TODO make this a setting?
      FlutterDisplayMode.setHighRefreshRate();
      getMaxFPS();
    }
  }

  void getMaxFPS() async {
    print('display mode ${await FlutterDisplayMode.supported}');
  }

  @override
  void dispose() {
    // TODO
    super.dispose();
  }

  void updateState() {
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      ThemeItem theme = settingsHandler.theme.value.name == 'Custom'
        ? ThemeItem(
          name: 'Custom',
          primary: settingsHandler.customPrimaryColor.value,
          accent: settingsHandler.customAccentColor.value
        )
        : settingsHandler.theme.value;
      ThemeMode themeMode = settingsHandler.themeMode.value;
      Brightness? platformBrightness = SchedulerBinding.instance?.window.platformBrightness;
      bool isDark = themeMode == ThemeMode.dark || (themeMode == ThemeMode.system && platformBrightness == Brightness.dark);
      bool isAmoled = settingsHandler.isAmoled.value;

      Brightness primaryBrightness = ThemeData.estimateBrightnessForColor(theme.primary!);
      bool onPrimaryIsDark = primaryBrightness == Brightness.dark;
      Brightness accentBrightness = ThemeData.estimateBrightnessForColor(theme.accent!);
      bool onAccentIsDark = accentBrightness == Brightness.dark;

      // TextTheme textTheme = TextTheme(
      //   headline5: GoogleFonts.quicksand(fontSize: 72.0, fontWeight: FontWeight.bold),
      //   headline6: GoogleFonts.quicksand(fontSize: 36.0),
      //   bodyText2: GoogleFonts.quicksand(fontSize: 14.0),
      //   bodyText1: GoogleFonts.quicksand(fontSize: 14.0),
      // );

      TextSelectionThemeData textSelectionTheme = TextSelectionThemeData(
        cursorColor: theme.accent,
        selectionColor: Colors.blue.withOpacity(0.66),
        selectionHandleColor: theme.accent,
      );

      print('isDark $isDark');

      final ColorScheme alternateColorScheme = ColorScheme(
        primary: theme.primary!,
        onPrimary: onPrimaryIsDark ? Colors.white : Colors.black,
        // onPrimary: isDark ? Colors.white : Colors.black,
        primaryVariant: theme.primary!,

        secondary: theme.accent!,
        onSecondary: onAccentIsDark ? Colors.white : Colors.black,
        // onSecondary: isDark ? Colors.white : Colors.black,
        secondaryVariant: theme.accent!,

        surface: isDark ? Colors.grey[900]! : Colors.grey[300]!,
        onSurface: isDark ? Colors.white : Colors.black,

        background: isDark ? Colors.black : Colors.white,
        onBackground: isDark ? Colors.white : Colors.black,

        error: Colors.redAccent,
        onError: Colors.white,

        brightness: isDark ? Brightness.dark : Brightness.light,
      );

      return StatsFl(
        isEnabled: settingsHandler.isDebug.value && settingsHandler.showFPS.value, //Toggle on/off
        width: 400, //Set size
        height: 50, //
        maxFps: maxFps, // Support custom FPS target (default is 60)
        showText: true, // Hide text label
        sampleTime: .2, //Interval between fps calculations, in seconds.
        totalTime: 10, //Total length of timeline, in seconds.
        align: Alignment.bottomLeft, //Alignment of statsbox
        child: ImageStats(
          isEnabled: settingsHandler.isDebug.value && settingsHandler.showImageStats.value,
          width: 110,
          height: 80,
          align: Alignment.centerLeft,
          child: GetMaterialApp(
            title: 'LoliSnatcher',
            debugShowCheckedModeBanner: false, // hide debug banner in the corner
            showPerformanceOverlay: settingsHandler.isDebug.value && settingsHandler.showFPS.value,
            theme: ThemeData(
              scaffoldBackgroundColor: (isDark && isAmoled) ? Colors.black : null,
              backgroundColor: (isDark && isAmoled) ? Colors.black : null,
              canvasColor: (isDark && isAmoled) ? Colors.black : null,

              brightness: isDark ? Brightness.dark : Brightness.light,
              primaryColor: theme.primary,
              appBarTheme: AppBarTheme(
                backgroundColor: alternateColorScheme.primary,
                foregroundColor: alternateColorScheme.onPrimary,
              ),

              colorScheme: alternateColorScheme,
              // textTheme: textTheme,
              textSelectionTheme: textSelectionTheme,
            ),

            // TODO doesnt detect when appbar text color should change depending on the background ???
            // darkTheme: ThemeData.dark().copyWith(
            //   appBarTheme: AppBarTheme(
            //     brightness: primaryBrightness,
            //     titleTextStyle: TextStyle(color: onPrimaryIsDark ? Colors.black : Colors.black),
            //     toolbarTextStyle: TextStyle(color: onPrimaryIsDark ? Colors.black : Colors.black),
            //     backgroundColor: theme.primary,
            //     foregroundColor: onPrimaryIsDark ? Colors.black : Colors.black,
            //   ),
            //   scaffoldBackgroundColor: isAmoled ? Colors.black : null,
            //   backgroundColor: isAmoled ? Colors.black : null,
            //   canvasColor: isAmoled ? Colors.black : null,

            //   brightness: Brightness.dark,
            //   primaryColor: theme.primary,
            //   accentColor: theme.accent,

            //   colorScheme: alternateColorScheme.copyWith(
            //     brightness: Brightness.dark
            //   ),
            //   textTheme: theme.text,
            //   textSelectionTheme: textSelectionTheme,
            // ),

            themeMode: themeMode,
            navigatorKey: Get.key,
            home: Preloader(),
          )
        )
      );
    });
  }
}

// Added a preloader to load booruconfigs and settings other wise the booruselector misbehaves
class Preloader extends StatelessWidget {
  final SettingsHandler settingsHandler = Get.find();
  final SnatchHandler snatchHandler = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(settingsHandler.isInit.value) {        
        if(Platform.isAndroid || Platform.isIOS) {
          // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
          // force landscape orientation if enabled desktop mode on mobile device
          if(settingsHandler.appMode != "Mobile") {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeRight,
              DeviceOrientation.landscapeLeft,
            ]);
          } else {
            SystemChrome.setPreferredOrientations(DeviceOrientation.values);
          }
        }

        return Home();
      } else {
        settingsHandler.initialize();

        // no custom theme data here yet, fallback to black bg + pink loading spinner
        return Container(
          color: Colors.black,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.pink)
            )
          )
        );
      }
    });
  }
}

/** The home widget is the main widget of the app and contains the Image Previews and the settings drawer.
 *
 * **/
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  Home();
}


class _HomeState extends State<Home> {
  final SettingsHandler settingsHandler = Get.find();
  final SnatchHandler snatchHandler = Get.find();
  final SearchHandler searchHandler = Get.find();

  final GlobalKey<ScaffoldState> mainScaffoldKey = GlobalKey<ScaffoldState>();

  bool firstRun = true;
  bool isSnatching = false;
  String snatchStatus = "";

  Timer? cacheClearTimer;

  int memeCount = 0;
  Timer? memeTimer;
  ThemeItem? selectedTheme;

  @override
  void initState() {
    super.initState();
    restoreTabs();

    // force cache clear every minute + perform tabs backup
    cacheClearTimer = Timer.periodic(Duration(seconds: 30), (timer) {
      // TODO we don't need to clear cache so much, since all images are aleared on dispose
      // Tools.forceClearMemoryCache(withLive: false);
      backupTabs();
    });

    // memeTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
    //   if(settingsHandler.isMemeTheme.value) { 
    //     if(memeCount + 1 < settingsHandler.map['theme']?['options'].length) {
    //       memeCount ++;
    //     } else {
    //       memeCount = 0;
    //     }

    //     if(selectedTheme == null) selectedTheme = settingsHandler.theme.value;

    //     settingsHandler.theme.value = settingsHandler.map['theme']?['options'][memeCount];
    //   } else {
    //     if(selectedTheme != null) {
    //       settingsHandler.theme.value = selectedTheme!;
    //       selectedTheme = null;
    //     }
    //   }
    // });
  }

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

  // special strings used to separate parts of tab backup string
  // tab - separates info parts about tab itself, list - separates tabs list entries
  final String tabDivider = '|||', listDivider = '~~~';

  // Restores tabs from a string saved in DB
  void restoreTabs() async {
    List<String> result = await settingsHandler.dbHandler.getTabRestore();
    List<SearchGlobal> restoredGlobals = [];

    bool foundBrokenItem = false;
    int newIndex = 0;
    if(result.length == 2) {
      // split list into tabs
      List<String> splitInput = result[1].split(listDivider);
      splitInput.asMap().forEach((int index, String str){
        // split tab into booru name and tags
        List<String> booruAndTags = str.split(tabDivider);
        // check for parsing errors
        bool isEntryValid = booruAndTags.length > 1 && booruAndTags[0].isNotEmpty;
        if(isEntryValid) {
          // find booru by name and create searchglobal with given tags
          Booru findBooru = settingsHandler.booruList.firstWhere((booru) => booru.name == booruAndTags[0], orElse: () => Booru(null, null, null, null, null));
          if(findBooru.name != null) {
            restoredGlobals.add(SearchGlobal(findBooru.obs, null, booruAndTags[1]));
          } else {
            foundBrokenItem = true;
            restoredGlobals.add(SearchGlobal(settingsHandler.booruList[0].obs, null, booruAndTags[1]));
          }

          // check if tab was marked as selected and set current selected index accordingly 
          if(booruAndTags.length == 3 && booruAndTags[2] == 'selected') { // if split has third item (selected) - set as current tab
            newIndex = index;
          }
        } else {
          foundBrokenItem = true;
        }
      });
    }

    searchHandler.isRestored.value = true;

    // set parsed tabs OR set first default tab if nothing to restore
    if(restoredGlobals.length > 0) {
      FlashElements.showSnackbar(
        context: context,
        title: Text(
          "Tabs restored",
          style: TextStyle(fontSize: 20)
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Restored ${restoredGlobals.length} tab${restoredGlobals.length == 1 ? '' : 's'} from previous session!'),

            if(foundBrokenItem)
              // notify user if there was unknown booru or invalid entry in the list
              ...[
                Text('Some restored tabs had unknown boorus or broken characters.'),
                Text('They were set to default or ignored.')
              ],
          ],
        ),
        sideColor: foundBrokenItem ? Colors.yellow : Colors.green,
        leadingIcon: foundBrokenItem ? Icons.warning_amber: Icons.settings_backup_restore,
      );

      searchHandler.list.value = restoredGlobals;
      searchHandler.changeTabIndex(newIndex);
    } else {
      Booru defaultBooru = Booru(null, null, null, null, null);
      // settingsHandler.getBooru();
      // Set the default booru and tags at the start
      print('BOORULIST ${settingsHandler.booruList.isNotEmpty}');
      if (settingsHandler.booruList.isNotEmpty) {
        defaultBooru = settingsHandler.booruList[0];
      }
      if(defaultBooru.type != null) searchHandler.list.add(SearchGlobal(defaultBooru.obs, null, settingsHandler.defTags));
      searchHandler.searchTextController.text = settingsHandler.defTags;
    }
    setState(() { });
  }

  // Saves current tabs list to DB
  void backupTabs() {
    // if there are only one tab - check that its not with default booru and tags
    // if there are more than 1 tab or check return false - start backup
    List<SearchGlobal> tabList = searchHandler.list;
    int tabIndex = searchHandler.index.value;
    bool onlyDefaultTab = tabList.length == 1 && tabList[0].booruHandler.booru.name == settingsHandler.prefBooru && tabList[0].tags == settingsHandler.defTags;
    if(!onlyDefaultTab && settingsHandler.booruList.isNotEmpty) {
      final List<String> dump = tabList.map((tab) {
        String booruName = tab.selectedBooru.value.name ?? 'unknown';
        String tabTags = tab.tags;
        String selected = tab == tabList[tabIndex] ? 'selected' : 'tab'; // 'tab' to always have controlled end of the string, to avoid broken strings (see kaguya anime full name as example)
        return '$booruName$tabDivider$tabTags$tabDivider$selected'; // booruName|searchTags|selected (last only if its the current tab)
      }).toList();
      // TODO small indicator somewhere when tabs are saved?
      final String restoreString = dump.join(listDivider);
      settingsHandler.dbHandler.addTabRestore(restoreString);
    } else {
      settingsHandler.dbHandler.clearTabRestore();
    }
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
                    GestureDetector(
                      onLongPress: () {
                        searchHandler.searchTextController.clearComposing();
                        searchHandler.searchBoxFocus.unfocus();
                        searchHandler.addTabByString(searchHandler.searchTextController.text, switchToNew: true);
                      },
                      child: IconButton(
                        iconSize: 30,
                        icon: Icon(Icons.search),
                        onPressed: () {
                          searchHandler.searchTextController.clearComposing();
                          searchHandler.searchBoxFocus.unfocus();
                          searchHandler.searchAction(searchHandler.searchTextController.text, null);
                        },
                      )
                    ),
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
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          // const Text("Tab: ", style: TextStyle(fontWeight: FontWeight.bold)),
                          TabBox(),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          TabBoxButtons(true, MainAxisAlignment.spaceEvenly),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          // const Text("Booru: ", style: TextStyle(fontWeight: FontWeight.bold)),
                          BooruSelectorMain(true),
                        ],
                      ),
                    ),
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
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            // const Text("Booru: ", style: TextStyle(fontWeight: FontWeight.bold)),
                            BooruSelectorMain(false),
                          ],
                        ),
                      ),

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

    if(settingsHandler.appMode != "Mobile"){
      return DesktopHome();
    }

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

