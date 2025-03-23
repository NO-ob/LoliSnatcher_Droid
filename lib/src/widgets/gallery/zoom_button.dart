import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/viewer_handler.dart';

class ZoomButton extends StatelessWidget {
  const ZoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewerHandler viewerHandler = ViewerHandler.instance;

    return ValueListenableBuilder(
      valueListenable: viewerHandler.isZoomed,
      builder: (context, isZoomed, child) => IconButton(
        icon: Icon(isZoomed ? Icons.zoom_out : Icons.zoom_in),
        onPressed: viewerHandler.toggleZoom,
        color: Theme.of(context).iconTheme.color?.withValues(alpha: 0.5),
        // visualDensity: VisualDensity.comfortable,
      ),
    );
  }
}
