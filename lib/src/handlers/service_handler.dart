
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vibration/vibration.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';


//The ServiceHandler class calls kotlin functions in MainActivity.kt
class ServiceHandler{
  static const platform = MethodChannel("com.noaisu.loliSnatcher/services");
  // Call androids native media scanner on a file path
  static void callMediaScanner(String path) async{
    try{
      await platform.invokeMethod("scanMedia",{"path": path});
    } catch(e){
      print(e);
    }
  }

  static Future<int> getSDKVersion() async {
    if (Platform.isAndroid) {
      return getAndroidSDKVersion();
    } else if (Platform.isLinux) {
      return 1;
    } else if (Platform.isWindows) {
      return 2;
    } else if (Platform.isIOS) {
      return 9999;
    } else if (Platform.isMacOS) {
      return 9998;
    } else {
      return -1;
    }
  }

  static Future<int> getAndroidSDKVersion() async{
    int result = 0;
    try{
      result = await platform.invokeMethod("getSdkVersion");
    } catch(e){
      print(e);
    }
    return result;
  }

  // Gets main storage dir
  static Future<String> getExtDir() async{
    String result = "";
    try{
      if(Platform.isAndroid) {
        result = await platform.invokeMethod("getExtPath");
      } else if(Platform.isLinux) {
        result = Platform.environment['HOME']!;
      } else if(Platform.isWindows) {
        result = Platform.environment['LOCALAPPDATA']!;
      } else if(Platform.isIOS) {
        result = (await getApplicationDocumentsDirectory()).path;
      }
    } catch(e){
      print(e);
    }
    return result;
  }

  static Future<String> setExtDir() async {
    String result = "";
    try {
      result = await platform.invokeMethod("setExtPath");
      print("Service handler got uri back: $result");
    } catch (e) {
      print(e);
    }
    // File(result+"/test.txt").create(recursive: true);
    return result;
  }
  static Future<String> getImageSAFUri() async {
    String result = "";
    try {
      result = await platform.invokeMethod("selectImage");
      print("Service handler got uri back: $result");
    } catch (e) {
      print(e);
    }
    // File(result+"/test.txt").create(recursive: true);
    return result;
  }
  static Future<Uint8List?> getSAFFile(String contentUri) async {
    Uint8List? result;
    try {
      result = await platform.invokeMethod("getFileBytes",{"uri":contentUri});
      print("Got file back");
    } catch (e) {
      print(e);
    }
    // File(result+"/test.txt").create(recursive: true);
    return result;
  }
  static Future<String> getSAFFileExtension(String contentUri) async {
    String result = "";
    try {
      result = await platform.invokeMethod("getFileExtension",{"uri":contentUri});
      print("Got file ext back");
      print(result);
    } catch (e) {
      print(e);
    }
    // File(result+"/test.txt").create(recursive: true);
    return result;
  }


  // This function only grants access until device reboot
  static Future<String> getSAFDirectoryAccess() async {
    String result = "";
    try {
      result = await platform.invokeMethod("getTempDirAccess");
      print("Got saf path back");
      print(result);
    } catch (e) {
      print(e);
    }
    return result;
  }

  static Future<Uint8List?> getFileFromSAFDirectory(String SAFUri, String fileName) async {
    Uint8List? result;
    try {
      result = await platform.invokeMethod("getFileByName",{"uri":SAFUri,"fileName":fileName});
      print("found file $fileName");
    } catch (e) {
      print(e);
    }
    return result;
  }

  static Future<String> getFilesByExt(String SAFUri, String fileExt) async {
    String result = "";
    try {
      result = await platform.invokeMethod("getTempDirAccess");
      print("Got saf path back");
      print(result);
    } catch (e) {
      print(e);
    }
    return result;
  }


  static Future<String> getConfigDir() async {
    String result = '';
    if (Platform.isAndroid){
      result = "${await getExtDir()}/LoliSnatcher/config/"; // await platform.invokeMethod("getDocumentsPath"); ?
    } else if (Platform.isLinux){
      result = "${await getExtDir()}/.loliSnatcher/config/";
    } else if (Platform.isWindows) {
      result = "${await getExtDir()}/LoliSnatcher/config/";
    } else if(Platform.isIOS) {
      result = "${await getExtDir()}/LoliSnatcher/config/";
    }
    return result;
  }

  static Future<String> testSAFPersistence() async {
    print("test saf persistence");
    String result = "";
    String safuri = "content://com.android.externalstorage.documents/tree/1206-2917%3ALolisnatcher";
    try {
      result = await platform.invokeMethod("testSAF",{"uri" : safuri});
      print("got saf result $result");
    } catch (e) {
      print(e);
    }
    Directory dir = Directory(result);
    return result;
  }

  static Future<String> getDocumentsDir() async{
    String result = "";
    try{
      result = await platform.invokeMethod("getDocumentsPath");
    } catch(e){
      print(e);
    }
    return result;
  }

  static Future<String> getPicturesDir() async{
    String result = "";
    try{
      if (Platform.isAndroid){
        result = "${await platform.invokeMethod("getPicturesPath")}/LoliSnatcher/"; // "${await getExtDir()}/Pictures/LoliSnatcher/";
      } else if (Platform.isLinux){
        result = "${await getExtDir()}/Pictures/LoliSnatcher/";
      } else if (Platform.isWindows){
        result = "${await getExtDir()}/LoliSnatcher/Pictures/";
      } else if(Platform.isIOS) {
        result = "${await getExtDir()}/LoliSnatcher/Pictures/";
      }
    } catch(e){
      print(e);
    }
    return result;
  }

  static Future<String> getCacheDir() async{
    String result = "";
    try{
      if (Platform.isAndroid){
        result = await platform.invokeMethod("getCachePath") + "/";
      } else if (Platform.isLinux){
        result = '${await getExtDir()}/.loliSnatcher/cache/';
      } else if (Platform.isWindows){
        result = '${await getExtDir()}/LoliSnatcher/cache/';
      } else if(Platform.isIOS) {
        result = "${await getExtDir()}/LoliSnatcher/cache/";
      }
    } catch(e){
      print(e);
    }
    return result;
  }

  static Future<void> loadShareTextIntent(String text) async{
    try{
      await platform.invokeMethod("shareText",{"text": text});
      return;
    } catch(e){
      print(e);
      return;
    }
  }

  static Future<void> loadShareFileIntent(String filePath, String mimeType) async{
    try{
      await platform.invokeMethod("shareFile", {"path": filePath, "mimeType": mimeType});
      return;
      // print('share closed');
    } catch(e){
      print(e);
      return;
    }
  }

  static void displayToast (String str){
    if (Platform.isAndroid){
      platform.invokeMethod("toast",{"toastStr" : str});
    }
  }

  static void disableSleep ({bool forceEnable = false}){
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    if (Platform.isAndroid && (settingsHandler.wakeLockEnabled || forceEnable)){
      platform.invokeMethod("disableSleep");
    }
  }

  static void enableSleep (){
    if (Platform.isAndroid){
      platform.invokeMethod("enableSleep");
    }
  }

  static Future<void> emptyCache() async {
    try {
      if (Platform.isAndroid){
        await platform.invokeMethod("emptyCache");
      } else if(Platform.isIOS) {
        // ???
      } else if (Platform.isLinux || Platform.isWindows){
        String cacheD = await getCacheDir();
        File cacheDir = File(cacheD);
        // TODO parse through possible folder list and don't do recursive to exclude wrong path problems
        await cacheDir.delete(recursive: true);
      }

    } catch(e){
      print(e);
    }
    return;
  }

  static void deleteDB(SettingsHandler settingsHandler) async{
    if (Platform.isAndroid){
      File dbFile = File("${settingsHandler.path}store.db");
      print(settingsHandler.path);
      await dbFile.delete();
    }
  }

  static void setSystemUiVisibility(bool visible) {
    if (visible) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: SystemUiOverlay.values);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: []);
    }
  }

  static void makeImmersive(){
    if (Platform.isAndroid){
      platform.invokeMethod("systemUIMode",{"mode":"immersive"});
    }
  }

  static void makeNormal(){
    if (Platform.isAndroid){
      platform.invokeMethod("systemUIMode",{"mode":"normal"});
    }
  }

  static void setBrightness(double brightness) {
    // TODO WIP
    if (Platform.isAndroid){
      platform.invokeMethod("setBrightness",{"brightness": brightness});
    }
  }

  static Future<String> getIP() async {
    String ip = "";
    // TODO WIP
    if (Platform.isAndroid){
      ip = await platform.invokeMethod("getIP");
    } else {
      var interfaces = await NetworkInterface.list(type: InternetAddressType.IPv4);
      if (interfaces.isNotEmpty) {
        ip = interfaces[0].addresses[0].address;
      }
    }
    return ip;
  }

  static Future<List<NetworkInterface>> getIPList() async {
    return await NetworkInterface.list(type: InternetAddressType.IPv4);
  }

  static void setVolume(int volume, int showSystemUI) {
    // TODO WIP
    if (Platform.isAndroid){
      platform.invokeMethod("setVolume",{"volume": volume, "showUI": showSystemUI});
    }
  }

  static void setVolumeButtons(bool setActive) {
    if (Platform.isAndroid){
      platform.invokeMethod("setVolumeButtons",{"setActive": setActive});
    }
  }

  static void launchURL(String url){
    if(Platform.isAndroid){
      platform.invokeMethod("launchURL", {"url": url});
    } else if(Platform.isIOS) {
      // ???
    } else if (Platform.isLinux) {
      Process.run('xdg-open', [url]);
    } else if (Platform.isWindows) {
      Process.run('start', [url], runInShell: true);
    }
  }

  static Future<Uint8List?> makeVidThumb(String videoURL) async {
    Uint8List? thumbnail;
    if (Platform.isAndroid){
      thumbnail = await platform.invokeMethod("makeVidThumb",{"videoURL" : videoURL});
    }
    return thumbnail;
  }

  static Future<String?> writeImage(var imageData, fileName, mediaType, fileExt, extPathOverride) async{
    String? result;
    try{
      result = await platform.invokeMethod("writeImage",{"imageData": imageData, "fileName": fileName, "mediaType": mediaType, "fileExt": fileExt,"extPathOverride":extPathOverride});
    } catch(e){
      print(e);
    }
    return result;
  }

  static void vibrate({
    bool flutterWay = false,
    int duration = 10,
    int amplitude = -1,
  }) async {
    if (Platform.isAndroid || Platform.isIOS) {
      if(flutterWay) {
        HapticFeedback.vibrate();
      } else {
        if (await Vibration.hasVibrator() ?? false) {
          Vibration.vibrate(duration: duration, amplitude: amplitude);
        }
      }
    }
  }

}