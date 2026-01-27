import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/widgets/drawers/downloads/dd_content.dart';
import 'package:lolisnatcher/src/widgets/drawers/downloads/dd_control_panel.dart';
import 'package:lolisnatcher/src/widgets/drawers/downloads/dd_controller.dart';

class DownloadsDrawer extends StatefulWidget {
  const DownloadsDrawer({
    required this.toggleDrawer,
    super.key,
  });

  final VoidCallback toggleDrawer;

  @override
  State<DownloadsDrawer> createState() => _DownloadsDrawerState();
}

class _DownloadsDrawerState extends State<DownloadsDrawer> {
  late final DownloadsDrawerController controller;

  @override
  void initState() {
    super.initState();
    controller = DownloadsDrawerController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(child: DDContent(controller: controller)),
            DDControlPanel(
              controller: controller,
              toggleDrawer: widget.toggleDrawer,
            ),
          ],
        ),
      ),
    );
  }
}
