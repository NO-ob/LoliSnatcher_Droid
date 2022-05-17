import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';

class MascotImage extends StatelessWidget {
  const MascotImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();

    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.primary,
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
