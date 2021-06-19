import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';

// used to move up the video controls when using the bottom app bar

class HideableControlsPadding extends StatefulWidget {
  SearchGlobals searchGlobals;
  ValueNotifier<bool> isFullscreen;
  Widget controls;
  HideableControlsPadding(this.searchGlobals, this.isFullscreen, this.controls);

  final double defaultHeight = kToolbarHeight; //56.0

  @override
  _HideableControlsPaddingState createState() => _HideableControlsPaddingState();
}

class _HideableControlsPaddingState extends State<HideableControlsPadding> {
  bool isEnabled = false;

  @override
  void initState() {
    super.initState();
    isEnabled = widget.searchGlobals.displayAppbar.value && !widget.isFullscreen.value;
    widget.searchGlobals.displayAppbar.addListener(setSt);
    widget.isFullscreen.addListener(setStOnFullScreen);
  }

  void setSt() {
    isEnabled = widget.searchGlobals.displayAppbar.value;
    setState(() {});
  }

  void setStOnFullScreen() {
    if(widget.isFullscreen.value) {
      isEnabled = false;
    } else {
      isEnabled = widget.searchGlobals.displayAppbar.value;
    }
    setState(() {});
  }

  @override
  void dispose() {
    widget.searchGlobals.displayAppbar.removeListener(setSt);
    widget.isFullscreen.removeListener(setStOnFullScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
      padding: EdgeInsets.only(bottom: isEnabled ? widget.defaultHeight : 0.0),
      child: widget.controls,
    );
  }
}
