import 'package:flutter/widgets.dart';

import 'package:lolisnatcher/gen/strings.g.dart';
import 'package:lolisnatcher/src/data/settings/settings_enum.dart';

enum PreviewQuality with SettingsEnum<PreviewQuality> {
  thumbnail,
  sample;

  // For JSON serialization - returns ORIGINAL string values for backwards compatibility
  // New format (uncomment after grace period): thumbnail => 'thumbnail', sample => 'sample'
  @override
  String toJson() {
    switch (this) {
      case PreviewQuality.thumbnail:
        return 'Thumbnail';
      case PreviewQuality.sample:
        return 'Sample';
    }
  }

  static PreviewQuality fromString(String name) {
    switch (name) {
      case 'Thumbnail':
      case 'thumbnail':
        return PreviewQuality.thumbnail;
      case 'Sample':
      case 'sample':
        return PreviewQuality.sample;
    }
    return defaultValue;
  }

  static PreviewQuality get defaultValue => PreviewQuality.sample;

  bool get isThumbnail => this == PreviewQuality.thumbnail;
  bool get isSample => this == PreviewQuality.sample;

  @override
  String locName(BuildContext context) {
    switch (this) {
      case PreviewQuality.thumbnail:
        return context.loc.settings.interface.previewQualityValues.thumbnail;
      case PreviewQuality.sample:
        return context.loc.settings.interface.previewQualityValues.sample;
    }
  }
}
