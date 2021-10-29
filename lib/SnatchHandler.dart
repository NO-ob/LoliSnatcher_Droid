import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/ImageWriter.dart';

import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';



class SnatchHandler extends GetxController {
  RxBool snatchActive = false.obs;
  RxString snatchStatus = "".obs;
  RxList<List<BooruItem>> queuedList = RxList<List<BooruItem>>([]);
  RxList<int> cooldownList = RxList<int>([]);
  RxList<Booru> booruList = RxList<Booru>([]);

  SnatchHandler(){
    queuedList.listen((List<List<BooruItem>> list) {
      // print("queuedList updated");
      // print(list);
      // print(list.length);
      trySnatch();
    });
  }

  Future snatch(List<BooruItem> booruItems, Booru booru, int cooldown) async {
    // print("snatching");
    if (!snatchActive.value){
      snatchActive.value = true;
      ImageWriter writer = ImageWriter();
      writer.writeMultiple(booruItems, booru, cooldown).listen(
        (data) {
          snatchStatus.value = "$data / ${booruItems.length}";
        },
        onDone: () {
          snatchActive.value = false;
          snatchStatus.value = "";
          trySnatch();
        },
      );
    }
  }

  void trySnatch() {
    if (!snatchActive.value && queuedList.length > 0 && booruList.length > 0 && cooldownList.length > 0) {
      snatch(queuedList.removeLast(), booruList.removeLast(), cooldownList.removeLast());
    }
  }

  void queue(List<BooruItem> booruItems, Booru booru, int cooldown) {
    if (booruItems.isNotEmpty) {
      cooldownList.add(cooldown);
      booruList.add(booru);
      queuedList.add(booruItems); // change this last because it triggers a listener
      if (booruItems.length > 1){
        FlashElements.showSnackbar(
          title: Text(
            "Added to snatch queue",
            style: TextStyle(fontSize: 20)
          ),
          position: Positions.top,
          duration: Duration(seconds: 2),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text('Amount: ${booruItems.length}'),
                Text('Position: ${queuedList.length}'),
            ],
          ),
          leadingIcon: Icons.info_outline,
          sideColor: Colors.green,
        );
      } else {
        FlashElements.showSnackbar(
          title: Text(
            "Added to snatch queue",
            style: TextStyle(fontSize: 20)
          ),
          position: Positions.top,
          duration: Duration(seconds: 2),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text('Position: ${queuedList.length}'),
            ],
          ),
          leadingIcon: Icons.info_outline,
          sideColor: Colors.green,
        );
      }
    }
  }

  Future searchSnatch(String tags, String amount, int cooldown, Booru booru) async{
    int count = 0, limit;
    BooruHandler booruHandler;
    var booruItems;

    if (int.parse(amount) <= 100){
      limit = int.parse(amount);
    } else {
      limit = 100;
    }

    List temp = BooruHandlerFactory().getBooruHandler([booru], limit);
    booruHandler = temp[0];
    booruHandler.pageNum.value = temp[1];
    booruHandler.pageNum ++;

    FlashElements.showSnackbar(
      title: Text(
        "Snatching Images",
        style: TextStyle(fontSize: 20)
      ),
      position: Positions.top,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text('Do not close the app!'),
        ],
      ),
      leadingIcon: Icons.warning_amber,
      leadingIconColor: Colors.yellow,
      sideColor: Colors.yellow,
    );

    while (count < int.parse(amount) && !booruHandler.locked.value){
      booruItems = (await booruHandler.Search(tags, null)) ?? [];
      booruHandler.pageNum ++;
      count = booruItems.length;
      print(count);
      // TODO error handling?
    }
    queue(booruItems, booru, cooldown);
    //Get.snackbar("Snatching Complete","¡¡¡( •̀ ᴗ •́ )و!!!",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.theme.primaryColor);
  }
}


