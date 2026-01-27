import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/gen/strings.g.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/drawers/downloads/dd_controller.dart';

class DDQueueControls extends StatelessWidget {
  const DDQueueControls({
    required this.controller,
    super.key,
  });

  final DownloadsDrawerController controller;

  @override
  Widget build(BuildContext context) {
    final snatchHandler = controller.snatchHandler;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Pause/Resume button
        Obx(
          () => AnimatedSize(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.bottomCenter,
            child: snatchHandler.queuedList.isEmpty
                ? const SizedBox.shrink()
                : SettingsButton(
                    drawBottomBorder: false,
                    drawTopBorder: true,
                    action: () {
                      if (snatchHandler.active.value) {
                        snatchHandler.active.value = false;
                      } else {
                        if (snatchHandler.current.value == null) {
                          snatchHandler.trySnatch();
                        } else {
                          snatchHandler.active.value = true;
                        }
                      }
                    },
                    icon: snatchHandler.active.value ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
                    name: snatchHandler.active.value ? context.loc.pause : context.loc.resume,
                    subtitle: snatchHandler.active.value
                        ? Text('(${context.loc.settings.downloads.fromNextItemInQueue})')
                        : null,
                  ),
          ),
        ),
        // Retry All button
        Obx(
          () => AnimatedSize(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.bottomCenter,
            child: snatchHandler.active.value ||
                    (snatchHandler.existsItems.isEmpty &&
                        snatchHandler.failedItems.isEmpty &&
                        snatchHandler.cancelledItems.isEmpty)
                ? const SizedBox.shrink()
                : SettingsButton(
                    drawBottomBorder: false,
                    drawTopBorder: true,
                    action: () => controller.onRetryAllFailed(false),
                    onLongPress: () => controller.onRetryAllFailed(true),
                    icon: const Icon(Icons.refresh),
                    name: context.loc.mobileHome.retryAll(
                      count: snatchHandler.existsItems.length +
                          snatchHandler.failedItems.length +
                          snatchHandler.cancelledItems.length,
                    ),
                    subtitle: Text(context.loc.mobileHome.existingFailedOrCancelledItems),
                  ),
          ),
        ),
        // Clear Retryable Items button
        Obx(
          () => AnimatedSize(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.bottomCenter,
            child: snatchHandler.active.value ||
                    (snatchHandler.existsItems.isEmpty &&
                        snatchHandler.failedItems.isEmpty &&
                        snatchHandler.cancelledItems.isEmpty)
                ? const SizedBox.shrink()
                : SettingsButton(
                    drawBottomBorder: false,
                    drawTopBorder: true,
                    action: snatchHandler.onClearRetryableItems,
                    icon: const Icon(Icons.delete_forever),
                    name: context.loc.mobileHome.clearAllRetryableItems,
                  ),
          ),
        ),
      ],
    );
  }
}
