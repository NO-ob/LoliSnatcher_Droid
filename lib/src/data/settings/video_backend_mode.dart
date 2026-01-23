import 'package:flutter/widgets.dart';

import 'package:lolisnatcher/gen/strings.g.dart';
import 'package:lolisnatcher/src/data/settings/settings_enum.dart';

enum VideoBackendMode with SettingsEnum<VideoBackendMode> {
  normal,
  mpv, // mediakit
  mdk; // fvp

  @override
  String toJson() {
    return name;
  }

  static VideoBackendMode fromString(String name) {
    switch (name) {
      case 'Normal':
      case 'normal':
        return VideoBackendMode.normal;
      case 'mpv':
        return VideoBackendMode.mpv;
      case 'mdk':
        return VideoBackendMode.mdk;
      default:
        return defaultValue;
    }
  }

  static VideoBackendMode get defaultValue {
    return VideoBackendMode.normal;
  }

  bool get isDefault => this == defaultValue;
  bool get isNormal => this == VideoBackendMode.normal;
  bool get isMpv => this == VideoBackendMode.mpv;
  bool get isMdk => this == VideoBackendMode.mdk;

  @override
  String locName(BuildContext context) {
    switch (this) {
      case VideoBackendMode.normal:
        return context.loc.settings.video.videoBackendModeValues.normal;
      case VideoBackendMode.mpv:
        return context.loc.settings.video.videoBackendModeValues.mpv;
      case VideoBackendMode.mdk:
        return context.loc.settings.video.videoBackendModeValues.mdk;
    }
  }
}
