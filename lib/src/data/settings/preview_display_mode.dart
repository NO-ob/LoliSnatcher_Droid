import 'package:flutter/widgets.dart';

import 'package:lolisnatcher/gen/strings.g.dart';
import 'package:lolisnatcher/src/data/settings/settings_enum.dart';

enum PreviewDisplayMode with SettingsEnum<PreviewDisplayMode> {
  square,
  rectangle,
  staggered;

  // For JSON serialization - returns ORIGINAL string values for backwards compatibility
  // New format (uncomment after grace period): square => 'square', rectangle => 'rectangle', staggered => 'staggered'
  @override
  String toJson() {
    switch (this) {
      case PreviewDisplayMode.square:
        return 'Square';
      case PreviewDisplayMode.rectangle:
        return 'Rectangle';
      case PreviewDisplayMode.staggered:
        return 'Staggered';
    }
  }

  static PreviewDisplayMode fromString(String name) {
    switch (name) {
      case 'Square':
      case 'square':
        return PreviewDisplayMode.square;
      case 'Rectangle':
      case 'rectangle':
        return PreviewDisplayMode.rectangle;
      case 'Staggered':
      case 'staggered':
        return PreviewDisplayMode.staggered;
    }
    return defaultValue;
  }

  static PreviewDisplayMode get defaultValue => PreviewDisplayMode.square;

  bool get isSquare => this == PreviewDisplayMode.square;
  bool get isRectangle => this == PreviewDisplayMode.rectangle;
  bool get isStaggered => this == PreviewDisplayMode.staggered;

  @override
  String locName(BuildContext context) {
    switch (this) {
      case PreviewDisplayMode.square:
        return context.loc.settings.interface.previewDisplayModeValues.square;
      case PreviewDisplayMode.rectangle:
        return context.loc.settings.interface.previewDisplayModeValues.rectangle;
      case PreviewDisplayMode.staggered:
        return context.loc.settings.interface.previewDisplayModeValues.staggered;
    }
  }
}
