import 'package:get/get.dart';

import 'package:LoliSnatcher/ImageWriter.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';

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
        ServiceHandler.displayToast("Items added to snatch queue\nAmount: ${booruItems.length}\nQueue Position: ${queuedList.length}");
      } else {
        ServiceHandler.displayToast("Item added to snatch queue\nQueue Position: ${queuedList.length}");
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

    ServiceHandler.displayToast("Snatching Images\nDo not close the app!");
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


