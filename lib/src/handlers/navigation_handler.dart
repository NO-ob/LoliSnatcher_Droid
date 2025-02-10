import 'package:flutter/cupertino.dart';

import 'package:get_it/get_it.dart';

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
}
