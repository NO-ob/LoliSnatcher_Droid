import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/ViewerHandler.dart';


// used to move up the video controls when using the bottom app bar

class HideableControlsPadding extends StatefulWidget {
  final Widget controls;
  HideableControlsPadding(this.controls);

  final double defaultHeight = kToolbarHeight; //56.0

  @override
  _HideableControlsPaddingState createState() => _HideableControlsPaddingState();
}

class _HideableControlsPaddingState extends State<HideableControlsPadding> {
  ViewerHandler viewerHandler = Get.find<ViewerHandler>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnabled = viewerHandler.displayAppbar.value && !viewerHandler.isFullscreen.value;
      if(isEnabled) {
        return AnimatedPadding(
          duration: Duration(milliseconds: 200),
          curve: Curves.linear,
          padding: EdgeInsets.only(bottom: isEnabled ? 0 : 0), //widget.defaultHeight : 0.0),
          child: widget.controls,
        );
      } else {
        return widget.controls;
      }
    });
  }
}
