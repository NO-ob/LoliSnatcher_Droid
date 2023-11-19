import 'package:flutter/material.dart';

extension UIExtras on Widget {
  Widget withBorder({
    Color? color,
    double? strokeWidth,
    BorderRadius? borderRadius,
  }) =>
      Container(
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
  String pluralize(int count) {
    return count == 1 ? this : '${this}s';
  }

  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';

  String toTitleCase() => split(' ').map((s) => s.capitalize()).join(' ');

  String toCamelCase() => split(' ').map((s) => s.capitalize()).join('');

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

  String toStringAsFixed(int digits) => toStringAsFixed(digits);

  String toFormattedString() => formatNumber(this);
}

String formatNumber(num number) {
  final String formattedPart = number.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]} ',
      );
  return formattedPart.trim();
}
