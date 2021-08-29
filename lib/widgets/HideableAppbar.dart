import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:flutter/services.dart';

class HideableAppBar extends StatefulWidget implements PreferredSizeWidget {
  Widget title;
  List<Widget> actions;
  bool autoHide;
  HideableAppBar(this.title, this.actions, this.autoHide);

  final double defaultHeight = kToolbarHeight; //56.0
  @override
  Size get preferredSize => Size.fromHeight(defaultHeight);
  @override
  _HideableAppBarState createState() => _HideableAppBarState();
}

class _HideableAppBarState extends State<HideableAppBar> {
  final SearchHandler searchHandler = Get.find<SearchHandler>();
  late StreamSubscription<bool> appbarListener;

  @override
  void initState() {
    super.initState();
    searchHandler.displayAppbar.value = !widget.autoHide;
    appbarListener = searchHandler.displayAppbar.listen((bool value) {
      setState(() {});
    });

    // Hide system ui on first render
    SystemChrome.setEnabledSystemUIOverlays([]);
    // ServiceHandler.makeImmersive();
  }

  @override
  void dispose() {
    appbarListener.cancel();

    // Return system ui after closing gallery
    // ServiceHandler.makeNormal();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Hide status bar and bottom navbar
    // Bug: triggers restate => forces video restart, animation lags
    // !widget.searchGlobals.displayAppbar.value ? SystemChrome.setEnabledSystemUIOverlays([]) : SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return SafeArea( // to fix height bug when bar on top
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
        color: Colors.transparent,
        height: searchHandler.displayAppbar.value ? widget.defaultHeight : 0.0,
        child: AppBar(
          // toolbarHeight: widget.defaultHeight,
          elevation: 1, // set to zero to disable a shadow behind
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          leading: IconButton(
            // to ignore icon change
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: FittedBox(
            fit: BoxFit.fitWidth,
            child: widget.title,
          ),
          actions: widget.actions,
        ),
      )
    );
  }
}
