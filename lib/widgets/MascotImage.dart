import 'dart:io';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MascotImage extends StatelessWidget {
  const MascotImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsHandler settingsHandler = Get.find<SettingsHandler>();

    return Container(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.primary,
          ),
          child: Image(
            fit: BoxFit.contain,
            image: settingsHandler.drawerMascotPathOverride.isEmpty
                ? AssetImage('assets/images/drawer_icon.png')
                : FileImage(File(settingsHandler.drawerMascotPathOverride)) as ImageProvider,
          ),
        ),
      ),
    );
  }
}