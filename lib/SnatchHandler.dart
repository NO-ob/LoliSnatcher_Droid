//import 'dart:html';
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
  bool jsonWrite = false;
  void addQueueHandler(){
    if (!queuedItems.hasListeners){
      print("+++++++++++++++++++++++++++++++++++++++++++++++++++");
      print("queuedItems listener added");
      queuedItems.addListener(() {
        print("+++++++++++++++++++++++++++++++++++++++++++++++++++");
        print("queuedItems updated");
        trySnatch();
      });
    }

  }
  Future snatch(List<BooruItem> booruItems, bool jsonWrite) async{
    print("+++++++++++++++++++++++++++++++++++++++++++++++++++");
    print("snatching");
    if (!snatchActive.value){
      snatchActive.value = true;
      ImageWriter writer = new ImageWriter();
      writer.writeMultiple(booruItems, jsonWrite).listen(
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
      snatch(queuedList.removeLast() , jsonWrite);
    }
  }
  void queue(List<BooruItem> booruItems, bool jsonWrite){
        print("+++++++++++++++++++++++++++++++++++++++++++++++++++");
       print("adding items to queue");
      this.jsonWrite = jsonWrite;
      if (booruItems.isNotEmpty){
        queuedList.add(booruItems);
        queuedItems.value ++;
      }
  }
  Future searchSnatch(String tags, String amount, int timeout, Booru booru, bool jsonWrite) async{
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
    Get.snackbar("Snatching Images","Do not close the app!",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Colors.pink[200]);
    while (count < int.parse(amount)){
      booruItems = await booruHandler.Search(tags,page);
      page ++;
      count = booruItems.length;
      print(count);
    }
    queue(booruItems,jsonWrite);
    /*Scaffold.of(Get.context).showBottomSheet<void>(
          (BuildContext context) {
        return Container(
          height:150,
          child: StreamBuilder(
              stream: writer.writeMultiple(booruItems, widget.settingsHandler.jsonWrite),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text("No Connection");
                    break;
                  case ConnectionState.waiting:
                    return Text("Waiting");
                    break;
                  case ConnectionState.active:
                    return Text("Snatching: ${snapshot.data} / ${booruItems.length}");
                    break;
                  case ConnectionState.done:
                    Get.back();
                    break;
                }
                return Text("Done");
              }
          ),
        );
      },
    );*/


    //Get.snackbar("Snatching Complete","¡¡¡( •̀ ᴗ •́ )و!!!",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Colors.pink[200]);
  }
}


