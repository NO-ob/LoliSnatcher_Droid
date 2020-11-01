import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'libBooru/BooruItem.dart';
import 'ServiceHandler.dart';
import 'dart:convert';
class ImageWriter{
  ServiceHandler serviceHandler = new ServiceHandler();
  Future write(BooruItem item, bool jsonWrite) async{
    try {
      var response = await http.get(item.fileURL);
      var path = "";
      if (Platform.isAndroid){
          path = await serviceHandler.getExtDir() + "/Pictures/LoliSnatcher/";
      } else if (Platform.isLinux){
          path = Platform.environment['HOME'] + "/Pictures/LoliSnatcher/";
      }
      await Directory(path).create(recursive:true);
      String fileName = item.fileURL.substring(item.fileURL.lastIndexOf("/") + 1);
      File image = new File(path+fileName);
      await image.writeAsBytes(response.bodyBytes);
      if (jsonWrite){
        File json = new File(path+fileName.split(".")[0]+".json");
        await json.writeAsString(jsonEncode(item.toJSON()));
      }
      try {
        serviceHandler.callMediaScanner(image.path);
      } catch (e){
        print("Image not found");
      }

    } catch (e){
      print("Image Writer Exception");
      print(e);
    }
    return (item.fileURL.substring(item.fileURL.lastIndexOf("/") + 1));
  }
  Future writeSelected(SearchGlobals searchGlobals, bool jsonWrite) async {
    List fetched = searchGlobals.booruHandler.getFetched();
    for (int i = 0; i < searchGlobals.selected.length; i++){
      await write(fetched.elementAt(searchGlobals.selected[i]), jsonWrite);
    }
    searchGlobals.selected = new List();
    Get.snackbar("Snatching Complete","¡¡¡( •̀ ᴗ •́ )و!!!",snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Colors.pink[200]);
  }
}