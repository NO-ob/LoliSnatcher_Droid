import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:app_links/app_links.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:statsfl/statsfl.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
import 'package:lolisnatcher/src/pages/init_home_page.dart';
import 'package:lolisnatcher/src/pages/mobile_home_page.dart';
import 'package:lolisnatcher/src/pages/settings/booru_edit_page.dart';
import 'package:lolisnatcher/src/services/image_writer.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/root/image_stats.dart';
import 'package:lolisnatcher/src/widgets/root/scroll_physics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  Logger.Inst();

  // load settings before first render to get theme data early
  NavigationHandler.register();
  ViewerHandler.register();
  await SettingsHandler.register().initialize();
  SearchHandler.register();
  SnatchHandler.register();
  TagHandler.register();
  NotifyHandler.register();
  // LocalAuthHandler.register();

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

  await ServiceHandler.setSystemUiVisibility(true);

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final SnatchHandler snatchHandler = SnatchHandler.instance;
  final NavigationHandler navigationHandler = NavigationHandler.instance;
  final TagHandler tagHandler = TagHandler.instance;
  final NotifyHandler notifyHandler = NotifyHandler.instance;
  // final LocalAuthHandler localAuthHandler = LocalAuthHandler.instance;
  int maxFps = 60;

  @override
  void initState() {
    super.initState();

    initHandlers();

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

  Future<void> initHandlers() async {
    searchHandler.setRootRestate(updateState);
    settingsHandler.alice.setNavigatorKey(navigationHandler.navigatorKey);
    await settingsHandler.postInit(() async {
      settingsHandler.postInitMessage.value = 'Loading tags...';
      // should init earlier than tabs so tags color properly on first render of search box
      await tagHandler.initialize();
      settingsHandler.postInitMessage.value = 'Restoring tabs...';
      await searchHandler.restoreTabs();
    });
  }

  Future<void> setMaxFPS() async {
    // enable higher refresh rate
    // TODO make this a setting?
    // TODO make it work on ios, desktop?
    // Currently there is no official support on these platforms, see:
    // https://github.com/flutter/flutter/issues/49757
    // https://github.com/flutter/flutter/issues/90675

    if (Platform.isAndroid) {
      await FlutterDisplayMode.setHighRefreshRate();
      final DisplayMode currentMode = await FlutterDisplayMode.active;

      if (currentMode.refreshRate > maxFps) {
        maxFps = currentMode.refreshRate.round();
        updateState();
      }
      Logger.Inst().log('Set max fps to $maxFps', 'MainApp', 'setMaxFPS', null);
    }
  }

  @override
  void dispose() {
    NotifyHandler.unregister();
    NavigationHandler.unregister();
    ViewerHandler.unregister();
    SnatchHandler.unregister();
    SearchHandler.unregister();
    TagHandler.unregister();
    // LocalAuthHandler.unregister();
    SettingsHandler.unregister();
    super.dispose();
  }

  void updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final ThemeItem theme = settingsHandler.theme.value.name == 'Custom'
          ? ThemeItem(
              name: 'Custom',
              primary: settingsHandler.customPrimaryColor.value,
              accent: settingsHandler.customAccentColor.value,
            )
          : settingsHandler.theme.value;
      final ThemeMode themeMode = settingsHandler.themeMode.value;
      final bool useDynamicColor = settingsHandler.useDynamicColor.value;
      final bool isAmoled = settingsHandler.isAmoled.value;

      final ThemeHandler themeHandler = ThemeHandler(
        theme: theme,
        themeMode: themeMode,
        isAmoled: isAmoled,
      );

      // debugRepaintRainbowEnabled = settingsHandler.showPerf.value;

      return StatsFl(
        isEnabled: settingsHandler.showFPS.value,
        width: 400,
        height: 50,
        maxFps: maxFps,
        showText: true,
        sampleTime: .2,
        totalTime: 10,
        align: Alignment.bottomLeft,
        child: ImageStats(
          isEnabled: settingsHandler.showImageStats.value,
          width: 120,
          height: 100,
          align: Alignment.centerLeft,
          child: DynamicColorBuilder(
            builder: (lightDynamic, darkDynamic) {
              themeHandler.setDynamicColors(
                useDynamicColor ? lightDynamic : null,
                useDynamicColor ? darkDynamic : null,
              );

              return MaterialApp(
                title: 'LoliSnatcher',
                debugShowCheckedModeBanner: false,
                showPerformanceOverlay: settingsHandler.showPerf.value,
                scrollBehavior: const CustomScrollBehavior(),
                theme: themeHandler.lightTheme(),
                darkTheme: themeHandler.darkTheme(),
                themeMode: themeMode,
                navigatorKey: navigationHandler.navigatorKey,
                navigatorObservers: [
                  TalkerRouteObserver(Logger.talker),
                ],
                home: const Home(),
              );
            },
          ),
        ),
      );
    });
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final TagHandler tagHandler = TagHandler.instance;
  // final LocalAuthHandler localAuthHandler = LocalAuthHandler.instance;

  Timer? backupTimer;
  Timer? cacheStaleTimer;
  ImageWriter imageWriter = ImageWriter();

  AppLinks? appLinks;
  StreamSubscription<Uri>? appLinksSubscription;

  bool initedDeepLinks = false;

  @override
  void initState() {
    super.initState();

    backupTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      // TODO rework so it happens on every tab change/addition, NOT on timer
      searchHandler.backupTabs();
      if (!tagHandler.tagSaveActive) {
        tagHandler.saveTags();
      }
    });

    clearCache();
    cacheStaleTimer = Timer.periodic(const Duration(minutes: 5), (timer) {
      clearCache();
    });

    // consider app launch as return to the app
    // WidgetsBinding.instance.addObserver(this);
    // localAuthHandler.onReturn();
  }

  Future<void> clearCache() async {
    await imageWriter.clearStaleCache();
    await imageWriter.clearCacheOverflow();
  }

  Future<void> initDeepLinks() async {
    if (initedDeepLinks) {
      return;
    }
    initedDeepLinks = true;
    if (Platform.isAndroid || Platform.isIOS) {
      appLinks = AppLinks();

      final Uri? initialLink = await appLinks!.getInitialLink();
      if (initialLink != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          openAppLink(initialLink.toString());
        });
      }

      appLinksSubscription = appLinks!.uriLinkStream.listen((uri) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          openAppLink(uri.toString());
        });
      });
    }
  }

  Future<void> openAppLink(String url) async {
    Logger.Inst().log(url, 'AppLinks', 'openAppLink', LogTypes.settingsLoad);
    // FlashElements.showSnackbar(title: Text('Deep Link: $url'), duration: null);

    if (url.contains('loli.snatcher')) {
      final Booru booru = Booru.fromLink(url);
      if (booru.name != null && booru.name!.isNotEmpty) {
        if (settingsHandler.booruList.indexWhere((b) => b.name == booru.name) != -1) {
          // Rename config if its already in the list
          booru.name = '${booru.name!} (duplicate)';
        }
        await SettingsPageOpen(context: context, page: () => BooruEdit(booru)).open();
      }
    }
  }

  @override
  void dispose() {
    backupTimer?.cancel();
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
    if (Platform.isAndroid || Platform.isIOS) {
      ServiceHandler.setSystemUiVisibility(true);

      // force landscape orientation if enabled desktop mode on mobile device
      if (SettingsHandler.instance.appMode.value.isDesktop) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      }
    }

    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: Obx(() {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Builder(
            key: ValueKey('init:${settingsHandler.isPostInit.value}-mobile:${settingsHandler.appMode.value.isMobile}'),
            builder: (context) {
              if (settingsHandler.isPostInit.value == false) {
                return const InitHomePage();
              }

              initDeepLinks();

              if (settingsHandler.appMode.value.isMobile) {
                return const MobileHome();
              } else {
                return const DesktopHome();
              }
            },
          ),
        );
      }),
    );

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
