import 'package:flutter/widgets.dart';

import 'package:lolisnatcher/gen/strings.g.dart';
import 'package:lolisnatcher/src/data/settings/settings_enum.dart';

enum ScrollDirection with SettingsEnum<ScrollDirection> {
  horizontal,
  vertical;

  // For JSON serialization - returns ORIGINAL string values for backwards compatibility
  // New format (uncomment after grace period): horizontal => 'horizontal', vertical => 'vertical'
  @override
  String toJson() {
    switch (this) {
      case ScrollDirection.horizontal:
        return 'Horizontal';
      case ScrollDirection.vertical:
        return 'Vertical';
    }
  }

  static ScrollDirection fromString(String name) {
    switch (name) {
      case 'Horizontal':
      case 'horizontal':
        return ScrollDirection.horizontal;
      case 'Vertical':
      case 'vertical':
        return ScrollDirection.vertical;
    }
    return defaultValue;
  }

  static ScrollDirection get defaultValue => ScrollDirection.horizontal;

  bool get isHorizontal => this == ScrollDirection.horizontal;
  bool get isVertical => this == ScrollDirection.vertical;

  @override
  String locName(BuildContext context) {
    switch (this) {
      case ScrollDirection.horizontal:
        return context.loc.settings.viewer.scrollDirectionValues.horizontal;
      case ScrollDirection.vertical:
        return context.loc.settings.viewer.scrollDirectionValues.vertical;
    }
  }
}
