import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:alice_lightweight/alice.dart';
import 'package:fvp/fvp.dart' as fvp;
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/data/settings/app_mode.dart';
import 'package:lolisnatcher/src/data/settings/hand_side.dart';
import 'package:lolisnatcher/src/data/settings/video_backend_mode.dart';
import 'package:lolisnatcher/src/data/theme_item.dart';
import 'package:lolisnatcher/src/data/update_info.dart';
import 'package:lolisnatcher/src/handlers/database_handler.dart';
import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/services/get_perms.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/http_overrides.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/video/media_kit_video_player.dart';

/// This class is used loading from and writing settings to files
class SettingsHandler {
  static SettingsHandler get instance => GetIt.instance<SettingsHandler>();

  static SettingsHandler register() {
    if (!GetIt.instance.isRegistered<SettingsHandler>()) {
      GetIt.instance.registerSingleton(SettingsHandler());
    }
    return instance;
  }

  static void unregister() => GetIt.instance.unregister<SettingsHandler>();

  static bool get isDesktopPlatform => Platform.isWindows || Platform.isLinux || Platform.isMacOS;

  DBHandler dbHandler = DBHandler();

  late Alice alice;

  // service vars
  RxBool isInit = false.obs, isPostInit = false.obs;
  RxString postInitMessage = ''.obs;
  String cachePath = '';
  String path = '';
  String boorusPath = '';

  Rx<UpdateInfo?> updateInfo = Rxn(null);

  ////////////////////////////////////////////////////

  // runtime settings vars
  bool hasHydrus = false;
  RxList<LogTypes> enabledLogTypes = RxList.from(EnvironmentConfig.isTesting ? [...LogTypes.values] : []);
  RxString discordURL = RxString(Constants.discordURL);

  // debug toggles
  RxBool isDebug = (kDebugMode || false).obs;
  RxBool showFPS = false.obs;
  RxBool showPerf = false.obs;
  RxBool showImageStats = false.obs;
  bool blurImages = kDebugMode ? Constants.blurImagesDefaultDev : false;

  ////////////////////////////////////////////////////

  // saveable settings vars
  String defTags = 'rating:safe';
  String previewMode = 'Sample';
  String videoCacheMode = 'Stream';
  String prefBooru = '';
  String previewDisplay = 'Square';
  String galleryMode = 'Full Res';
  String snatchMode = 'Full Res';
  String shareAction = 'Ask';
  Rx<AppMode> appMode = AppMode.defaultValue.obs;
  Rx<HandSide> handSide = HandSide.defaultValue.obs;
  String galleryBarPosition = 'Top';
  String galleryScrollDirection = 'Horizontal';
  String extPathOverride = '';
  String drawerMascotPathOverride = '';
  String backupPath = '';
  String zoomButtonPosition = 'Right';
  String changePageButtonsPosition = isDesktopPlatform ? 'Right' : 'Disabled';
  String scrollGridButtonsPosition = isDesktopPlatform ? 'Right' : 'Disabled';
  String lastSyncIp = '';
  String lastSyncPort = '';
  // TODO move it to boorus themselves to have different user agents for different boorus?
  String customUserAgent = '';
  String proxyType = 'direct';
  String proxyAddress = '';
  String proxyUsername = '';
  String proxyPassword = '';
  VideoBackendMode videoBackendMode = isDesktopPlatform ? VideoBackendMode.mpv : VideoBackendMode.normal;
  String altVideoPlayerVO = isDesktopPlatform ? 'libmpv' : 'gpu'; // mediakit default: gpu - android, libmpv - desktop
  String altVideoPlayerHWDEC = isDesktopPlatform ? 'auto' : 'auto-safe'; // mediakit default: auto-safe - android, auto - desktop

  List<String> hatedTags = [];
  List<String> lovedTags = [];

  int itemLimit = Constants.defaultItemLimit;
  int portraitColumns = 2;
  int landscapeColumns = 4;
  int preloadCount = 1;
  int snatchCooldown = 250;
  int volumeButtonsScrollSpeed = 200;
  int galleryAutoScrollTime = 4000;
  int cacheSize = 3;
  int autoLockTimeout = 120;

  double mousewheelScrollSpeed = 10;
  double preloadSizeLimit = 0.2;

  int currentColumnCount(BuildContext context) {
    return MediaQuery.orientationOf(context) == Orientation.portrait ? portraitColumns : landscapeColumns;
  }

  Duration cacheDuration = Duration.zero;

  static const List<List<String>> buttonList = [
    ['autoscroll', 'Slideshow'],
    ['snatch', 'Save'],
    ['favourite', 'Favourite'],
    ['info', 'Display Info'],
    ['share', 'Share'],
    ['select', 'Select'],
    ['open', 'Open in Browser'],
    ['reloadnoscale', 'Reload w/out scaling'],
    ['toggle_quality', 'Toggle Quality'],
    ['external_player', 'External player'],
  ];
  List<List<String>> buttonOrder = [...buttonList];

  bool jsonWrite = false;
  bool autoPlayEnabled = true;
  bool loadingGif = false;
  bool thumbnailCache = true;
  bool mediaCache = false;
  bool autoHideImageBar = false;
  bool dbEnabled = true;
  bool indexesEnabled = false;
  bool searchHistoryEnabled = true;
  bool filterHated = false;
  bool filterFavourites = false;
  bool filterSnatched = false;
  bool filterAi = false;
  bool useVolumeButtonsForScroll = false;
  bool shitDevice = false;
  bool disableVideo = false;
  bool enableDrawerMascot = false;
  bool allowSelfSignedCerts = false;
  bool wakeLockEnabled = true;
  bool tagTypeFetchEnabled = true;
  bool downloadNotifications = true;
  bool allowRotation = false;
  bool enableHeroTransitions = true;
  bool disableCustomPageTransitions = false;
  bool incognitoKeyboard = false;
  bool hideNotes = false;
  bool startVideosMuted = false;
  bool snatchOnFavourite = false;
  bool favouriteOnSnatch = false;
  bool disableVibration = false;
  bool altVideoPlayerHwAccel = true;
  bool disableImageScaling = false;
  bool gifsAsThumbnails = false;
  bool desktopListsDrag = false;
  RxBool useLockscreen = false.obs;
  RxBool blurOnLeave = false.obs;
  RxList<Booru> booruList = RxList<Booru>([]);
  ////////////////////////////////////////////////////

  // themes wip
  Rx<ThemeItem> theme = ThemeItem(
    name: 'Pink',
    primary: Colors.pink[200],
    accent: Colors.pink[600],
  ).obs;

  Rx<Color?> customPrimaryColor = Colors.pink[200]!.obs;
  Rx<Color?> customAccentColor = Colors.pink[600]!.obs;

  Rx<ThemeMode> themeMode = ThemeMode.dark.obs; // system, light, dark
  RxBool useDynamicColor = false.obs;
  RxBool isAmoled = false.obs;
  ////////////////////////////////////////////////////

  // list of setting names which shouldnt be synced with other devices
  List<String> deviceSpecificSettings = [
    'shitDevice',
    'disableVideo',
    'thumbnailCache',
    'mediaCache',
    'dbEnabled',
    'indexesEnabled',
    'searchHistoryEnabled',
    'useVolumeButtonsForScroll',
    'volumeButtonsScrollSpeed',
    'mousewheelScrollSpeed',
    'prefBooru',
    'appMode',
    'handSide',
    'extPathOverride',
    'backupPath',
    'lastSyncIp',
    'lastSyncPort',
    'customUserAgent',
    'proxyType',
    'proxyAddress',
    'proxyUsername',
    'proxyPassword',
    'videoBackendMode',
    'altVideoPlayerVO',
    'altVideoPlayerHWDEC',
    'altVideoPlayerHwAccel',
    'theme',
    'themeMode',
    'isAmoled',
    'useDynamicColor',
    'customPrimaryColor',
    'customAccentColor',
    'version',
    'disableImageScaling',
    'gifsAsThumbnails',
    'cacheDuration',
    'cacheSize',
    'autoLockTimeout',
    'enableDrawerMascot',
    'drawerMascotPathOverride',
    'allowSelfSignedCerts',
    'showFPS',
    'showPerf',
    'showImageStats',
    'isDebug',
    'desktopListsDrag',
    'incognitoKeyboard',
    'backupPath',
    'useLockscreen',
    'blurOnLeave',
  ];

  // default values and possible options map for validation
  // TODO build settings widgets from this map, need to add Label/Description/other options required for the input element
  // TODO move it in another file?
  Map<String, Map<String, dynamic>> get map => {
        // stringFromList
        'previewMode': {
          'type': 'stringFromList',
          'default': 'Sample',
          'options': <String>['Thumbnail', 'Sample'],
        },
        'previewDisplay': {
          'type': 'stringFromList',
          'default': 'Square',
          'options': <String>['Square', 'Rectangle', 'Staggered'],
        },
        'shareAction': {
          'type': 'stringFromList',
          'default': 'Ask',
          'options': <String>['Ask', 'Post URL', 'File URL', 'File', 'Hydrus'],
        },
        'videoCacheMode': {
          'type': 'stringFromList',
          'default': 'Stream',
          'options': <String>['Stream', 'Cache', 'Stream+Cache'],
        },
        'galleryMode': {
          'type': 'stringFromList',
          'default': 'Full Res',
          'options': <String>['Sample', 'Full Res'],
        },
        'snatchMode': {
          'type': 'stringFromList',
          'default': 'Full Res',
          'options': <String>['Sample', 'Full Res'],
        },
        'galleryScrollDirection': {
          'type': 'stringFromList',
          'default': 'Horizontal',
          'options': <String>['Horizontal', 'Vertical'],
        },
        'galleryBarPosition': {
          'type': 'stringFromList',
          'default': 'Top',
          'options': <String>['Top', 'Bottom'],
        },
        'zoomButtonPosition': {
          'type': 'stringFromList',
          'default': 'Right',
          'options': <String>['Disabled', 'Left', 'Right'],
        },
        'changePageButtonsPosition': {
          'type': 'stringFromList',
          'default': isDesktopPlatform ? 'Right' : 'Disabled',
          'options': <String>['Disabled', 'Left', 'Right'],
        },
        'scrollGridButtonsPosition': {
          'type': 'stringFromList',
          'default': isDesktopPlatform ? 'Right' : 'Disabled',
          'options': <String>['Disabled', 'Left', 'Right'],
        },
        'videoBackendMode': {
          'type': 'videoBackendMode',
          'default': isDesktopPlatform ? VideoBackendMode.mpv : VideoBackendMode.defaultValue,
          'options': VideoBackendMode.values,
        },
        'altVideoPlayerVO': {
          'type': 'stringFromList',
          'default': isDesktopPlatform ? 'libmpv' : 'gpu', // mediakit default: gpu - android, libmpv - desktop
          'options': <String>[
            'gpu',
            'gpu-next',
            'libmpv',
            'mediacodec_embed',
            'sdl',
          ],
        },
        'altVideoPlayerHWDEC': {
          'type': 'stringFromList',
          'default': isDesktopPlatform ? 'auto' : 'auto-safe', // mediakit default: auto-safe - android, auto - desktop
          'options': <String>[
            'auto',
            'auto-safe',
            'auto-copy',
            'mediacodec',
            'mediacodec-copy',
            'vulkan',
            'vulkan-copy',
          ],
        },
        'proxyType': {
          'type': 'stringFromList',
          'default': 'direct',
          'options': <String>[
            'direct',
            'system',
            'http',
            'socks5',
            'socks4',
          ],
        },

        // string
        'defTags': {
          'type': 'string',
          'default': 'rating:safe',
        },
        'prefBooru': {
          'type': 'string',
          'default': '',
        },
        'extPathOverride': {
          'type': 'string',
          'default': '',
        },
        'drawerMascotPathOverride': {
          'type': 'string',
          'default': '',
        },
        'backupPath': {
          'type': 'string',
          'default': '',
        },
        'lastSyncIp': {
          'type': 'string',
          'default': '',
        },
        'lastSyncPort': {
          'type': 'string',
          'default': '',
        },
        'customUserAgent': {
          'type': 'string',
          'default': '',
        },
        'proxyAddress': {
          'type': 'string',
          'default': '',
        },
        'proxyUsername': {
          'type': 'string',
          'default': '',
        },
        'proxyPassword': {
          'type': 'string',
          'default': '',
        },

        // stringList
        'hatedTags': {
          'type': 'stringList',
          'default': <String>[],
        },
        'lovedTags': {
          'type': 'stringList',
          'default': <String>[],
        },
        'enabledLogTypes': {
          'type': 'logTypesList',
          'default': <LogTypes>[],
        },

        // int
        'limit': {
          'type': 'int',
          'default': Constants.defaultItemLimit,
          'step': 10,
          'upperLimit': 100,
          'lowerLimit': 10,
        },
        'portraitColumns': {
          'type': 'int',
          'default': 2,
          'step': 1,
          'upperLimit': 100,
          'lowerLimit': 1,
        },
        'landscapeColumns': {
          'type': 'int',
          'default': 4,
          'step': 1,
          'upperLimit': 100,
          'lowerLimit': 1,
        },
        'preloadCount': {
          'type': 'int',
          'default': 1,
          'step': 1,
          'upperLimit': 3,
          'lowerLimit': 0,
        },
        'snatchCooldown': {
          'type': 'int',
          'default': 250,
          'step': 50,
          'upperLimit': 10000,
          'lowerLimit': 0,
        },
        'volumeButtonsScrollSpeed': {
          'type': 'int',
          'default': 200,
          'step': 10,
          'upperLimit': 1000000,
          'lowerLimit': 0,
        },
        'galleryAutoScrollTime': {
          'type': 'int',
          'default': 4000,
          'step': 100,
          'upperLimit': 100000,
          'lowerLimit': 100,
        },
        'cacheSize': {
          'type': 'int',
          'default': 3,
          'step': 1,
          'upperLimit': 10,
          'lowerLimit': 0,
        },
        'autoLockTimeout': {
          'type': 'int',
          'default': 120,
          'step': 10,
          'upperLimit': double.infinity,
          'lowerLimit': 0,
        },

        // double
        'mousewheelScrollSpeed': {
          'type': 'double',
          'default': 10.0,
          'upperLimit': 20.0,
          'lowerLimit': 0.1,
          'step': 0.5,
        },
        'preloadSizeLimit': {
          'type': 'double',
          'default': 0.2,
          'upperLimit': double.infinity,
          'lowerLimit': 0.0,
          'step': 0.1,
        },

        // bool
        'jsonWrite': {
          'type': 'bool',
          'default': false,
        },
        'autoPlayEnabled': {
          'type': 'bool',
          'default': true,
        },
        'loadingGif': {
          'type': 'bool',
          'default': false,
        },
        'thumbnailCache': {
          'type': 'bool',
          'default': true,
        },
        'mediaCache': {
          'type': 'bool',
          'default': false,
        },
        'autoHideImageBar': {
          'type': 'bool',
          'default': false,
        },
        'dbEnabled': {
          'type': 'bool',
          'default': true,
        },
        'indexesEnabled': {
          'type': 'bool',
          'default': false,
        },
        'searchHistoryEnabled': {
          'type': 'bool',
          'default': true,
        },
        'filterHated': {
          'type': 'bool',
          'default': false,
        },
        'filterFavourites': {
          'type': 'bool',
          'default': false,
        },
        'filterSnatched': {
          'type': 'bool',
          'default': false,
        },
        'filterAi': {
          'type': 'bool',
          'default': false,
        },
        'useVolumeButtonsForScroll': {
          'type': 'bool',
          'default': false,
        },
        'shitDevice': {
          'type': 'bool',
          'default': false,
        },
        'disableVideo': {
          'type': 'bool',
          'default': false,
        },
        'enableDrawerMascot': {
          'type': 'bool',
          'default': false,
        },
        'allowSelfSignedCerts': {
          'type': 'bool',
          'default': false,
        },
        'disableImageScaling': {
          'type': 'bool',
          'default': false,
        },
        'gifsAsThumbnails': {
          'type': 'bool',
          'default': false,
        },
        'desktopListsDrag': {
          'type': 'bool',
          'default': false,
        },
        'wakeLockEnabled': {
          'type': 'bool',
          'default': true,
        },
        'tagTypeFetchEnabled': {
          'type': 'bool',
          'default': true,
        },
        'downloadNotifications': {
          'type': 'bool',
          'default': true,
        },
        'allowRotation': {
          'type': 'bool',
          'default': false,
        },
        'enableHeroTransitions': {
          'type': 'bool',
          'default': true,
        },
        'disableCustomPageTransitions': {
          'type': 'bool',
          'default': false,
        },
        'incognitoKeyboard': {
          'type': 'bool',
          'default': false,
        },
        'hideNotes': {
          'type': 'bool',
          'default': false,
        },
        'startVideosMuted': {
          'type': 'bool',
          'default': false,
        },
        'snatchOnFavourite': {
          'type': 'bool',
          'default': false,
        },
        'favouriteOnSnatch': {
          'type': 'bool',
          'default': false,
        },
        'disableVibration': {
          'type': 'bool',
          'default': false,
        },
        'useAltVideoPlayer': {
          'type': 'bool',
          'default': isDesktopPlatform,
        },
        'altVideoPlayerHwAccel': {
          'type': 'bool',
          'default': true,
        },
        'useLockscreen': {
          'type': 'rxbool',
          'default': false,
        },
        'blurOnLeave': {
          'type': 'rxbool',
          'default': false,
        },

        // other
        'buttonOrder': {
          'type': 'other',
          'default': <List<String>>[...buttonList],
        },
        'cacheDuration': {
          'type': 'duration',
          'default': Duration.zero,
          'options': <Map<String, dynamic>>[
            {'label': 'Never', 'value': Duration.zero},
            {'label': '30 minutes', 'value': const Duration(minutes: 30)},
            {'label': '1 hour', 'value': const Duration(hours: 1)},
            {'label': '6 hours', 'value': const Duration(hours: 6)},
            {'label': '12 hours', 'value': const Duration(hours: 12)},
            {'label': '1 day', 'value': const Duration(days: 1)},
            {'label': '2 days', 'value': const Duration(days: 2)},
            {'label': '1 week', 'value': const Duration(days: 7)},
            {'label': '1 month', 'value': const Duration(days: 30)},
          ],
        },

        // theme
        'appMode': {
          'type': 'appMode',
          'default': AppMode.defaultValue,
          'options': AppMode.values,
        },
        'handSide': {
          'type': 'handSide',
          'default': HandSide.defaultValue,
          'options': HandSide.values,
        },
        'theme': {
          'type': 'theme',
          'default': ThemeItem(name: 'Pink', primary: Colors.pink[200], accent: Colors.pink[600]),
          'options': <ThemeItem>[
            ThemeItem(name: 'Pink', primary: Colors.pink[200], accent: Colors.pink[600]),
            ThemeItem(name: 'Purple', primary: Colors.deepPurple[600], accent: Colors.deepPurple[800]),
            ThemeItem(name: 'Blue', primary: Colors.lightBlue, accent: Colors.lightBlue[600]),
            ThemeItem(name: 'Teal', primary: Colors.teal, accent: Colors.teal[600]),
            ThemeItem(name: 'Red', primary: Colors.red[700], accent: Colors.red[800]),
            ThemeItem(name: 'Green', primary: Colors.green, accent: Colors.green[700]),
            ThemeItem(name: 'Halloween', primary: const Color(0xFF0B192C), accent: const Color(0xFFEB5E28)),
            ThemeItem(name: 'Custom', primary: null, accent: null),
          ],
        },
        'themeMode': {
          'type': 'themeMode',
          'default': ThemeMode.dark,
          'options': ThemeMode.values,
        },
        'useDynamicColor': {
          'type': 'rxbool',
          'default': false.obs,
        },
        'isAmoled': {
          'type': 'rxbool',
          'default': false.obs,
        },
        'customPrimaryColor': {
          'type': 'rxcolor',
          'default': Colors.pink[200],
        },
        'customAccentColor': {
          'type': 'rxcolor',
          'default': Colors.pink[600],
        },
      };

  dynamic validateValue(String name, dynamic value, {bool toJSON = false}) {
    final Map<String, dynamic>? settingParams = map[name];

    if (toJSON) {
      value = getByString(name);
    }

    if (settingParams == null) {
      if (toJSON) {
        return value.toString();
      } else {
        return value;
      }
    }

    try {
      switch (settingParams['type']) {
        case 'stringFromList':
          final String validValue = List<String>.from(settingParams['options']!).firstWhere((el) => el == value, orElse: () => '');
          if (validValue != '') {
            return validValue;
          } else {
            return settingParams['default'];
          }

        case 'string':
          if (value is! String) {
            throw Exception('value "$value" for $name is not a String');
          } else {
            return value;
          }

        case 'int':
          final int? parse = (value is String) ? int.tryParse(value) : (value is int ? value : null);
          if (parse == null) {
            throw Exception('value "$value" of type ${value.runtimeType} for $name is not an int');
          } else if (parse < settingParams['lowerLimit'] || parse > settingParams['upperLimit']) {
            if (toJSON) {
              // force default value when not passing validation when saving
              setByString(name, settingParams['default']);
            }
            return settingParams['default'];
          } else {
            return parse;
          }

        case 'bool':
          if (value is! bool) {
            if (value is String && (value == 'true' || value == 'false')) {
              return value == 'true';
            } else {
              throw Exception('value "$value" for $name is not a bool');
            }
          } else {
            return value;
          }

        case 'rxbool':
          if (toJSON) {
            // rxbool to bool
            return (value as RxBool).value;
          } else {
            // bool to rxbool
            if (value is RxBool) {
              return value;
            } else if (value is bool) {
              return value.obs;
            } else {
              throw Exception('value "$value" for $name is not a rxbool');
            }
          }

        case 'appMode':
          if (toJSON) {
            // rxobject to string
            return (value as Rx<AppMode>).value.toString();
          } else {
            if (value is String) {
              // string to rxobject
              return AppMode.fromString(value);
            } else {
              return settingParams['default'];
            }
          }

        case 'handSide':
          if (toJSON) {
            // rxobject to string
            return (value as Rx<HandSide>).value.toString();
          } else {
            if (value is String) {
              // string to rxobject
              return HandSide.fromString(value);
            } else {
              return settingParams['default'];
            }
          }

        case 'videoBackendMode':
          if (toJSON) {
            return (value as VideoBackendMode).toString();
          } else {
            if (value is String) {
              return VideoBackendMode.fromString(value);
            } else {
              return settingParams['default'];
            }
          }

        case 'logTypesList':
          if (toJSON) {
            // rxobject to list<string>
            return (value as RxList<LogTypes>).map((el) => el.toString()).toList();
          } else {
            if (value is List) {
              // list<string> to list<LogTypes>
              return List<String>.from(value).map(LogTypes.fromString).toList();
            } else {
              return settingParams['default'];
            }
          }

        case 'theme':
          if (toJSON) {
            // rxobject to string
            return (value as Rx<ThemeItem>).value.name;
          } else {
            if (value is String) {
              // string to rxobject
              final ThemeItem findTheme =
                  List<ThemeItem>.from(settingParams['options']!).firstWhere((el) => el.name == value, orElse: () => settingParams['default']);
              return findTheme;
            } else {
              return settingParams['default'];
            }
          }

        case 'themeMode':
          if (toJSON) {
            // rxobject to string
            return (value as Rx<ThemeMode>).value.toString().split('.')[1]; // ThemeMode.dark => dark
          } else {
            if (value is String) {
              // string to rxobject
              final List<ThemeMode> findMode = ThemeMode.values.where((element) => element.toString() == 'ThemeMode.$value').toList();
              if (findMode.isNotEmpty) {
                // if theme mode is present
                return findMode[0];
              } else {
                // if not theme mode with given name
                return settingParams['default'];
              }
            } else {
              return settingParams['default'];
            }
          }

        case 'rxcolor':
          if (toJSON) {
            // rxobject to int
            // TODO replace value with toARGB32() in the next flutter release
            // ignore: deprecated_member_use
            return (value as Rx<Color?>).value?.value ?? Colors.pink.value; // Color => int
          } else {
            // int to rxobject
            if (value is int) {
              return Color(value);
            } else {
              return settingParams['default'];
            }
          }

        case 'duration':
          if (toJSON) {
            return (value as Duration).inSeconds; // Duration => int
          } else {
            if (value is Duration) {
              return value;
            } else if (value is int) {
              // int to Duration
              return Duration(seconds: value);
            } else {
              return settingParams['default'];
            }
          }

        // case 'stringList':
        default:
          return value;
      }
    } catch (e, s) {
      // return default value on exceptions
      Logger.Inst().log(
        'value validation error: $e',
        'SettingsHandler',
        'validateValue',
        null,
        s: s,
      );
      return settingParams['default'];
    }
  }

  Future<bool> loadSettings() async {
    if (path == '') {
      await setConfigDir();
    }
    if (cachePath == '') {
      cachePath = await ServiceHandler.getCacheDir();
    }

    if (await checkForSettings()) {
      await loadSettingsJson();
    } else {
      await saveSettings(restate: true);
    }
    return true;
  }

  Future<bool> loadDatabase() async {
    try {
      if (!Tools.isTestMode) {
        if (dbEnabled) {
          await dbHandler.dbConnect(path);
        } else {
          dbHandler = DBHandler();
        }
      }
      return true;
    } catch (e, s) {
      Logger.Inst().log(
        'loadDatabase error: $e',
        'SettingsHandler',
        'loadDatabase',
        LogTypes.exception,
        s: s,
      );
      return false;
    }
  }

  Future<bool> indexDatabase() async {
    try {
      if (!Tools.isTestMode) {
        if (dbEnabled) {
          if (indexesEnabled) {
            postInitMessage.value = 'Indexing database...\nThis may take a while';
            await dbHandler.createIndexes();
          } else {
            postInitMessage.value = 'Dropping indexes...\nThis may take a while';
            await dbHandler.dropIndexes();
          }
        }
      }
      return true;
    } catch (e, s) {
      Logger.Inst().log(
        'indexDatabase error: $e',
        'SettingsHandler',
        'indexDatabase',
        LogTypes.exception,
        s: s,
      );
      return false;
    }
  }

  Future<bool> checkForSettings() {
    final File settingsFile = File('${path}settings.json');
    return settingsFile.exists();
  }

  Future<void> loadSettingsJson() async {
    final File settingsFile = File('${path}settings.json');
    final String settings = await settingsFile.readAsString();
    // print('loadJSON $settings');
    await loadFromJSON(settings, true);
    return;
  }

  dynamic getByString(String varName) {
    switch (varName) {
      case 'defTags':
        return defTags;
      case 'previewMode':
        return previewMode;
      case 'videoCacheMode':
        return videoCacheMode;
      case 'previewDisplay':
        return previewDisplay;
      case 'galleryMode':
        return galleryMode;
      case 'snatchMode':
        return snatchMode;
      case 'shareAction':
        return shareAction;
      case 'limit':
        return itemLimit;
      case 'portraitColumns':
        return portraitColumns;
      case 'landscapeColumns':
        return landscapeColumns;
      case 'preloadCount':
        return preloadCount;
      case 'snatchCooldown':
        return snatchCooldown;
      case 'galleryBarPosition':
        return galleryBarPosition;
      case 'galleryScrollDirection':
        return galleryScrollDirection;
      case 'buttonOrder':
        return buttonOrder;
      case 'hatedTags':
        return hatedTags;
      case 'lovedTags':
        return lovedTags;
      case 'autoPlayEnabled':
        return autoPlayEnabled;
      case 'loadingGif':
        return loadingGif;
      case 'thumbnailCache':
        return thumbnailCache;
      case 'mediaCache':
        return mediaCache;
      case 'autoHideImageBar':
        return autoHideImageBar;
      case 'dbEnabled':
        return dbEnabled;
      case 'indexesEnabled':
        return indexesEnabled;
      case 'searchHistoryEnabled':
        return searchHistoryEnabled;
      case 'filterHated':
        return filterHated;
      case 'filterFavourites':
        return filterFavourites;
      case 'filterSnatched':
        return filterSnatched;
      case 'filterAi':
        return filterAi;
      case 'useVolumeButtonsForScroll':
        return useVolumeButtonsForScroll;
      case 'volumeButtonsScrollSpeed':
        return volumeButtonsScrollSpeed;
      case 'mousewheelScrollSpeed':
        return mousewheelScrollSpeed;
      case 'preloadSizeLimit':
        return preloadSizeLimit;
      case 'disableVideo':
        return disableVideo;
      case 'shitDevice':
        return shitDevice;
      case 'galleryAutoScrollTime':
        return galleryAutoScrollTime;
      case 'jsonWrite':
        return jsonWrite;
      case 'zoomButtonPosition':
        return zoomButtonPosition;
      case 'changePageButtonsPosition':
        return changePageButtonsPosition;
      case 'scrollGridButtonsPosition':
        return scrollGridButtonsPosition;
      case 'disableImageScaling':
        return disableImageScaling;
      case 'gifsAsThumbnails':
        return gifsAsThumbnails;
      case 'desktopListsDrag':
        return desktopListsDrag;
      case 'cacheDuration':
        return cacheDuration;
      case 'cacheSize':
        return cacheSize;
      case 'autoLockTimeout':
        return autoLockTimeout;
      case 'allowSelfSignedCerts':
        return allowSelfSignedCerts;
      case 'useLockscreen':
        return useLockscreen;
      case 'blurOnLeave':
        return blurOnLeave;
      case 'enabledLogTypes':
        return enabledLogTypes;

      case 'prefBooru':
        return prefBooru;
      case 'extPathOverride':
        return extPathOverride;
      case 'drawerMascotPathOverride':
        return drawerMascotPathOverride;
      case 'backupPath':
        return backupPath;
      case 'enableDrawerMascot':
        return enableDrawerMascot;
      case 'lastSyncIp':
        return lastSyncIp;
      case 'lastSyncPort':
        return lastSyncPort;
      case 'customUserAgent':
        return customUserAgent;
      case 'proxyType':
        return proxyType;
      case 'proxyAddress':
        return proxyAddress;
      case 'proxyUsername':
        return proxyUsername;
      case 'proxyPassword':
        return proxyPassword;
      case 'wakeLockEnabled':
        return wakeLockEnabled;
      case 'tagTypeFetchEnabled':
        return tagTypeFetchEnabled;
      case 'downloadNotifications':
        return downloadNotifications;
      case 'allowRotation':
        return allowRotation;
      case 'enableHeroTransitions':
        return enableHeroTransitions;
      case 'disableCustomPageTransitions':
        return disableCustomPageTransitions;
      case 'incognitoKeyboard':
        return incognitoKeyboard;
      case 'hideNotes':
        return hideNotes;
      case 'startVideosMuted':
        return startVideosMuted;
      case 'snatchOnFavourite':
        return snatchOnFavourite;
      case 'favouriteOnSnatch':
        return favouriteOnSnatch;
      case 'disableVibration':
        return disableVibration;
      case 'videoBackendMode':
        return videoBackendMode;
      case 'altVideoPlayerHwAccel':
        return altVideoPlayerHwAccel;
      case 'altVideoPlayerVO':
        return altVideoPlayerVO;
      case 'altVideoPlayerHWDEC':
        return altVideoPlayerHWDEC;
      // theme stuff
      case 'appMode':
        return appMode;
      case 'handSide':
        return handSide;
      case 'theme':
        return theme;
      case 'themeMode':
        return themeMode;
      case 'useDynamicColor':
        return useDynamicColor;
      case 'isAmoled':
        return isAmoled;
      case 'customPrimaryColor':
        return customPrimaryColor;
      case 'customAccentColor':
        return customAccentColor;
      default:
        return null;
    }
  }

  dynamic setByString(String varName, dynamic value) {
    final dynamic validatedValue = validateValue(varName, value);
    //Could this just be replaced with getByString(varName) = validatedValue?
    switch (varName) {
      case 'defTags':
        defTags = validatedValue;
        break;
      case 'previewMode':
        previewMode = validatedValue;
        break;
      case 'videoCacheMode':
        videoCacheMode = validatedValue;
        break;
      case 'previewDisplay':
        previewDisplay = validatedValue;
        break;
      case 'galleryMode':
        galleryMode = validatedValue;
        break;
      case 'snatchMode':
        snatchMode = validatedValue;
        break;
      case 'shareAction':
        shareAction = validatedValue;
        break;
      case 'limit':
        itemLimit = validatedValue;
        break;
      case 'portraitColumns':
        portraitColumns = validatedValue;
        break;
      case 'landscapeColumns':
        landscapeColumns = validatedValue;
        break;
      case 'preloadCount':
        preloadCount = validatedValue;
        break;
      case 'snatchCooldown':
        snatchCooldown = validatedValue;
        break;
      case 'galleryBarPosition':
        galleryBarPosition = validatedValue;
        break;
      case 'galleryScrollDirection':
        galleryScrollDirection = validatedValue;
        break;

      // TODO special cases
      // case 'buttonOrder':
      //   buttonOrder = validatedValue;
      //   break;
      // case 'hatedTags':
      //   hatedTags = validatedValue;
      //   break;
      // case 'lovedTags':
      //   lovedTags = validatedValue;
      //   break;
      case 'autoPlayEnabled':
        autoPlayEnabled = validatedValue;
        break;
      case 'loadingGif':
        loadingGif = validatedValue;
        break;
      case 'thumbnailCache':
        thumbnailCache = validatedValue;
        break;
      case 'mediaCache':
        mediaCache = validatedValue;
        break;
      case 'autoHideImageBar':
        autoHideImageBar = validatedValue;
        break;
      case 'dbEnabled':
        dbEnabled = validatedValue;
        break;
      case 'indexesEnabled':
        indexesEnabled = validatedValue;
        break;
      case 'searchHistoryEnabled':
        searchHistoryEnabled = validatedValue;
        break;
      case 'filterHated':
        filterHated = validatedValue;
        break;
      case 'filterFavourites':
        filterFavourites = validatedValue;
        break;
      case 'filterSnatched':
        filterSnatched = validatedValue;
        break;
      case 'filterAi':
        filterAi = validatedValue;
        break;
      case 'useVolumeButtonsForScroll':
        useVolumeButtonsForScroll = validatedValue;
        break;
      case 'volumeButtonsScrollSpeed':
        volumeButtonsScrollSpeed = validatedValue;
        break;
      case 'mousewheelScrollSpeed':
        mousewheelScrollSpeed = validatedValue;
        break;
      case 'preloadSizeLimit':
        preloadSizeLimit = validatedValue;
        break;
      case 'disableVideo':
        disableVideo = validatedValue;
        break;
      case 'shitDevice':
        shitDevice = validatedValue;
        break;
      case 'galleryAutoScrollTime':
        galleryAutoScrollTime = validatedValue;
        break;
      case 'jsonWrite':
        jsonWrite = validatedValue;
        break;
      case 'zoomButtonPosition':
        zoomButtonPosition = validatedValue;
        break;
      case 'changePageButtonsPosition':
        changePageButtonsPosition = validatedValue;
        break;
      case 'scrollGridButtonsPosition':
        scrollGridButtonsPosition = validatedValue;
        break;
      case 'disableImageScaling':
        disableImageScaling = validatedValue;
        break;
      case 'gifsAsThumbnails':
        gifsAsThumbnails = validatedValue;
        break;
      case 'desktopListsDrag':
        desktopListsDrag = validatedValue;
        break;
      case 'cacheDuration':
        cacheDuration = validatedValue;
        break;
      case 'cacheSize':
        cacheSize = validatedValue;
        break;
      case 'autoLockTimeout':
        autoLockTimeout = validatedValue;
        break;
      case 'prefBooru':
        prefBooru = validatedValue;
        break;
      case 'extPathOverride':
        extPathOverride = validatedValue;
        break;
      case 'backupPath':
        backupPath = validatedValue;
        break;
      case 'lastSyncIp':
        lastSyncIp = validatedValue;
        break;
      case 'lastSyncPort':
        lastSyncPort = validatedValue;
        break;
      case 'customUserAgent':
        customUserAgent = validatedValue;
        break;
      case 'proxyType':
        proxyType = validatedValue;
        break;
      case 'proxyAddress':
        proxyAddress = validatedValue;
        break;
      case 'proxyUsername':
        proxyUsername = validatedValue;
        break;
      case 'proxyPassword':
        proxyPassword = validatedValue;
        break;
      case 'allowSelfSignedCerts':
        allowSelfSignedCerts = validatedValue;
        break;
      case 'enabledLogTypes':
        enabledLogTypes.value = validatedValue;
        break;
      case 'wakeLockEnabled':
        wakeLockEnabled = validatedValue;
        break;
      case 'tagTypeFetchEnabled':
        tagTypeFetchEnabled = validatedValue;
        break;
      case 'downloadNotifications':
        downloadNotifications = validatedValue;
        break;
      case 'allowRotation':
        allowRotation = validatedValue;
        break;
      case 'enableHeroTransitions':
        enableHeroTransitions = validatedValue;
        break;
      case 'disableCustomPageTransitions':
        disableCustomPageTransitions = validatedValue;
        break;
      case 'incognitoKeyboard':
        incognitoKeyboard = validatedValue;
        break;
      case 'hideNotes':
        hideNotes = validatedValue;
        break;
      case 'startVideosMuted':
        startVideosMuted = validatedValue;
        break;
      case 'snatchOnFavourite':
        snatchOnFavourite = validatedValue;
        break;
      case 'favouriteOnSnatch':
        favouriteOnSnatch = validatedValue;
        break;
      case 'disableVibration':
        disableVibration = validatedValue;
        break;
      case 'videoBackendMode':
        videoBackendMode = validatedValue;
        break;
      case 'altVideoPlayerHwAccel':
        altVideoPlayerHwAccel = validatedValue;
        break;
      case 'altVideoPlayerVO':
        altVideoPlayerVO = validatedValue;
        break;
      case 'altVideoPlayerHWDEC':
        altVideoPlayerHWDEC = validatedValue;
        break;
      case 'useLockscreen':
        useLockscreen = validatedValue;
        break;
      case 'blurOnLeave':
        blurOnLeave = validatedValue;
        break;

      // theme stuff
      case 'appMode':
        appMode.value = validatedValue;
        break;
      case 'handSide':
        handSide.value = validatedValue;
        break;
      case 'theme':
        theme.value = validatedValue;
        break;
      case 'themeMode':
        themeMode.value = validatedValue;
        break;
      case 'useDynamicColor':
        useDynamicColor = validatedValue;
        break;
      case 'isAmoled':
        isAmoled = validatedValue;
        break;
      case 'customPrimaryColor':
        customPrimaryColor.value = validatedValue;
        break;
      case 'customAccentColor':
        customAccentColor.value = validatedValue;
        break;
      case 'drawerMascotPathOverride':
        drawerMascotPathOverride = validatedValue;
        break;
      case 'enableDrawerMascot':
        enableDrawerMascot = validatedValue;
        break;
      default:
        break;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      'defTags': validateValue('defTags', null, toJSON: true),
      'previewMode': validateValue('previewMode', null, toJSON: true),
      'videoCacheMode': validateValue('videoCacheMode', null, toJSON: true),
      'previewDisplay': validateValue('previewDisplay', null, toJSON: true),
      'galleryMode': validateValue('galleryMode', null, toJSON: true),
      'snatchMode': validateValue('snatchMode', null, toJSON: true),
      'shareAction': validateValue('shareAction', null, toJSON: true),
      'limit': validateValue('limit', null, toJSON: true),
      'portraitColumns': validateValue('portraitColumns', null, toJSON: true),
      'landscapeColumns': validateValue('landscapeColumns', null, toJSON: true),
      'preloadCount': validateValue('preloadCount', null, toJSON: true),
      'snatchCooldown': validateValue('snatchCooldown', null, toJSON: true),
      'galleryBarPosition': validateValue('galleryBarPosition', null, toJSON: true),
      'galleryScrollDirection': validateValue('galleryScrollDirection', null, toJSON: true),
      'jsonWrite': validateValue('jsonWrite', null, toJSON: true),
      'autoPlayEnabled': validateValue('autoPlayEnabled', null, toJSON: true),
      'loadingGif': validateValue('loadingGif', null, toJSON: true),
      'thumbnailCache': validateValue('thumbnailCache', null, toJSON: true),
      'mediaCache': validateValue('mediaCache', null, toJSON: true),
      'autoHideImageBar': validateValue('autoHideImageBar', null, toJSON: true),
      'dbEnabled': validateValue('dbEnabled', null, toJSON: true),
      'indexesEnabled': validateValue('indexesEnabled', null, toJSON: true),
      'searchHistoryEnabled': validateValue('searchHistoryEnabled', null, toJSON: true),
      'filterHated': validateValue('filterHated', null, toJSON: true),
      'filterFavourites': validateValue('filterFavourites', null, toJSON: true),
      'filterSnatched': validateValue('filterSnatched', null, toJSON: true),
      'filterAi': validateValue('filterAi', null, toJSON: true),
      'useVolumeButtonsForScroll': validateValue('useVolumeButtonsForScroll', null, toJSON: true),
      'volumeButtonsScrollSpeed': validateValue('volumeButtonsScrollSpeed', null, toJSON: true),
      'mousewheelScrollSpeed': validateValue('mousewheelScrollSpeed', null, toJSON: true),
      'preloadSizeLimit': validateValue('preloadSizeLimit', null, toJSON: true),
      'disableVideo': validateValue('disableVideo', null, toJSON: true),
      'shitDevice': validateValue('shitDevice', null, toJSON: true),
      'galleryAutoScrollTime': validateValue('galleryAutoScrollTime', null, toJSON: true),
      'zoomButtonPosition': validateValue('zoomButtonPosition', null, toJSON: true),
      'changePageButtonsPosition': validateValue('changePageButtonsPosition', null, toJSON: true),
      'scrollGridButtonsPosition': validateValue('scrollGridButtonsPosition', null, toJSON: true),
      'disableImageScaling': validateValue('disableImageScaling', null, toJSON: true),
      'gifsAsThumbnails': validateValue('gifsAsThumbnails', null, toJSON: true),
      'desktopListsDrag': validateValue('desktopListsDrag', null, toJSON: true),
      'cacheDuration': validateValue('cacheDuration', null, toJSON: true),
      'cacheSize': validateValue('cacheSize', null, toJSON: true),
      'autoLockTimeout': validateValue('autoLockTimeout', null, toJSON: true),
      'allowSelfSignedCerts': validateValue('allowSelfSignedCerts', null, toJSON: true),
      'enabledLogTypes': validateValue('enabledLogTypes', null, toJSON: true),
      'wakeLockEnabled': validateValue('wakeLockEnabled', null, toJSON: true),
      'tagTypeFetchEnabled': validateValue('tagTypeFetchEnabled', null, toJSON: true),
      'downloadNotifications': validateValue('downloadNotifications', null, toJSON: true),
      'allowRotation': validateValue('allowRotation', null, toJSON: true),
      'enableHeroTransitions': validateValue('enableHeroTransitions', null, toJSON: true),
      'disableCustomPageTransitions': validateValue('disableCustomPageTransitions', null, toJSON: true),
      'incognitoKeyboard': validateValue('incognitoKeyboard', null, toJSON: true),
      'hideNotes': validateValue('hideNotes', null, toJSON: true),
      'startVideosMuted': validateValue('startVideosMuted', null, toJSON: true),
      'snatchOnFavourite': validateValue('snatchOnFavourite', null, toJSON: true),
      'favouriteOnSnatch': validateValue('favouriteOnSnatch', null, toJSON: true),
      'disableVibration': validateValue('disableVibration', null, toJSON: true),
      'videoBackendMode': validateValue('videoBackendMode', null, toJSON: true),
      'altVideoPlayerHwAccel': validateValue('altVideoPlayerHwAccel', null, toJSON: true),
      'altVideoPlayerVO': validateValue('altVideoPlayerVO', null, toJSON: true),
      'altVideoPlayerHWDEC': validateValue('altVideoPlayerHWDEC', null, toJSON: true),
      'useLockscreen': validateValue('useLockscreen', null, toJSON: true),
      'blurOnLeave': validateValue('blurOnLeave', null, toJSON: true),

      //TODO
      'buttonOrder': buttonOrder.map((e) => e[0]).toList(),
      'hatedTags': cleanTagsList(hatedTags),
      'lovedTags': cleanTagsList(lovedTags),

      'prefBooru': validateValue('prefBooru', null, toJSON: true),
      'appMode': validateValue('appMode', null, toJSON: true),
      'handSide': validateValue('handSide', null, toJSON: true),
      'extPathOverride': validateValue('extPathOverride', null, toJSON: true),
      'backupPath': validateValue('backupPath', null, toJSON: true),
      'lastSyncIp': validateValue('lastSyncIp', null, toJSON: true),
      'lastSyncPort': validateValue('lastSyncPort', null, toJSON: true),
      'customUserAgent': validateValue('customUserAgent', null, toJSON: true),
      'proxyType': validateValue('proxyType', null, toJSON: true),
      'proxyAddress': validateValue('proxyAddress', null, toJSON: true),
      'proxyUsername': validateValue('proxyUsername', null, toJSON: true),
      'proxyPassword': validateValue('proxyPassword', null, toJSON: true),

      'theme': validateValue('theme', null, toJSON: true),
      'themeMode': validateValue('themeMode', null, toJSON: true),
      'useDynamicColor': validateValue('useDynamicColor', null, toJSON: true),
      'isAmoled': validateValue('isAmoled', null, toJSON: true),
      'enableDrawerMascot': validateValue('enableDrawerMascot', null, toJSON: true),
      'drawerMascotPathOverride': validateValue('drawerMascotPathOverride', null, toJSON: true),
      'customPrimaryColor': validateValue('customPrimaryColor', null, toJSON: true),
      'customAccentColor': validateValue('customAccentColor', null, toJSON: true),
      'version': Constants.appVersion,
      'build': Constants.appBuildNumber,
    };

    // print('JSON $json');
    return json;
  }

  Future<bool> loadFromJSON(String jsonString, bool setMissingKeys) async {
    Map<String, dynamic> json = {};
    try {
      json = jsonDecode(jsonString);
    } catch (e, s) {
      Logger.Inst().log(
        'Failed to parse settings config $e',
        'SettingsHandler',
        'loadFromJSON',
        LogTypes.exception,
        s: s,
      );
    }

    // TODO add error handling for invalid values
    // (don't allow user to exit the page until the value is correct? or just set to default (current behaviour)? mix of both?)

    try {
      dynamic tempBtnOrder = json['buttonOrder'];
      if (tempBtnOrder is List) {
        // print('btnorder is a list');
      } else if (tempBtnOrder is String) {
        // print('btnorder is a string');
        tempBtnOrder = tempBtnOrder.split(',');
      } else {
        // print('btnorder is a ${tempBtnOrder.runtimeType} type');
        tempBtnOrder = [];
      }
      final List<List<String>> btnOrder = List<String>.from(tempBtnOrder)
          .map((bstr) {
            final List<String> button = buttonList.singleWhere((el) => el[0] == bstr, orElse: () => ['null', 'null']);
            return button;
          })
          .where((el) => el[0] != 'null')
          .toList();
      btnOrder.addAll(
        buttonList.where(
          (el) => !btnOrder.contains(el),
        ),
      ); // add all buttons that are not present in the parsed list (future proofing, in case we add more buttons later)
      buttonOrder = btnOrder;
    } catch (e, s) {
      Logger.Inst().log(
        'Failed to parse button order $e',
        'SettingsHandler',
        'loadFromJSON',
        LogTypes.exception,
        s: s,
      );
    }

    try {
      dynamic tempHatedTags = json['hatedTags'];
      if (tempHatedTags is List) {
        // print('hatedTags is a list');
      } else if (tempHatedTags is String) {
        // print('hatedTags is a string');
        tempHatedTags = tempHatedTags.split(',');
      } else {
        // print('hatedTags is a ${tempHatedTags.runtimeType} type');
        tempHatedTags = [];
      }
      final List<String> hateTags = List<String>.from(tempHatedTags);
      for (int i = 0; i < hateTags.length; i++) {
        if (!hatedTags.contains(hateTags.elementAt(i))) {
          hatedTags.add(hateTags.elementAt(i));
        }
      }
    } catch (e, s) {
      Logger.Inst().log(
        'Failed to parse hated tags $e',
        'SettingsHandler',
        'loadFromJSON',
        LogTypes.exception,
        s: s,
      );
    }

    try {
      dynamic tempLovedTags = json['lovedTags'];
      if (tempLovedTags is List) {
        // print('lovedTags is a list');
      } else if (tempLovedTags is String) {
        // print('lovedTags is a string');
        tempLovedTags = tempLovedTags.split(',');
      } else {
        // print('lovedTags is a ${tempLovedTags.runtimeType} type');
        tempLovedTags = [];
      }
      final List<String> loveTags = List<String>.from(tempLovedTags);
      for (int i = 0; i < loveTags.length; i++) {
        if (!lovedTags.contains(loveTags.elementAt(i))) {
          lovedTags.add(loveTags.elementAt(i));
        }
      }
    } catch (e, s) {
      Logger.Inst().log(
        'Failed to parse loved tags $e',
        'SettingsHandler',
        'loadFromJSON',
        LogTypes.exception,
        s: s,
      );
    }

    final List<String> leftoverKeys = json.keys.where((element) => !['buttonOrder', 'hatedTags', 'lovedTags'].contains(element)).toList();
    for (final String key in leftoverKeys) {
      try {
        setByString(key, json[key]);
      } catch (e, s) {
        Logger.Inst().log(
          'Failed to set value for key $key',
          'SettingsHandler',
          'loadFromJSON',
          LogTypes.exception,
          s: s,
        );
      }
      // print('key $key val ${json[key]} type ${json[key].runtimeType}');
    }

    if (setMissingKeys) {
      // find all keys that are missing in the file and set them to default values
      map.forEach((key, value) {
        if (!json.keys.contains(key)) {
          if (map[key] != null) {
            setByString(key, map[key]!['default']);
          }
        }
      });
    }

    try {
      final List<String> legacyKeys = [
        'useAltVideoPlayer',
      ];
      for (final String key in legacyKeys) {
        if (json.keys.contains(key)) {
          switch (key) {
            case 'useAltVideoPlayer':
              setByString(
                'videoBackendMode',
                (json[key] is bool && json[key]) ? VideoBackendMode.mpv.name : videoBackendMode.name,
              );
              break;
          }
        }
      }
    } catch (e, s) {
      Logger.Inst().log(
        'Failed to parse legacy keys $e',
        'SettingsHandler',
        'loadFromJSON',
        LogTypes.exception,
        s: s,
      );
    }

    // Force enable logging on test builds
    enabledLogTypes.value = EnvironmentConfig.isTesting ? [...LogTypes.values] : [...enabledLogTypes];

    return true;
  }

  Future<bool> saveSettings({required bool restate}) async {
    await getPerms();
    if (path == '') {
      await setConfigDir();
    }
    await Directory(path).create(recursive: true);
    final File settingsFile = File('${path}settings.json');
    final writer = settingsFile.openWrite();
    writer.write(jsonEncode(toJson()));
    await writer.close();

    if (restate) {
      final searchHandler = SearchHandler.instance;
      searchHandler.filterCurrentFetched(); // refilter fetched because user could have changed the filtering settings
      unawaited(
        Future.delayed(const Duration(seconds: 1)).then((_) {
          searchHandler.rootRestate?.call(); // force global state update to redraw stuff
        }),
      );
    }
    return true;
  }

  Future<bool> loadBoorus() async {
    final List<Booru> tempList = [];
    try {
      if (path == '') {
        await setConfigDir();
      }

      final Directory directory = Directory(boorusPath);
      List<FileSystemEntity> files = [];
      if (await directory.exists()) {
        files = await directory.list().toList();
      }

      if (files.isNotEmpty) {
        for (int i = 0; i < files.length; i++) {
          if (files[i].path.contains('.json')) {
            // && files[i].path != 'settings.json'
            // print(files[i].toString());
            final File booruFile = files[i] as File;
            final Booru booruFromFile = Booru.fromJSON(await booruFile.readAsString());
            final bool isAllowed = BooruType.saveable.contains(booruFromFile.type);
            if (isAllowed) {
              tempList.add(booruFromFile);
            } else {
              await booruFile.delete();
            }

            if (booruFromFile.type == BooruType.Hydrus) {
              hasHydrus = true;
            }
          }
        }
      }

      if (dbEnabled && tempList.isNotEmpty) {
        tempList.add(Booru('Favourites', BooruType.Favourites, '', '', ''));
        tempList.add(Booru('Downloads', BooruType.Downloads, '', '', ''));
      }
    } catch (e, s) {
      Logger.Inst().log(
        'Failed to load boorus $e',
        'SettingsHandler',
        'loadBoorus',
        LogTypes.exception,
        s: s,
      );
    }

    booruList.value = tempList.where((element) => !booruList.contains(element)).toList(); // filter due to possibility of duplicates

    if (tempList.isNotEmpty) {
      unawaited(sortBooruList());
    }
    return true;
  }

  Future<void> sortBooruList() async {
    final List<Booru> sorted = [...booruList]; // spread the array just in case, to guarantee that we don't affect the original value
    sorted.sort((a, b) {
      // sort alphabetically
      return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
    });

    int prefIndex = 0;
    for (int i = 0; i < sorted.length; i++) {
      if (sorted[i].name == prefBooru && prefBooru.isNotEmpty) {
        prefIndex = i;
        // print("prefIndex is" + prefIndex.toString());
      }
    }
    if (prefIndex != 0) {
      // move default booru to top
      // print("Booru pref found in booruList");
      final Booru tmp = sorted.elementAt(prefIndex);
      sorted.remove(tmp);
      sorted.insert(0, tmp);
      // print("booruList is");
      // print(sorted);
    }

    final int favsIndex = sorted.indexWhere((el) => el.type == BooruType.Favourites);
    if (favsIndex != -1) {
      // move favourites to the end
      final Booru tmp = sorted.elementAt(favsIndex);
      sorted.remove(tmp);
      sorted.add(tmp);
    }

    final int dlsIndex = sorted.indexWhere((el) => el.type == BooruType.Downloads);
    if (dlsIndex != -1) {
      // move downloads to the end
      final Booru tmp = sorted.elementAt(dlsIndex);
      sorted.remove(tmp);
      sorted.add(tmp);
    }

    booruList.value = sorted;
  }

  Future saveBooru(Booru booru, {bool onlySave = false}) async {
    if (path == '') {
      await setConfigDir();
    }

    await Directory(boorusPath).create(recursive: true);
    final File booruFile = File('$boorusPath${booru.name}.json');
    final writer = booruFile.openWrite();
    writer.write(jsonEncode(booru.toJson()));
    await writer.close();

    if (!onlySave) {
      // used only to avoid duplication after migration to json format
      // TODO remove condition when migration logic is removed
      booruList.add(booru);
      unawaited(sortBooruList());
    }
    return true;
  }

  Future<bool> deleteBooru(Booru booru) async {
    final File booruFile = File('$boorusPath${booru.name}.json');
    await booruFile.delete();
    if (prefBooru == booru.name) {
      prefBooru = '';
      await saveSettings(restate: true);
    }
    booruList.remove(booru);
    unawaited(sortBooruList());
    return true;
  }

  // TODO add more tags?
  static const List<String> soundTags = [
    'sound',
    'sound_edit',
    'has_audio',
    'voice_acted',
  ];

  static const List<String> aiTags = [
    'ai_assisted',
    'ai-assisted',
    'ai_created',
    'ai-created',
    'ai_generated',
    'ai-generated',
    'novelai',
    'stable_diffusion',
    'stable-diffusion',
  ];

  TagsListData parseTagsList(List<String> itemTags, {bool isCapped = true}) {
    final List<String> cleanItemTags = cleanTagsList(itemTags);
    List<String> hatedInItem = hatedTags.where(cleanItemTags.contains).toList();
    List<String> lovedInItem = lovedTags.where(cleanItemTags.contains).toList();
    final List<String> soundInItem = soundTags.where(cleanItemTags.contains).toList();
    final List<String> aiInItem = aiTags.where(cleanItemTags.contains).toList();

    if (isCapped) {
      if (hatedInItem.length > 5) {
        hatedInItem = [...hatedInItem.take(5), '...'];
      }
      if (lovedInItem.length > 5) {
        lovedInItem = [...lovedInItem.take(5), '...'];
      }
    }

    return TagsListData(hatedInItem, lovedInItem, soundInItem, aiInItem);
  }

  bool containsHated(List<String> itemTags) {
    return hatedTags.where(itemTags.contains).isNotEmpty;
  }

  bool containsLoved(List<String> itemTags) {
    return lovedTags.where(itemTags.contains).isNotEmpty;
  }

  bool containsSound(List<String> itemTags) {
    return soundTags.where(itemTags.contains).isNotEmpty;
  }

  bool containsAI(List<String> itemTags) {
    return aiTags.where(itemTags.contains).isNotEmpty;
  }

  void addTagToList(String type, String tag) {
    switch (type) {
      case 'hated':
        if (!hatedTags.contains(tag)) {
          hatedTags.add(tag);
        }
        break;
      case 'loved':
        if (!lovedTags.contains(tag)) {
          lovedTags.add(tag);
        }
        break;
      default:
        break;
    }
    saveSettings(restate: false);
  }

  void removeTagFromList(String type, String tag) {
    switch (type) {
      case 'hated':
        if (hatedTags.contains(tag)) {
          hatedTags.remove(tag);
        }
        break;
      case 'loved':
        if (lovedTags.contains(tag)) {
          lovedTags.remove(tag);
        }
        break;
      default:
        break;
    }
    saveSettings(restate: false);
  }

  List<String> cleanTagsList(List<String> tags) {
    List<String> cleanTags = [];
    cleanTags = tags.where((tag) => tag.isNotEmpty).map((tag) => tag.trim().toLowerCase()).toList();
    cleanTags.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return cleanTags;
  }

  Future<void> checkUpdate({bool withMessage = false}) async {
    if (Tools.isTestMode) {
      return;
    }

    const String changelog = '''Changelog''';
    // ignore: unused_local_variable
    final Map<String, dynamic> fakeUpdate = {
      'version_name': '2.2.0',
      'build_number': 170,
      'title': 'Title',
      'changelog': changelog,
      'is_in_store': true, // is app still in store
      'is_update_in_store':
          true, // is update available in store [LEGACY], after 2.2.0 hits the store - left this in update.json as true for backwards compatibility with pre-2.2
      'is_important': false, // is update important => force open dialog on start
      'store_package': 'com.noaisu.play.loliSnatcher', // custom app package name, to allow to redirect store users to new app if it will be needed
      'github_url': 'https://github.com/NO-ob/LoliSnatcher_Droid/releases/latest',
    }; // fake update json for tests
    // String fakeUpdate = '123'; // broken string

    try {
      const String updateFileName = EnvironmentConfig.isFromStore ? 'update_store.json' : 'update.json';
      final response = await DioNetwork.get('https://raw.githubusercontent.com/NO-ob/LoliSnatcher_Droid/master/$updateFileName');
      final json = jsonDecode(response.data);
      // final json = jsonDecode(jsonEncode(fakeUpdate));

      // use this and fakeUpdate to generate json file
      Logger.Inst().log(jsonEncode(json), 'SettingsHandler', 'checkUpdate', LogTypes.settingsError);

      updateInfo.value = UpdateInfo(
        versionName: json['version_name'] ?? '0.0.0',
        buildNumber: json['build_number'] ?? 0,
        title: json['title'] ?? '...',
        changelog: json['changelog'] ?? '...',
        isInStore: json['is_in_store'] ?? false,
        isImportant: json['is_important'] ?? false,
        storePackage: json['store_package'] ?? '',
        githubURL: json['github_url'] ?? 'https://github.com/NO-ob/LoliSnatcher_Droid/releases/latest',
      );

      final String? discordFromGithub = json['discord_url'];
      if (discordFromGithub != null && discordFromGithub.isNotEmpty) {
        // overwrite included discord url if it's not the same as the one in update info
        if (discordFromGithub != discordURL.value) {
          discordURL.value = discordFromGithub;
        }
      }

      if (Constants.appBuildNumber < (updateInfo.value!.buildNumber)) {
        // if current build number is less than update build number in json
        if (EnvironmentConfig.isFromStore) {
          // installed from store
          if (updateInfo.value!.isInStore) {
            // app is still in store
            showUpdate(withMessage || updateInfo.value!.isImportant);
          } else {
            // app was removed from store
            // then always notify user so they can move to github version and get news about removal
            showUpdate(true);
          }
        } else {
          // installed from github
          showUpdate(withMessage || updateInfo.value!.isImportant);
        }
      } else {
        // otherwise show latest version message
        showLastVersionMessage(withMessage);
      }
    } catch (e) {
      if (withMessage) {
        FlashElements.showSnackbar(
          title: const Text(
            'Update Check Error!',
            style: TextStyle(fontSize: 20),
          ),
          content: Text(
            e.toString(),
          ),
          sideColor: Colors.red,
          leadingIcon: Icons.update,
          leadingIconColor: Colors.red,
        );
      }
    }
  }

  void showLastVersionMessage(bool withMessage) {
    if (withMessage) {
      FlashElements.showSnackbar(
        title: const Text(
          'You already have the latest version!',
          style: TextStyle(fontSize: 20),
        ),
        sideColor: Colors.green,
        leadingIcon: Icons.update,
        leadingIconColor: Colors.green,
        actionsBuilder: (controller) {
          return [
            ElevatedButton.icon(
              onPressed: () {
                controller.dismiss();
                showUpdate(true);
              },
              icon: const Icon(Icons.list_alt_rounded),
              label: const Text('View latest changelog'),
            ),
          ];
        },
      );
    }
  }

  void showUpdate(bool withMessage) {
    if (withMessage && updateInfo.value != null) {
      const bool isFromStore = EnvironmentConfig.isFromStore;

      final bool isDiffVersion = Constants.appBuildNumber < updateInfo.value!.buildNumber;

      final ctx = NavigationHandler.instance.navigatorKey.currentContext!;

      SettingsPageOpen(
        context: ctx,
        page: () => Scaffold(
          appBar: AppBar(
            title: Text(
              'Update ${isDiffVersion ? 'Available!' : 'Changelog:'} ${updateInfo.value!.versionName}+${updateInfo.value!.buildNumber}',
            ),
          ),
          body: Column(
            children: [
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isDiffVersion) ...[
                        const Text('Currently Installed: ${Constants.appVersion}+${Constants.appBuildNumber}'),
                        const Text(''),
                      ],
                      Text(updateInfo.value!.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const Text(''),
                      const Text('Changelog:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const Text(''),
                      Text(updateInfo.value!.changelog),
                      // .replaceAll("\n", r"\n").replaceAll("\r", r"\r")
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      icon: const Icon(Icons.close),
                      label: Text(isDiffVersion ? 'Later' : 'Close'),
                    ),
                    const SizedBox(width: 16),
                    if (isFromStore && updateInfo.value!.isInStore)
                      ElevatedButton.icon(
                        onPressed: () {
                          // try {
                          //   launchUrlString("market://details?id=" + updateInfo.value!.storePackage);
                          // } on PlatformException catch(e) {
                          //   launchUrlString("https://play.google.com/store/apps/details?id=" + updateInfo.value!.storePackage);
                          // }
                          launchUrlString(
                            'https://play.google.com/store/apps/details?id=${updateInfo.value!.storePackage}',
                            mode: LaunchMode.externalApplication,
                          );
                          Navigator.of(ctx).pop();
                        },
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('Visit Play Store'),
                      )
                    else
                      ElevatedButton.icon(
                        onPressed: () {
                          launchUrlString(
                            updateInfo.value!.githubURL,
                            mode: LaunchMode.externalApplication,
                          );
                          Navigator.of(ctx).pop();
                        },
                        icon: const Icon(Icons.exit_to_app),
                        label: const Text('Visit Releases'),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ).open();
    }
  }

  Future<void> setConfigDir() async {
    // print('-=-=-=-=-=-=-=-');
    // print(Platform.environment);
    path = await ServiceHandler.getConfigDir();
    boorusPath = '${path}boorus/';
    return;
  }

  Future<void> initialize() async {
    if (isInit.value == true) {
      return;
    }

    try {
      await getPerms();
      await loadSettings();
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        'SettingsHandler',
        'initialize',
        LogTypes.settingsError,
        s: s,
      );
      FlashElements.showSnackbar(
        title: const Text(
          'Initialization Error!',
          style: TextStyle(fontSize: 20),
        ),
        content: Text(
          e.toString(),
        ),
        sideColor: Colors.red,
        leadingIcon: Icons.error,
        leadingIconColor: Colors.red,
      );
    }
    print('isFromStore: ${EnvironmentConfig.isFromStore}');

    // print('=-=-=-=-=-=-=-=-=-=-=-=-=');
    // print(toJSON());
    // print(jsonEncode(toJSON()));

    alice = Alice();

    unawaited(checkUpdate(withMessage: false));
    isInit.value = true;
    return;
  }

  Future<void> postInit(AsyncCallback externalAction) async {
    if (isPostInit.value == true) {
      return;
    }

    try {
      postInitMessage.value = 'Setting up proxy...';
      await initProxy();

      if (isDesktopPlatform) {
        MediaKitVideoPlayer.registerWith();
      } else {
        switch (videoBackendMode) {
          case VideoBackendMode.normal:
            MediaKitVideoPlayer.registerNative();
            break;
          case VideoBackendMode.mpv:
            MediaKitVideoPlayer.registerWith();
            break;
          case VideoBackendMode.mdk:
            fvp.registerWith();
            break;
        }
      }

      postInitMessage.value = 'Loading Database...';
      await loadDatabase();
      await indexDatabase();
      if (booruList.isEmpty) {
        postInitMessage.value = 'Loading Boorus...';
        await loadBoorus();
      }
      await externalAction();
    } catch (e, s) {
      postInitMessage.value = 'Error!';
      Logger.Inst().log(
        e.toString(),
        'SettingsHandler',
        'postInit',
        LogTypes.settingsError,
        s: s,
      );
      FlashElements.showSnackbar(
        title: const Text(
          'Post Initialization Error!',
          style: TextStyle(fontSize: 20),
        ),
        content: Text(
          e.toString(),
        ),
        sideColor: Colors.red,
        leadingIcon: Icons.error,
        leadingIconColor: Colors.red,
      );
    }

    isPostInit.value = true;
    postInitMessage.value = '';
    return;
  }
}

class EnvironmentConfig {
  static const bool isFromStore = bool.fromEnvironment(
    'LS_IS_STORE',
    defaultValue: false,
  );

  static const bool isTesting = bool.fromEnvironment(
    'LS_IS_TESTING',
    defaultValue: false,
  );
}

class TagsListData {
  const TagsListData([
    this.hatedTags = const [],
    this.lovedTags = const [],
    this.soundTags = const [],
    this.aiTags = const [],
  ]);

  final List<String> hatedTags;
  final List<String> lovedTags;
  final List<String> soundTags;
  final List<String> aiTags;
}
