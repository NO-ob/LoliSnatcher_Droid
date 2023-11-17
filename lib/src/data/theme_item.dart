import 'package:flutter/material.dart';

class ThemeItem {
  ThemeItem({
    required this.name,
    required this.primary,
    required this.accent,
  });

  String name;
  // Flutters Colors.color should be used instead of using Color(0xFFhexcolour) because it breaks the light/dark mode on the text and icons for some reason
  Color? primary;
  Color? accent;
}
