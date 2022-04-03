import 'dart:async';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ViewerHandler.dart';

class HideableAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;
  HideableAppBar(this.title, this.actions);

  final double defaultHeight = kToolbarHeight; //56.0

  @override
  Size get preferredSize => Size.fromHeight(defaultHeight);
  @override
  _HideableAppBarState createState() => _HideableAppBarState();
}

class _HideableAppBarState extends State<HideableAppBar> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final ViewerHandler viewerHandler = Get.find<ViewerHandler>();

  late StreamSubscription<bool> appbarListener;

  @override
  void initState() {
    super.initState();

    ServiceHandler.setSystemUiVisibility(!settingsHandler.autoHideImageBar);
    viewerHandler.displayAppbar.value = !settingsHandler.autoHideImageBar;

    appbarListener = viewerHandler.displayAppbar.listen((bool value) {
      ServiceHandler.setSystemUiVisibility(value);
      setState(() {});
    });
  }

  @override
  void dispose() {
    appbarListener.cancel();
    ServiceHandler.setSystemUiVisibility(true);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // to fix height bug when bar on top
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
        color: Colors.transparent,
        height: viewerHandler.displayAppbar.value ? widget.defaultHeight : 0.0,
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
      ),
    );
  }
}
