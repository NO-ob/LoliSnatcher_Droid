enum VideoBackendMode {
  normal,
  mpv, // mediakit
  mdk; // fvp

  @override
  String toString() {
    return name;
  }

  static VideoBackendMode fromString(String name) {
    switch (name) {
      case 'Normal':
      case 'normal':
        return VideoBackendMode.normal;
      case 'mpv':
        return VideoBackendMode.mpv;
      case 'mdk':
        return VideoBackendMode.mdk;
      default:
        return VideoBackendMode.normal;
    }
  }

  static VideoBackendMode get defaultValue {
    return VideoBackendMode.normal;
  }

  bool get isDefault => this == defaultValue;
  bool get isNormal => this == VideoBackendMode.normal;
  bool get isMpv => this == VideoBackendMode.mpv;
  bool get isMdk => this == VideoBackendMode.mdk;
}
