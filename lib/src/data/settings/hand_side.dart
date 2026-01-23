import 'package:flutter/widgets.dart';
import 'package:lolisnatcher/gen/strings.g.dart';

enum HandSide {
  left,
  right
  ;

  @override
  String toString() {
    switch (this) {
      case HandSide.left:
        return 'Left';
      case HandSide.right:
        return 'Right';
    }
  }

  static HandSide fromString(String name) {
    switch (name) {
      case 'Left':
      case 'left':
      case 'l':
        return HandSide.left;
      case 'Right':
      case 'right':
      case 'r':
        return HandSide.right;
    }
    return HandSide.right;
  }

  static HandSide get defaultValue {
    return HandSide.right;
  }

  bool get isLeft => this == HandSide.left;
  bool get isRight => this == HandSide.right;

  String locName(BuildContext context) {
    switch (this) {
      case HandSide.left:
        return context.loc.settings.viewer.buttonPositionValues.left;
      case HandSide.right:
        return context.loc.settings.viewer.buttonPositionValues.right;
    }
  }
}
