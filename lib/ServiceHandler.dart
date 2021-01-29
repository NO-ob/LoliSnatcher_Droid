import 'dart:io';

import 'package:flutter/services.dart';


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
    String result;
    try{
      result = await platform.invokeMethod("getExtPath");
    } catch(e){
      print(e);
    }
    return result;
  }
  Future<String> getDocumentsDir() async{
    String result;
    try{
      result = await platform.invokeMethod("getDocumentsPath");
    } catch(e){
      print(e);
    }
    return result;
  }
  Future<String> getPicturesDir() async{
    String result;
    try{
      result = await platform.invokeMethod("getPicturesPath");
    } catch(e){
      print(e);
    }
    return result;
  }
  Future<String> getCacheDir() async{
    String result;
    try{
      if (Platform.isAndroid){
        result = await platform.invokeMethod("getCachePath") + "/";
      } else if (Platform.isLinux){
        result = Platform.environment['HOME'] + "/.loliSnatcher/cache/";
      }
    } catch(e){
      print(e);
    }
    return result;
  }
  void loadShareIntent(String fileURL) async{
    try{
      await platform.invokeMethod("shareItem",{"fileURL": fileURL});
    } catch(e){
      print(e);
    }
  }
  void emptyCache() async{
    try{
      if (Platform.isAndroid){
        await platform.invokeMethod("emptyCache");
      } else if (Platform.isLinux){
        File cacheDir = new File(await getCacheDir());
        cacheDir.delete(recursive: true);
      }

    } catch(e){
      print(e);
    }
  }
}