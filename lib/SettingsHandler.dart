import 'dart:async';
import 'dart:io';
import 'package:ext_storage/ext_storage.dart';
import 'package:get/get.dart';
class SettingsHandler {
  String defTags,limit,previewMode;
  SettingsHandler(){
  }
  Future writeDefaults() async{
    var path = await ExtStorage.getExternalStorageDirectory() + "/LoliSnatcher/config/";
    if (!await File(path+"settings.conf").exists()){
      await Directory(path).create(recursive:true);
      File settingsFile = new File(path+"settings.conf");
      var writer = settingsFile.openWrite();
      writer.write("Default Tags = rating:safe\n");
      writer.write("Limit = 20\n");
      writer.write("Preview Mode = Sample\n");
      writer.close;
    }
    return true;
  }

  Future loadSettings() async{
    var path = await ExtStorage.getExternalStorageDirectory() + "/LoliSnatcher/config/";
    File settingsFile = new File(path+"settings.conf");
    List<String> settings = settingsFile.readAsLinesSync();
    for (int i=0;i < settings.length; i++){
      switch(settings[i].split(" = ")[0]){
        case("Default Tags"):
          if (settings[i].split(" = ").length > 1){
            defTags = settings[i].split(" = ")[1];
            print("Found Default Tags " + settings[i].split(" = ")[1]);
          }
          break;
        case("Limit"):
          if (settings[i].split(" = ").length > 1){
            limit = settings[i].split(" = ")[1];
            print("Found Limit " + settings[i].split(" = ")[1] );
          }
          break;
        case("Preview Mode"):
          if (settings[i].split(" = ").length > 1){
            previewMode = settings[i].split(" = ")[1];
            print("Found Preview Mode " + settings[i].split(" = ")[1] );
          }
          break;
      }
    }
    return true;
  }

  void saveSettings(String defTags, String limit, String previewMode) async{
    var path = await ExtStorage.getExternalStorageDirectory() + "/LoliSnatcher/config/";
    await Directory(path).create(recursive:true);
    File settingsFile = new File(path+"settings.conf");
    var writer = settingsFile.openWrite();
    if (defTags != ""){
      writer.write("Default Tags = $defTags\n");
    }
    if (limit != ""){
      // Write limit if it between 0-100
      if (int.parse(limit) <= 100 && int.parse(limit) > 0){
        await writer.write("Limit = ${int.parse(limit)}\n");
      } else {
        // Close writer and alert user
        writer.close();
        Get.snackbar("Settings Error","$limit is not a valid Limit",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5));
        return;
      }
    }
    writer.write("Preview Mode = $previewMode\n");
    writer.close();
    await this.loadSettings();
    Get.snackbar("Settings Saved!","Some changes may not take effect until the app is restarted",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5));
  }

}