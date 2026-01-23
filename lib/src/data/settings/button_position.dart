import 'package:flutter/widgets.dart';

import 'package:lolisnatcher/src/data/settings/settings_enum.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';

/// Used for zoomButtonPosition, changePageButtonsPosition, scrollGridButtonsPosition
enum ButtonPosition with SettingsEnum<ButtonPosition> {
  disabled,
  left,
  right,
  ;

  // For JSON serialization - returns ORIGINAL string values for backwards compatibility
  // New format (uncomment after grace period): disabled => 'disabled', left => 'left', right => 'right'
  @override
  String toJson() {
    switch (this) {
      case ButtonPosition.disabled:
        return 'Disabled';
      case ButtonPosition.left:
        return 'Left';
      case ButtonPosition.right:
        return 'Right';
    }
  }

  static ButtonPosition fromString(String name) {
    switch (name) {
      case 'Disabled':
      case 'disabled':
        return ButtonPosition.disabled;
      case 'Left':
      case 'left':
        return ButtonPosition.left;
      case 'Right':
      case 'right':
        return ButtonPosition.right;
    }
    return defaultValue;
  }

  static ButtonPosition get defaultValue => ButtonPosition.right;

  /// Default for settings that are disabled on mobile by default
  static ButtonPosition get defaultValueDesktopOnly {
    return SettingsHandler.isDesktopPlatform ? ButtonPosition.right : ButtonPosition.disabled;
  }

  bool get isDisabled => this == ButtonPosition.disabled;
  bool get isLeft => this == ButtonPosition.left;
  bool get isRight => this == ButtonPosition.right;

  @override
  String locName(BuildContext context) {
    switch (this) {
      case ButtonPosition.disabled:
        return context.loc.settings.viewer.buttonPositionValues.disabled;
      case ButtonPosition.left:
        return context.loc.settings.viewer.buttonPositionValues.left;
      case ButtonPosition.right:
        return context.loc.settings.viewer.buttonPositionValues.right;
    }
  }
}
