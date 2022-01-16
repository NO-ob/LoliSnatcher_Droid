import 'dart:async';
import 'dart:io';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/scheduler.dart' show SchedulerBinding;
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:statsfl/statsfl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_links/app_links.dart';

import 'package:LoliSnatcher/ScrollPhysics.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ViewerHandler.dart';
import 'package:LoliSnatcher/DesktopHome.dart';
import 'package:LoliSnatcher/MobileHome.dart';
import 'package:LoliSnatcher/ThemeItem.dart';
import 'package:LoliSnatcher/widgets/ImageStats.dart';
import 'package:LoliSnatcher/ImageWriter.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/pages/settings/BooruEditPage.dart';
import 'package:LoliSnatcher/utilities/Logger.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
// import 'package:LoliSnatcher/widgets/FlashElements.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux) {
    DartVLC.initialize();

    // Init db stuff
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
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
  late final ViewerHandler viewerHandler;
  int maxFps = 60;

  @override
  void initState() {
    super.initState();
    settingsHandler = Get.put(SettingsHandler(), permanent: true);
    // settingsHandler.initialize();
    searchHandler = Get.put(SearchHandler(updateState), permanent: true);
    snatchHandler = Get.put(SnatchHandler(), permanent: true);
    viewerHandler = Get.put(ViewerHandler(), permanent: true);

    initHandlers();

    if (Platform.isAndroid || Platform.isIOS) {
      var window = WidgetsBinding.instance!.window;
      window.onPlatformBrightnessChanged = () {
        // This callback is called every time the brightness changes and forces the app root to restate.
        // This allows to not use darkTheme to avoid coloring bugs on AppBars
        updateState();
      };
    }

    setMaxFPS();
  }

  void initHandlers() async {
    await settingsHandler.initialize();
    await searchHandler.restoreTabs();
  }

  void setMaxFPS() async {
    // enable higher refresh rate
    // TODO make this a setting?
    // TODO make it work on ios, desktop?
    // Currently there is no official support on these platforms, see:
    // https://github.com/flutter/flutter/issues/49757
    // https://github.com/flutter/flutter/issues/90675

    if (Platform.isAndroid) {
      await FlutterDisplayMode.setHighRefreshRate();
      DisplayMode currentMode = await FlutterDisplayMode.active;

      if (currentMode.refreshRate > maxFps) {
        maxFps = currentMode.refreshRate.round();
        updateState();
      }
      debugPrint('LoliSnatcher: Set Max FPS $maxFps');
      // FlashElements.showSnackbar(title: Text('Max FPS: $maxFps'));
    }
  }

  @override
  void dispose() {
    Get.delete<ViewerHandler>();
    Get.delete<SnatchHandler>();
    Get.delete<SearchHandler>();
    Get.delete<SettingsHandler>();
    super.dispose();
  }

  void updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      ThemeItem theme = settingsHandler.theme.value.name == 'Custom'
          ? ThemeItem(name: 'Custom', primary: settingsHandler.customPrimaryColor.value, accent: settingsHandler.customAccentColor.value)
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

      // print('isDark $isDark');

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
            showPerformanceOverlay: settingsHandler.isDebug.value && settingsHandler.showPerf.value,
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
          ),
        ),
      );
    });
  }
}

class Preloader extends StatelessWidget {
  Preloader({Key? key}) : super(key: key);

  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (settingsHandler.isInit.value) {
        if (Platform.isAndroid || Platform.isIOS) {
          // set system ui mode
          if (settingsHandler.showStatusBar) {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
            // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
          } else {
            // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
          }

          // force landscape orientation if enabled desktop mode on mobile device
          if (settingsHandler.appMode != "Mobile") {
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
        // no custom theme data here yet, fallback to black bg + pink loading spinner
        return Container(
          color: Colors.black,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.pink),
            ),
          ),
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
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();

  Timer? cacheClearTimer;
  Timer? cacheStaleTimer;
  ImageWriter imageWriter = ImageWriter();

  int memeCount = 0;
  Timer? memeTimer;
  ThemeItem? selectedTheme;

  AppLinks? appLinks;

  @override
  void initState() {
    super.initState();

    initDeepLinks();

    // searchHandler.restoreTabs();

    // force cache clear every minute + perform tabs backup
    cacheClearTimer = Timer.periodic(Duration(seconds: 30), (timer) {
      // TODO we don't need to clear cache so much, since all images are cleared on dispose
      // Tools.forceClearMemoryCache(withLive: false);
      // TODO rework so it happens on every tab change/addition, NOT on timer
      searchHandler.backupTabs();
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

  void initDeepLinks() async {
    if (Platform.isAndroid || Platform.isIOS) {
      appLinks = AppLinks(
        onAppLink: (Uri uri, String stringUri) {
          openAppLink(stringUri);
        },
      );

      // check if there is a link on start
      final Uri? appLink = await appLinks!.getInitialAppLink();
      if (appLink != null) {
        openAppLink(appLink.toString());
      }
    }
  }

  void openAppLink(String url) async {
    Logger.Inst().log(url, "AppLinks", "openAppLink", LogTypes.settingsLoad);
    // FlashElements.showSnackbar(title: Text('Deep Link: $url'), duration: null);

    if (url.contains('loli.snatcher')) {
      Booru booru = Booru.fromLink(url);
      if (booru.name != null && booru.name!.isNotEmpty) {
        if (settingsHandler.booruList.indexWhere((b) => b.name == booru.name) != -1) {
          // Rename config if its already in the list
          booru.name = booru.name! + ' (duplicate)';
        }
        SettingsPageOpen(context: context, page: () => BooruEdit(booru)).open();
      }
    }
  }

  @override
  void dispose() {
    cacheClearTimer?.cancel();
    cacheStaleTimer?.cancel();
    memeTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (settingsHandler.appMode != "Mobile") {
      return DesktopHome();
    } else {
      return MobileHome();
    }
  }
}
