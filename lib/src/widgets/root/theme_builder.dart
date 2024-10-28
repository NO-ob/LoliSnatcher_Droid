import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/theme_item.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/theme_handler.dart';

class ThemeBuilder extends StatelessWidget {
  const ThemeBuilder({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    return Obx(() {
      final ThemeItem theme = settingsHandler.theme.value.name == 'Custom'
          ? ThemeItem(
              name: 'Custom',
              primary: settingsHandler.customPrimaryColor.value,
              accent: settingsHandler.customAccentColor.value,
            )
          : settingsHandler.theme.value;

      final ThemeHandler themeHandler = ThemeHandler(
        theme: theme,
        themeMode: settingsHandler.themeMode.value,
        isAmoled: settingsHandler.isAmoled.value,
      );

      return Theme(
        data: themeHandler.isDark ? themeHandler.darkTheme() : themeHandler.lightTheme(),
        child: child,
      );
    });
  }
}
