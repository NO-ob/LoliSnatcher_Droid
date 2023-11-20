import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomScrollBehavior extends MaterialScrollBehavior {
  const CustomScrollBehavior();

  // set default scroll physics
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        // case TargetPlatform.android:
        return const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
      case TargetPlatform.fuchsia:
      case TargetPlatform.android:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
    // return const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
  }

  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        ...PointerDeviceKind.values,
        // PointerDeviceKind.touch,
        // PointerDeviceKind.mouse,
      };
}
