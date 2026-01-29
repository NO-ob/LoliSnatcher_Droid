import 'package:flutter/widgets.dart';

import 'package:lolisnatcher/src/data/settings/app_alias.dart';
import 'package:lolisnatcher/src/data/settings/app_mode.dart';
import 'package:lolisnatcher/src/data/settings/button_position.dart';
import 'package:lolisnatcher/src/data/settings/hand_side.dart';
import 'package:lolisnatcher/src/data/settings/image_quality.dart';
import 'package:lolisnatcher/src/data/settings/mpv_hardware_decoding.dart';
import 'package:lolisnatcher/src/data/settings/mpv_video_output.dart';
import 'package:lolisnatcher/src/data/settings/preview_display_mode.dart';
import 'package:lolisnatcher/src/data/settings/preview_quality.dart';
import 'package:lolisnatcher/src/data/settings/proxy_type.dart';
import 'package:lolisnatcher/src/data/settings/scroll_direction.dart';
import 'package:lolisnatcher/src/data/settings/share_action.dart';
import 'package:lolisnatcher/src/data/settings/vertical_position.dart';
import 'package:lolisnatcher/src/data/settings/video_backend_mode.dart';
import 'package:lolisnatcher/src/data/settings/video_cache_mode.dart';

/// Mixin for settings enums that provides unified serialization behavior.
///
/// Enums implementing this mixin must provide:
/// - [toJson] - Returns the string value for JSON serialization (backwards compatible)
/// - [locName] - Returns the localized display name
///
/// Static members that must be defined on the enum:
/// - `defaultValue` - The default enum value
/// - `fromString(String)` - Factory to create enum from string
mixin SettingsEnum<T extends Enum> {
  /// Returns the string value for JSON serialization.
  /// Should maintain backwards compatibility with old string values.
  String toJson();

  /// Returns the localized display name for this enum value.
  String locName(BuildContext context);
}

/// Registry for settings enum types.
/// Maps type names (used in settings map) to their fromString functions.
///
/// This allows validateValue to handle all SettingsEnum types generically
/// without needing individual switch cases for each enum.
class SettingsEnumRegistry {
  static final Map<String, dynamic Function(String)> _fromStringMap = {};

  /// Register an enum type with its fromString function.
  /// Call this for each enum type at app startup.
  static void register<T extends Enum>({
    required String typeName,
    required T Function(String) fromString,
  }) {
    _fromStringMap[typeName] = fromString;
  }

  /// Check if a type name is registered in the registry.
  static bool isRegistered(String typeName) => _fromStringMap.containsKey(typeName);

  /// Get the fromString function for a registered type.
  static dynamic Function(String)? getFromString(String typeName) => _fromStringMap[typeName];

  /// Validate and convert a value for a registered enum type.
  ///
  /// When [toJSON] is true, converts the enum to its JSON string representation.
  /// When [toJSON] is false, converts a string to the enum value.
  static dynamic validate(
    String typeName,
    dynamic value,
    dynamic defaultValue, {
    required bool toJSON,
  }) {
    if (toJSON) {
      if (value is SettingsEnum) {
        return value.toJson();
      }
      return value.toString();
    } else {
      if (value is String) {
        final fromString = _fromStringMap[typeName];
        if (fromString != null) {
          return fromString(value);
        }
      }
      return defaultValue;
    }
  }
}

/// Initialize the settings enum registry with all enum types.
/// Call this once at app startup before loading settings.
void initSettingsEnumRegistry() {
  SettingsEnumRegistry.register<AppMode>(
    typeName: 'appMode',
    fromString: AppMode.fromString,
  );
  SettingsEnumRegistry.register<HandSide>(
    typeName: 'handSide',
    fromString: HandSide.fromString,
  );
  SettingsEnumRegistry.register<VideoBackendMode>(
    typeName: 'videoBackendMode',
    fromString: VideoBackendMode.fromString,
  );
  SettingsEnumRegistry.register<PreviewQuality>(
    typeName: 'previewQuality',
    fromString: PreviewQuality.fromString,
  );
  SettingsEnumRegistry.register<PreviewDisplayMode>(
    typeName: 'previewDisplayMode',
    fromString: PreviewDisplayMode.fromString,
  );
  SettingsEnumRegistry.register<ImageQuality>(
    typeName: 'imageQuality',
    fromString: ImageQuality.fromString,
  );
  SettingsEnumRegistry.register<ScrollDirection>(
    typeName: 'scrollDirection',
    fromString: ScrollDirection.fromString,
  );
  SettingsEnumRegistry.register<VerticalPosition>(
    typeName: 'verticalPosition',
    fromString: VerticalPosition.fromString,
  );
  SettingsEnumRegistry.register<ButtonPosition>(
    typeName: 'buttonPosition',
    fromString: ButtonPosition.fromString,
  );
  SettingsEnumRegistry.register<ShareAction>(
    typeName: 'shareAction',
    fromString: ShareAction.fromString,
  );
  SettingsEnumRegistry.register<VideoCacheMode>(
    typeName: 'videoCacheMode',
    fromString: VideoCacheMode.fromString,
  );
  SettingsEnumRegistry.register<MpvVideoOutput>(
    typeName: 'mpvVideoOutput',
    fromString: MpvVideoOutput.fromString,
  );
  SettingsEnumRegistry.register<MpvHardwareDecoding>(
    typeName: 'mpvHardwareDecoding',
    fromString: MpvHardwareDecoding.fromString,
  );
  SettingsEnumRegistry.register<ProxyType>(
    typeName: 'proxyType',
    fromString: ProxyType.fromString,
  );
  SettingsEnumRegistry.register<AppAlias>(
    typeName: 'appAlias',
    fromString: AppAlias.fromString,
  );
}

/// Helper to create a map entry for an enum setting.
/// Use in the settings map to reduce boilerplate.
Map<String, dynamic> enumSettingEntry<T extends Enum>(T defaultValue, String typeName) => {
  'type': typeName,
  'default': defaultValue,
};
