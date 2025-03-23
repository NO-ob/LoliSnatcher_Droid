import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/services/image_writer.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_build.dart';

class SnatchHandler {
  SnatchHandler() {
    queuedList.addListener(queuedListListener);
  }

  static SnatchHandler get instance => GetIt.instance<SnatchHandler>();

  static SnatchHandler register() {
    if (!GetIt.instance.isRegistered<SnatchHandler>()) {
      GetIt.instance.registerSingleton(
        SnatchHandler(),
        dispose: (snatchHandler) => snatchHandler.dispose(),
      );
    }
    return instance;
  }

  static void unregister() => GetIt.instance.unregister<SnatchHandler>();

  final RxBool active = false.obs;
  final RxString status = ''.obs;
  final RxInt queueProgress = 0.obs;
  final Rx<SnatchItem?> current = Rx<SnatchItem?>(null);
  final RxInt received = 0.obs;
  final RxInt total = 0.obs;

  final RxList<({BooruItem item, Booru booru})> existsItems = RxList([]);
  final RxList<({BooruItem item, Booru booru})> failedItems = RxList([]);
  final RxList<({BooruItem item, Booru booru})> cancelledItems = RxList([]);

  CancelToken? cancelToken;

  double get currentProgress {
    if (total.value == 0) return 0;
    return received.value / total.value;
  }

  final RxList<SnatchItem> queuedList = RxList<SnatchItem>([]);

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
      'cancelled': 0,
    };
  }

  void onProgress(int newReceived, int newTotal) {
    received.value = newReceived;
    total.value = newTotal;
  }

  void onRemoveRetryItem(
    ({BooruItem item, Booru booru}) record,
  ) {
    existsItems.remove(record);
    failedItems.remove(record);
    cancelledItems.remove(record);
  }

  void onClearRetryableItems() {
    existsItems.clear();
    failedItems.clear();
    cancelledItems.clear();
  }

  void onRetryAll({
    required int cooldown,
    bool ignoreExists = false,
  }) {
    final itemsToRetry = [...existsItems, ...failedItems, ...cancelledItems];
    final Set<Booru> uniqueBoorus = itemsToRetry.map((i) => i.booru).toSet();
    final Map<Booru, List<BooruItem>> booruItemsMap = {};
    booruItemsMap.addEntries(uniqueBoorus.map((b) => MapEntry(b, [])));
    for (int i = 0; i < itemsToRetry.length; i++) {
      final BooruItem item = itemsToRetry[i].item;
      final Booru booru = itemsToRetry[i].booru;
      final List<BooruItem> items = booruItemsMap[booru]!;
      items.add(item);
      booruItemsMap[booru] = items;
    }

    final List<SnatchItem> snatchItems = [];
    booruItemsMap.forEach((booru, items) {
      snatchItems.add(
        SnatchItem(
          items,
          cooldown,
          booru,
          ignoreExists || items.any((i) => existsItems.any((e) => e.item == i)),
        ),
      );
    });

    queuedList.addAll(snatchItems);

    onClearRetryableItems();
  }

  void onRetryItem(
    ({BooruItem item, Booru booru}) record, {
    required int cooldown,
    bool ignoreExists = false,
  }) {
    queuedList.add(
      SnatchItem(
        [record.item],
        cooldown,
        record.booru,
        ignoreExists,
      ),
    );

    onRemoveRetryItem(record);
  }

  void onCancel() {
    cancelToken?.cancel();
  }

  void onCancelTokenCreate(CancelToken token) {
    cancelToken = token;
  }

  Future snatch(SnatchItem item) async {
    status.value = queuedList.isNotEmpty ? '0/${item.booruItems.length}/${queuedList.length}' : '0/${item.booruItems.length}';
    current.value = item;

    // writeMultipleFake(item.booruItems, item.booru, item.cooldown).listen(
    ImageWriter()
        .writeMultiple(
      item.booruItems,
      item.booru,
      item.cooldown,
      onProgress,
      item.ignoreExists,
      onCancelTokenCreate,
    )
        .listen(
      (Map<String, dynamic> data) {
        final int snatched = data['snatched']! as int;
        final List<BooruItem> exists = data['exists'] ?? [];
        final List<BooruItem> failed = data['failed'] ?? [];
        final List<BooruItem> cancelled = data['cancelled'] ?? [];
        final bool isLastMessage = data['exists'] != null && data['failed'] != null && data['cancelled'] != null;

        // last yield in stream will send fetch results counters
        // but show this message only when queue is empty => snatching is complete
        if (SettingsHandler.instance.downloadNotifications && isLastMessage) {
          if (current.value!.booruItems.length == 1) {
            FlashElements.showSnackbar(
              duration: const Duration(seconds: 2),
              position: Positions.top,
              title: const Text(
                'Item Snatched',
                style: TextStyle(fontSize: 20),
              ),
              content: Row(
                children: [
                  if (exists.isNotEmpty || failed.isNotEmpty || cancelled.isNotEmpty || queuedList.isNotEmpty)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (exists.isNotEmpty) const Text('Item was already snatched before'),
                          if (failed.isNotEmpty) const Text('Failed to snatch the item'),
                          if (cancelled.isNotEmpty) const Text('Item was cancelled'),
                          if (queuedList.isNotEmpty) const Text('Starting next queue item...'),
                        ],
                      ),
                    ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 64,
                    height: 64,
                    child: ThumbnailBuild(
                      item: current.value!.booruItems.first,
                      selectable: false,
                      simple: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              leadingIcon: Icons.done_all,
              sideColor: failed.isNotEmpty ? Colors.red : ((exists.isNotEmpty || cancelled.isNotEmpty) ? Colors.yellow : Colors.green),
              // TODO restart/retry buttons for failed items?
            );
          } else {
            FlashElements.showSnackbar(
              duration: const Duration(seconds: 2),
              position: Positions.top,
              title: const Text('Items Snatched', style: TextStyle(fontSize: 20)),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Snatched: ${queueProgress.value} ${Tools.pluralize('item', queueProgress.value)}"),
                  if (exists.isNotEmpty)
                    Text('${exists.length} ${Tools.pluralize('file', exists.length)} ${exists.length == 1 ? 'was' : 'were'} already snatched'),
                  if (failed.isNotEmpty) Text('Failed to snatch ${failed.length} ${Tools.pluralize('file', failed.length)}'),
                  if (cancelled.isNotEmpty) Text('Cancelled ${cancelled.length} ${Tools.pluralize('file', cancelled.length)}'),
                  if (queuedList.isNotEmpty) const Text('Starting next queue item...'),
                ],
              ),
              leadingIcon: Icons.done_all,
              sideColor: failed.isNotEmpty ? Colors.red : ((exists.isNotEmpty || cancelled.isNotEmpty) ? Colors.yellow : Colors.green),
              //TODO restart/retry buttons for failed items?
            );
          }
        }

        if (isLastMessage) {
          existsItems.addAll(exists.map((e) => (booru: item.booru, item: e)));
          failedItems.addAll(failed.map((e) => (booru: item.booru, item: e)));
          cancelledItems.addAll(cancelled.map((e) => (booru: item.booru, item: e)));
        }

        cancelToken = null;
        status.value = queuedList.isNotEmpty ? '$snatched/${item.booruItems.length}/${queuedList.length}' : '$snatched/${item.booruItems.length}';
        queueProgress.value = queueProgress.value + 1;
        received.value = 0;
        total.value = 0;
      },
      onDone: () {
        cancelToken = null;
        status.value = '';
        current.value = null;
        queueProgress.value = 0;
        received.value = 0;
        total.value = 0;

        if (active.value) {
          if (queuedList.isNotEmpty) {
            snatch(queuedList.removeAt(0));
          } else {
            active.value = false;
          }
        }
      },
    );
  }

  void queuedListListener() {
    trySnatch();
  }

  void trySnatch() {
    if (!active.value && current.value == null) {
      if (queuedList.isNotEmpty) {
        active.value = true;
        snatch(queuedList.removeAt(0));
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
            title: Text(
              'Added ${booruItems.length} items to snatch queue',
              style: const TextStyle(fontSize: 20),
            ),
            position: Positions.top,
            duration: const Duration(seconds: 2),
            leadingIcon: Icons.info_outline,
            sideColor: Colors.green,
          );
        }
      } else {
        if (SettingsHandler.instance.downloadNotifications) {
          FlashElements.showSnackbar(
            title: const Text(
              'Added item to snatch queue',
              style: TextStyle(fontSize: 20),
            ),
            position: Positions.top,
            duration: const Duration(seconds: 2),
            leadingIcon: Icons.info_outline,
            sideColor: Colors.green,
            content: Row(
              children: [
                const SizedBox(width: 8),
                SizedBox(
                  width: 64,
                  height: 64,
                  child: ThumbnailBuild(
                    item: booruItems.first,
                    selectable: false,
                    simple: true,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
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
      booruItems = booruItems.where((e) => !e.isHated).toList();
      booruHandler.pageNum++;
      count = booruItems.length;
      // TODO error handling?
    }
    queue(booruItems, booru, cooldown, false);
  }

  void dispose() {
    queuedList.removeListener(queuedListListener);
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
