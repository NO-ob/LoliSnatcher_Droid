import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'libBooru/BooruItem.dart';
import 'ServiceHandler.dart';
class ImageWriter{
  ServiceHandler serviceHandler = new ServiceHandler();
  Future write(BooruItem item) async{
    try {
      var response = await http.get(item.fileURL);
      var path = "";
      if (Platform.isAndroid){
        path = await serviceHandler.getExtDir() + "/Pictures/LoliSnatcher/";
      } else if (Platform.isLinux){
        path = Platform.environment['HOME'] + "/Pictures/LoliSnatcher/";
      }
      await Directory(path).create(recursive:true);
      File image = new File(path+item.fileURL.substring(item.fileURL.lastIndexOf("/") + 1));
      await image.writeAsBytes(response.bodyBytes);
      serviceHandler.callMediaScanner(image.path);
    }
    catch (e){
      print("Image not found");
    }
    return (item.fileURL.substring(item.fileURL.lastIndexOf("/") + 1));
  }

}