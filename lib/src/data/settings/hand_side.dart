enum HandSide {
  left,
  right;

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

  bool get isLeft {
    return this == HandSide.left;
  }

  bool get isRight {
    return this == HandSide.right;
  }

  static HandSide get defaultValue {
    return HandSide.right;
  }
}
