import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:ext_storage/ext_storage.dart';
import 'dart:io';
import 'libBooru/BooruItem.dart';
import 'package:get/get.dart';
class ImageWriter{

  Future write(BooruItem item) async{
    try {
      var response = await http.get(item.fileURL);
      var path = "";
      if (Platform.isAndroid){
        path = await ExtStorage.getExternalStorageDirectory() + "/Pictures/LoliSnatcher/";
      } else if (Platform.isLinux){
        path = Platform.environment['HOME'] + "/Pictures/LoliSnatcher/";
      }
      await Directory(path).create(recursive:true);
      File image = new File(path+item.fileURL.substring(item.fileURL.lastIndexOf("/") + 1));
      image.writeAsBytesSync(response.bodyBytes);
    }
    catch (e){
      print("Image not found");
    }
    return (item.fileURL.substring(item.fileURL.lastIndexOf("/") + 1));
  }
}