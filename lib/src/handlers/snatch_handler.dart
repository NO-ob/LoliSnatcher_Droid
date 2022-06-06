import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/src/utils/tools.dart';
import 'package:LoliSnatcher/src/services/image_writer.dart';
import 'package:LoliSnatcher/src/widgets/common/flash_elements.dart';
import 'package:LoliSnatcher/src/handlers/booru_handler_factory.dart';
import 'package:LoliSnatcher/src/data/booru_item.dart';
import 'package:LoliSnatcher/src/handlers/booru_handler.dart';
import 'package:LoliSnatcher/src/data/booru.dart';

class SnatchItem {
  final List<BooruItem> booruItems;
  final int cooldown;
  final Booru booru;

  SnatchItem(this.booruItems, this.cooldown, this.booru);
}

class SnatchHandler extends GetxController {
  static SnatchHandler get instance => Get.find<SnatchHandler>();


  RxBool snatchActive = false.obs;
  RxString snatchStatus = "".obs;
  RxInt snatchProgress = 0.obs;

  RxList<SnatchItem> queuedList = RxList<SnatchItem>([]);

  SnatchHandler() {
    queuedList.listen((List<SnatchItem> list) {
      // print("queuedList updated");
      // print(list);
      // print(list.length);
      trySnatch();
    });
  }

  Stream<Map<String, int>> writeMultipleFake(List<BooruItem> items, Booru booru, int cooldown) async* {
    int snatchedCounter = 0;
    for (int i = 0; i < items.length; i++) {
      await Future.delayed(const Duration(milliseconds: 2000), () async {});
      snatchedCounter++;
      yield {
        "snatched": snatchedCounter,
      };
    }

    yield {
      "snatched": snatchedCounter,
      "exists": 0,
      "failed": 0,
    };
  }

  Future snatch(SnatchItem item) async {
    // print("snatching");
    snatchActive.value = true;
    snatchStatus.value = queuedList.isNotEmpty ? "0/${item.booruItems.length}/${queuedList.length}" : "0/${item.booruItems.length}";

    ImageWriter().writeMultiple(item.booruItems, item.booru, item.cooldown).listen(
    // writeMultipleFake(item.booruItems, item.booru, item.cooldown).listen(
      (Map<String, int> data) {
        final int snatched = data["snatched"]!;
        final int? exists = data["exists"];
        final int? failed = data["failed"];

        snatchStatus.value = queuedList.isNotEmpty ? "$snatched/${item.booruItems.length}/${queuedList.length}" : "$snatched/${item.booruItems.length}";

        if(exists == null && failed == null) {
          // record progress only when snatched changes
          snatchProgress.value = snatchProgress.value + 1;
        }

        if (exists != null && failed != null && queuedList.isEmpty) {
          // last yield in stream will send exists and failed counts
          // but show this message only when queue is empty => snatching is complete
          FlashElements.showSnackbar(
            duration: const Duration(seconds: 2),
            position: Positions.top,
            title: const Text("Snatching Complete", style: TextStyle(fontSize: 20)),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Snatched: ${snatchProgress.value} ${Tools.pluralize('item', snatchProgress.value)}"),
                if (exists > 0) Text('$exists ${Tools.pluralize('file', exists)} ${exists == 1 ? 'was' : 'were'} already snatched'),
                if (failed > 0) Text('Failed to snatch $failed ${Tools.pluralize('file', exists)}'),
              ],
            ),
            leadingIcon: Icons.done_all,
            sideColor: (exists > 0 || failed > 0) ? Colors.yellow : Colors.green,
            //TODO restart/retry buttons for failed items?
          );
        }
      },
      onDone: () {
        if (queuedList.isNotEmpty) {
          snatch(queuedList.removeLast());
        } else {
          snatchActive.value = false;
          snatchStatus.value = "";
          snatchProgress.value = 0;
        }
      },
    );
  }

  void trySnatch() {
    if (!snatchActive.value) {
      if (queuedList.isNotEmpty) {
        snatch(queuedList.removeLast());
      } else if (queuedList.isEmpty) {
        //
      }
    }
  }

  void queue(List<BooruItem> booruItems, Booru booru, int cooldown) {
    if (booruItems.isNotEmpty) {
      SnatchItem item = SnatchItem(booruItems, cooldown, booru);
      queuedList.add(item);

      if (booruItems.length > 1) {
        FlashElements.showSnackbar(
          title: const Text("Added to snatch queue", style: TextStyle(fontSize: 20)),
          position: Positions.top,
          duration: const Duration(seconds: 2),
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
          title: const Text("Added to snatch queue", style: TextStyle(fontSize: 20)),
          position: Positions.top,
          duration: const Duration(seconds: 2),
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

  Future searchSnatch(String tags, String amount, int cooldown, Booru booru) async {
    int count = 0, limit;
    BooruHandler booruHandler;
    List<BooruItem> booruItems = [];

    if (int.parse(amount) <= 100) {
      limit = int.parse(amount);
    } else {
      limit = 100;
    }

    List temp = BooruHandlerFactory().getBooruHandler([booru], limit);
    booruHandler = temp[0] as BooruHandler;
    booruHandler.pageNum = temp[1] as int;
    booruHandler.pageNum++;

    FlashElements.showSnackbar(
      title: const Text("Snatching Images", style: TextStyle(fontSize: 20)),
      position: Positions.top,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Do not close the app!'),
        ],
      ),
      leadingIcon: Icons.warning_amber,
      leadingIconColor: Colors.yellow,
      sideColor: Colors.yellow,
    );

    while (count < int.parse(amount) && !booruHandler.locked) {
      booruItems = (await booruHandler.Search(tags, null) ?? []);
      booruHandler.pageNum++;
      count = booruItems.length;
      print(count);
      // TODO error handling?
    }
    queue(booruItems, booru, cooldown);
  }
}
