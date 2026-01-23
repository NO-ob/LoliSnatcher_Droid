import 'package:flutter/widgets.dart';

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

/// Helper class for settings enum serialization.
/// Used in settings_handler.dart to serialize/deserialize enum values.
class SettingsEnumHelper {
  /// Generic method to convert a settings enum to its JSON string representation.
  static String enumToJson<T extends Enum>(T value) {
    if (value is SettingsEnum) {
      return (value as SettingsEnum).toJson();
    }
    return value.toString();
  }

  /// Generic method to validate and convert a value to an enum.
  /// Returns the converted enum value or the default if conversion fails.
  static T validateEnum<T extends Enum>(
    dynamic value,
    T defaultValue,
    T Function(String) fromString,
  ) {
    if (value is T) {
      return value;
    }
    if (value is String) {
      return fromString(value);
    }
    return defaultValue;
  }
}
