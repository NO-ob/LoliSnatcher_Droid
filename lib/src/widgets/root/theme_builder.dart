import 'package:LoliSnatcher/src/handlers/theme_handler.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:LoliSnatcher/src/handlers/settings_handler.dart';
import 'package:LoliSnatcher/src/data/theme_item.dart';

class ThemeBuilder extends StatelessWidget {
  const ThemeBuilder({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    return Obx(() {
      ThemeItem theme = settingsHandler.theme.value.name == 'Custom'
          ? ThemeItem(
              name: 'Custom',
              primary: settingsHandler.customPrimaryColor.value,
              accent: settingsHandler.customAccentColor.value,
            )
          : settingsHandler.theme.value;
      ThemeMode themeMode = settingsHandler.themeMode.value;
      bool isAmoled = settingsHandler.isAmoled.value;

      final ThemeHandler themeHandler = ThemeHandler(
        theme: theme,
        themeMode: themeMode,
        isAmoled: isAmoled,
      );

      return Theme(
        data: themeHandler.isDark ? themeHandler.darkTheme() : themeHandler.lightTheme(),
        child: child,
      );
    });
  }
}
