//import 'dart:html';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:flutter/material.dart';
import 'libBooru/BooruItem.dart';
import 'libBooru/GelbooruHandler.dart';
import 'libBooru/MoebooruHandler.dart';
import 'libBooru/PhilomenaHandler.dart';
import 'libBooru/DanbooruHandler.dart';
import 'libBooru/ShimmieHandler.dart';
import 'libBooru/BooruHandler.dart';
import 'libBooru/e621Handler.dart';
import 'libBooru/Booru.dart';
import 'ImageWriter.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'getPerms.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';

class SnatchHandler  {
  ValueNotifier snatchActive = ValueNotifier(false);
  ValueNotifier snatchStatus = ValueNotifier("");
  ValueNotifier queuedItems = ValueNotifier(0);
  List queuedList = new List();
  List<int> cooldownList = new List();
  List booruNameList = new List();
  bool jsonWrite = false;
  int cooldown = 250;
  SnatchHandler(){
    addQueueHandler();
  }
  void addQueueHandler(){
    if (!queuedItems.hasListeners) {
      print("+++++++++++++++++++++++++++++++++++++++++++++++++++");
      print("queuedItems listener added");
      queuedItems.addListener(() {
        print("+++++++++++++++++++++++++++++++++++++++++++++++++++");
        print("queuedItems updated");
        trySnatch();
      });
    }
  }
  Future snatch(List<BooruItem> booruItems, bool jsonWrite, String booruName,int cooldown) async{
    print("+++++++++++++++++++++++++++++++++++++++++++++++++++");
    print("snatching");
    if (!snatchActive.value){
      snatchActive.value = true;
      ImageWriter writer = new ImageWriter();
      writer.writeMultiple(booruItems, jsonWrite, booruName, cooldown).listen(
            (data) {
          snatchStatus.value = "$data / ${booruItems.length}";
        },
        onDone: (){
          snatchActive.value = false;
          snatchStatus.value = "";
          trySnatch();
        },
      );
    }
  }
  void trySnatch(){
    if (!snatchActive.value && queuedItems.value > 0){
      queuedItems.value --;
      snatch(queuedList.removeLast(),jsonWrite,booruNameList.removeLast(),cooldownList.removeLast());
    }
  }
  void queue(List<BooruItem> booruItems, bool jsonWrite, String booruName, int cooldown){
      this.jsonWrite = jsonWrite;
      if (booruItems.isNotEmpty){
        queuedList.add(booruItems);
        cooldownList.add(cooldown);
        booruNameList.add(booruName);
        queuedItems.value ++;
        if (booruItems.length > 1){
          ServiceHandler.displayToast("Items added to snatch queue\n Amount: ${booruItems.length}\n Queue Position: ${queuedItems.value}");
          //Get.snackbar("Items added to snatch queue", "Amount: ${booruItems.length}\n Queue Position: ${queuedItems.value}", snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
        } else {
          ServiceHandler.displayToast("Item added to snatch queue\n ${booruItems[0].fileURL} \n Queue Position: ${queuedItems.value}");
          //Get.snackbar("Item added to snatch queue", booruItems[0].fileURL + "\n Queue Position: ${queuedItems.value}", snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
        }
      }
  }
  Future searchSnatch(String tags, String amount, int cooldown, Booru booru, bool jsonWrite) async{
    int count = 0, limit,page = 0;
    BooruHandler booruHandler;
    var booruItems;
    if (int.parse(amount) <= 100){
      limit = int.parse(amount);
    } else {
      limit = 100;
    }
    List temp = new BooruHandlerFactory().getBooruHandler(booru, limit);
    booruHandler = temp[0];
    page = temp[1];
    ServiceHandler.displayToast("Snatching Images \n Do not close the app!");
    //Get.snackbar("Snatching Images","Do not close the app!",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
    while (count < int.parse(amount) && !booruHandler.locked){
      booruItems = await booruHandler.Search(tags,page);
      page ++;
      count = booruItems.length;
      print(count);
    }
    queue(booruItems, jsonWrite, booru.name, cooldown);
    //Get.snackbar("Snatching Complete","¡¡¡( •̀ ᴗ •́ )و!!!",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
  }
}


