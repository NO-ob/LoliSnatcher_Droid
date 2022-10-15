import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

class NavigationHandler extends GetxController {
  static NavigationHandler get instance => Get.find<NavigationHandler>();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}