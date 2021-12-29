import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SnatchHandler.dart';

class ActiveTitle extends StatelessWidget {
  final SnatchHandler snatchHandler = Get.find<SnatchHandler>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(snatchHandler.snatchActive.value) {
        return Text("Snatching: ${snatchHandler.snatchStatus}");
      } else {
        return Text("LoliSnatcher");
      }
    });
  }
}