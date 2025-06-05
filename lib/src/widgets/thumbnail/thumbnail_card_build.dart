import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/widgets/common/animated_progress_indicator.dart';
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
    final settingsHandler = SettingsHandler.instance;
    final searchHandler = SearchHandler.instance;
    final viewerHandler = ViewerHandler.instance;
    final snatchHandler = SnatchHandler.instance;

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
          final bool isSelected = searchHandler.currentSelected.contains(item);
          final bool isCurrent =
              (settingsHandler.appMode.value.isDesktop || viewerHandler.inViewer.value) &&
              searchHandler.viewedIndex.value == index;
          final bool isCurrentlyBeingSnatched =
              snatchHandler.current.value?.booruItems[snatchHandler.queueProgress.value] == item &&
              snatchHandler.total.value != 0;

          final bool showBorder = isCurrent || isSelected || isCurrentlyBeingSnatched;
          final Color borderColor = isCurrentlyBeingSnatched
              ? Colors.transparent
              : Theme.of(context).colorScheme.secondary;
          final double borderRadius = isCurrentlyBeingSnatched ? 10 : 4;
          final double defaultBorderWidth = max(2, MediaQuery.devicePixelRatioOf(context));
          final double borderWidth = defaultBorderWidth * (isCurrentlyBeingSnatched ? 3 : 1);

          return Stack(
            alignment: Alignment.center,
            children: [
              Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: showBorder
                      ? Border.all(
                          color: borderColor,
                          width: borderWidth,
                        )
                      : null,
                ),
                child: InkWell(
                  enableFeedback: true,
                  borderRadius: BorderRadius.circular(4),
                  highlightColor: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.4),
                  splashColor: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.2),
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
                  child: Obx(
                    () {
                      final bool hasSelected = searchHandler.currentSelected.isNotEmpty;
                      final selectedIndex = searchHandler.currentSelected.indexOf(item);
                      final isSelected = selectedIndex != -1;

                      return ThumbnailBuild(
                        item: item,
                        booru: searchHandler.currentBooru,
                        handler: searchHandler.currentBooruHandler,
                        selectable: true,
                        selectedIndex: selectedIndex == -1 ? null : selectedIndex,
                        onSelected: hasSelected
                            ? () {
                                if (isSelected) {
                                  searchHandler.currentTab.selected.remove(item);
                                } else {
                                  searchHandler.currentTab.selected.add(item);
                                }
                              }
                            : null,
                      );
                    },
                  ),
                ),
              ),
              if (isCurrentlyBeingSnatched)
                Positioned.fill(
                  child: AnimatedProgressIndicator(
                    value: snatchHandler.currentProgress,
                    animationDuration: const Duration(milliseconds: 50),
                    indicatorStyle: IndicatorStyle.square,
                    valueColor: Theme.of(context).progressIndicatorTheme.color,
                    strokeWidth: borderWidth,
                    borderRadius: borderRadius,
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
