import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/gen/strings.g.dart';
import 'package:lolisnatcher/src/data/settings/settings_enum.dart';
import 'package:lolisnatcher/src/data/theme_item.dart';

/// Base class for setting definitions.
/// Provides type-safe access to setting values with validation.
abstract class SettingDefinition<T> {
  const SettingDefinition({
    required this.key,
    required this.type,
    required this.defaultValue,
    this.options,
  });

  final String key;
  final String type;
  final T defaultValue;
  final List<T>? options;

  /// Get the current value from the settings holder
  T getValue(dynamic holder);

  /// Set the value on the settings holder
  void setValue(dynamic holder, T value);

  /// Validate and convert a value from JSON
  T fromJson(dynamic value);

  /// Convert a value to JSON
  dynamic toJson(T value);

  /// Create a map entry for the settings map
  Map<String, dynamic> toMapEntry() => {
        'type': type,
        'default': defaultValue,
        if (options != null) 'options': options,
      };
}

/// Setting definition for string values
class StringSetting extends SettingDefinition<String> {
  const StringSetting({
    required super.key,
    required super.defaultValue,
  }) : super(type: 'string');

  @override
  String getValue(dynamic holder) => throw UnimplementedError();

  @override
  void setValue(dynamic holder, String value) => throw UnimplementedError();

  @override
  String fromJson(dynamic value) {
    if (value is String) return value;
    return defaultValue;
  }

  @override
  String toJson(String value) => value;
}

/// Setting definition for int values with range validation
class IntSetting extends SettingDefinition<int> {
  const IntSetting({
    required super.key,
    required super.defaultValue,
    required this.lowerLimit,
    required this.upperLimit,
    this.step = 1,
  }) : super(type: 'int');

  final num lowerLimit;
  final num upperLimit;
  final int step;

  @override
  int getValue(dynamic holder) => throw UnimplementedError();

  @override
  void setValue(dynamic holder, int value) => throw UnimplementedError();

  @override
  int fromJson(dynamic value) {
    final int? parsed = value is String ? int.tryParse(value) : (value is int ? value : null);
    if (parsed == null) return defaultValue;
    if (parsed < lowerLimit || parsed > upperLimit) return defaultValue;
    return parsed;
  }

  @override
  int toJson(int value) => value;

  @override
  Map<String, dynamic> toMapEntry() => {
        ...super.toMapEntry(),
        'step': step,
        'lowerLimit': lowerLimit,
        'upperLimit': upperLimit,
      };
}

/// Setting definition for double values with range validation
class DoubleSetting extends SettingDefinition<double> {
  const DoubleSetting({
    required super.key,
    required super.defaultValue,
    required this.lowerLimit,
    required this.upperLimit,
    this.step = 0.1,
  }) : super(type: 'double');

  final double lowerLimit;
  final double upperLimit;
  final double step;

  @override
  double getValue(dynamic holder) => throw UnimplementedError();

  @override
  void setValue(dynamic holder, double value) => throw UnimplementedError();

  @override
  double fromJson(dynamic value) {
    final double? parsed = value is String
        ? double.tryParse(value)
        : (value is double
            ? value
            : value is int
                ? value.toDouble()
                : null);
    if (parsed == null) return defaultValue;
    if (parsed < lowerLimit || parsed > upperLimit) return defaultValue;
    return parsed;
  }

  @override
  double toJson(double value) => value;

  @override
  Map<String, dynamic> toMapEntry() => {
        ...super.toMapEntry(),
        'step': step,
        'lowerLimit': lowerLimit,
        'upperLimit': upperLimit,
      };
}

/// Setting definition for bool values
class BoolSetting extends SettingDefinition<bool> {
  const BoolSetting({
    required super.key,
    required super.defaultValue,
  }) : super(type: 'bool');

  @override
  bool getValue(dynamic holder) => throw UnimplementedError();

  @override
  void setValue(dynamic holder, bool value) => throw UnimplementedError();

  @override
  bool fromJson(dynamic value) {
    if (value is bool) return value;
    if (value is String) {
      if (value == 'true') return true;
      if (value == 'false') return false;
    }
    return defaultValue;
  }

  @override
  bool toJson(bool value) => value;
}

/// Setting definition for enum values that implement SettingsEnum
class EnumSetting<T extends Enum> extends SettingDefinition<T> {
  EnumSetting({
    required super.key,
    required String typeName,
    required super.defaultValue,
    required this.fromString,
    super.options,
  }) : super(type: typeName);

  final T Function(String) fromString;

  @override
  T getValue(dynamic holder) => throw UnimplementedError();

  @override
  void setValue(dynamic holder, T value) => throw UnimplementedError();

  @override
  T fromJson(dynamic value) {
    if (value is String) {
      return fromString(value);
    }
    return defaultValue;
  }

  @override
  dynamic toJson(T value) {
    if (value is SettingsEnum) {
      return (value as SettingsEnum).toJson();
    }
    return value.toString();
  }
}

/// Setting definition for Color values
class ColorSetting extends SettingDefinition<Color?> {
  const ColorSetting({
    required super.key,
    required super.defaultValue,
  }) : super(type: 'color');

  @override
  Color? getValue(dynamic holder) => throw UnimplementedError();

  @override
  void setValue(dynamic holder, Color? value) => throw UnimplementedError();

  @override
  Color? fromJson(dynamic value) {
    if (value is int) return Color(value);
    return defaultValue;
  }

  @override
  int? toJson(Color? value) {
    // ignore: deprecated_member_use
    return value?.value ?? Colors.pink.value;
  }
}

/// Setting definition for Duration values (stored as seconds)
class DurationSetting extends SettingDefinition<Duration> {
  const DurationSetting({
    required super.key,
    required super.defaultValue,
    super.options,
  }) : super(type: 'duration');

  @override
  Duration getValue(dynamic holder) => throw UnimplementedError();

  @override
  void setValue(dynamic holder, Duration value) => throw UnimplementedError();

  @override
  Duration fromJson(dynamic value) {
    if (value is Duration) return value;
    if (value is int) return Duration(seconds: value);
    return defaultValue;
  }

  @override
  int toJson(Duration value) => value.inSeconds;
}

/// Setting definition for ThemeItem values
class ThemeSetting extends SettingDefinition<ThemeItem> {
  const ThemeSetting({
    required super.key,
    required super.defaultValue,
    required super.options,
  }) : super(type: 'theme');

  @override
  ThemeItem getValue(dynamic holder) => throw UnimplementedError();

  @override
  void setValue(dynamic holder, ThemeItem value) => throw UnimplementedError();

  @override
  ThemeItem fromJson(dynamic value) {
    if (value is String && options != null) {
      return options!.firstWhere(
        (el) => el.name == value,
        orElse: () => defaultValue,
      );
    }
    return defaultValue;
  }

  @override
  String toJson(ThemeItem value) => value.name;
}

/// Setting definition for ThemeMode values
class ThemeModeSetting extends SettingDefinition<ThemeMode> {
  const ThemeModeSetting({
    required super.key,
    required super.defaultValue,
  }) : super(type: 'themeMode', options: ThemeMode.values);

  @override
  ThemeMode getValue(dynamic holder) => throw UnimplementedError();

  @override
  void setValue(dynamic holder, ThemeMode value) => throw UnimplementedError();

  @override
  ThemeMode fromJson(dynamic value) {
    if (value is String) {
      final match = ThemeMode.values.where((e) => e.name == value);
      if (match.isNotEmpty) return match.first;
    }
    return defaultValue;
  }

  @override
  String toJson(ThemeMode value) => value.name;
}

/// Setting definition for AppLocale values
class LocaleSetting extends SettingDefinition<AppLocale?> {
  const LocaleSetting({
    required super.key,
    super.defaultValue,
  }) : super(type: 'locale', options: AppLocale.values);

  @override
  AppLocale? getValue(dynamic holder) => throw UnimplementedError();

  @override
  void setValue(dynamic holder, AppLocale? value) => throw UnimplementedError();

  @override
  AppLocale? fromJson(dynamic value) {
    if (value is String) {
      return AppLocale.values.firstWhereOrNull((e) => e.name == value);
    }
    return defaultValue;
  }

  @override
  String? toJson(AppLocale? value) => value?.name;
}

/// Setting definition for string list values
class StringListSetting extends SettingDefinition<List<String>> {
  const StringListSetting({
    required super.key,
    required super.defaultValue,
    super.options,
  }) : super(type: 'stringList');

  @override
  List<String> getValue(dynamic holder) => throw UnimplementedError();

  @override
  void setValue(dynamic holder, List<String> value) => throw UnimplementedError();

  @override
  List<String> fromJson(dynamic value) {
    if (value is List) return List<String>.from(value);
    if (value is String) return value.split(',');
    return defaultValue;
  }

  @override
  List<String> toJson(List<String> value) => value;
}
