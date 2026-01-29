import 'package:flutter/widgets.dart';

import 'package:lolisnatcher/src/data/settings/settings_enum.dart';

/// Enum representing available app display name aliases for the Android launcher.
/// These correspond to activity-alias entries in AndroidManifest.xml.
enum AppAlias with SettingsEnum<AppAlias> {
  loliSnatcher,
  loliSnatcherSpaced,
  losn,
  ls,
  booruSnatcher,
  booruSnatcherSpaced,
  booru,
  ;

  @override
  String toJson() {
    switch (this) {
      case AppAlias.loliSnatcher:
        return 'loli_snatcher';
      case AppAlias.loliSnatcherSpaced:
        return 'loli_snatcher_spaced';
      case AppAlias.losn:
        return 'losn';
      case AppAlias.ls:
        return 'ls';
      case AppAlias.booruSnatcher:
        return 'booru_snatcher';
      case AppAlias.booruSnatcherSpaced:
        return 'booru_snatcher_spaced';
      case AppAlias.booru:
        return 'booru';
    }
  }

  static AppAlias fromString(String name) {
    switch (name) {
      case 'loli_snatcher':
      case 'loliSnatcher':
        return AppAlias.loliSnatcher;
      case 'loli_snatcher_spaced':
      case 'loliSnatcherSpaced':
        return AppAlias.loliSnatcherSpaced;
      case 'losn':
        return AppAlias.losn;
      case 'ls':
        return AppAlias.ls;
      case 'booru_snatcher':
      case 'booruSnatcher':
        return AppAlias.booruSnatcher;
      case 'booru_snatcher_spaced':
      case 'booruSnatcherSpaced':
        return AppAlias.booruSnatcherSpaced;
      case 'booru':
        return AppAlias.booru;
    }
    return defaultValue;
  }

  static AppAlias get defaultValue {
    return AppAlias.loliSnatcher;
  }

  /// The display name shown in the launcher
  String get displayName {
    switch (this) {
      case AppAlias.loliSnatcher:
        return 'LoliSnatcher';
      case AppAlias.loliSnatcherSpaced:
        return 'Loli Snatcher';
      case AppAlias.losn:
        return 'LoSn';
      case AppAlias.ls:
        return 'LS';
      case AppAlias.booruSnatcher:
        return 'BooruSnatcher';
      case AppAlias.booruSnatcherSpaced:
        return 'Booru Snatcher';
      case AppAlias.booru:
        return 'Booru';
    }
  }

  @override
  String locName(BuildContext context) {
    // App names are not localized - they are displayed as-is
    return displayName;
  }
}
