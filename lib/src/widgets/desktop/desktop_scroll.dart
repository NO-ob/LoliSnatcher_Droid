import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void desktopPointerScroll(
  ScrollController controller,
  PointerSignalEvent event,
) {
  if (event is PointerScrollEvent) {
    controller.jumpTo(controller.offset + event.scrollDelta.dy);
  }
}
