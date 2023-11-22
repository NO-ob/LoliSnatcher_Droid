import 'dart:io';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';

class MascotImage extends StatelessWidget {
  const MascotImage({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Image(
        fit: BoxFit.contain,
        image: settingsHandler.drawerMascotPathOverride.isEmpty
            ? const AssetImage('assets/images/drawer_icon.png')
            : FileImage(File(settingsHandler.drawerMascotPathOverride)) as ImageProvider,
      ),
    );
  }
}
