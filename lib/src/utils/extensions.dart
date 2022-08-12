import 'package:flutter/material.dart';

extension UIExtras on Widget {
  Widget withBorder({Color? color, double? strokeWidth, BorderRadius? borderRadius}) => Container(
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

  Widget withColor(Color color) => Container(color: color, child: this);
}

extension StringExtras on String {
  String pluralize(int count) {
    return count == 1 ? this : '${this}s';
  }

  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";

  String toTitleCase() => split(' ').map((s) => s.capitalize()).join(' ');

  String toCamelCase() => split(' ').map((s) => s.capitalize()).join('');

  String toSnakeCase() => toLowerCase().replaceAll(' ', '_');

  String toKebabCase() => toLowerCase().replaceAll(' ', '-');

  String toPascalCase() => toTitleCase().replaceAll(' ', '');

  bool stringToBool() => this == 'true' || this == '1';
}

extension IntExtras on int {
  bool isEven() => this % 2 == 0;

  bool isOdd() => this % 2 == 1;

  int clamp(int min, int max) => (min > this ? min : (max < this ? max : this));

  bool intToBool() => this == 1;
}

extension DoubleExtras on double {
  double clamp(double min, double max) => (min > this ? min : (max < this ? max : this));

  String toStringAsFixed(int digits) => toStringAsFixed(digits);
}
