import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/services/image_writer.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';

class SnatchHandler extends GetxController {
  SnatchHandler() {
    queuedList.listen((List<SnatchItem> list) {
      trySnatch();
    });
  }
  static SnatchHandler get instance => Get.find<SnatchHandler>();

  RxBool active = false.obs;
  RxString status = ''.obs;
  RxInt queueProgress = 0.obs;
  RxInt received = 0.obs;
  RxInt total = 0.obs;

  RxList<SnatchItem> queuedList = RxList<SnatchItem>([]);

  Stream<Map<String, int>> writeMultipleFake(List<BooruItem> items, Booru booru, int cooldown) async* {
    int snatchedCounter = 0;
    for (int i = 0; i < items.length; i++) {
      await Future.delayed(const Duration(milliseconds: 2000), () async {});
      snatchedCounter++;
      yield {
        'snatched': snatchedCounter,
      };
    }

    yield {
      'snatched': snatchedCounter,
      'exists': 0,
      'failed': 0,
    };
  }

  void onProgress(int newReceived, int newTotal) {
    received.value = newReceived;
    total.value = newTotal;
  }

  Future snatch(SnatchItem item) async {
    active.value = true;
    status.value = queuedList.isNotEmpty ? '0/${item.booruItems.length}/${queuedList.length}' : '0/${item.booruItems.length}';

    // writeMultipleFake(item.booruItems, item.booru, item.cooldown).listen(
    ImageWriter()
        .writeMultiple(
      item.booruItems,
      item.booru,
      item.cooldown,
      onProgress,
      item.ignoreExists,
    )
        .listen(
      (Map<String, dynamic> data) {
        final int snatched = data['snatched']! as int;
        final List<BooruItem>? exists = data['exists'];
        final List<BooruItem>? failed = data['failed'];

        status.value = queuedList.isNotEmpty ? '$snatched/${item.booruItems.length}/${queuedList.length}' : '$snatched/${item.booruItems.length}';

        if (exists == null && failed == null) {
          // record progress only when snatched changes
          queueProgress.value = queueProgress.value + 1;
        }

        received.value = 0;
        total.value = 0;

        if (exists != null && failed != null && queuedList.isEmpty) {
          // last yield in stream will send exists and failed counts
          // but show this message only when queue is empty => snatching is complete
          if (SettingsHandler.instance.downloadNotifications) {
            FlashElements.showSnackbar(
              duration: const Duration(seconds: 2),
              position: Positions.top,
              title: const Text('Snatching Complete', style: TextStyle(fontSize: 20)),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Snatched: ${queueProgress.value} ${Tools.pluralize('item', queueProgress.value)}"),
                  if (exists.isNotEmpty)
                    Text('${exists.length} ${Tools.pluralize('file', exists.length)} ${exists.length == 1 ? 'was' : 'were'} already snatched'),
                  if (failed.isNotEmpty) Text('Failed to snatch ${failed.length} ${Tools.pluralize('file', exists.length)}'),
                ],
              ),
              leadingIcon: Icons.done_all,
              sideColor: (exists.isNotEmpty || failed.isNotEmpty) ? Colors.yellow : Colors.green,
              //TODO restart/retry buttons for failed items?
            );
          }
        }
      },
      onDone: () {
        if (queuedList.isNotEmpty) {
          snatch(queuedList.removeLast());
        } else {
          active.value = false;
          status.value = '';
          queueProgress.value = 0;
          received.value = 0;
          total.value = 0;
        }
      },
    );
  }

  void trySnatch() {
    if (!active.value) {
      if (queuedList.isNotEmpty) {
        snatch(queuedList.removeLast());
      } else if (queuedList.isEmpty) {
        //
      }
    }
  }

  void queue(
    List<BooruItem> booruItems,
    Booru booru,
    int cooldown,
    bool ignoreExists,
  ) {
    if (booruItems.isNotEmpty) {
      final SnatchItem item = SnatchItem(booruItems, cooldown, booru, ignoreExists);
      queuedList.add(item);

      if (booruItems.length > 1) {
        if (SettingsHandler.instance.downloadNotifications) {
          FlashElements.showSnackbar(
            title: const Text('Added to snatch queue', style: TextStyle(fontSize: 20)),
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
        }
      } else {
        if (SettingsHandler.instance.downloadNotifications) {
          FlashElements.showSnackbar(
            title: const Text('Added to snatch queue', style: TextStyle(fontSize: 20)),
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

    final List temp = BooruHandlerFactory().getBooruHandler([booru], limit);
    booruHandler = temp[0] as BooruHandler;
    booruHandler.pageNum = temp[1] as int;
    booruHandler.pageNum++;

    FlashElements.showSnackbar(
      title: const Text('Snatching Images', style: TextStyle(fontSize: 20)),
      position: Positions.top,
      content: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Do not close the app!'),
        ],
      ),
      leadingIcon: Icons.warning_amber,
      leadingIconColor: Colors.yellow,
      sideColor: Colors.yellow,
    );

    while (count < int.parse(amount) && !booruHandler.locked) {
      booruItems = await booruHandler.search(tags, null) ?? [];
      booruHandler.pageNum++;
      count = booruItems.length;
      // TODO error handling?
    }
    queue(booruItems, booru, cooldown, false);
  }
}

class SnatchItem {
  SnatchItem(
    this.booruItems,
    this.cooldown,
    this.booru,
    this.ignoreExists,
  );

  final List<BooruItem> booruItems;
  final int cooldown;
  final Booru booru;
  final bool ignoreExists;
}
