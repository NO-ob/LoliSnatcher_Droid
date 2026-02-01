import 'package:lolisnatcher/gen/strings.g.dart';
import 'package:lolisnatcher/src/data/settings/settings_enum.dart';

/// Used for galleryMode and snatchMode settings
enum ImageQuality with SettingsEnum<ImageQuality> {
  sample,
  fullRes,
  ;

  // For JSON serialization - returns ORIGINAL string values for backwards compatibility
  // New format (uncomment after grace period): sample => 'sample', fullRes => 'fullRes'
  @override
  String toJson() {
    switch (this) {
      case ImageQuality.sample:
        return 'Sample';
      case ImageQuality.fullRes:
        return 'Full Res';
    }
  }

  static ImageQuality fromString(String name) {
    switch (name) {
      case 'Sample':
      case 'sample':
        return ImageQuality.sample;
      case 'Full Res':
      case 'fullRes':
      case 'full_res':
        return ImageQuality.fullRes;
    }
    return defaultValue;
  }

  static ImageQuality get defaultValue => ImageQuality.fullRes;

  bool get isSample => this == ImageQuality.sample;
  bool get isFullRes => this == ImageQuality.fullRes;

  @override
  String get locName {
    switch (this) {
      case ImageQuality.sample:
        return loc.settings.viewer.imageQualityValues.sample;
      case ImageQuality.fullRes:
        return loc.settings.viewer.imageQualityValues.fullRes;
    }
  }
}
