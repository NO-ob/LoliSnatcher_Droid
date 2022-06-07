import 'dart:io';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';

class MascotImage extends StatelessWidget {
  const MascotImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Image(
          fit: BoxFit.contain,
          image: settingsHandler.drawerMascotPathOverride.isEmpty
              ? const AssetImage('assets/images/drawer_icon.png')
              : FileImage(File(settingsHandler.drawerMascotPathOverride)) as ImageProvider,
        ),
      ),
    );
  }
}
