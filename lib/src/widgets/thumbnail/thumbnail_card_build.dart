import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_build.dart';

class ThumbnailCardBuild extends StatelessWidget {
  const ThumbnailCardBuild({
    required this.index,
    required this.item,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onSecondaryTap,
    super.key,
  });

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

    return AutoScrollTag(
      highlightColor: Colors.red,
      key: ValueKey(index),
      controller: searchHandler.gridScrollController,
      index: index,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        child: Obx(() {
          // print('ThumbnailCardBuild obx: $index');
          final bool isSelected = searchHandler.currentTab.selected.contains(item);
          final bool isCurrent = settingsHandler.appMode.value.isDesktop && (searchHandler.viewedIndex.value == index);

          return Ink(
            decoration: (isCurrent || isSelected)
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: isCurrent ? Colors.red : Theme.of(context).colorScheme.secondary,
                    border: Border.all(
                      color: isCurrent ? Colors.red : Theme.of(context).colorScheme.secondary,
                      width: max(2, MediaQuery.of(context).devicePixelRatio),
                    ),
                  )
                : null,
            child: InkWell(
              enableFeedback: true,
              borderRadius: BorderRadius.circular(4),
              highlightColor: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
              splashColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
              onTap: () {
                onTap?.call(index, item);
              },
              onDoubleTap: () {
                onDoubleTap?.call(index, item);
              },
              onLongPress: () {
                onLongPress?.call(index, item);
              },
              onSecondaryTap: () {
                onSecondaryTap?.call(index, item);
              },
              // TODO make inkwell ripple work with thumbnail (currently can't just use stack because thumbnail must be clickable too (i.e. checkbox))
              child: ThumbnailBuild(item: item),
            ),
          );
        }),
      ),
    );
  }
}
