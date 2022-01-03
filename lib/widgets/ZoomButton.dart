import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ViewerHandler.dart';

class ZoomButton extends StatefulWidget {
  ZoomButton({Key? key}) : super(key: key);

  @override
  _ZoomButtonState createState() => _ZoomButtonState();
}

class _ZoomButtonState extends State<ZoomButton> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final ViewerHandler viewerHandler = Get.find<ViewerHandler>();

  bool isVisible = false;

  StreamSubscription<bool>? appbarListener;

  @override
  void initState() {
    super.initState();
    isVisible = settingsHandler.zoomButtonPosition != "Disabled" && settingsHandler.appMode != "Desktop" && viewerHandler.displayAppbar.value;
    appbarListener = viewerHandler.displayAppbar.listen((bool value) {
      if (settingsHandler.zoomButtonPosition != "Disabled" && settingsHandler.appMode != "Desktop") {
        isVisible = value;
      }
      updateState();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: kToolbarHeight * 3,
      right: settingsHandler.zoomButtonPosition == "Right" ? -10 : null,
      left: settingsHandler.zoomButtonPosition == "Left" ? -10 : null,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: isVisible
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Get.theme.colorScheme.background.withOpacity(0.33),
                  minimumSize: Size(28, 28),
                  padding: EdgeInsets.all(3),
                ),
                child: Obx(() => Icon(
                      viewerHandler.isZoomed.value ? Icons.zoom_out : Icons.zoom_in,
                      size: 28,
                      color: Get.theme.colorScheme.onBackground.withOpacity(0.5),
                    )),
                onPressed: viewerHandler.toggleZoom,
              )
            : const SizedBox(),
      ),
    );
  }
}
