import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../SnatchHandler.dart';

class ActiveTitle extends StatefulWidget {
  ActiveTitle();

  @override
  _ActiveTitleState createState() => _ActiveTitleState();
  
}

class _ActiveTitleState extends State<ActiveTitle> {
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