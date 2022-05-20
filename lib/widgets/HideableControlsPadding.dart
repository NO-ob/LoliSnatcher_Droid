import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/ViewerHandler.dart';


// used to move up the video controls when using the bottom app bar

class HideableControlsPadding extends StatefulWidget {
  const HideableControlsPadding(this.controls, {Key? key}) : super(key: key);
  final Widget controls;

  final double defaultHeight = kToolbarHeight; //56.0

  @override
  State<HideableControlsPadding> createState() => _HideableControlsPaddingState();
}

class _HideableControlsPaddingState extends State<HideableControlsPadding> {
  final ViewerHandler viewerHandler = ViewerHandler.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnabled = viewerHandler.displayAppbar.value && !viewerHandler.isFullscreen.value;
      if(isEnabled) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 200),
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
