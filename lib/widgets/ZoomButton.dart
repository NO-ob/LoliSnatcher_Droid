import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ViewerHandler.dart';

class ZoomButton extends StatefulWidget {
  const ZoomButton({Key? key}) : super(key: key);

  @override
  State<ZoomButton> createState() => _ZoomButtonState();
}

class _ZoomButtonState extends State<ZoomButton> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final ViewerHandler viewerHandler = Get.find<ViewerHandler>();

  bool isVisible = false, isLoaded = false;

  StreamSubscription<bool>? appbarListener, loadedListener;

  @override
  void initState() {
    super.initState();
    isVisible = settingsHandler.zoomButtonPosition != "Disabled" && settingsHandler.appMode.value != AppMode.DESKTOP && viewerHandler.displayAppbar.value;
    appbarListener = viewerHandler.displayAppbar.listen((bool value) {
      if (settingsHandler.zoomButtonPosition != "Disabled" && settingsHandler.appMode.value != AppMode.DESKTOP) {
        isVisible = value;
      }
      updateState();
    });

    isLoaded = viewerHandler.isLoaded.value;
    loadedListener = viewerHandler.isLoaded.listen((bool value) {
      if (isLoaded != value) {
        isLoaded = value;
        updateState();
      }
    });
  }

  void updateState() {
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    appbarListener?.cancel();
    loadedListener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: kToolbarHeight * 3,
      right: settingsHandler.zoomButtonPosition == "Right" ? -8 : null,
      left: settingsHandler.zoomButtonPosition == "Left" ? -8 : null,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: (isVisible && isLoaded)
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Get.theme.colorScheme.background.withOpacity(0.33),
                  minimumSize: const Size(28, 28),
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 6),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  ),
                ),
                onPressed: viewerHandler.toggleZoom,
                child: Obx(
                  () => Icon(
                    viewerHandler.isZoomed.value ? Icons.zoom_out : Icons.zoom_in,
                    size: 28,
                    color: Get.theme.colorScheme.onBackground.withOpacity(0.5),
                  ),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
