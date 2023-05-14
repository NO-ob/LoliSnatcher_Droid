import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_build.dart';

class ThumbnailCardBuild extends StatelessWidget {
  const ThumbnailCardBuild({
    Key? key,
    required this.index,
    required this.item,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onSecondaryTap,
    
  }) : super(key: key);

  final int index;
  final BooruItem item;
  final void Function(int, BooruItem)? onTap;
  final void Function(int, BooruItem)? onDoubleTap;
  final void Function(int, BooruItem)? onLongPress;
  final void Function(int, BooruItem)? onSecondaryTap;

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final SearchHandler searchHandler = SearchHandler.instance;

    // print('ThumbnailCardBuild: $index');
    return Obx(() {
      bool isSelected = searchHandler.currentTab.selected.contains(index);
      bool isCurrent = settingsHandler.appMode.value.isDesktop && (searchHandler.viewedIndex.value == index);

      // print('ThumbnailCardBuild obx: $index');

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
                      color: isCurrent ? Colors.red : Theme.of(context).colorScheme.secondary,
                      width: 2.0,
                    ),
                  )
                : null,
            child: GestureDetector(
              onSecondaryTap: () {
                onSecondaryTap?.call(index, item);
              },
              child: InkResponse(
                enableFeedback: true,
                highlightShape: BoxShape.rectangle,
                containedInkWell: true,
                borderRadius: BorderRadius.circular(10),
                highlightColor: Theme.of(context).colorScheme.secondary,
                splashColor: Colors.pink,
                child: ThumbnailBuild(index: index, item: item),
                onTap: () {
                  onTap?.call(index, item);
                },
                onDoubleTap: () {
                  onDoubleTap?.call(index, item);
                },
                onLongPress: () {
                  onLongPress?.call(index, item);
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}
