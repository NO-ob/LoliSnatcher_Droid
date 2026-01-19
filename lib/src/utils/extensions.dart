import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';

extension BuildContextExtras on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get mediaSize => MediaQuery.sizeOf(this);
  double get width => mediaSize.width;
  double get height => mediaSize.height;
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  EdgeInsets get padding => MediaQuery.paddingOf(this);
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);
  Orientation get orientation => MediaQuery.orientationOf(this);
  bool get isLandscape => orientation.isLandscape;
  bool get isPortrait => orientation.isPortrait;

  NavigatorState get navigator => Navigator.of(this);

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  bool get isDark => theme.brightness == Brightness.dark;
  bool get isLight => theme.brightness == Brightness.light;
}

extension OrientationExtras on Orientation {
  bool get isLandscape => this == Orientation.landscape;
  bool get isPortrait => this == Orientation.portrait;
}

extension UIExtras on Widget {
  Widget withBorder({
    Color? color,
    double? strokeWidth,
    BorderRadius? borderRadius,
  }) => Container(
    decoration: BoxDecoration(
      border: Border.all(color: color ?? Colors.black, width: strokeWidth ?? 1),
      borderRadius: borderRadius,
    ),
    child: this,
  );

  Widget padded(double padding) => Padding(padding: EdgeInsets.all(padding), child: this);

  Widget flex({int weight = 1}) => Expanded(flex: weight, child: this);

  Widget centered() => Center(child: this);

  Widget withOpacity(double opacity) => Opacity(opacity: opacity, child: this);

  Widget withColor(Color color) => ColoredBox(color: color, child: this);
}

extension StringExtras on String {
  String _capitalize() => isEmpty ? '' : '${this[0].toUpperCase()}${substring(1)}';

  String get capitalizeFirst => _capitalize();

  String toTitleCase() => split(' ').map((s) => s._capitalize()).join(' ');

  String toCamelCase() => split(' ').map((s) => s._capitalize()).join('');

  String toSnakeCase() => toLowerCase().replaceAll(' ', '_');

  String toKebabCase() => toLowerCase().replaceAll(' ', '-');

  String toPascalCase() => toTitleCase().replaceAll(' ', '');

  bool toBool() => this == 'true' || this == '1';
}

extension IntExtras on int {
  bool isEven() => this.isEven;

  bool isOdd() => this.isOdd;

  int clamp(int min, int max) => (min > this ? min : (max < this ? max : this));

  bool toBool() => this == 1;

  String toFormattedString() => formatNumber(this);
}

extension DoubleExtras on double {
  double clamp(double min, double max) => (min > this ? min : (max < this ? max : this));

  String toFormattedString() => formatNumber(this);

  double toPrecision(int fractionDigits) {
    final mod = pow(10, fractionDigits.toDouble()).toDouble();
    return (this * mod).round().toDouble() / mod;
  }

  String truncateTrailingZeroes(int? fractionDigits) =>
      toStringAsFixed(fractionDigits ?? toString().split('.')[1].length).replaceAllMapped(
        RegExp(r'(\.\d*?[1-9]|)\.?0+$'),
        (match) => '${match[1] == '.' ? '' : match[1]}',
      );
}

extension BoolExtras on bool {
  void toggle() => this ? false : true;
}

String formatNumber(num number) {
  final formatter = NumberFormat.decimalPattern(
    SettingsHandler.instance.locale.value?.languageCode ?? PlatformDispatcher.instance.locale.languageCode,
  );
  return formatter.format(number);
}

extension ListExts<T> on List<T> {
  T? firstWhereOrNull(bool Function(T e) test) {
    for (final e in this) {
      if (test(e)) return e;
    }
    return null;
  }

  T? lastWhereOrNull(bool Function(T e) test) {
    for (final e in reversed) {
      if (test(e)) return e;
    }
    return null;
  }
}

extension IterableExts<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T e) test) {
    for (final e in this) {
      if (test(e)) return e;
    }
    return null;
  }
}
