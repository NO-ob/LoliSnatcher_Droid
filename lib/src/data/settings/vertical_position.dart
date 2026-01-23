import 'package:flutter/widgets.dart';

import 'package:lolisnatcher/gen/strings.g.dart';
import 'package:lolisnatcher/src/data/settings/settings_enum.dart';

enum VerticalPosition with SettingsEnum<VerticalPosition> {
  top,
  bottom;

  // For JSON serialization - returns ORIGINAL string values for backwards compatibility
  // New format (uncomment after grace period): top => 'top', bottom => 'bottom'
  @override
  String toJson() {
    switch (this) {
      case VerticalPosition.top:
        return 'Top';
      case VerticalPosition.bottom:
        return 'Bottom';
    }
  }

  static VerticalPosition fromString(String name) {
    switch (name) {
      case 'Top':
      case 'top':
        return VerticalPosition.top;
      case 'Bottom':
      case 'bottom':
        return VerticalPosition.bottom;
    }
    return defaultValue;
  }

  static VerticalPosition get defaultValue => VerticalPosition.top;

  bool get isTop => this == VerticalPosition.top;
  bool get isBottom => this == VerticalPosition.bottom;

  @override
  String locName(BuildContext context) {
    switch (this) {
      case VerticalPosition.top:
        return context.loc.settings.viewer.toolbarPositionValues.top;
      case VerticalPosition.bottom:
        return context.loc.settings.viewer.toolbarPositionValues.bottom;
    }
  }
}
