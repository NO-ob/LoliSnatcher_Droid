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

      final int totalItems = totalActiveAmount + totalRetryableAmount;

      if (totalItems == 0) {
        return const DDEmptyState();
      }

      return DDCombinedList(
        controller: controller,
        snatchHandler: snatchHandler,
        activeLength: activeLength,
        queuesLength: queuesLength,
        existsLength: existsLength,
        failedLength: failedLength,
        cancelledLength: cancelledLength,
      );
    });
  }
}

class DDCombinedList extends StatelessWidget {
  const DDCombinedList({
    required this.controller,
    required this.snatchHandler,
    required this.activeLength,
    required this.queuesLength,
    required this.existsLength,
    required this.failedLength,
    required this.cancelledLength,
    super.key,
  });

  final DownloadsDrawerController controller;
  final SnatchHandler snatchHandler;
  final int activeLength;
  final int queuesLength;
  final int existsLength;
  final int failedLength;
  final int cancelledLength;

  @override
  Widget build(BuildContext context) {
    final totalActiveAmount = activeLength + queuesLength;
    final totalRetryableAmount = existsLength + failedLength + cancelledLength;
    final totalItems = totalActiveAmount + totalRetryableAmount;

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: totalItems,
      itemExtent: 200,
      itemBuilder: (BuildContext context, int index) {
        // Active items (currently downloading)
        if (activeLength != 0 && index < activeLength) {
          return _buildActiveItem(index);
        }

        // Queued items
        if (index < totalActiveAmount) {
          return _buildQueuedItem(index - activeLength);
        }

        // Retryable items (exists, failed, cancelled)
        final retryableIndex = index - totalActiveAmount;
        return _buildRetryableItem(retryableIndex);
      },
    );
  }

  Widget _buildActiveItem(int index) {
    final item = snatchHandler.current.value!.booruItems[snatchHandler.queueProgress.value + index];
    return DDActiveItem(
      item: item,
      handler: controller.getHandler(snatchHandler.current.value!.booru),
      index: index,
      isFirst: index == 0,
      queueProgress: snatchHandler.queueProgress.value,
      totalItems: snatchHandler.current.value!.booruItems.length,
    );
  }

  Widget _buildQueuedItem(int offsetIndex) {
    final int queueIndex = queuesLength == 1
        ? 0
        : lerpDouble(
            0,
            max(0, queuesLength - 1),
            offsetIndex / (queuesLength - 1),
          )!.toInt();
    final queue = snatchHandler.queuedList[queueIndex];

    return DDQueuedItem(
      queue: queue,
      queueIndex: queueIndex,
      handler: controller.getHandler(queue.booru),
    );
  }

  Widget _buildRetryableItem(int retryableIndex) {
    final bool isExists = retryableIndex < existsLength;
    final bool isFailed = retryableIndex < existsLength + failedLength;

    final RetryableItemType type;
    if (isExists) {
      type = RetryableItemType.exists;
    } else if (isFailed) {
      type = RetryableItemType.failed;
    } else {
      type = RetryableItemType.cancelled;
    }

    final record = isExists
        ? snatchHandler.existsItems[retryableIndex]
        : isFailed
            ? snatchHandler.failedItems[retryableIndex - existsLength]
            : snatchHandler.cancelledItems[retryableIndex - existsLength - failedLength];

    return DDRetryableItem(
      record: record,
      type: type,
      handler: controller.getHandler(record.booru),
      onRetry: (isLongTap) => controller.onRetryFailedItem(record, isExists, isLongTap),
      onSkip: () => snatchHandler.onRemoveRetryItem(record),
    );
  }
}
