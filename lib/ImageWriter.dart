import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:ext_storage/ext_storage.dart';
import 'dart:io';
import 'libBooru/BooruItem.dart';
class ImageWriter{

  bool saveImage(List<BooruItem> fetched){
    for(int i = 0; i < fetched.length; i++){
      write(fetched[i].fileURL);
      return true;
    }
  }

  Future write(String fileURL) async{
    var response = await http.get(fileURL);
    var path = await ExtStorage.getExternalStoragePublicDirectory(ExtStorage.DIRECTORY_PICTURES) + "/LoliSnatcher/";
    await Directory(path).create(recursive:true);
    File image = new File(path+fileURL.substring(fileURL.lastIndexOf("/") + 1));
    image.writeAsBytesSync(response.bodyBytes);
    print(fileURL.substring(fileURL.lastIndexOf("/") + 1)+ " Saved ＼(^ o ^)／");
    return (fileURL.substring(fileURL.lastIndexOf("/") + 1)+ " Saved ＼(^ o ^)／");
  }
}