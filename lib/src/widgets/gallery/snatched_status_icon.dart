import 'dart:io';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/services/image_writer.dart';

class SnatchedStatusIcon extends StatefulWidget {
  const SnatchedStatusIcon({required this.item, required this.booru, super.key});

  final BooruItem item;
  final Booru booru;

  @override
  State<SnatchedStatusIcon> createState() => _SnatchedStatusIconState();
}

class _SnatchedStatusIconState extends State<SnatchedStatusIcon> {
  bool fileExists = false;

  @override
  void initState() {
    super.initState();
    fileExistsCheck();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fileExistsCheck() async {
    final String extPath = SettingsHandler.instance.extPathOverride;
    if (extPath.isNotEmpty) {
      fileExists = await ServiceHandler.existsFileFromSAFDirectory(extPath, ImageWriter().getFilename(widget.item, widget.booru));
    } else {
      fileExists = await File(await ImageWriter().getFilePath(widget.item, widget.booru)).exists();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(covariant SnatchedStatusIcon oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.item != widget.item) {
      fileExists = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {});
      });
      fileExistsCheck();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.save_alt,
      size: Theme.of(context).buttonTheme.height / 2.1,
      color: fileExists ? Colors.green : Colors.white,
    );
  }
}
