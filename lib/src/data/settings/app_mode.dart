enum AppMode {
  DESKTOP,
  MOBILE;

  @override
  String toString() {
    switch (this) {
      case AppMode.DESKTOP:
        return 'Desktop';
      case AppMode.MOBILE:
        return 'Mobile';
    }
  }

  static AppMode fromString(String name) {
    switch (name) {
      case 'Desktop':
        return AppMode.DESKTOP;
      case 'Mobile':
        return AppMode.MOBILE;
    }
    return AppMode.MOBILE;
  }
}
