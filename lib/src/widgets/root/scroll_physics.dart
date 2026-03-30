import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';

class CustomScrollBehavior extends MaterialScrollBehavior {
  const CustomScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
      //
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        );
    }
  }

  @override
  Set<PointerDeviceKind> get dragDevices => {
    ...PointerDeviceKind.values,
    // PointerDeviceKind.touch,
    // PointerDeviceKind.mouse,
  };
}

/// Custom binding that intercepts pointer scroll events and applies
/// a speed multiplier before they reach Scrollables.
class CustomWidgetsBinding extends WidgetsFlutterBinding {
  static double get scrollSpeedMultiplier {
    try {
      return SettingsHandler.instance.mousewheelScrollSpeed / 10;
    } catch (_) {
      return 1;
    }
  }

  static bool get _shouldModifyScroll => Platform.isWindows || Platform.isLinux;

  static WidgetsBinding ensureInitialized() {
    if (_shouldModifyScroll) {
      CustomWidgetsBinding();
    }
    return WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  void handlePointerEvent(PointerEvent event) {
    if (event is PointerScrollEvent && _shouldModifyScroll) {
      final multiplier = scrollSpeedMultiplier;
      if (multiplier != 1) {
        // Create a modified event with scaled scroll delta
        final modifiedEvent = PointerScrollEvent(
          viewId: event.viewId,
          timeStamp: event.timeStamp,
          kind: event.kind,
          device: event.device,
          position: event.position,
          scrollDelta: event.scrollDelta * multiplier,
          embedderId: event.embedderId,
        );
        super.handlePointerEvent(modifiedEvent);
        return;
      }
    }
    super.handlePointerEvent(event);
  }
}
