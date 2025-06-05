import 'package:flutter/cupertino.dart';

import 'package:get_it/get_it.dart';

import 'package:lolisnatcher/src/widgets/preview/waterfall_bottom_bar.dart';
import 'package:lolisnatcher/src/widgets/root/custom_sliver_persistent_header.dart';

class NavigationHandler {
  static NavigationHandler get instance => GetIt.instance<NavigationHandler>();

  static NavigationHandler register() {
    if (!GetIt.instance.isRegistered<NavigationHandler>()) {
      GetIt.instance.registerSingleton(NavigationHandler());
    }
    return instance;
  }

  static void unregister() => GetIt.instance.unregister<NavigationHandler>();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get navContext => navigatorKey.currentContext!;

  final GlobalKey<CustomFloatingHeaderState> floatingHeaderKey = GlobalKey<CustomFloatingHeaderState>();
  final GlobalKey<WaterfallBottomBarState> bottomBarKey = GlobalKey<WaterfallBottomBarState>();
}
