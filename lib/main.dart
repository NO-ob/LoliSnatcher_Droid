import 'dart:async';
import 'dart:io';

import 'package:app_links/app_links.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:statsfl/statsfl.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/theme_item.dart';
import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/notify_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/handlers/theme_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/pages/desktop_home_page.dart';
import 'package:lolisnatcher/src/pages/mobile_home_page.dart';
import 'package:lolisnatcher/src/pages/settings/booru_edit_page.dart';
import 'package:lolisnatcher/src/services/image_writer.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/root/image_stats.dart';
import 'package:lolisnatcher/src/widgets/root/scroll_physics.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux) {
    DartVLC.initialize();

    // Init db stuff
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);

    Logger.Inst().log('$details', 'FlutterError', 'onError', LogTypes.exception);
  };

  // TODO
  // AwesomeNotifications().initialize(
  //   // set the icon to null if you want to use the default app icon
  //   null,
  //   [
  //     NotificationChannel(
  //       channelGroupKey: 'basic_channel_group',
  //       channelKey: 'basic_channel',
  //       channelName: 'Basic notifications',
  //       channelDescription: 'Notification channel for basic tests',
  //       defaultColor: Colors.pink[600],
  //       ledColor: Colors.white,
  //     )
  //   ],
  //   // Channel groups are only visual and are not required
  //   channelGroups: [
  //     NotificationChannelGroup(
  //       channelGroupKey: 'basic_channel_group',
  //       channelGroupName: 'Basic group',
  //     ),
  //   ],
  //   debug: true,
  // );

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final SettingsHandler settingsHandler;
  late final SearchHandler searchHandler;
  late final SnatchHandler snatchHandler;
  late final ViewerHandler viewerHandler;
  late final NavigationHandler navigationHandler;
  late final TagHandler tagHandler;
  late final NotifyHandler notifyHandler;
  // late final LocalAuthHandler localAuthHandler;
  int maxFps = 60;

  @override
  void initState() {
    super.initState();
    settingsHandler = Get.put(SettingsHandler(), permanent: true);
    searchHandler = Get.put(SearchHandler(updateState), permanent: true);
    snatchHandler = Get.put(SnatchHandler(), permanent: true);
    viewerHandler = Get.put(ViewerHandler(), permanent: true);
    tagHandler = Get.put(TagHandler(), permanent: true);
    navigationHandler = Get.put(NavigationHandler(), permanent: true);
    notifyHandler = Get.put(NotifyHandler(), permanent: true);
    // localAuthHandler = Get.put(LocalAuthHandler(), permanent: true);
    initHandlers();

    if (Platform.isAndroid || Platform.isIOS) {
      var window = WidgetsBinding.instance.window;
      window.onPlatformBrightnessChanged = () {
        // This callback is called every time the brightness changes and forces the app root to restate.
        // This allows to not use darkTheme to avoid coloring bugs on AppBars
        updateState();
      };
    }

    // TODO
    // AwesomeNotifications().setListeners(
    //   onActionReceivedMethod: NotifyHandler.onActionReceivedMethod,
    //   onNotificationCreatedMethod: NotifyHandler.onNotificationCreatedMethod,
    //   onNotificationDisplayedMethod: NotifyHandler.onNotificationDisplayedMethod,
    //   onDismissActionReceivedMethod: NotifyHandler.onDismissActionReceivedMethod,
    // );

    // AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    //   if (!isAllowed) {
    //     // TODO
    //     // This is just a basic example. For real apps, you must show some
    //     // friendly dialog box before call the request method.
    //     // This is very important to not harm the user experience
    //     AwesomeNotifications().requestPermissionToSendNotifications();
    //   }
    // });

    setMaxFPS();
  }

  void initHandlers() async {
    await settingsHandler.initialize();

    // should init earlier than tabs so tags color properly on first render of search box
    // TODO but this possibly could lead to bad preformance on start if tag storage is too big?
    await tagHandler.initialize();

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
    Get.delete<NotifyHandler>();
    Get.delete<NavigationHandler>();
    Get.delete<ViewerHandler>();
    Get.delete<SnatchHandler>();
    Get.delete<SearchHandler>();
    Get.delete<TagHandler>();
    // Get.delete<LocalAuthHandler>();
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
      bool isAmoled = settingsHandler.isAmoled.value;

      ThemeHandler themeHandler = ThemeHandler(
        theme: theme,
        themeMode: themeMode,
        isAmoled: isAmoled,
      );

      // TODO fix status bar coloring when in gallery view (AND depending on theme?)
      // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //   statusBarColor: Theme.of(context).colorScheme.background.withOpacity(0.5),
      //   statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
      //   statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      //   systemStatusBarContrastEnforced: true,

      //   systemNavigationBarColor: Theme.of(context).colorScheme.background.withOpacity(0.5),
      //   systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      //   systemNavigationBarContrastEnforced: true,
      //   systemNavigationBarDividerColor: Colors.transparent,
      // ));

      // debugRepaintRainbowEnabled = settingsHandler.showPerf.value;

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
          child: MaterialApp(
            title: 'LoliSnatcher',
            debugShowCheckedModeBanner: false, // hide debug banner in the corner
            showPerformanceOverlay: settingsHandler.isDebug.value && settingsHandler.showPerf.value,
            scrollBehavior: const CustomScrollBehavior(),
            theme: themeHandler.lightTheme(),
            darkTheme: themeHandler.darkTheme(),

            themeMode: themeMode,
            navigatorKey: navigationHandler.navigatorKey,
            home: const Preloader(),
          ),
        ),
      );
    });
  }
}

class Preloader extends StatelessWidget {
  const Preloader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    return Obx(() {
      if (settingsHandler.isInit.value) {
        if (Platform.isAndroid || Platform.isIOS) {
          // set system ui mode
          ServiceHandler.setSystemUiVisibility(true);

          // force landscape orientation if enabled desktop mode on mobile device
          if (settingsHandler.appMode.value.isDesktop) {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeRight,
              DeviceOrientation.landscapeLeft,
            ]);
          } else {
            SystemChrome.setPreferredOrientations(DeviceOrientation.values);
          }
        }

        return const Home();
      } else {
        // no custom theme data here yet, fallback to black bg + pink loading spinner
        return Container(
          color: Colors.black,
          child: const Center(
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
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final TagHandler tagHandler = TagHandler.instance;
  // final LocalAuthHandler localAuthHandler = LocalAuthHandler.instance;

  Timer? cacheClearTimer;
  Timer? cacheStaleTimer;
  ImageWriter imageWriter = ImageWriter();

  AppLinks? appLinks;
  StreamSubscription<Uri>? appLinksSubscription;

  @override
  void initState() {
    super.initState();

    initDeepLinks();

    // searchHandler.restoreTabs();

    // force cache clear every minute + perform tabs backup
    cacheClearTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      // TODO we don't need to clear cache so much, since all images are cleared on dispose
      // Tools.forceClearMemoryCache(withLive: false);
      // TODO rework so it happens on every tab change/addition, NOT on timer
      searchHandler.backupTabs();
      // TODO possible performance problem if you have too many tags?
      if(!tagHandler.tagSaveActive){
        tagHandler.saveTags();
      }

    });

    imageWriter.clearStaleCache();
    imageWriter.clearCacheOverflow();
    // run check for stale cache files
    // TODO find a better way and/or cases when it will be better to call these
    cacheStaleTimer = Timer.periodic(const Duration(minutes: 5), (timer) {
      imageWriter.clearStaleCache();
      imageWriter.clearCacheOverflow();
    });

    // consider app launch as return to the app
    // WidgetsBinding.instance.addObserver(this);
    // localAuthHandler.onReturn();
  }

  void initDeepLinks() async {
    if (Platform.isAndroid || Platform.isIOS) {
      appLinks = AppLinks();

      // check if there is a deep link on app start
      final Uri? initialLink = await appLinks!.getInitialAppLink();
      if (initialLink != null) {
        openAppLink(initialLink.toString());
      }

      // listen for deep links
      appLinksSubscription = appLinks!.uriLinkStream.listen((uri) {
        openAppLink(uri.toString());
      });
    }
  }

  void openAppLink(String url) async {
    Logger.Inst().log(url, 'AppLinks', 'openAppLink', LogTypes.settingsLoad);
    // FlashElements.showSnackbar(title: Text('Deep Link: $url'), duration: null);

    if (url.contains('loli.snatcher')) {
      Booru booru = Booru.fromLink(url);
      if (booru.name != null && booru.name!.isNotEmpty) {
        if (settingsHandler.booruList.indexWhere((b) => b.name == booru.name) != -1) {
          // Rename config if its already in the list
          booru.name = '${booru.name!} (duplicate)';
        }
        SettingsPageOpen(context: context, page: () => BooruEdit(booru)).open();
      }
    }
  }

  @override
  void dispose() {
    cacheClearTimer?.cancel();
    cacheStaleTimer?.cancel();
    appLinksSubscription?.cancel();
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   super.didChangeAppLifecycleState(state);
  //   if (state != AppLifecycleState.resumed) {
  //     // record time when user left the app
  //     localAuthHandler.onLeave();
  //   }
  //   if (state == AppLifecycleState.resumed) {
  //     // check if app needs to be locked when user returns to the app
  //     localAuthHandler.onReturn();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (settingsHandler.appMode.value.isMobile) {
        return const MobileHome();
      } else {
        return const DesktopHome();
      }
    });

    // with lockscreen:
    // return Obx(() {
    //   if(localAuthHandler.isLoggedIn.value == true) {
    //     if (settingsHandler.appMode.value.isMobile) {
    //       return const MobileHome();
    //     } else {
    //       return const DesktopHome();
    //     }
    //   } else {
    //     return const LockScreen();
    //   }
    // });
  }
}
