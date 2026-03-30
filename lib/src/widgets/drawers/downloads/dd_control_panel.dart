import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/gen/strings.g.dart';
import 'package:lolisnatcher/src/widgets/drawers/downloads/dd_controller.dart';
import 'package:lolisnatcher/src/widgets/drawers/downloads/dd_queue_controls.dart';
import 'package:lolisnatcher/src/widgets/drawers/downloads/dd_selection_actions.dart';

class DDControlPanel extends StatelessWidget {
  const DDControlPanel({
    required this.controller,
    required this.toggleDrawer,
    super.key,
  });

  final DownloadsDrawerController controller;
  final VoidCallback toggleDrawer;

  @override
  Widget build(BuildContext context) {
    final settingsHandler = controller.settingsHandler;
    final searchHandler = controller.searchHandler;
    final snatchHandler = controller.snatchHandler;

    return Stack(
      children: [
        Obx(
          () => AnimatedSize(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.bottomCenter,
            child: (settingsHandler.booruList.isNotEmpty && searchHandler.tabs.isNotEmpty)
                ? ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.sizeOf(context).height * (snatchHandler.queuedList.isEmpty ? 0.7 : 0.5),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: Scrollbar(
                        controller: controller.scrollController,
                        thumbVisibility: true,
                        interactive: true,
                        child: SingleChildScrollView(
                          controller: controller.scrollController,
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DDQueueControls(controller: controller),
                              DDSelectionActions(
                                controller: controller,
                                toggleDrawer: toggleDrawer,
                              ),
                              DDNavigationButtons(
                                controller: controller,
                                toggleDrawer: toggleDrawer,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
        // Loading overlay
        Positioned.fill(
          child: Obx(
            () => AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: controller.updating.value
                  ? Container(
                      alignment: Alignment.center,
                      color: Colors.black.withValues(alpha: 0.66),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircularProgressIndicator(),
                          const SizedBox(height: 10),
                          Text(context.loc.settings.downloads.updatingData),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ],
    );
  }
}
