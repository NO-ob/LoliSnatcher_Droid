import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:path_provider/path_provider.dart';
import 'package:vibration/vibration.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

//The ServiceHandler class calls kotlin functions in MainActivity.kt
class ServiceHandler {
  static void log(
    Object? e, {
    StackTrace? s,
  }) {
    if (kDebugMode) {
      Logger.Inst().log(
        e.toString(),
        'ServiceHandler',
        'log',
        LogTypes.exception,
        s: s,
      );
    }
  }

  static const platform = MethodChannel('com.noaisu.loliSnatcher/services');

  static Future<void> restartApp() {
    return platform.invokeMethod('restartApp');
  }

  static Future<int> getAndroidSDKVersion() async {
    int result = 0;
    try {
      result = await platform.invokeMethod('getSdkVersion');
    } catch (e) {
      log(e);
    }
    return result;
  }

  // Gets main storage dir
  static Future<String> getExtDir() async {
    String result = '';
    try {
      if (Platform.isAndroid) {
        result = await platform.invokeMethod('getExtPath');
      } else if (Platform.isLinux) {
        result = Platform.environment['HOME']!;
      } else if (Platform.isWindows) {
        result = Platform.environment['LOCALAPPDATA']!;
      } else if (Platform.isIOS) {
        result = (await getApplicationDocumentsDirectory()).path;
      }
    } catch (e) {
      log(e);
    }
    return result;
  }

  static Future<String> setExtDir() async {
    String result = '';
    try {
      result = await platform.invokeMethod('setExtPath');
      log('Service handler got uri back: $result');
    } catch (e) {
      log(e);
    }
    // File(result+"/test.txt").create(recursive: true);
    return result;
  }

  static Future<String> getImageSAFUri() async {
    String result = '';
    try {
      result = await platform.invokeMethod('selectImage');
      log('Service handler got uri back: $result');
    } catch (e) {
      log(e);
    }
    // File(result+"/test.txt").create(recursive: true);
    return result;
  }

  static Future<Uint8List?> getSAFFile(String contentUri) async {
    Uint8List? result;
    try {
      result = await platform.invokeMethod('getFileBytes', {'uri': contentUri});
      log('Got file back');
    } catch (e) {
      log(e);
    }
    // File(result+"/test.txt").create(recursive: true);
    return result;
  }

  static Future<String> getSAFFileExtension(String contentUri) async {
    String result = '';
    try {
      result = await platform.invokeMethod('getFileExtension', {'uri': contentUri});
      log('Got file ext back');
      log(result);
    } catch (e) {
      log(e);
    }
    // File(result+"/test.txt").create(recursive: true);
    return result;
  }

  // This function only grants access until device reboot
  static Future<String> getSAFDirectoryAccess() async {
    String result = '';
    try {
      result = await platform.invokeMethod('getTempDirAccess');
      log('Got saf path back');
      log(result);
    } catch (e) {
      log(e);
    }
    return result;
  }

  static Future<Uint8List?> getFileFromSAFDirectory(String safUri, String fileName) async {
    Uint8List? result;
    try {
      result = await platform.invokeMethod('getFileByName', {'uri': safUri, 'fileName': fileName});
      log('found file $fileName');
    } catch (e) {
      log(e);
    }
    return result;
  }

  static Future<bool> existsFileFromSAFDirectory(String safUri, String fileName) async {
    bool result = false;
    try {
      result = await platform.invokeMethod('existsFileByName', {'uri': safUri, 'fileName': fileName});
      log('found file $fileName $result');
    } catch (e) {
      log(e);
    }
    return result;
  }

  static Future<String?> createFileStreamFromSAFDirectory(String fileName, String mediaType, String fileExt, String savePath) async {
    String? result;
    try {
      result = await platform.invokeMethod('createFileStream', {'fileName': fileName, 'mediaType': mediaType, 'fileExt': fileExt, 'savePath': savePath});
      log('created file $fileName $result');
    } catch (e) {
      log(e);
    }
    return result;
  }

  static Future<bool> writeStreamToFileFromSAFDirectory(String safUri, Uint8List data) async {
    bool result = false;
    try {
      result = await platform.invokeMethod('writeFileStream', {'uri': safUri, 'data': data}) ?? false;
      // log("wrote file stream $SAFUri");
    } catch (e) {
      log(e);
    }
    return result;
  }

  static Future<bool> closeStreamToFileFromSAFDirectory(String safUri) async {
    bool result = false;
    try {
      result = await platform.invokeMethod('closeStreamToFile', {'uri': safUri}) ?? false;
      log('closed file stream $safUri');
    } catch (e) {
      log(e);
    }
    return result;
  }

  static Future<bool> deleteStreamToFileFromSAFDirectory(String safUri) async {
    bool result = false;
    try {
      result = await platform.invokeMethod('deleteStreamToFile', {'uri': safUri}) ?? false;
      log('deleted file stream $safUri');
    } catch (e) {
      log(e);
    }
    return result;
  }

  static Future<bool> existsFileStreamFromSAFDirectory(String safUri) async {
    bool result = false;
    try {
      result = await platform.invokeMethod('existsStreamToFile', {'uri': safUri});
      log('found file stream $safUri');
    } catch (e) {
      log(e);
    }
    return result;
  }

  static Future<bool> deleteFileFromSAFDirectory(String safUri, String fileName) async {
    bool result = false;
    try {
      result = await platform.invokeMethod('deleteFileByName', {'uri': safUri, 'fileName': fileName});
      log('deleted file $fileName');
    } catch (e) {
      log(e);
    }
    return result;
  }

  static Future<String> getFilesByExt(String safUri, String fileExt) async {
    String result = '';
    try {
      result = await platform.invokeMethod('getTempDirAccess');
      log('Got saf path back');
      log(result);
    } catch (e) {
      log(e);
    }
    return result;
  }

  static Future<bool> copySafFileToDir(String safUri, String fileName, String targetPath) async {
    bool result = false;
    try {
      result = await platform.invokeMethod('copySafFileToDir', {'uri': safUri, 'fileName': fileName, 'targetPath': targetPath});
    } catch (e) {
      log(e);
      result = false;
    }
    return result;
  }

  static Future<bool> copyFileToSafDir(
    String sourcePath,
    String fileName,
    String safUri,
    String mime,
  ) async {
    bool result = false;
    try {
      result = await platform.invokeMethod('copyFileToSafDir', {
        'sourcePath': sourcePath,
        'fileName': fileName,
        'uri': safUri,
        'mime': mime,
      });
    } catch (e) {
      log(e);
      result = false;
    }
    return result;
  }

  static Future<String> getConfigDir() async {
    String result = '';
    if (Platform.isAndroid) {
      result = '${await getExtDir()}/LoliSnatcher/config/'; // await platform.invokeMethod("getDocumentsPath"); ?
    } else if (Platform.isLinux) {
      result = '${await getExtDir()}/.loliSnatcher/config/';
    } else if (Platform.isWindows) {
      result = '${await getExtDir()}/LoliSnatcher/config/';
    } else if (Platform.isIOS) {
      result = '${await getExtDir()}/LoliSnatcher/config/';
    }
    return result;
  }

  static Future<String> testSAFPersistence() async {
    log('test saf persistence');
    String result = '';
    const String safuri = 'content://com.android.externalstorage.documents/tree/1206-2917%3ALolisnatcher';
    try {
      result = await platform.invokeMethod('testSAF', {'uri': safuri});
      log('got saf result $result');
    } catch (e) {
      log(e);
    }
    // final Directory dir = Directory(result);
    return result;
  }

  static Future<String> getDocumentsDir() async {
    String result = '';
    try {
      result = await platform.invokeMethod('getDocumentsPath');
    } catch (e) {
      log(e);
    }
    return result;
  }

  static Future<String> getPicturesDir() async {
    String result = '';
    try {
      if (Platform.isAndroid) {
        result = "${await platform.invokeMethod("getPicturesPath")}/LoliSnatcher/"; // "${await getExtDir()}/Pictures/LoliSnatcher/";
      } else if (Platform.isLinux) {
        result = '${await getExtDir()}/Pictures/LoliSnatcher/';
      } else if (Platform.isWindows) {
        result = '${await getExtDir()}/LoliSnatcher/Pictures/';
      } else if (Platform.isIOS) {
        result = '${await getExtDir()}/LoliSnatcher/Pictures/';
      }
    } catch (e) {
      log(e);
    }
    return result;
  }

  static Future<String> getCacheDir() async {
    String result = '';
    try {
      if (Platform.isAndroid) {
        result = await platform.invokeMethod('getCachePath') + '/';
      } else if (Platform.isLinux) {
        result = '${await getExtDir()}/.loliSnatcher/cache/';
      } else if (Platform.isWindows) {
        result = '${await getExtDir()}/LoliSnatcher/cache/';
      } else if (Platform.isIOS) {
        result = '${await getExtDir()}/LoliSnatcher/cache/';
      }
    } catch (e) {
      log(e);
    }
    return result;
  }

  static Future<void> loadShareTextIntent(String text) async {
    try {
      await platform.invokeMethod('shareText', {'text': text});
      return;
    } catch (e) {
      log(e);
      return;
    }
  }

  static Future<void> loadShareFileIntent(String filePath, String mimeType) async {
    try {
      await platform.invokeMethod('shareFile', {'path': filePath, 'mimeType': mimeType});
      return;
      // log('share closed');
    } catch (e) {
      log(e);
      return;
    }
  }

  static void disableSleep({bool forceEnable = false}) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    if (Platform.isAndroid && (settingsHandler.wakeLockEnabled || forceEnable)) {
      platform.invokeMethod('disableSleep');
    }
  }

  static void enableSleep() {
    if (Platform.isAndroid) {
      platform.invokeMethod('enableSleep');
    }
  }

  static Future<void> emptyCache() async {
    try {
      if (Platform.isAndroid) {
        await platform.invokeMethod('emptyCache');
      } else if (Platform.isIOS) {
        // ???
      } else if (Platform.isLinux || Platform.isWindows) {
        final String cacheD = await getCacheDir();
        final File cacheDir = File(cacheD);
        // TODO parse through possible folder list and don't do recursive to exclude wrong path problems
        await cacheDir.delete(recursive: true);
      }
    } catch (e) {
      log(e);
    }
    return;
  }

  static Future<void> deleteDB(SettingsHandler settingsHandler) async {
    if (Platform.isAndroid) {
      final File dbFile = File('${settingsHandler.path}store.db');
      log(settingsHandler.path);
      await dbFile.delete();
    }
  }

  static Future<void> setSystemUiVisibility(bool visible) async {
    await SystemChrome.setEnabledSystemUIMode(
      visible ? SystemUiMode.edgeToEdge : SystemUiMode.immersiveSticky,
      overlays: visible ? SystemUiOverlay.values : [],
    );
  }

  static Future<String> getIP() async {
    String ip = '';
    // TODO WIP
    if (Platform.isAndroid) {
      ip = await platform.invokeMethod('getIP');
    } else {
      final interfaces = await NetworkInterface.list(type: InternetAddressType.IPv4);
      if (interfaces.isNotEmpty) {
        ip = interfaces[0].addresses[0].address;
      }
    }
    return ip;
  }

  static Future<List<NetworkInterface>> getIPList() async {
    return NetworkInterface.list(type: InternetAddressType.IPv4);
  }

  static void setVolumeButtons(bool setActive) {
    if (Platform.isAndroid) {
      platform.invokeMethod('setVolumeButtons', {'setActive': setActive});
    }
  }

  static Future<Uint8List?> makeVidThumb(String videoURL) async {
    Uint8List? thumbnail;
    if (Platform.isAndroid) {
      thumbnail = await platform.invokeMethod('makeVidThumb', {'videoURL': videoURL});
    }
    return thumbnail;
  }

  static Future<String?> writeImage(
    dynamic imageData,
    String fileName,
    String mediaType,
    String fileExt,
    String? extPathOverride,
  ) async {
    String? result;
    try {
      result = await platform.invokeMethod('writeImage', {
        'imageData': imageData,
        'fileName': fileName,
        'mediaType': mediaType,
        'fileExt': fileExt,
        'extPathOverride': extPathOverride,
      });
    } catch (e) {
      log(e);
    }
    return result;
  }

  // ignore: avoid_void_async
  static Future<void> vibrate({
    bool flutterWay = false,
    int duration = 10,
    int amplitude = -1,
  }) async {
    if (SettingsHandler.instance.disableVibration) {
      return;
    }

    try {
      if (Platform.isAndroid || Platform.isIOS) {
        if (flutterWay) {
          await HapticFeedback.vibrate();
        } else {
          if (await Vibration.hasVibrator()) {
            await Vibration.vibrate(
              duration: duration,
              amplitude: amplitude,
            );
          }
        }
      }
    } catch (e, s) {
      log(e, s: s);
    }
  }

  static Future<void> openLinkDefaultsSettings() async {
    if (Platform.isAndroid) {
      await platform.invokeMethod('openLinkDefaults');
    }
  }
}
