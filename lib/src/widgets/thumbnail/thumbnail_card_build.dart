import 'dart:math';

import 'package:flutter/material.dart';

import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/widgets/common/animated_progress_indicator.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_build.dart';

class ThumbnailCardBuild extends StatelessWidget {
  const ThumbnailCardBuild({
    required this.index,
    required this.item,
    required this.handler,
    required this.scrollController,
    this.isHighlighted = false,
    this.selectable = true,
    this.selectedIndex,
    this.onSelected,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onSecondaryTap,
    super.key,
  });

  final int index;
  final BooruItem item;
  final BooruHandler handler;
  final AutoScrollController scrollController;
  final bool isHighlighted;
  final bool selectable;
  final int? selectedIndex;
  final void Function(int)? onSelected;
  final void Function(int)? onTap;
  final void Function(int)? onDoubleTap;
  final void Function(int)? onLongPress;
  final void Function(int)? onSecondaryTap;

  @override
  Widget build(BuildContext context) {
    final snatchHandler = SnatchHandler.instance;

    final isSelected = selectable && selectedIndex != null;

    return AutoScrollTag(
      highlightColor: Colors.red,
      key: ValueKey(index),
      controller: scrollController,
      index: index,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: snatchHandler.current,
              builder: (_, current, child) {
                return ValueListenableBuilder(
                  valueListenable: snatchHandler.queueProgress,
                  builder: (_, queueProgress, _) {
                    return ValueListenableBuilder(
                      valueListenable: snatchHandler.total,
                      builder: (_, total, _) {
                        return ValueListenableBuilder(
                          valueListenable: snatchHandler.received,
                          builder: (_, received, _) {
                            final bool isCurrentlyBeingSnatched =
                                current?.booruItems[queueProgress] == item && total != 0;

                            final bool showBorder = isHighlighted || isSelected || isCurrentlyBeingSnatched;
                            final Color borderColor = isCurrentlyBeingSnatched
                                ? Colors.transparent
                                : Theme.of(context).colorScheme.secondary;
                            final double borderRadius = isCurrentlyBeingSnatched ? 10 : 4;
                            final double defaultBorderWidth = max(2, MediaQuery.devicePixelRatioOf(context));
                            final double borderWidth = defaultBorderWidth * (isCurrentlyBeingSnatched ? 3 : 1);

                            return Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(borderRadius),
                                border: showBorder
                                    ? Border.all(
                                        color: borderColor,
                                        width: borderWidth,
                                      )
                                    : null,
                              ),
                              child: child,
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
              child: RepaintBoundary(
                child: InkWell(
                  enableFeedback: true,
                  borderRadius: BorderRadius.circular(4),
                  highlightColor: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.4),
                  splashColor: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.2),
                  onTap: onTap == null ? null : () => onTap?.call(index),
                  onDoubleTap: onDoubleTap == null ? null : () => onDoubleTap?.call(index),
                  onLongPress: onLongPress == null ? null : () => onLongPress?.call(index),
                  onSecondaryTap: onSecondaryTap == null ? null : () => onSecondaryTap?.call(index),
                  child: ThumbnailBuild(
                    item: item,
                    handler: handler,
                    selectable: selectable,
                    selectedIndex: isSelected ? selectedIndex : null,
                    onSelected: onSelected == null ? null : () => onSelected!(index),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: ValueListenableBuilder(
                valueListenable: snatchHandler.current,
                builder: (_, current, _) {
                  return ValueListenableBuilder(
                    valueListenable: snatchHandler.queueProgress,
                    builder: (_, queueProgress, _) {
                      return ValueListenableBuilder(
                        valueListenable: snatchHandler.total,
                        builder: (_, total, _) {
                          return ValueListenableBuilder(
                            valueListenable: snatchHandler.received,
                            builder: (_, _, _) {
                              final bool isCurrentlyBeingSnatched =
                                  current?.booruItems[queueProgress] == item && total != 0;
                              final double borderRadius = isCurrentlyBeingSnatched ? 10 : 4;
                              final double defaultBorderWidth = max(2, MediaQuery.devicePixelRatioOf(context));
                              final double borderWidth = defaultBorderWidth * (isCurrentlyBeingSnatched ? 3 : 1);

                              if (isCurrentlyBeingSnatched) {
                                return AnimatedProgressIndicator(
                                  value: snatchHandler.currentProgress,
                                  animationDuration: const Duration(milliseconds: 50),
                                  indicatorStyle: IndicatorStyle.square,
                                  valueColor: Theme.of(context).progressIndicatorTheme.color,
                                  strokeWidth: borderWidth,
                                  borderRadius: borderRadius,
                                );
                              }

                              return const SizedBox.shrink();
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
