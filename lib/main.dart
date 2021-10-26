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
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/DesktopHome.dart';
import 'package:LoliSnatcher/MobileHome.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/ThemeItem.dart';
import 'package:LoliSnatcher/widgets/ImageStats.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/ImageWriter.dart';


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
    settingsHandler.initialize();
    searchHandler = Get.put(SearchHandler(updateState));
    snatchHandler = Get.put(SnatchHandler());

    if(Platform.isAndroid || Platform.isIOS) {
      var window = WidgetsBinding.instance!.window;
      window.onPlatformBrightnessChanged = () {
        // This callback is called every time the brightness changes and forces the app root to restate.
        // This allows to not use darkTheme to avoid coloring bugs on AppBars
        updateState();
      };

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
            scrollBehavior: CustomScrollBehavior(),
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
        // settingsHandler.initialize();

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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  Home();
}


class _HomeState extends State<Home> {
  final SettingsHandler settingsHandler = Get.find();
  final SnatchHandler snatchHandler = Get.find();
  final SearchHandler searchHandler = Get.find();

  Timer? cacheClearTimer;
  Timer? cacheStaleTimer;
  ImageWriter imageWriter = ImageWriter();

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
      // TODO rework so it happens on every tab change/addition, NOT on timer
      backupTabs();
    });

    imageWriter.clearStaleCache();
    imageWriter.clearCacheOverflow();
    // run check for stale cache files
    // TODO find a better way and/or cases when it will be better to call these
    cacheStaleTimer = Timer.periodic(Duration(minutes: 5), (timer) {
      imageWriter.clearStaleCache();
      imageWriter.clearCacheOverflow();
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

  @override
  void dispose() {
    cacheClearTimer?.cancel();
    cacheStaleTimer?.cancel();
    memeTimer?.cancel();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    if(settingsHandler.appMode != "Mobile"){
      return DesktopHome();
    } else {
      return MobileHome();
    }
  }

}


class CustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => { 
    ...PointerDeviceKind.values
    // PointerDeviceKind.touch,
    // PointerDeviceKind.mouse,
  };
}
