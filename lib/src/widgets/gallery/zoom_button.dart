import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/viewer_handler.dart';

class ZoomButton extends StatelessWidget {
  const ZoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewerHandler viewerHandler = ViewerHandler.instance;

    return Obx(
      () => IconButton(
        icon: Icon(viewerHandler.isZoomed.value ? Icons.zoom_out : Icons.zoom_in),
        onPressed: viewerHandler.toggleZoom,
        color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
        // visualDensity: VisualDensity.comfortable,
      ),
    );
  }
}
