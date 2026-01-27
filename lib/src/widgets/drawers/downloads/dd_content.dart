import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/widgets/drawers/downloads/dd_active_item.dart';
import 'package:lolisnatcher/src/widgets/drawers/downloads/dd_controller.dart';
import 'package:lolisnatcher/src/widgets/drawers/downloads/dd_empty_state.dart';
import 'package:lolisnatcher/src/widgets/drawers/downloads/dd_queued_item.dart';
import 'package:lolisnatcher/src/widgets/drawers/downloads/dd_retryable_item.dart';

class DDContent extends StatelessWidget {
  const DDContent({
    required this.controller,
    super.key,
  });

  final DownloadsDrawerController controller;

  @override
  Widget build(BuildContext context) {
    final snatchHandler = controller.snatchHandler;

    return Obx(() {
      final int queuesLength = snatchHandler.queuedList.length;
      final int activeLength = snatchHandler.current.value != null
          ? snatchHandler.current.value!.booruItems.length - snatchHandler.queueProgress.value
          : 0;
      final int totalActiveAmount = queuesLength + activeLength;

      final int existsLength = snatchHandler.existsItems.length;
      final int failedLength = snatchHandler.failedItems.length;
      final int cancelledLength = snatchHandler.cancelledItems.length;
      final int totalRetryableAmount = existsLength + failedLength + cancelledLength;

      if (totalActiveAmount == 0 && totalRetryableAmount == 0) {
        return const DDEmptyState();
      }

      if (totalActiveAmount != 0) {
        return DDActiveList(
          controller: controller,
          snatchHandler: snatchHandler,
          activeLength: activeLength,
          queuesLength: queuesLength,
        );
      }

      if (totalRetryableAmount != 0) {
        return DDRetryableList(
          controller: controller,
          snatchHandler: snatchHandler,
          existsLength: existsLength,
          failedLength: failedLength,
          cancelledLength: cancelledLength,
          totalRetryableAmount: totalRetryableAmount,
        );
      }

      return const SizedBox.shrink();
    });
  }
}

class DDActiveList extends StatelessWidget {
  const DDActiveList({
    required this.controller,
    required this.snatchHandler,
    required this.activeLength,
    required this.queuesLength,
    super.key,
  });

  final DownloadsDrawerController controller;
  final SnatchHandler snatchHandler;
  final int activeLength;
  final int queuesLength;

  @override
  Widget build(BuildContext context) {
    final totalActiveAmount = activeLength + queuesLength;

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: totalActiveAmount,
      itemExtent: 200,
      itemBuilder: (BuildContext context, int index) {
        if (activeLength != 0 && index < activeLength) {
          final item = snatchHandler.current.value!.booruItems[snatchHandler.queueProgress.value + index];
          return DDActiveItem(
            item: item,
            handler: controller.getHandler(snatchHandler.current.value!.booru),
            index: index,
            isFirst: index == 0,
            queueProgress: snatchHandler.queueProgress.value,
            totalItems: snatchHandler.current.value!.booruItems.length,
          );
        } else {
          final int queueIndex = lerpDouble(
            0,
            max(0, queuesLength - 1),
            (index - activeLength) / (queuesLength - 1),
          )!.toInt();
          final queue = snatchHandler.queuedList[queueIndex];

          return DDQueuedItem(
            queue: queue,
            queueIndex: queueIndex,
            handler: controller.getHandler(queue.booru),
          );
        }
      },
    );
  }
}

class DDRetryableList extends StatelessWidget {
  const DDRetryableList({
    required this.controller,
    required this.snatchHandler,
    required this.existsLength,
    required this.failedLength,
    required this.cancelledLength,
    required this.totalRetryableAmount,
    super.key,
  });

  final DownloadsDrawerController controller;
  final SnatchHandler snatchHandler;
  final int existsLength;
  final int failedLength;
  final int cancelledLength;
  final int totalRetryableAmount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: totalRetryableAmount,
      itemExtent: 200,
      itemBuilder: (BuildContext context, int index) {
        final bool isExists = index < existsLength;
        final bool isFailed = index < existsLength + failedLength;

        final RetryableItemType type;
        if (isExists) {
          type = RetryableItemType.exists;
        } else if (isFailed) {
          type = RetryableItemType.failed;
        } else {
          type = RetryableItemType.cancelled;
        }

        final record = isExists
            ? snatchHandler.existsItems[index]
            : isFailed
                ? snatchHandler.failedItems[index - existsLength]
                : snatchHandler.cancelledItems[index - existsLength - failedLength];

        return DDRetryableItem(
          record: record,
          type: type,
          handler: controller.getHandler(record.booru),
          onRetry: (isLongTap) => controller.onRetryFailedItem(record, isExists, isLongTap),
          onSkip: () => snatchHandler.onRemoveRetryItem(record),
        );
      },
    );
  }
}
