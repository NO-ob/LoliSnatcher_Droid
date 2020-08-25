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
}