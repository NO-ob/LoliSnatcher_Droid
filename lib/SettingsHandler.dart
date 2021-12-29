import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

import 'package:LoliSnatcher/getPerms.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ThemeItem.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/DBHandler.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/utilities/Logger.dart';
import 'package:LoliSnatcher/utilities/MyHttpOverrides.dart';

/**
 * This class is used loading from and writing settings to files
 */
class SettingsHandler extends GetxController {
  ServiceHandler serviceHandler = ServiceHandler();
  DBHandler dbHandler = DBHandler();
  DBHandler favDbHandler = DBHandler();

  // service vars
  RxBool isInit = false.obs;
  String cachePath = "";
  String path = "";
  String boorusPath = "";
  int SDKVer = 0;

  // TODO don't forget to update these on every new release
  // version vars
  String appName = "LoliSnatcher";
  String packageName = "com.noaisu.loliSnatcher";
  String verStr = "2.0.0";
  int buildNumber = 163;
  Rx<UpdateInfo?> updateInfo = Rxn(null);

  ////////////////////////////////////////////////////

  // runtime settings vars
  bool hasHydrus = false;
  bool mergeEnabled = false;
  List<LogTypes> ignoreLogTypes = [];

  // debug toggles
  RxBool isDebug = (kDebugMode || false).obs;
  RxBool showFPS = false.obs;
  RxBool showPerf = false.obs;
  RxBool showImageStats = false.obs;
  RxBool isMemeTheme = false.obs;
  bool showURLOnThumb = false;
  bool disableImageScaling = false;
  // disable isolates on debug builds, because they cause lags in emulator
  bool disableImageIsolates = kDebugMode || false;

  ////////////////////////////////////////////////////

  // saveable settings vars
  String defTags = "rating:safe";
  String previewMode = "Sample";
  String videoCacheMode = "Stream";
  String prefBooru = "";
  String previewDisplay = "Square";
  String galleryMode = "Full Res";
  String shareAction = "Ask";
  String appMode = (Platform.isWindows || Platform.isLinux) ? 'Desktop' : 'Mobile';
  String galleryBarPosition = 'Top';
  String galleryScrollDirection = 'Horizontal';
  String extPathOverride = "";
  String drawerMascotPathOverride = "";
  String zoomButtonPosition = "Right";
  String changePageButtonsPosition = (Platform.isWindows || Platform.isLinux) ? "Right" : "Disabled";
  String lastSyncIp = '';
  String lastSyncPort = '';

  List<String> hatedTags = [];
  List<String> lovedTags = [];

  int limit = 20;
  int portraitColumns = 2;
  int landscapeColumns = 4;
  int preloadCount = 1;
  int snatchCooldown = 250;
  int volumeButtonsScrollSpeed = 200;
  int galleryAutoScrollTime = 4000;
  int cacheSize = 3;

  Duration cacheDuration = Duration.zero;

  List<List<String>> buttonList = [
    ["autoscroll", "AutoScroll"],
    ["snatch", "Save"],
    ["favourite", "Favourite"],
    ["info", "Display Info"],
    ["share", "Share"],
    ["open", "Open in Browser"],
    ["reloadnoscale", "Reload w/out scaling"]
  ];
  List<List<String>> buttonOrder = [
    ["autoscroll", "AutoScroll"],
    ["snatch", "Save"],
    ["favourite", "Favourite"],
    ["info", "Display Info"],
    ["share", "Share"],
    ["open", "Open in Browser"],
    ["reloadnoscale", "Reload w/out scaling"]
  ];

  bool jsonWrite = false;
  bool autoPlayEnabled = true;
  bool loadingGif = false;
  bool thumbnailCache = true;
  bool mediaCache = false;
  bool autoHideImageBar = false;
  bool dbEnabled = true;
  bool searchHistoryEnabled = true;
  bool filterHated = false;
  bool useVolumeButtonsForScroll = false;
  bool shitDevice = false;
  bool disableVideo = false;
  bool enableDrawerMascot = false;
  bool allowSelfSignedCerts = false;
  bool showStatusBar = true;

  RxList<Booru> booruList = RxList<Booru>([]);
  ////////////////////////////////////////////////////

  // themes wip
  Rx<ThemeItem> theme = ThemeItem(
    name: "Pink",
    primary: Colors.pink[200],
    accent: Colors.pink[600]
  ).obs..listen((ThemeItem theme) {
    print('newTheme ${theme.name} ${theme.primary}');
  });

  Rx<Color?> customPrimaryColor = Colors.pink[200].obs;
  Rx<Color?> customAccentColor = Colors.pink[600].obs;

  Rx<ThemeMode> themeMode = ThemeMode.dark.obs; // system, light, dark
  RxBool isAmoled = false.obs;
  ////////////////////////////////////////////////////

  // list of setting names which shouldnt be synced with other devices
  List<String> deviceSpecificSettings = [
    'shitDevice', 'disableVideo',
    'thumbnailCache', 'mediaCache',
    'dbEnabled', 'searchHistoryEnabled',
    'useVolumeButtonsForScroll', 'volumeButtonsScrollSpeed',
    'prefBooru', 'appMode', 'extPathOverride',
    'lastSyncIp', 'lastSyncPort',
    'theme', 'themeMode', 'isAmoled',
    'customPrimaryColor', 'customAccentColor',
    'version', 'SDK', 'disableImageScaling',
    'cacheDuration', 'cacheSize', 'enableDrawerMascot',
    'drawerMascotPathOverride', 'allowSelfSignedCerts',
    'showStatusBar'
  ];
  // default values and possible options map for validation
  // TODO build settings widgets from this map, need to add Label/Description/other options required for the input element
  // TODO move it in another file?
  Map<String, Map<String, dynamic>> map = {
    // stringFromList
    "appMode": {
      "type": "stringFromList",
      "default": "Mobile",
      "options": <String>["Mobile", "Desktop"],
    },
    "previewMode": {
      "type": "stringFromList",
      "default": "Sample",
      "options": <String>["Sample", "Thumbnail"],
    },
    "previewDisplay": {
      "type": "stringFromList",
      "default": "Square",
      "options": <String>["Square", "Rectangle", "Staggered"],
    },
    "shareAction": {
      "type": "stringFromList",
      "default": "Ask",
      "options": <String>["Ask", "Post URL", "File URL", "File", "Hydrus"],
    },
    "videoCacheMode": {
      "type": "stringFromList",
      "default": "Stream",
      "options": <String>["Stream", "Cache", "Stream+Cache"],
    },
    "galleryMode": {
      "type": "stringFromList",
      "default": "Full Res",
      "options": <String>["Sample", "Full Res"],
    },
    "galleryScrollDirection": {
      "type": "stringFromList",
      "default": "Horizontal",
      "options": <String>["Horizontal", "Vertical"],
    },
    "galleryBarPosition": {
      "type": "stringFromList",
      "default": "Top",
      "options": <String>["Top", "Bottom"],
    },
    "zoomButtonPosition": {
      "type": "stringFromList",
      "default": "Right",
      "options": <String>["Disabled", "Left", "Right"],
    },
    "changePageButtonsPosition": {
      "type": "stringFromList",
      "default": "Disabled",
      "options": <String>["Disabled", "Left", "Right"],
    },

    // string
    "deftags": {
      "type": "string",
      "default": "rating:safe",
    },
    "prefBooru": {
      "type": "string",
      "default": "",
    },
    "extPathOverride": {
      "type": "string",
      "default": "",
    },
    "drawerMascotPathOverride": {
      "type": "string",
      "default": "",
    },
    "lastSyncIp": {
      "type": "string",
      "default": "",
    },
    "lastSyncPort": {
      "type": "string",
      "default": "",
    },

    // stringList
    "hatedTags": {
      "type": "stringList",
      "default": <String>[],
    },
    "lovedTags": {
      "type": "stringList",
      "default": <String>[],
    },

    // int
    "limit": {
      "type": "int",
      "default": 20,
      "upperLimit": 100,
      "lowerLimit": 10,
    },
    "portraitColumns": {
      "type": "int",
      "default": 2,
      "upperLimit": 100,
      "lowerLimit": 1,
    },
    "landscapeColumns": {
      "type": "int",
      "default": 4,
      "upperLimit": 100,
      "lowerLimit": 1,
    },
    "preloadCount": {
      "type": "int",
      "default": 1,
      "upperLimit": 3,
      "lowerLimit": 0,
    },
    "snatchCooldown": {
      "type": "int",
      "default": 250,
      "upperLimit": 10000,
      "lowerLimit": 0,
    },
    "volumeButtonsScrollSpeed": {
      "type": "int",
      "default": 200,
      "upperLimit": 1000000,
      "lowerLimit": 0,
    },
    "galleryAutoScrollTime": {
      "type": "int",
      "default": 4000,
      "upperLimit": 100000,
      "lowerLimit": 100,
    },
    "cacheSize": {
      "type": "int",
      "default": 3,
      "upperLimit": 10,
      "lowerLimit": 0,
    },

    // double

    // bool
    "jsonWrite": {
      "type": "bool",
      "default": false,
    },
    "autoPlayEnabled": {
      "type": "bool",
      "default": true,
    },
    "loadingGif": {
      "type": "bool",
      "default": false,
    },
    "thumbnailCache": {
      "type": "bool",
      "default": true,
    },
    "mediaCache": {
      "type": "bool",
      "default": false,
    },
    "autoHideImageBar": {
      "type": "bool",
      "default": false,
    },
    "dbEnabled": {
      "type": "bool",
      "default": true,
    },
    "searchHistoryEnabled": {
      "type": "bool",
      "default": true,
    },
    "filterHated": {
      "type": "bool",
      "default": false,
    },
    "useVolumeButtonsForScroll": {
      "type": "bool",
      "default": false,
    },
    "shitDevice": {
      "type": "bool",
      "default": false,
    },
    "disableVideo": {
      "type": "bool",
      "default": false,
    },
    "enableDrawerMascot": {
      "type": "bool",
      "default": false,
    },
    "allowSelfSignedCerts":{
      "type" : "bool",
      "default": false,
    },
    "showStatusBar": {
      "type": "bool",
      "default": true,
    },
    "disableImageScaling": {
      "type": "bool",
      "default": false,
    },


    // other
    "buttonOrder": {
      "type": "other",
      "default": <List<String>>[
        ["autoscroll", "AutoScroll"],
        ["snatch", "Save"],
        ["favourite", "Favourite"],
        ["info", "Display Info"],
        ["share", "Share"],
        ["open", "Open in Browser"],
        ["reloadnoscale", "Reload w/out scaling"]
      ],
    },
    "cacheDuration": {
      "type": "duration",
      "default": Duration.zero,
      "options": <Map<String, dynamic>>[
        {'label': 'Never', 'value': Duration.zero},
        {'label': '30 minutes', 'value': Duration(minutes: 30)},
        {'label': '1 hour', 'value': Duration(hours: 1)},
        {'label': '6 hours', 'value': Duration(hours: 6)},
        {'label': '12 hours', 'value': Duration(hours: 12)},
        {'label': '1 day', 'value': Duration(days: 1)},
        {'label': '2 days', 'value': Duration(days: 2)},
        {'label': '1 week', 'value': Duration(days: 7)},
        {'label': '1 month', 'value': Duration(days: 30)},
      ],
    },

    // theme
    "theme": {
      "type": "theme",
      "default": ThemeItem(name: "Pink", primary: Colors.pink[200], accent: Colors.pink[600]),
      "options": <ThemeItem>[
        ThemeItem(name: "Pink", primary: Colors.pink[200], accent: Colors.pink[600]),
        ThemeItem(name: "Purple", primary: Colors.deepPurple[600], accent: Colors.deepPurple[800]),
        ThemeItem(name: "Blue", primary: Colors.lightBlue, accent: Colors.lightBlue[600]),
        ThemeItem(name: "Teal", primary: Colors.teal, accent: Colors.teal[600]),
        ThemeItem(name: "Red", primary: Colors.red[700], accent: Colors.red[800]),
        ThemeItem(name: "Green", primary: Colors.green, accent: Colors.green[700]),
        ThemeItem(name: "Custom", primary: null, accent: null),
      ]
    },
    "themeMode": {
      "type": "themeMode",
      "default": ThemeMode.dark,
      "options": ThemeMode.values,
    },
    "isAmoled": {
      "type": "rxbool",
      "default": false.obs,
    },
    "customPrimaryColor": {
      "type": "rxcolor",
      "default": Colors.pink[200],
    },
    "customAccentColor": {
      "type": "rxcolor",
      "default": Colors.pink[600],
    },
  };

  dynamic validateValue(String name, dynamic value, {bool toJSON = false}) {
    Map<String, dynamic>? settingParams = map[name];

    if(toJSON) {
      value = getByString(name);
    }

    if(settingParams == null) {
      if(toJSON) {
        return value.toString();
      } else {
        return value;
      }
    }

    try {
      switch (settingParams["type"]) {
        case 'stringFromList':
          String validValue = List<String>.from(settingParams["options"]!).firstWhere((el) => el == value, orElse: () => '');
          if(validValue != '') {
            return validValue;
          } else {
            return settingParams["default"];
          }

        case 'string':
          if(!(value is String)) {
            throw 'value "$value" for $name is not a String';
          } else {
            return value;
          }

        case 'int':
          int? parse = (value is String) ? int.tryParse(value) : (value is int ? value : null);
          if(parse == null) {
            throw 'value "$value" of type ${value.runtimeType} for $name is not an int';
          } else if (parse < settingParams["lowerLimit"] || parse > settingParams["upperLimit"]) {
            if(toJSON) {
              // force default value when not passing validation when saving
              setByString(name, settingParams["default"]);
            }
            return settingParams["default"];
          } else {
            return parse;
          }

        case 'bool':
          if(!(value is bool)) {
            if(value is String && (value == 'true' || value == 'false')) {
              return value == 'true' ? true : false;
            } else {
              throw 'value "$value" for $name is not a bool';
            }
          } else {
            return value;
          }

        case 'rxbool':
          if (toJSON) {
            // rxbool to bool
            return value.value;
          } else {
            // bool to rxbool
            if(value is RxBool) {
              return value;
            } else if (value is bool) {
              return value.obs;
            } else {
              throw 'value "$value" for $name is not a rxbool';
            }
          }

        case 'theme':
          if(toJSON) {
            // rxobject to string
            return value.value.name;
          } else {
            if(value is String) {
              // string to rxobject
              final ThemeItem findTheme = List<ThemeItem>.from(settingParams["options"]!).firstWhere((el) => el.name == value, orElse: () => settingParams["default"]);
              return findTheme;
            } else {
              return settingParams["default"];
            }
          }

        case 'themeMode':
          if (toJSON) {
            // rxobject to string
            return value.value.toString().split('.')[1]; // ThemeMode.dark => dark
          } else {
            if (value is String) {
              // string to rxobject
              final List<ThemeMode> findMode = ThemeMode.values.where((element) => element.toString() == 'ThemeMode.$value').toList();
              if (findMode.length > 0) {
                // if theme mode is present
                return findMode[0];
              } else {
                // if not theme mode with given name
                return settingParams["default"];
              }
            } else {
              return settingParams["default"];
            }
          }

        case 'rxcolor':
          if (toJSON) {
            // rxobject to int
            return value.value.value; // Color => int
          } else {
            // int to rxobject
            if (value is int) {
              return Color(value);
            } else {
              return settingParams["default"];
            }
          }

        case 'duration':
          if (toJSON) {
            return value.inSeconds; // Duration => int
          } else {
            if (value is Duration) {
              return value;
            } else if(value is int) {
              // int to Duration
              return Duration(seconds: value);
            } else {
              return settingParams["default"];
            }
          }

        // case 'stringList':
        default:
          return value;
      }
    } catch(err) {
      // return default value on exceptions
      Logger.Inst().log('value validation error: $err',"SettingsHandler","validateValue",LogTypes.settingsError);
      return settingParams["default"];
    }
  }

  Future<bool> debugLoadAndSaveLegacy() async {
    if(await checkForLegacySettings()) {
      await loadLegacySettings();
    }
    await saveSettings(restate: true);

    return true;
  }

  Future<bool> loadSettings() async {
    if (path == "") await setConfigDir();
    if (cachePath == "") cachePath = await serviceHandler.getCacheDir();
    if (SDKVer == 0) SDKVer = await serviceHandler.getSDKVersion();

    if(await checkForSettings()) {
      await loadSettingsJson();
    } else if(await checkForLegacySettings()) {
      await loadLegacySettings();
    } else {
      await saveSettings(restate: true);
    }

    if (dbEnabled) {
      await dbHandler.dbConnect(path);
      await favDbHandler.dbConnectReadOnly(path);
    } else {
      dbHandler = DBHandler();
      favDbHandler = DBHandler();
    }
    ignoreLogTypes.addAll(LogTypes.values);
    return true;
  }

  Future<bool> checkForSettings() async {
    File settingsFile = File(path + "settings.json");
    return await settingsFile.exists();
  }
  Future<void> loadSettingsJson() async {
    File settingsFile = File(path + "settings.json");
    String settings = await settingsFile.readAsString();
    // print('loadJSON $settings');
    loadFromJSON(settings, true);
    return;
  }

  Future<bool> checkForLegacySettings() async {
    File settingsFile = File(path + "settings.conf");
    return await settingsFile.exists();
  }
  Future<void> loadLegacySettings() async {
    File settingsFile = File(path + "settings.conf");
    List<String> settings = await settingsFile.readAsLines();
    for (int i=0;i < settings.length; i++){
      List<String> itemSplit = settings[i].split(" = ");
      if (itemSplit.length < 2) continue; // skip where no ' = ' substring or no value after it
      String itemName = itemSplit[0];
      String itemValue = itemSplit[1]; // can be: string, int, double, bool, other special cases
      switch(itemName) {
        case("Default Tags"):
          setByString('defTags', itemValue);
          break;
        case("Limit"):
          setByString('limit', itemValue);
          break;
        case("Preview Mode"):
          setByString('previewMode', itemValue);
          break;
        case("Portrait Columns"):
          setByString('portraitColumns', itemValue);
          break;
        case("Landscape Columns"):
          setByString('landscapeColumns', itemValue);
          break;
        case("Preload Count"):
          setByString('preloadCount', itemValue);
          break;
        case("Write Json"):
          setByString('jsonWrite', itemValue == "true");
          break;
        case("Auto Play"):
          setByString('autoPlayEnabled', itemValue == "true");
          break;
        case("Loading Gif"):
          setByString('loadingGif', itemValue == "true");
          break;
        // don't restore thumbnail cache setting, because in 2.0 we need to force enable it for everyone
        // case("Image Cache"):
        //   setByString('thumbnailCache', itemValue == "true");
        //   break;
        case("Media Cache"):
          setByString('mediaCache', itemValue == "true");
          break;
        case("Video Cache Mode"):
          setByString('videoCacheMode', itemValue);
          break;
        case("Share Action"):
          setByString('shareAction', itemValue);
          break;
        case("Pref Booru"):
          setByString('prefBooru', itemValue);
          break;
        case ("Autohide Bar"):
          setByString('autoHideImageBar', itemValue == "true");
          break;
        case("Snatch Cooldown"):
          setByString('snatchCooldown', itemValue);
          break;
        case ("Preview Display"):
          setByString('previewDisplay', itemValue);
          break;
        case ("Gallery Mode"):
          setByString('galleryMode', itemValue);
          break;
        case ("Gallery Bar Position"):
          setByString('galleryBarPosition', itemValue);
          break;
        case ("Gallery Scroll Direction"):
          setByString('galleryScrollDirection', itemValue);
          break;
        case ("Enable Database"):
          setByString('dbEnabled', itemValue == "true");
          break;
        case ("Search History"):
          setByString('searchHistoryEnabled', itemValue == "true");
          break;
        case ("App Mode"):
          setByString('appMode', itemValue);
          break;
        case("Buttons Order"):
          List<List<String>> tempOrder = itemValue.split(',').map((bstr) {
            List<String> button = buttonList.singleWhere((el) => el[0] == bstr, orElse: () => ['null', 'null']);
            return button;
          }).where((el) => el[0] != 'null').toList(); // split button names string, get their [name, label] list, filter all wrong values

          tempOrder.addAll(buttonList.where((el) => !tempOrder.contains(el))); // add all buttons that are not present in the parsed list (future proofing, in case we add more buttons later)
          buttonOrder = tempOrder;
          break;
        case("Hated Tags"):
          hatedTags = cleanTagsList(itemValue.split(','));
          break;
        case ("Filter Hated"):
          setByString('filterHated', itemValue == "true");
          break;
        case("Loved Tags"):
          lovedTags = cleanTagsList(itemValue.split(','));
          break;
        case ("Volume Buttons Scroll"):
          setByString('useVolumeButtonsForScroll', itemValue == "true");
          break;
        case("Volume Buttons Scroll Speed"):
          setByString('volumeButtonsScrollSpeed', itemValue);
          break;
        case ("Shit Device"):
          setByString('shitDevice', itemValue == "true");
          break;
        case ("Disable Video"):
          setByString('disableVideo', itemValue == "true");
          break;
        case ("Ext Path"):
          setByString('extPathOverride', itemValue);
          break;
        case ("Gallery Auto Scroll"):
          setByString('galleryAutoScrollTime', itemValue);
          break;
      }
    }
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
      case 'shareAction':
        return shareAction;
      case 'limit':
        return limit;
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
      case 'searchHistoryEnabled':
        return searchHistoryEnabled;
      case 'filterHated':
        return filterHated;
      case 'useVolumeButtonsForScroll':
        return useVolumeButtonsForScroll;
      case 'volumeButtonsScrollSpeed':
        return volumeButtonsScrollSpeed;
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
      case 'disableImageScaling':
        return disableImageScaling;
      case 'cacheDuration':
        return cacheDuration;
      case 'cacheSize':
        return cacheSize;
      case 'allowSelfSignedCerts':
        return allowSelfSignedCerts;

      case 'prefBooru':
        return prefBooru;
      case 'appMode':
        return appMode;
      case 'extPathOverride':
        return extPathOverride;
      case 'drawerMascotPathOverride':
        return drawerMascotPathOverride;
      case 'enableDrawerMascot':
        return enableDrawerMascot;
      case 'lastSyncIp':
        return lastSyncIp;
      case 'lastSyncPort':
        return lastSyncPort;

      // theme stuff
      case 'theme':
        return theme;
      case 'themeMode':
        return themeMode;
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
    dynamic validatedValue = validateValue(varName, value);
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
      case 'shareAction':
        shareAction = validatedValue;
        break;
      case 'limit':
        limit = validatedValue;
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
      case 'searchHistoryEnabled':
        searchHistoryEnabled = validatedValue;
        break;
      case 'filterHated':
        filterHated = validatedValue;
        break;
      case 'useVolumeButtonsForScroll':
        useVolumeButtonsForScroll = validatedValue;
        break;
      case 'volumeButtonsScrollSpeed':
        volumeButtonsScrollSpeed = validatedValue;
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
      case 'disableImageScaling':
        disableImageScaling = validatedValue;
        break;
      case 'cacheDuration':
        cacheDuration = validatedValue;
        break;
      case 'cacheSize':
        cacheSize = validatedValue;
        break;
      case 'prefBooru':
        prefBooru = validatedValue;
        break;
      case 'appMode':
        appMode = validatedValue;
        break;
      case 'extPathOverride':
        extPathOverride = validatedValue;
        break;
      case 'lastSyncIp':
        lastSyncIp = validatedValue;
        break;
      case 'lastSyncPort':
        lastSyncPort = validatedValue;
        break;
      case 'allowSelfSignedCerts':
        allowSelfSignedCerts = validatedValue;
        break;
      // theme stuff
      case 'theme':
        theme.value = validatedValue;
        break;
      case 'themeMode':
        themeMode.value = validatedValue;
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


  Map<String, dynamic> toJSON() {
    Map<String, dynamic> json = {
      "defTags": validateValue("defTags", null, toJSON: true),
      "previewMode": validateValue("previewMode", null, toJSON: true),
      "videoCacheMode": validateValue("videoCacheMode", null, toJSON: true),
      "previewDisplay": validateValue("previewDisplay", null, toJSON: true),
      "galleryMode": validateValue("galleryMode", null, toJSON: true),
      "shareAction" : validateValue("shareAction", null, toJSON: true),
      "limit" : validateValue("limit", null, toJSON: true),
      "portraitColumns" : validateValue("portraitColumns", null, toJSON: true),
      "landscapeColumns" : validateValue("landscapeColumns", null, toJSON: true),
      "preloadCount" : validateValue("preloadCount", null, toJSON: true),
      "snatchCooldown" : validateValue("snatchCooldown", null, toJSON: true),
      "galleryBarPosition" : validateValue("galleryBarPosition", null, toJSON: true),
      "galleryScrollDirection" : validateValue("galleryScrollDirection", null, toJSON: true),
      "jsonWrite" : validateValue("jsonWrite", null, toJSON: true),
      "autoPlayEnabled" : validateValue("autoPlayEnabled", null, toJSON: true),
      "loadingGif" : validateValue("loadingGif", null, toJSON: true),
      "thumbnailCache" : validateValue("thumbnailCache", null, toJSON: true),
      "mediaCache": validateValue("mediaCache", null, toJSON: true),
      "autoHideImageBar" : validateValue("autoHideImageBar", null, toJSON: true),
      "dbEnabled" : validateValue("dbEnabled", null, toJSON: true),
      "searchHistoryEnabled" : validateValue("searchHistoryEnabled", null, toJSON: true),
      "filterHated" : validateValue("filterHated", null, toJSON: true),
      "useVolumeButtonsForScroll" : validateValue("useVolumeButtonsForScroll", null, toJSON: true),
      "volumeButtonsScrollSpeed" : validateValue("volumeButtonsScrollSpeed", null, toJSON: true),
      "disableVideo" : validateValue("disableVideo", null, toJSON: true),
      "shitDevice" : validateValue("shitDevice", null, toJSON: true),
      "galleryAutoScrollTime" : validateValue("galleryAutoScrollTime", null, toJSON: true),
      "zoomButtonPosition": validateValue("zoomButtonPosition", null, toJSON: true),
      "changePageButtonsPosition": validateValue("changePageButtonsPosition", null, toJSON: true),
      "disableImageScaling" : validateValue("disableImageScaling", null, toJSON: true),
      "cacheDuration" : validateValue("cacheDuration", null, toJSON: true),
      "cacheSize" : validateValue("cacheSize", null, toJSON: true),
      "allowSelfSignedCerts": validateValue("allowSelfSignedCerts", null, toJSON: true),

      //TODO
      "buttonOrder": buttonOrder.map((e) => e[0]).toList(),
      "hatedTags": cleanTagsList(hatedTags),
      "lovedTags": cleanTagsList(lovedTags),

      "prefBooru": validateValue("prefBooru", null, toJSON: true),
      "appMode": validateValue("appMode", null, toJSON: true),
      "extPathOverride": validateValue("extPathOverride", null, toJSON: true),
      "lastSyncIp": validateValue("lastSyncIp", null, toJSON: true),
      "lastSyncPort": validateValue("lastSyncPort", null, toJSON: true),

      "theme": validateValue("theme", null, toJSON: true),
      "themeMode": validateValue("themeMode", null, toJSON: true),
      "isAmoled": validateValue("isAmoled", null, toJSON: true),
      "enableDrawerMascot" : validateValue("enableDrawerMascot", null, toJSON: true),
      "drawerMascotPathOverride": validateValue("drawerMascotPathOverride", null, toJSON: true),
      "customPrimaryColor": validateValue("customPrimaryColor", null, toJSON: true),
      "customAccentColor": validateValue("customAccentColor", null, toJSON: true),

      "version": verStr,
      "SDK": SDKVer,
    };

    // print('JSON $json');
    return json;
  }

  Future<bool> loadFromJSON(String jsonString, bool setMissingKeys) async {
    Map<String, dynamic> json = jsonDecode(jsonString);

    var tempBtnOrder = json["buttonOrder"];
    if(tempBtnOrder is List) {
      // print('btnorder is a list');
    } else if(tempBtnOrder is String) {
      // print('btnorder is a string');
      tempBtnOrder = tempBtnOrder.split(',');
    } else {
      // print('btnorder is a ${tempBtnOrder.runtimeType} type');
      tempBtnOrder = [];
    }
    List<List<String>> btnOrder = List<String>.from(tempBtnOrder).map((bstr) {
      List<String> button = buttonList.singleWhere((el) => el[0] == bstr, orElse: () => ['null', 'null']);
      return button;
    }).where((el) => el[0] != 'null').toList();
    btnOrder.addAll(buttonList.where((el) => !btnOrder.contains(el))); // add all buttons that are not present in the parsed list (future proofing, in case we add more buttons later)
    buttonOrder = btnOrder;

    var tempHatedTags = json["hatedTags"];
    if(tempHatedTags is List) {
      // print('hatedTags is a list');
    } else if(tempHatedTags is String) {
      // print('hatedTags is a string');
      tempHatedTags = tempHatedTags.split(',');
    } else {
      // print('hatedTags is a ${tempHatedTags.runtimeType} type');
      tempHatedTags = [];
    }
    List<String> hateTags = List<String>.from(tempHatedTags);
    for (int i = 0; i < hateTags.length; i++){
      if (!hatedTags.contains(hateTags.elementAt(i))) {
        hatedTags.add(hateTags.elementAt(i));
      }
    }

    var tempLovedTags = json["lovedTags"];
    if(tempLovedTags is List) {
      // print('lovedTags is a list');
    } else if(tempLovedTags is String) {
      // print('lovedTags is a string');
      tempLovedTags = tempLovedTags.split(',');
    } else {
      // print('lovedTags is a ${tempLovedTags.runtimeType} type');
      tempLovedTags = [];
    }
    List<String> loveTags = List<String>.from(tempLovedTags);
    for (int i = 0; i < loveTags.length; i++){
      if (!lovedTags.contains(loveTags.elementAt(i))){
        lovedTags.add(loveTags.elementAt(i));
      }
    }

    List<String> leftoverKeys = json.keys.where((element) => !['buttonOrder', 'hatedTags', 'lovedTags'].contains(element)).toList();
    for(String key in leftoverKeys) {
      // print('key $key val ${json[key]} type ${json[key].runtimeType}');
      setByString(key, json[key]);
    }

    if(setMissingKeys) {
      // find all keys that are missing in the file and set them to default values
      map.forEach((key, value) {
        if (!json.keys.contains(key)) {
          if (map[key] != null) {
            setByString(key, map[key]!['default']);
          }
        }
      });
    }

    return true;
  }

  Future<bool> saveSettings({required bool restate}) async {
    await getPerms();
    if (path == "") await setConfigDir();
    await Directory(path).create(recursive:true);

    File settingsFile = File(path + "settings.json");
    var writer = settingsFile.openWrite();
    writer.write(jsonEncode(toJSON()));
    writer.close();

    if(restate) Get.find<SearchHandler>().rootRestate(); // force global state update to redraw stuff
    return true;
  }

  Future<bool> saveSettingsLegacy({withMessage = true}) async {
    await getPerms();
    if (path == "") await setConfigDir();
    await Directory(path).create(recursive:true);

    File settingsFile = File(path + "settings.conf");
    var writer = settingsFile.openWrite();

    writer.write("Default Tags = $defTags\n");
    // this.defTags = defTags;

    writer.write("Buttons Order = ${buttonOrder.map((e) => e[0]).join(',')}\n");
    // this.buttonOrder = buttonOrder;

    writer.write("Hated Tags = ${cleanTagsList(hatedTags).join(',')}\n");
    // this.hatedTags = hatedTags;

    writer.write("Filter Hated = $filterHated\n");

    writer.write("Loved Tags = ${cleanTagsList(lovedTags).join(',')}\n");
    // this.lovedTags = lovedTags;

    writer.write("Volume Buttons Scroll = $useVolumeButtonsForScroll\n");
    writer.write("Volume Buttons Scroll Speed = $volumeButtonsScrollSpeed\n");

    // Write limit if its between 0-100
    if (limit <= 100 && limit >= 5){
      writer.write("Limit = $limit\n");
    } else {
      // Close writer and alert user
      writer.write("Limit = 20\n");
      ServiceHandler.displayToast("Settings Error \n $limit is not a valid Limit amount, Defaulting to 20");
    }
    writer.write("Landscape Columns = $landscapeColumns\n");
    writer.write("Portrait Columns = $portraitColumns\n");
    writer.write("Preview Mode = $previewMode\n");
    writer.write("Preload Count = $preloadCount\n");
    writer.write("Write Json = $jsonWrite\n");
    writer.write("Pref Booru = $prefBooru\n");
    writer.write("Auto Play = $autoPlayEnabled\n");
    writer.write("Loading Gif = $loadingGif\n");
    writer.write("Image Cache = $thumbnailCache\n");
    writer.write("Media Cache = $mediaCache\n");
    writer.write("Video Cache Mode = $videoCacheMode\n");
    writer.write("Share Action = $shareAction\n");
    writer.write("Autohide Bar = $autoHideImageBar\n");
    writer.write("Snatch Cooldown = $snatchCooldown\n");
    writer.write("Preview Display = $previewDisplay\n");
    writer.write("Gallery Mode = $galleryMode\n");
    writer.write("Gallery Bar Position = $galleryBarPosition\n");
    writer.write("Gallery Scroll Direction = $galleryScrollDirection\n");
    writer.write("Enable Database = $dbEnabled\n");
    writer.write("Search History = $searchHistoryEnabled\n");
    writer.write("App Mode = $appMode\n");
    writer.write("Shit Device = $shitDevice\n");
    writer.write("Disable Video = $disableVideo\n");
    writer.write("Ext Path = $extPathOverride\n");
    writer.write("Gallery Auto Scroll = $galleryAutoScrollTime\n");
    writer.close();
    if(withMessage) ServiceHandler.displayToast("Settings Saved!\nSome changes may not take effect until the search is refreshed or the app is restarted");

    Get.find<SearchHandler>().rootRestate(); // force global state update to redraw stuff
    return true;
  }

  Future<bool> loadBoorus() async {
    List<Booru> tempList = [];
    try {
      if (path == "") await setConfigDir();

      Directory directory = Directory(boorusPath);
      Directory legacyDirectory = Directory(path);
      bool fromLegacy = false;

      // TODO get rid of this legacy logic after 2.1-2.2, when most users will update to json format
      List files = [];
      if(await directory.exists()) {
        files = directory.listSync();
      } else if(await legacyDirectory.exists()) {
        fromLegacy = true;
        files = legacyDirectory.listSync();
      }

      if (files.length > 0) {
        for (int i = 0; i < files.length; i++) {
          if (files[i].path.contains(fromLegacy ? ".booru" : ".json")) { // && files[i].path != 'settings.json'
            // print(files[i].toString());
            Booru booruFromFile = fromLegacy ? Booru.fromFileLegacy(files[i]) : Booru.fromJSON(files[i].readAsStringSync());
            tempList.add(booruFromFile);
            if(fromLegacy) {
              saveBooru(booruFromFile, onlySave: true);
            }
            if (booruFromFile.type == "Hydrus") {
              hasHydrus = true;
            }
          }
        }
      }

      if (dbEnabled && tempList.isNotEmpty){
        tempList.add(Booru("Favourites", "Favourites", "", "", ""));
      }
    } catch (e){
      print('Booru loading error: $e');
    }

    // TODO boorus get duplicated on first load after legacy -> json
    booruList.value = tempList.where((element) => !booruList.contains(element)).toList(); // filter due to possibility of duplicates after legacy -> json saving

    if (tempList.isNotEmpty){
      sortBooruList();
    } else {
      print(prefBooru);
      print(tempList.isNotEmpty);
    }
    return true;
  }



  void sortBooruList() async {
    List<Booru> sorted = [...booruList]; // spread the array just in case, to guarantee that we don't affect the original value
    sorted.sort((a, b) {
      // sort alphabetically
      return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
    });

    int prefIndex = 0;
    for (int i = 0; i < sorted.length; i++){
      if (sorted[i].name == prefBooru && prefBooru.isNotEmpty){
        prefIndex = i;
        // print("prefIndex is" + prefIndex.toString());
      }
    }
    if (prefIndex != 0){
      // move default booru to top
      // print("Booru pref found in booruList");
      Booru tmp = sorted.elementAt(prefIndex);
      sorted.remove(tmp);
      sorted.insert(0, tmp);
      // print("booruList is");
      // print(sorted);
    }

    int favsIndex = sorted.indexWhere((el) => el.type == 'Favourites');
    if(favsIndex != -1) {
      // move favourites to the end
      Booru tmp = sorted.elementAt(favsIndex);
      sorted.remove(tmp);
      sorted.add(tmp);
    }
    booruList.value = sorted;
  }

  Future saveBooru(Booru booru, {bool onlySave: false}) async {
    if (path == "") await setConfigDir();

    await Directory(boorusPath).create(recursive:true);
    File booruFile = File(boorusPath + "${booru.name}.json");
    var writer = booruFile.openWrite();
    writer.write(jsonEncode(booru.toJSON()));
    writer.close();

    if(!onlySave) {
      // used only to avoid duplication after migration to json format
      // TODO remove condition when migration logic is removed
      booruList.add(booru);
      sortBooruList();
    }
    return true;
  }

  Future saveBooruLegacy(Booru booru) async {
    if (path == "") await setConfigDir();

    await Directory(path).create(recursive:true);
    File booruFile = File(path + "${booru.name}.booru");
    var writer = booruFile.openWrite();
    writer.write("Booru Name = ${booru.name}\n");
    writer.write("Booru Type = ${booru.type}\n");
    writer.write("Favicon URL = ${booru.faviconURL}\n");
    writer.write("Base URL = ${booru.baseURL}\n");
    writer.write("API Key = ${booru.apiKey}\n");
    writer.write("User ID = ${booru.userID}\n");
    writer.write("Default Tags = ${booru.defTags}\n");
    writer.close();
    booruList.add(booru);
    sortBooruList();
    return true;
  }

  bool deleteBooru(Booru booru){
    File booruFile = File(boorusPath + "${booru.name}.json");
    booruFile.deleteSync();
    if (prefBooru == booru.name){
      prefBooru = "";
      saveSettings(restate: true);
    }
    booruList.remove(booru);
    sortBooruList();
    return true;
  }

  List<List<String>> parseTagsList(List<String> itemTags, {bool isCapped = true}) {
    List<String> cleanItemTags = cleanTagsList(itemTags);
    List<String> hatedInItem = hatedTags.where((tag) => cleanItemTags.contains(tag)).toList();
    List<String> lovedInItem = lovedTags.where((tag) => cleanItemTags.contains(tag)).toList();
    List<String> soundInItem = ['sound', 'sound_edit', 'has_audio', 'voice_acted'].where((tag) => cleanItemTags.contains(tag)).toList();
    // TODO add more sound tags?

    if(isCapped) {
      if(hatedInItem.length > 5) {
        hatedInItem = [...hatedInItem.take(5), '...'];
      }
      if(lovedInItem.length > 5) {
        lovedInItem = [...lovedInItem.take(5), '...'];
      }
    }

    return [hatedInItem, lovedInItem, soundInItem];
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
      default: break;
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
      default: break;
    }
    saveSettings(restate: false);
  }

  List<String> cleanTagsList(List<String> tags) {
    return tags.where((tag) => tag != "").map((tag) => tag.trim().toLowerCase()).toList();
  }

  void checkUpdate({bool withMessage = false}) async {
    // String fakeUpdate = '{"version_name": "2.0.0", "build_number": 999, "title": "Test Title", "changelog": "Test Changelog\\r\\n- Test Changelog\\r\\n-- Test Changelog\\r\\n", "is_in_store": true, "is_update_in_store": true, "is_important": true, "store_package": "com.android.chrome", "github_url": "https://github.com/NO-ob/LoliSnatcher_Droid/releases/latest"}'; // fake update json for tests
    // String fakeUpdate = '123'; // broken string
    try {
      final response = await http.get(Uri.parse('https://raw.githubusercontent.com/NO-ob/LoliSnatcher_Droid/master/update.json'));
      final json = jsonDecode(response.body);
      // final json = jsonDecode(fakeUpdate);

      updateInfo.value = UpdateInfo(
        versionName: json["version_name"] ?? '0.0.0',
        buildNumber: json["build_number"] ?? 0,
        title: json["title"] ?? '...',
        changelog: json["changelog"] ?? '...',
        isInStore: json["is_in_store"] ?? false,
        isUpdateInStore: json["is_update_in_store"] ?? false,
        isImportant: json["is_important"] ?? false,
        storePackage: json["store_package"] ?? '',
        githubURL: json["github_url"] ?? 'https://github.com/NO-ob/LoliSnatcher_Droid/releases/latest',
      );

      // if current build number is less than update build number in json
      if(buildNumber < (updateInfo.value!.buildNumber)) {
        // is allowed to open update dialog (either after user pressed a button or update is considered important)
        if((withMessage || updateInfo.value!.isImportant)) {
          // if app is from store and app is still in store
          if(EnvironmentConfig.isFromStore && updateInfo.value!.isInStore) {
            // if update is available in store
            if(updateInfo.value!.isUpdateInStore) {
              showUpdate();
            } else {
              // otherwise show latest version message
              showLastVersionMessage(withMessage);
            }
          } else {
            // otherwise always show dialog with a link to github
            showUpdate();
          }
        }
      } else {
        // otherwise show latest version message
        showLastVersionMessage(withMessage);
        updateInfo.value = null;
      }
    } catch (e) {
      if(withMessage) {
        FlashElements.showSnackbar(
          title: Text(
            "Update Check Error!",
            style: TextStyle(fontSize: 20)
          ),
          content: Text(
            e.toString()
          ),
          sideColor: Colors.red,
          leadingIcon: Icons.update,
          leadingIconColor: Colors.red,
        );
      }
    }
  }

  void showLastVersionMessage(bool withMessage) {
    if(withMessage) {
      FlashElements.showSnackbar(
        title: Text(
          "You already have the latest version!",
          style: TextStyle(fontSize: 20)
        ),
        sideColor: Colors.green,
        leadingIcon: Icons.update,
        leadingIconColor: Colors.green,
      );
    }
  }

  void showUpdate() {
    if(updateInfo.value != null) {
      // TODO get from some external variable when building
      bool isFromStore = EnvironmentConfig.isFromStore;

      Get.dialog(
        SettingsDialog(
          title: Text('Update Available: ${updateInfo.value!.versionName}+${updateInfo.value!.buildNumber}'),
          contentItems: [
            Text('Currently Installed: $verStr+$buildNumber'),
            Text(''),
            Text('${updateInfo.value!.title}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(''),
            Text('Changelog:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(''),
            Text(updateInfo.value!.changelog),
            // .replaceAll("\n", r"\n").replaceAll("\r", r"\r")
          ],
          actionButtons: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(Get.context!).pop(true);
              },
              child: Text('Later')
            ),
            if(isFromStore && updateInfo.value!.isInStore)
              ElevatedButton.icon(
                onPressed: () async {
                  // try {
                  //   ServiceHandler.launchURL("market://details?id=" + updateInfo.value!.storePackage);
                  // } on PlatformException catch(e) {
                  //   ServiceHandler.launchURL("https://play.google.com/store/apps/details?id=" + updateInfo.value!.storePackage);
                  // }
                  ServiceHandler.launchURL("https://play.google.com/store/apps/details?id=" + updateInfo.value!.storePackage);
                  Navigator.of(Get.context!).pop(true);
                },
                icon: Icon(Icons.play_arrow),
                label: Text('Visit Play Store')
              )
            else
              ElevatedButton.icon(
                onPressed: () {
                  ServiceHandler.launchURL(updateInfo.value!.githubURL);
                  Navigator.of(Get.context!).pop(true);
                },
                icon: Icon(Icons.exit_to_app),
                label: Text('Visit Releases')
              ),
          ],
        ),
        barrierDismissible: false,
      );
    }
  }

  Future<void> setConfigDir() async {
    // print('-=-=-=-=-=-=-=-');
    // print(Platform.environment);
    path = await serviceHandler.getConfigDir();
    boorusPath = path + 'boorus/';
    return;
  }


  Future<void> initialize() async {
    try {
      await getPerms();
      await loadSettings();

      if (booruList.isEmpty){
        await loadBoorus();
      }
      if (allowSelfSignedCerts){
        HttpOverrides.global = MyHttpOverrides();
      }

      if(Platform.isAndroid || Platform.isIOS) {
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        packageName = packageInfo.packageName;
      }

      // if(Platform.isAndroid || Platform.isIOS) {
      //   // TODO on desktop flutter doesnt't use version data from pubspec
      //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
      //   appName = packageInfo.appName;
      //   verStr = packageInfo.version;

      //   // in debug build this gives the right number, but in release it adds 2? (162 => 2162)
      //   buildNumber = int.tryParse(packageInfo.buildNumber) ?? 100;
      //   // print('packegaInfo: ${packageInfo.version} ${packageInfo.buildNumber} ${packageInfo.buildSignature}');
      // }

      print('isFromStore: ${EnvironmentConfig.isFromStore}');

      // print('=-=-=-=-=-=-=-=-=-=-=-=-=');
      // print(toJSON());
      // print(jsonEncode(toJSON()));

      checkUpdate(withMessage: false);
      isInit.value = true;
    } catch (e) {
      print(e);
      FlashElements.showSnackbar(
        title: Text(
          "Initialization Error!",
          style: TextStyle(fontSize: 20)
        ),
        content: Text(
          e.toString()
        ),
        sideColor: Colors.red,
        leadingIcon: Icons.error,
        leadingIconColor: Colors.red,
      );
    }
    return;
  }
}


class UpdateInfo {
  String versionName;
  int buildNumber;
  String title;
  String changelog;
  bool isInStore;
  bool isUpdateInStore;
  bool isImportant;
  String storePackage;
  String githubURL;

  UpdateInfo({
    required this.versionName,
    required this.buildNumber,
    required this.title,
    required this.changelog,
    required this.isInStore,
    required this.isUpdateInStore,
    required this.isImportant,
    required this.storePackage,
    required this.githubURL,
  });
}

class EnvironmentConfig {
  static const isFromStore = bool.fromEnvironment(
    'LS_IS_STORE',
    defaultValue: false
  );
}
