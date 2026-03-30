// ignore_for_file: constant_identifier_names

import 'package:lolisnatcher/src/data/settings/settings_enum.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';

enum AppMode with SettingsEnum<AppMode> {
  Desktop,
  Mobile,
  ;

  @override
  String toJson() {
    switch (this) {
      case AppMode.Desktop:
        return 'Desktop';
      case AppMode.Mobile:
        return 'Mobile';
    }
  }

  static AppMode fromString(String name) {
    switch (name) {
      case 'Desktop':
        return AppMode.Desktop;
      case 'Mobile':
        return AppMode.Mobile;
    }
    return defaultValue;
  }

  bool get isDesktop {
    return this == AppMode.Desktop;
  }

  bool get isMobile {
    return this == AppMode.Mobile;
  }

  static AppMode get defaultValue {
    return SettingsHandler.isDesktopPlatform ? AppMode.Desktop : AppMode.Mobile;
  }

  @override
  String get locName {
    switch (this) {
      case AppMode.Desktop:
        return loc.settings.interface.appModeValues.desktop;
      case AppMode.Mobile:
        return loc.settings.interface.appModeValues.mobile;
    }
  }
}
