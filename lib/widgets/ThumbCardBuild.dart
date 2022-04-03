import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/ThumbBuild.dart';

class ThumbCardBuild extends StatelessWidget {
  final int index;
  final int columnCount;
  final SearchGlobal tab;
  final void Function(int) onTap;
  ThumbCardBuild(this.index, this.columnCount, this.onTap, this.tab, {Key? key}) : super(key: key);

  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();

  void onDoubleTap(int index) async {
    BooruItem item = tab.booruHandler.filteredFetched[index];
    if (item.isFavourite.value != null) {
      ServiceHandler.vibrate();

      item.isFavourite.toggle();
      settingsHandler.dbHandler.updateBooruItem(item, "local");
    }
  }

  void onLongPress(int index) async {
    ServiceHandler.vibrate(duration: 5);

    if (tab.selected.contains(index)) {
      tab.selected.remove(index);
    } else {
      tab.selected.add(index);
    }
  }

  void onSecondaryTap(int index) {
    BooruItem item = tab.booruHandler.filteredFetched[index];
    Clipboard.setData(ClipboardData(text: item.fileURL));
    FlashElements.showSnackbar(
      duration: Duration(seconds: 2),
      title: Text("Copied File URL to clipboard!", style: TextStyle(fontSize: 20)),
      content: Text(item.fileURL, style: TextStyle(fontSize: 16)),
      leadingIcon: Icons.copy,
      sideColor: Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    // print('ThumbCardBuild: $index');
    return Obx(() {
      bool isSelected = tab.selected.contains(index);
      bool isCurrent = settingsHandler.appMode == 'Desktop' && (searchHandler.viewedIndex.value == index);

      // print('ThumbCardBuild obx: $index');

      return AutoScrollTag(
        highlightColor: Colors.red,
        key: ValueKey(index),
        controller: searchHandler.gridScrollController,
        index: index,
        child: Material(
          borderOnForeground: true,
          child: Ink(
            decoration: (isCurrent || isSelected)
                ? BoxDecoration(
                    border: Border.all(
                      color: isCurrent ? Colors.red : Get.theme.colorScheme.secondary,
                      width: 2.0,
                    ),
                  )
                : null,
            child: GestureDetector(
              onSecondaryTap: () {
                onSecondaryTap(index);
              },
              child: InkResponse(
                enableFeedback: true,
                highlightShape: BoxShape.rectangle,
                containedInkWell: false,
                highlightColor: Get.theme.colorScheme.secondary,
                splashColor: Colors.pink,
                child: ThumbBuild(index, columnCount, tab),
                onTap: () {
                  onTap(index);
                },
                onDoubleTap: () {
                  onDoubleTap(index);
                },
                onLongPress: () {
                  onLongPress(index);
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}
