
import 'dart:io';
import 'dart:typed_data';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:flutter/services.dart';

import 'libBooru/DBHandler.dart';


//The ServiceHandler class calls kotlin functions in MainActivity.kt
class ServiceHandler{
  static const platform = const MethodChannel("com.noaisu.loliSnatcher/services");
  // Call androids native media scanner on a file path
  void callMediaScanner(String path) async{
    try{
      await platform.invokeMethod("scanMedia",{"path": path});
    } catch(e){
      print(e);
    }
  }
  // Calls androids native  get storage dir function
  Future<String> getExtDir() async{
    String result = "";
    try{
      result = await platform.invokeMethod("getExtPath");
    } catch(e){
      print(e);
    }
    return result;
  }
  Future<int> getSDKVersion() async{
    int result = 0;
    try{
      result = await platform.invokeMethod("getSdkVersion");
    } catch(e){
      print(e);
    }
    return result;
  }
  Future<String> getDocumentsDir() async{
    String result = "";
    try{
      result = await platform.invokeMethod("getDocumentsPath");
    } catch(e){
      print(e);
    }
    return result;
  }
  Future<String> getPicturesDir() async{
    String result = "";
    try{
      result = await platform.invokeMethod("getPicturesPath");
    } catch(e){
      print(e);
    }
    return result;
  }
  Future<String> getCacheDir() async{
    String result = "";
    try{
      if (Platform.isAndroid){
        result = await platform.invokeMethod("getCachePath") + "/";
      } else if (Platform.isLinux){
        result = Platform.environment['HOME']! + "/.loliSnatcher/cache/";
      }
    } catch(e){
      print(e);
    }
    return result;
  }
  Future<void> loadShareTextIntent(String text) async{
    try{
      await platform.invokeMethod("shareText",{"text": text});
      return;
    } catch(e){
      print(e);
      return;
    }
  }
  Future<void> loadShareFileIntent(String filePath, String mimeType) async{
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
  static void disableSleep (){
    if (Platform.isAndroid){
      platform.invokeMethod("disableSleep");
    }
  }
  static void enableSleep (){
    if (Platform.isAndroid){
      platform.invokeMethod("enableSleep");
    }
  }
  void emptyCache() async{
    try{
      if (Platform.isAndroid){
        await platform.invokeMethod("emptyCache");
      } else if (Platform.isLinux){
        String cacheD = await getCacheDir();
        File cacheDir = new File(cacheD);
        cacheDir.delete(recursive: true);
      }

    } catch(e){
      print(e);
    }
  }
  void deleteDB(SettingsHandler settingsHandler) async{
    if (Platform.isAndroid){
      File dbFile = new File(settingsHandler.path + "store.db");
      print(settingsHandler.path);
      await dbFile.delete();
    }
  }
  static void makeImmersive(){
    platform.invokeMethod("systemUIMode",{"mode":"immersive"});
  }
  static void makeNormal(){
    platform.invokeMethod("systemUIMode",{"mode":"normal"});
  }

  static void launchURL(String url){
    if(Platform.isAndroid){
      platform.invokeMethod("launchURL", {"url":"$url"});
    } else if (Platform.isLinux) {
      Process.run('xdg-open', [url]);
    }
  }
  Future<Uint8List?> makeVidThumb(String videoURL) async {
    Uint8List? thumbnail;
    if (Platform.isAndroid){
      thumbnail = await platform.invokeMethod("makeVidThumb",{"videoURL" : videoURL});
    }
    return thumbnail;
  }
  Future<String?> writeImage(var imageData, fileName, mediaType, fileExt) async{
    String? result;
    try{
      result = await platform.invokeMethod("writeImage",{"imageData": imageData, "fileName": fileName, "mediaType": mediaType, "fileExt": fileExt});
    } catch(e){
      print(e);
    }
    return result;
  }
}