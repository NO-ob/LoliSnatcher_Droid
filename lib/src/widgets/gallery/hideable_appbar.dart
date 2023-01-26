import 'dart:async';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';

class HideableAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HideableAppBar(this.title, this.actions, {Key? key}) : super(key: key);
  final Widget title;
  final List<Widget> actions;

  final double defaultHeight = kToolbarHeight; //56.0

  @override
  Size get preferredSize => Size.fromHeight(defaultHeight);

  @override
  State<HideableAppBar> createState() => _HideableAppBarState();
}

class _HideableAppBarState extends State<HideableAppBar> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;

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
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
        color: Colors.transparent,
        height: viewerHandler.displayAppbar.value ? widget.defaultHeight : 0.0,
        child: AppBar(
          // toolbarHeight: widget.defaultHeight,
          elevation: 1, // set to zero to disable a shadow behind
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.black54,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            // to ignore icon change
            icon: const Icon(Icons.arrow_back, color: Colors.white),
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
