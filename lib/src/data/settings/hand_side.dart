enum HandSide {
  right,
  left;

  @override
  String toString() {
    switch (this) {
      case HandSide.right:
        return 'Right';
      case HandSide.left:
        return 'Left';
    }
  }

  static HandSide fromString(String name) {
    switch (name) {
      case 'Right':
        return HandSide.right;
      case 'Left':
        return HandSide.left;
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