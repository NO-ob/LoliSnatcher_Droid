import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:app_links/app_links.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart' hide Translations;
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
    // Init db stuff
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  Logger.Inst();

  // load settings before first render to get theme data early
  Get.put(NavigationHandler(), permanent: true);
  Get.put(ViewerHandler(), permanent: true);
  final SettingsHandler settingsHandler = Get.put(SettingsHandler(), permanent: true);
  await settingsHandler.initialize();

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

  runApp(TranslationProvider(child: const MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final SettingsHandler settingsHandler;
  late final SearchHandler searchHandler;
  late final SnatchHandler snatchHandler;
  late final NavigationHandler navigationHandler;
  late final TagHandler tagHandler;
  late final NotifyHandler notifyHandler;
  // late final LocalAuthHandler localAuthHandler;
  int maxFps = 60;

  @override
  void initState() {
    super.initState();
    settingsHandler = Get.find<SettingsHandler>();
    searchHandler = Get.put(SearchHandler(updateState), permanent: true);
    snatchHandler = Get.put(SnatchHandler(), permanent: true);
    tagHandler = Get.put(TagHandler(), permanent: true);
    navigationHandler = Get.find<NavigationHandler>();
    notifyHandler = Get.put(NotifyHandler(), permanent: true);
    // localAuthHandler = Get.put(LocalAuthHandler(), permanent: true);
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
    settingsHandler.alice.setNavigatorKey(navigationHandler.navigatorKey);
    await settingsHandler.postInit(() async {
      settingsHandler.postInitMessage.value = loc.init.loadingTags;
      // should init earlier than tabs so tags color properly on first render of search box
      await tagHandler.initialize();
      settingsHandler.postInitMessage.value = loc.init.restoringTabs;
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
      Logger.Inst().log(
        'Set max fps to $maxFps',
        'MainApp',
        'setMaxFPS',
        null,
      );
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

      // TODO fix status bar coloring when in gallery view (AND depending on theme?)
      // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //   statusBarColor: Theme.of(context).colorScheme.background.withValues(alpha: 0.5),
      //   statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
      //   statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      //   systemStatusBarContrastEnforced: true,

      //   systemNavigationBarColor: Theme.of(context).colorScheme.background.withValues(alpha: 0.5),
      //   systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      //   systemNavigationBarContrastEnforced: true,
      //   systemNavigationBarDividerColor: Colors.transparent,
      // ));

      // debugRepaintRainbowEnabled = settingsHandler.showPerf.value;

      return StatsFl(
        isEnabled: settingsHandler.showFPS.value, //Toggle on/off
        width: 400, //Set size
        height: 50, //
        maxFps: maxFps, // Support custom FPS target (default is 60)
        showText: true, // Hide text label
        sampleTime: .2, //Interval between fps calculations, in seconds.
        totalTime: 10, //Total length of timeline, in seconds.
        align: Alignment.bottomLeft, //Alignment of statsbox
        child: ImageStats(
          isEnabled: settingsHandler.showImageStats.value,
          width: 110,
          height: 80,
          align: Alignment.centerLeft,
          child: DynamicColorBuilder(
            builder: (lightDynamic, darkDynamic) {
              themeHandler.setDynamicColors(
                useDynamicColor ? lightDynamic : null,
                useDynamicColor ? darkDynamic : null,
              );

              return MaterialApp(
                title: loc.appName,
                debugShowCheckedModeBanner: false, // hide debug banner in the corner
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
                locale: TranslationProvider.of(context).flutterLocale,
                supportedLocales: AppLocaleUtils.supportedLocales,
                localizationsDelegates: GlobalMaterialLocalizations.delegates,
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

      // check if there is a deep link on app start
      final Uri? initialLink = await appLinks!.getInitialLink();
      if (initialLink != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          openAppLink(initialLink.toString());
        });
      }

      // listen for deep links
      appLinksSubscription = appLinks!.uriLinkStream.listen((uri) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          openAppLink(uri.toString());
        });
      });
    }
  }

  Future<void> openAppLink(String url) async {
    Logger.Inst().log(url, 'AppLinks', 'openAppLink', LogTypes.settingsLoad);

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
      // set system ui mode
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
