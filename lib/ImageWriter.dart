import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:ext_storage/ext_storage.dart';
import 'dart:io';
import 'libBooru/BooruItem.dart';
import 'package:get/get.dart';
class ImageWriter{
  String status;
  bool saveImage(List<BooruItem> fetched){
    for(int i = 0; i < fetched.length; i++){
      write(fetched[i]);
      return true;
    }
  }

  Future write(BooruItem item) async{
    status = item.fileURL;
    var response = await http.get(item.fileURL);
    var path = await ExtStorage.getExternalStoragePublicDirectory(ExtStorage.DIRECTORY_PICTURES) + "/LoliSnatcher/";
    await Directory(path).create(recursive:true);
    File image = new File(path+item.fileURL.substring(item.fileURL.lastIndexOf("/") + 1));
    await image.writeAsBytesSync(response.bodyBytes);
    Get.snackbar("Snatched ＼(^ o ^)／",item.fileURL,snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 1));
    return (item.fileURL.substring(item.fileURL.lastIndexOf("/") + 1));
  }
}