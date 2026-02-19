import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:alice_lightweight/alice.dart';
import 'package:alice_lightweight/helper/alice_save_helper.dart';
import 'package:fvp/fvp.dart' as fvp;
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/gen/strings.g.dart';
import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/data/settings/app_alias.dart';
import 'package:lolisnatcher/src/data/settings/app_mode.dart';
import 'package:lolisnatcher/src/data/settings/button_position.dart';
import 'package:lolisnatcher/src/data/settings/gallery_button.dart';
import 'package:lolisnatcher/src/data/settings/settings_enum.dart';
import 'package:lolisnatcher/src/data/settings/hand_side.dart';
import 'package:lolisnatcher/src/data/settings/image_quality.dart';
import 'package:lolisnatcher/src/data/settings/mpv_hardware_decoding.dart';
import 'package:lolisnatcher/src/data/settings/mpv_video_output.dart';
import 'package:lolisnatcher/src/data/settings/preview_display_mode.dart';
import 'package:lolisnatcher/src/data/settings/preview_quality.dart';
import 'package:lolisnatcher/src/data/settings/proxy_type.dart';
import 'package:lolisnatcher/src/data/settings/scroll_direction.dart';
import 'package:lolisnatcher/src/data/settings/share_action.dart';
import 'package:lolisnatcher/src/data/settings/vertical_position.dart';
import 'package:lolisnatcher/src/data/settings/video_backend_mode.dart';
import 'package:lolisnatcher/src/data/settings/video_cache_mode.dart';
import 'package:lolisnatcher/src/data/theme_item.dart';
import 'package:lolisnatcher/src/data/update_info.dart';
import 'package:lolisnatcher/src/handlers/database_handler.dart';
import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/secure_storage_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/services/get_perms.dart';
import 'package:lolisnatcher/src/services/saf_file_cache.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/http_overrides.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/video/media_kit_video_player.dart';

// exporting localization here to avoid import repetition, since we use settingsHandler in a lot of places anyway
export 'package:lolisnatcher/gen/strings.g.dart';

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
  final RxBool isInit = false.obs, isPostInit = false.obs;
  final RxString postInitMessage = ''.obs;
  String cachePath = '';
  String path = '';
  String boorusPath = '';

  final Rx<UpdateInfo?> updateInfo = Rxn(null);

  ////////////////////////////////////////////////////

  // runtime settings vars
  bool hasHydrus = false;
  final RxString discordURL = RxString(Constants.discordURL);

  // debug toggles
  final RxBool isDebug = (kDebugMode || false).obs;
  final RxBool showFps = false.obs;
  final RxBool showPerf = false.obs;
  final RxBool showImageStats = false.obs;
  final RxBool showVideoStats = false.obs;
  bool blurImages = kDebugMode ? Constants.blurImagesDefaultDev : false;

  ////////////////////////////////////////////////////

  // saveable settings vars
  AppAlias appAlias = AppAlias.defaultValue;
  String defTags = 'rating:safe';
  PreviewQuality previewMode = PreviewQuality.defaultValue;
  VideoCacheMode videoCacheMode = VideoCacheMode.defaultValue;
  String prefBooru = '';
  PreviewDisplayMode previewDisplay = PreviewDisplayMode.defaultValue;
  PreviewDisplayMode previewDisplayFallback = PreviewDisplayMode.defaultValue;
  ImageQuality galleryMode = ImageQuality.defaultValue;
  ImageQuality snatchMode = ImageQuality.defaultValue;
  ShareAction shareAction = ShareAction.defaultValue;
  final Rx<AppMode> appMode = AppMode.defaultValue.obs;
  final Rx<HandSide> handSide = HandSide.defaultValue.obs;
  VerticalPosition galleryBarPosition = VerticalPosition.defaultValue;
  ScrollDirection galleryScrollDirection = ScrollDirection.defaultValue;
  String extPathOverride = '';
  String drawerMascotPathOverride = '';
  String backupPath = '';
  ButtonPosition zoomButtonPosition = ButtonPosition.defaultValue;
  ButtonPosition changePageButtonsPosition = ButtonPosition.defaultValueDesktopOnly;
  ButtonPosition scrollGridButtonsPosition = ButtonPosition.defaultValueDesktopOnly;
  String lastSyncIp = '';
  String lastSyncPort = '';
  // TODO move it to boorus themselves to have different user agents for different boorus?
  String customUserAgent = '';
  ProxyType proxyType = ProxyType.defaultValue;
  String proxyAddress = '';
  String proxyUsername = '';
  String proxyPassword = '';
  VideoBackendMode videoBackendMode = isDesktopPlatform ? VideoBackendMode.mpv : VideoBackendMode.normal;
  MpvVideoOutput altVideoPlayerVO = MpvVideoOutput.defaultValue;
  MpvHardwareDecoding altVideoPlayerHWDEC = MpvHardwareDecoding.defaultValue;

  List<String> hiddenTags = [];
  List<String> markedTags = [];

  int itemLimit = Constants.defaultItemLimit;
  int portraitColumns = 2;
  int landscapeColumns = 4;
  int preloadCount = 1;
  int preloadHeight = 4096 * 4;
  int snatchCooldown = 250;
  int volumeButtonsScrollSpeed = 200;
  int galleryAutoScrollTime = 4000;
  int cacheSize = 3;
  int autoLockTimeout = 120;

  double mousewheelScrollSpeed = 10;
  double preloadSizeLimit = 0.2;

  int currentColumnCount(BuildContext context) {
    return context.isPortrait ? portraitColumns : landscapeColumns;
  }

  Duration cacheDuration = Duration.zero;

  List<GalleryButton> buttonOrder = [...GalleryButton.values];
  List<GalleryButton> disabledButtons = [];

  bool jsonWrite = false;
  bool autoPlayEnabled = true;
  bool loadingGif = false;
  bool thumbnailCache = true;
  bool mediaCache = true;
  bool autoHideImageBar = false;
  bool dbEnabled = true;
  bool indexesEnabled = false;
  bool searchHistoryEnabled = true;
  bool filterHated = false;
  bool filterMarked = false;
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
  bool showBottomSearchbar = true;
  bool useTopSearchbarInput = false;
  bool showSearchbarQuickActions = false;
  bool autofocusSearchbar = true;
  bool expandDetails = false;
  bool usePredictiveBack = true;
  final RxBool useLockscreen = false.obs;
  final RxBool blurOnLeave = false.obs;
  final RxList<Booru> booruList = RxList<Booru>([]);
  ////////////////////////////////////////////////////

  // themes wip
  final Rx<ThemeItem> theme = ThemeItem(
    name: 'Pink',
    primary: Colors.pink[200],
    accent: Colors.pink[600],
  ).obs;

  final Rx<Color?> customPrimaryColor = Colors.pink[200]!.obs;
  final Rx<Color?> customAccentColor = Colors.pink[600]!.obs;

  final Rx<ThemeMode> themeMode = ThemeMode.dark.obs; // system, light, dark
  final RxBool useDynamicColor = false.obs;
  final RxBool isAmoled = false.obs;

  final Rx<String> fontFamily = 'System'.obs;

  final Rxn<AppLocale> locale = Rxn<AppLocale>(null);
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
    'fontFamily',
    'locale',
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
    'showFps',
    'showPerf',
    'showImageStats',
    'showVideoStats',
    'isDebug',
    'desktopListsDrag',
    'incognitoKeyboard',
    'appAlias',
    'showBottomSearchbar',
    'useTopSearchbarInput',
    'showSearchbarQuickActions',
    'autofocusSearchbar',
    'expandDetails',
    'usePredictiveBack',
    'useLockscreen',
    'blurOnLeave',
  ];

  // default values and possible options map for validation
  // TODO build settings widgets from this map, need to add Label/Description/other options required for the input element
  // TODO move it in another file?
  Map<String, Map<String, dynamic>> get map => {
    // enums
    'previewMode': {
      'type': 'previewQuality',
      'default': PreviewQuality.defaultValue,
      'options': PreviewQuality.values,
    },
    'previewDisplay': {
      'type': 'previewDisplayMode',
      'default': PreviewDisplayMode.defaultValue,
      'options': PreviewDisplayMode.values,
    },
    'previewDisplayFallback': {
      'type': 'previewDisplayMode',
      'default': PreviewDisplayMode.defaultValue,
      'options': PreviewDisplayMode.values.where((e) => e != PreviewDisplayMode.staggered).toList(),
    },
    'shareAction': {
      'type': 'shareAction',
      'default': ShareAction.defaultValue,
      'options': ShareAction.values,
    },
    'videoCacheMode': {
      'type': 'videoCacheMode',
      'default': VideoCacheMode.defaultValue,
      'options': VideoCacheMode.values,
    },
    'galleryMode': {
      'type': 'imageQuality',
      'default': ImageQuality.defaultValue,
      'options': ImageQuality.values,
    },
    'snatchMode': {
      'type': 'imageQuality',
      'default': ImageQuality.defaultValue,
      'options': ImageQuality.values,
    },
    'galleryScrollDirection': {
      'type': 'scrollDirection',
      'default': ScrollDirection.defaultValue,
      'options': ScrollDirection.values,
    },
    'galleryBarPosition': {
      'type': 'verticalPosition',
      'default': VerticalPosition.defaultValue,
      'options': VerticalPosition.values,
    },
    'zoomButtonPosition': {
      'type': 'buttonPosition',
      'default': ButtonPosition.defaultValue,
      'options': ButtonPosition.values,
    },
    'changePageButtonsPosition': {
      'type': 'buttonPosition',
      'default': ButtonPosition.defaultValueDesktopOnly,
      'options': ButtonPosition.values,
    },
    'scrollGridButtonsPosition': {
      'type': 'buttonPosition',
      'default': ButtonPosition.defaultValueDesktopOnly,
      'options': ButtonPosition.values,
    },
    'videoBackendMode': {
      'type': 'videoBackendMode',
      'default': isDesktopPlatform ? VideoBackendMode.mpv : VideoBackendMode.defaultValue,
      'options': VideoBackendMode.values,
    },
    'altVideoPlayerVO': {
      'type': 'mpvVideoOutput',
      'default': MpvVideoOutput.defaultValue,
      'options': MpvVideoOutput.values,
    },
    'altVideoPlayerHWDEC': {
      'type': 'mpvHardwareDecoding',
      'default': MpvHardwareDecoding.defaultValue,
      'options': MpvHardwareDecoding.values,
    },
    'proxyType': {
      'type': 'proxyType',
      'default': ProxyType.defaultValue,
      'options': ProxyType.values,
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
    'hiddenTags': {
      'type': 'stringList',
      'default': <String>[],
    },
    'lovedTags': {
      'type': 'stringList',
      'default': <String>[],
    },
    'markedTags': {
      'type': 'stringList',
      'default': <String>[],
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
      'upperLimit': 4,
      'lowerLimit': 0,
    },
    'preloadHeight': {
      'type': 'int',
      'default': 4096 * 4,
      'step': 1024,
      'upperLimit': 2_000_000_000,
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
      'upperLimit': 100.0,
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
      'default': true,
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
    'filterMarked': {
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
    'appAlias': {
      'type': 'appAlias',
      'default': AppAlias.defaultValue,
      'options': AppAlias.values,
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
    'altVideoPlayerHwAccel': {
      'type': 'bool',
      'default': true,
    },
    'showBottomSearchbar': {
      'type': 'bool',
      'default': true,
    },
    'useTopSearchbarInput': {
      'type': 'bool',
      'default': false,
    },
    'showSearchbarQuickActions': {
      'type': 'bool',
      'default': false,
    },
    'autofocusSearchbar': {
      'type': 'bool',
      'default': true,
    },
    'expandDetails': {
      'type': 'bool',
      'default': false,
    },
    'usePredictiveBack': {
      'type': 'bool',
      'default': true,
    },
    'useLockscreen': {
      'type': 'bool',
      'default': false,
    },
    'blurOnLeave': {
      'type': 'bool',
      'default': false,
    },

    // other
    'buttonOrder': {
      'type': 'stringList',
      'default': <String>[
        ...GalleryButton.values.map((b) => b.toJson()),
      ],
    },
    'disabledButtons': {
      'type': 'stringList',
      'default': <String>[],
      'options': <String>[
        ...GalleryButton.disableable.map((b) => b.toJson()),
      ],
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
      'type': 'bool',
      'default': false,
    },
    'isAmoled': {
      'type': 'bool',
      'default': false,
    },
    'fontFamily': {
      'type': 'string',
      'default': 'System',
    },
    'locale': {
      'type': 'locale',
      'default': null,
    },
    'customPrimaryColor': {
      'type': 'color',
      'default': Colors.pink[200],
    },
    'customAccentColor': {
      'type': 'color',
      'default': Colors.pink[600],
    },
  };

  dynamic validateValue(String name, dynamic value, {bool toJSON = false}) {
    final Map<String, dynamic>? settingParams = map[name];

    if (toJSON) {
      value = getByString(name);
    }

    if (value is Rx) {
      value = value.value;
    }

    if (settingParams == null) {
      if (toJSON) {
        return value.toString();
      } else {
        return value;
      }
    }

    try {
      final String type = settingParams['type'];

      // Check if this is a registered SettingsEnum type - handles all enums generically
      if (SettingsEnumRegistry.isRegistered(type)) {
        return SettingsEnumRegistry.validate(
          type,
          value,
          settingParams['default'],
          toJSON: toJSON,
        );
      }

      switch (type) {
        case 'stringFromList':
          final String validValue = List<String>.from(
            settingParams['options']!,
          ).firstWhere((el) => el == value, orElse: () => '');
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

        // Special types with custom handling
        case 'theme':
          if (toJSON) {
            return (value as ThemeItem).name;
          } else {
            if (value is String) {
              final ThemeItem findTheme = List<ThemeItem>.from(
                settingParams['options']!,
              ).firstWhere((el) => el.name == value, orElse: () => settingParams['default']);
              return findTheme;
            } else {
              return settingParams['default'];
            }
          }

        case 'themeMode':
          if (toJSON) {
            return (value as ThemeMode).name; // ThemeMode.dark => dark
          } else {
            if (value is String) {
              final List<ThemeMode> findMode = ThemeMode.values
                  .where((element) => element.toString() == 'ThemeMode.$value')
                  .toList();
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

        case 'color':
          if (toJSON) {
            // TODO replace value with toARGB32() in the next flutter release
            // ignore: deprecated_member_use
            return (value as Color?)?.value ?? Colors.pink.value; // Color => int
          } else {
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

        case 'locale':
          if (toJSON) {
            return (value as AppLocale?)?.name;
          } else {
            if (value is String) {
              return AppLocale.values.firstWhereOrNull((e) => e.name == value);
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

  Future<bool> loadDatabase(ValueChanged<String> onStatusUpdate) async {
    try {
      if (!Tools.isTestMode) {
        if (dbEnabled) {
          await dbHandler.dbConnect(
            path,
            onStatusUpdate: onStatusUpdate,
          );
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
            postInitMessage.value = '${loc.settings.database.indexingDatabase}...\n${loc.thisMayTakeSomeTime}';
            await dbHandler.createIndexes();
          } else {
            postInitMessage.value = '${loc.settings.database.droppingIndexes}...\n${loc.thisMayTakeSomeTime}';
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
      case 'previewDisplayFallback':
        return previewDisplayFallback;
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
      case 'preloadHeight':
        return preloadHeight;
      case 'snatchCooldown':
        return snatchCooldown;
      case 'galleryBarPosition':
        return galleryBarPosition;
      case 'galleryScrollDirection':
        return galleryScrollDirection;
      case 'buttonOrder':
        return buttonOrder;
      case 'disabledButtons':
        return disabledButtons;
      case 'hatedTags':
      case 'hiddenTags':
        return hiddenTags;
      case 'lovedTags':
      case 'markedTags':
        return markedTags;
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
      case 'filterMarked':
        return filterMarked;
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
      case 'showBottomSearchbar':
        return showBottomSearchbar;
      case 'useTopSearchbarInput':
        return useTopSearchbarInput;
      case 'showSearchbarQuickActions':
        return showSearchbarQuickActions;
      case 'autofocusSearchbar':
        return autofocusSearchbar;
      case 'expandDetails':
        return expandDetails;
      case 'usePredictiveBack':
        return usePredictiveBack;
      case 'useLockscreen':
        return useLockscreen;
      case 'blurOnLeave':
        return blurOnLeave;

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
      case 'appAlias':
        return appAlias;
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
      case 'fontFamily':
        return fontFamily;
      case 'customPrimaryColor':
        return customPrimaryColor;
      case 'customAccentColor':
        return customAccentColor;
      case 'locale':
        return locale;
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
      case 'previewDisplayFallback':
        previewDisplayFallback = validatedValue;
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
      case 'preloadHeight':
        preloadHeight = validatedValue;
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

      case 'buttonOrder':
        buttonOrder = validatedValue;
        break;
      case 'disabledButtons':
        disabledButtons = validatedValue;
        break;
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
      case 'filterMarked':
        filterMarked = validatedValue;
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
        SAFFileCache.instance.invalidate();
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
      case 'appAlias':
        appAlias = validatedValue;
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
      case 'showBottomSearchbar':
        showBottomSearchbar = validatedValue;
        break;
      case 'useTopSearchbarInput':
        useTopSearchbarInput = validatedValue;
        break;
      case 'showSearchbarQuickActions':
        showSearchbarQuickActions = validatedValue;
        break;
      case 'autofocusSearchbar':
        autofocusSearchbar = validatedValue;
        break;
      case 'expandDetails':
        expandDetails = validatedValue;
        break;
      case 'usePredictiveBack':
        usePredictiveBack = validatedValue;
        break;
      case 'useLockscreen':
        useLockscreen.value = validatedValue;
        break;
      case 'blurOnLeave':
        blurOnLeave.value = validatedValue;
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
        useDynamicColor.value = validatedValue;
        break;
      case 'isAmoled':
        isAmoled.value = validatedValue;
        break;
      case 'fontFamily':
        fontFamily.value = validatedValue;
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
      case 'locale':
        locale.value = validatedValue;
        break;
      default:
        break;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};

    // Auto-generate JSON from map keys
    for (final key in map.keys) {
      // Special handling for tags (need to be cleaned)
      if (key == 'hatedTags' || key == 'lovedTags') {
        // do nothing, legacy key
      } else if (key == 'hiddenTags') {
        json[key] = cleanTagsList(hiddenTags.map(Tag.new).toList());
      } else if (key == 'markedTags') {
        json[key] = cleanTagsList(markedTags.map(Tag.new).toList());
      } else {
        json[key] = validateValue(key, null, toJSON: true);
      }
    }

    // Add version info
    json['version'] = Constants.updateInfo.versionName;
    json['build'] = Constants.updateInfo.buildNumber;

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
      final List<GalleryButton> btnOrder = List<GalleryButton?>.from(
        tempBtnOrder.map((b) => b is String ? GalleryButton.fromString(b) : null),
      ).where((b) => b != null).toList().cast<GalleryButton>();
      btnOrder.addAll(
        GalleryButton.values.where(
          (b) => !btnOrder.contains(b),
        ),
      ); // add all buttons that are not present in the parsed list (future proofing, in case we add more buttons later)
      buttonOrder = btnOrder;
    } catch (e, s) {
      Logger.Inst().log(
        'Failed to parse button order list $e',
        'SettingsHandler',
        'loadFromJSON',
        LogTypes.exception,
        s: s,
      );
    }

    try {
      dynamic tempDisabledButtons = json['disabledButtons'];
      if (tempDisabledButtons is List) {
        tempDisabledButtons = [
          ...tempDisabledButtons
              .map((b) => b is String ? GalleryButton.fromString(b) : null)
              .where((b) => b != null)
              .toList()
              .cast<GalleryButton>(),
        ];

        final disableableButtons = [...GalleryButton.disableable];
        for (final button in tempDisabledButtons) {
          if (disableableButtons.any((e) => e == button)) {
            // do nothing
          } else {
            // remove unknown and not allowed to remove buttons
            tempDisabledButtons.remove(button);
          }
        }

        disabledButtons = [...tempDisabledButtons];
      } else {
        disabledButtons = [];
      }
    } catch (e, s) {
      Logger.Inst().log(
        'Failed to parse button disabled list $e',
        'SettingsHandler',
        'loadFromJSON',
        LogTypes.exception,
        s: s,
      );
    }

    try {
      dynamic tempHiddenTags = json['hiddenTags'] ?? json['hatedTags'];
      if (tempHiddenTags is List) {
        // print('hiddenTags is a list');
      } else if (tempHiddenTags is String) {
        // print('hiddenTags is a string');
        tempHiddenTags = tempHiddenTags.split(',');
      } else {
        // print('hiddenTags is a ${tempHiddenTags.runtimeType} type');
        tempHiddenTags = [];
      }
      final List<String> hideTags = List<String>.from(tempHiddenTags);
      for (int i = 0; i < hideTags.length; i++) {
        if (!hiddenTags.contains(hideTags.elementAt(i))) {
          hiddenTags.add(hideTags.elementAt(i));
        }
      }
    } catch (e, s) {
      Logger.Inst().log(
        'Failed to parse hidden tags $e',
        'SettingsHandler',
        'loadFromJSON',
        LogTypes.exception,
        s: s,
      );
    }

    try {
      dynamic tempMarkedTags = json['markedTags'] ?? json['lovedTags'];
      if (tempMarkedTags is List) {
        // print('markedTags is a list');
      } else if (tempMarkedTags is String) {
        // print('markedTags is a string');
        tempMarkedTags = tempMarkedTags.split(',');
      } else {
        // print('markedTags is a ${tempMarkedTags.runtimeType} type');
        tempMarkedTags = [];
      }
      final List<String> markTags = List<String>.from(tempMarkedTags);
      for (int i = 0; i < markTags.length; i++) {
        if (!markedTags.contains(markTags.elementAt(i))) {
          markedTags.add(markTags.elementAt(i));
        }
      }
    } catch (e, s) {
      Logger.Inst().log(
        'Failed to parse marked tags $e',
        'SettingsHandler',
        'loadFromJSON',
        LogTypes.exception,
        s: s,
      );
    }

    final List<String> leftoverKeys = json.keys
        .where(
          (e) => ![
            'buttonOrder',
            'disabledButtons',
            'hiddenTags',
            'markedTags',
          ].contains(e),
        )
        .toList();
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
      final List<String> legacyKeys = [];
      for (final String key in legacyKeys) {
        if (json.keys.contains(key)) {
          switch (key) {
            default:
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

    // force mobile app mode, until we redo UI for desktop and start doing builds again
    appMode.value = AppMode.Mobile;

    return true;
  }

  Future<bool> saveSettings({required bool restate}) async {
    await getStoragePermission();
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

            if (booruFromFile.type?.isHydrus == true) {
              hasHydrus = true;
            }
          }
        }
      }

      if (dbEnabled && tempList.isNotEmpty) {
        tempList.add(Booru(loc.favourites, BooruType.Favourites, '', '', ''));
        tempList.add(Booru(loc.downloads, BooruType.Downloads, '', '', ''));
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

    booruList.value = tempList
        .where((element) => !booruList.contains(element))
        .toList(); // filter due to possibility of duplicates

    if (tempList.isNotEmpty) {
      unawaited(sortBooruList());
    }
    return true;
  }

  Future<void> sortBooruList() async {
    final List<Booru> sorted = [
      ...booruList,
    ]; // spread the array just in case, to guarantee that we don't affect the original value
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

    final int favsIndex = sorted.indexWhere((el) => el.type?.isFavourites == true);
    if (favsIndex != -1) {
      // move favourites to the end
      final Booru tmp = sorted.elementAt(favsIndex);
      sorted.remove(tmp);
      sorted.add(tmp);
    }

    final int dlsIndex = sorted.indexWhere((el) => el.type?.isDownloads == true);
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

  TagsListData parseTagsList(List<Tag> itemTags, {bool isCapped = true}) {
    final List<String> cleanItemTags = cleanTagsList(itemTags);
    List<String> hiddenInItem = hiddenTags.where(cleanItemTags.contains).toList();
    List<String> markedInItem = markedTags.where(cleanItemTags.contains).toList();
    final List<String> soundInItem = soundTags.where(cleanItemTags.contains).toList();
    final List<String> aiInItem = aiTags.where(cleanItemTags.contains).toList();

    if (isCapped) {
      if (hiddenInItem.length > 5) {
        hiddenInItem = [...hiddenInItem.take(5), '...'];
      }
      if (markedInItem.length > 5) {
        markedInItem = [...markedInItem.take(5), '...'];
      }
    }

    return TagsListData(hiddenInItem, markedInItem, soundInItem, aiInItem);
  }

  bool containsHidden(List<String> itemTags) {
    return hiddenTags.where(itemTags.contains).isNotEmpty;
  }

  bool containsMarked(List<String> itemTags) {
    return markedTags.where(itemTags.contains).isNotEmpty;
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
      case 'hidden':
        if (!hiddenTags.contains(tag)) {
          hiddenTags.add(tag);
        }
        break;
      case 'loved':
      case 'marked':
        if (!markedTags.contains(tag)) {
          markedTags.add(tag);
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
      case 'hidden':
        if (hiddenTags.contains(tag)) {
          hiddenTags.remove(tag);
        }
        break;
      case 'loved':
      case 'marked':
        if (markedTags.contains(tag)) {
          markedTags.remove(tag);
        }
        break;
      default:
        break;
    }
    saveSettings(restate: false);
  }

  List<String> cleanTagsList(List<Tag> tags) {
    List<String> cleanTags = [];
    cleanTags = tags
        .where((tag) => tag.fullString.isNotEmpty)
        .map((tag) => tag.fullString.trim().toLowerCase())
        .toList();
    cleanTags.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return cleanTags;
  }

  Future<void> checkUpdate({bool withMessage = false}) async {
    if (Tools.isTestMode) {
      return;
    }

    // const String fakeUpdate = '123'; // for tests // broken string
    // const Map<String, dynamic> = {}; // for tests // full json here

    try {
      const String updateFileName = EnvironmentConfig.isFromStore ? 'update_store.json' : 'update.json';
      final response = await DioNetwork.get(
        'https://raw.githubusercontent.com/NO-ob/LoliSnatcher_Droid/master/$updateFileName',
      );
      final json = response.data is String ? jsonDecode(response.data) : (response.data is Map ? response.data : {});
      if (json is Map && json.isEmpty) {
        throw Exception('Update file is empty');
      }

      try {
        Logger.Inst().log(
          jsonEncode(json),
          'SettingsHandler',
          'checkUpdate',
          LogTypes.settingsError,
        );
      } catch (_) {}

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

      if (Constants.updateInfo.buildNumber < (updateInfo.value!.buildNumber)) {
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
        final secureStorageHandler = SecureStorageHandler.instance;
        final viewedAtBuild = int.tryParse(
          await secureStorageHandler.read(SecureStorageKey.viewedUpdateChangelogForBuild) ?? '',
        );
        if (booruList.isEmpty) {
          // don't bother new (no boorus) users until next update
          await secureStorageHandler.write(
            SecureStorageKey.viewedUpdateChangelogForBuild,
            Constants.updateInfo.buildNumber.toString(),
          );
        } else if (viewedAtBuild == null || viewedAtBuild < Constants.updateInfo.buildNumber) {
          await secureStorageHandler.write(
            SecureStorageKey.viewedUpdateChangelogForBuild,
            Constants.updateInfo.buildNumber.toString(),
          );
          showUpdate(true, isAfterUpdate: true);
        } else {
          if (withMessage) {
            // otherwise show latest version message
            showLastVersionMessage();
          }
        }
      }
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        'SettingsHandler',
        'checkUpdate',
        LogTypes.settingsError,
        s: s,
      );
      if (withMessage) {
        FlashElements.showSnackbar(
          title: Text(
            loc.settings.checkForUpdates.updateCheckError,
            style: const TextStyle(fontSize: 20),
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

  void showLastVersionMessage() {
    FlashElements.showSnackbar(
      title: Text(
        loc.settings.checkForUpdates.youHaveLatestVersion,
        style: const TextStyle(fontSize: 20),
      ),
      sideColor: Colors.green,
      leadingIcon: Icons.update,
      leadingIconColor: Colors.green,
      actionsBuilder: (context, controller) {
        return [
          ElevatedButton.icon(
            onPressed: () {
              controller.dismiss();
              showUpdate(
                true,
                isAfterUpdate: true,
              );
            },
            icon: const Icon(Icons.list_alt_rounded),
            label: Text(
              loc.settings.checkForUpdates.viewLatestChangelog,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ];
      },
    );
  }

  void showUpdate(
    bool showMessage, {
    bool isAfterUpdate = false,
  }) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _updateInfo = isAfterUpdate ? Constants.updateInfo : updateInfo.value;
    if (showMessage && _updateInfo != null) {
      const bool isFromStore = EnvironmentConfig.isFromStore;

      final bool isDiffVersion = Constants.updateInfo.buildNumber < _updateInfo.buildNumber;

      final ctx = NavigationHandler.instance.navContext;

      SettingsPageOpen(
        context: ctx,
        page: (_) => Scaffold(
          appBar: SettingsAppBar(
            title:
                '${isDiffVersion ? loc.settings.checkForUpdates.updateAvailable : '${isAfterUpdate ? loc.settings.checkForUpdates.whatsNew : loc.settings.checkForUpdates.updateChangelog}:'} ${updateInfo.value!.versionName}+${updateInfo.value!.buildNumber}',
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isDiffVersion) ...[
                          Text(
                            '${loc.settings.checkForUpdates.currentVersion}: ${Constants.updateInfo.versionName}+${Constants.updateInfo.buildNumber}',
                          ),
                          const Text(''),
                        ],
                        Text(
                          _updateInfo.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(''),
                        Text(
                          loc.settings.checkForUpdates.changelog,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(''),
                        Text(_updateInfo.changelog),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        icon: const Icon(Icons.close),
                        label: Text(isDiffVersion ? loc.later : loc.close),
                      ),
                      const SizedBox(width: 16),
                      if (isFromStore && _updateInfo.isInStore)
                        ElevatedButton.icon(
                          onPressed: () {
                            // try {
                            //   launchUrlString("market://details?id=" + _updateInfo.storePackage);
                            // } on PlatformException catch(e) {
                            //   launchUrlString("https://play.google.com/store/apps/details?id=" + _updateInfo.storePackage);
                            // }
                            launchUrlString(
                              'https://play.google.com/store/apps/details?id=${_updateInfo.storePackage}',
                              mode: LaunchMode.externalApplication,
                            );
                            Navigator.of(ctx).pop();
                          },
                          icon: const Icon(Icons.play_arrow),
                          label: Text(loc.settings.checkForUpdates.visitPlayStore),
                        )
                      else
                        ElevatedButton.icon(
                          onPressed: () {
                            launchUrlString(
                              _updateInfo.githubURL,
                              mode: LaunchMode.externalApplication,
                            );
                            Navigator.of(ctx).pop();
                          },
                          icon: const Icon(Icons.exit_to_app),
                          label: Text(loc.settings.checkForUpdates.visitReleases),
                        ),
                    ],
                  ),
                ),
              ],
            ),
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

  Future<void> setLocale(AppLocale? locale) async {
    if (locale == null) {
      await LocaleSettings.useDeviceLocale();
    } else {
      await LocaleSettings.setLocale(locale);
    }
  }

  Future<void> initialize() async {
    if (isInit.value == true) {
      return;
    }

    try {
      await getStoragePermission();
      await loadSettings();
      await setLocale(locale.value);
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        'SettingsHandler',
        'initialize',
        LogTypes.settingsError,
        s: s,
      );
      FlashElements.showSnackbar(
        title: Text(
          loc.init.initError,
          style: const TextStyle(fontSize: 20),
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

    alice = Alice(
      quickShareAction: Platform.isWindows
          ? (call) async {
              await Clipboard.setData(
                ClipboardData(
                  text: await AliceSaveHelper.buildCallLog(call),
                ),
              );
            }
          : null,
    );

    if (Platform.isAndroid && extPathOverride.isNotEmpty) {
      unawaited(SAFFileCache.instance.populate(extPathOverride));
    }

    isInit.value = true;
    return;
  }

  Future<void> postInit(AsyncCallback externalAction) async {
    if (isPostInit.value == true) {
      return;
    }

    try {
      postInitMessage.value = loc.init.settingUpProxy;
      await initProxy();

      if (isDesktopPlatform) {
        fvp.registerWith();
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

      postInitMessage.value = loc.init.loadingDatabase;
      await loadDatabase((newStatus) {
        postInitMessage.value = 'Fixing data in the database...\nThis may take some time\n$newStatus';
      });
      await indexDatabase();
      if (booruList.isEmpty) {
        postInitMessage.value = loc.init.loadingBoorus;
        await loadBoorus();
      }
      await externalAction();
    } catch (e, s) {
      postInitMessage.value = loc.errorExclamation;
      Logger.Inst().log(
        e.toString(),
        'SettingsHandler',
        'postInit',
        LogTypes.settingsError,
        s: s,
      );
      FlashElements.showSnackbar(
        title: Text(
          loc.init.initError,
          style: const TextStyle(fontSize: 20),
        ),
        content: Text(
          e.toString(),
        ),
        sideColor: Colors.red,
        leadingIcon: Icons.error,
        leadingIconColor: Colors.red,
      );
    }

    unawaited(checkUpdate(withMessage: false));

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
    this.hiddenTags = const [],
    this.markedTags = const [],
    this.soundTags = const [],
    this.aiTags = const [],
  ]);

  final List<String> hiddenTags;
  final List<String> markedTags;
  final List<String> soundTags;
  final List<String> aiTags;
}
