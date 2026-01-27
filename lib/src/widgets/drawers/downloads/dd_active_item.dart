import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/animated_progress_indicator.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_build.dart';

class DDActiveItem extends StatelessWidget {
  const DDActiveItem({
    required this.item,
    required this.handler,
    required this.index,
    required this.isFirst,
    required this.queueProgress,
    required this.totalItems,
    super.key,
  });

  final BooruItem item;
  final BooruHandler handler;
  final int index;
  final bool isFirst;
  final int queueProgress;
  final int totalItems;

  @override
  Widget build(BuildContext context) {
    final snatchHandler = SnatchHandler.instance;

    return Stack(
      children: [
        if (isFirst)
          Positioned.fill(
            bottom: 0,
            left: 0,
            child: Obx(() {
              if (snatchHandler.total.value == 0) {
                return const SizedBox.shrink();
              }

              return AnimatedProgressIndicator(
                value: snatchHandler.currentProgress,
                valueColor: Theme.of(context).progressIndicatorTheme.color?.withValues(alpha: 0.5),
                indicatorStyle: IndicatorStyle.linear,
                borderRadius: 0,
                animationDuration: const Duration(milliseconds: 100),
              );
            }),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: 100,
                    height: 150,
                    child: ThumbnailBuild(
                      item: item,
                      handler: handler,
                      selectable: false,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      if (totalItems != 1)
                        Text(
                          '${queueProgress + index + 1}/$totalItems',
                          style: const TextStyle(fontSize: 16),
                        ),
                      if (isFirst)
                        CancelButton(
                          withIcon: true,
                          action: snatchHandler.onCancel,
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            if (isFirst)
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      if (snatchHandler.total.value != 0)
                        Text(
                          '${Tools.formatBytes(
                            snatchHandler.received.value,
                            2,
                            withSpace: false,
                          )}/${Tools.formatBytes(
                            snatchHandler.total.value,
                            2,
                            withSpace: false,
                          )}',
                          style: const TextStyle(fontSize: 16),
                        )
                      else
                        const SizedBox.shrink(),
                      const Spacer(),
                      if (snatchHandler.total.value != 0)
                        Text(
                          '${(snatchHandler.currentProgress * 100.0).toStringAsFixed(2)}%',
                          style: const TextStyle(fontSize: 16),
                        )
                      else
                        const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
