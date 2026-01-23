import 'package:flutter/widgets.dart';

import 'package:lolisnatcher/gen/strings.g.dart';
import 'package:lolisnatcher/src/data/settings/settings_enum.dart';

enum VideoCacheMode with SettingsEnum<VideoCacheMode> {
  stream,
  cache,
  streamCache,
  ;

  // For JSON serialization - returns ORIGINAL string values for backwards compatibility
  // New format (uncomment after grace period): stream => 'stream', cache => 'cache', streamCache => 'streamCache'
  @override
  String toJson() {
    switch (this) {
      case VideoCacheMode.stream:
        return 'Stream';
      case VideoCacheMode.cache:
        return 'Cache';
      case VideoCacheMode.streamCache:
        return 'Stream+Cache';
    }
  }

  static VideoCacheMode fromString(String name) {
    switch (name) {
      case 'Stream':
      case 'stream':
        return VideoCacheMode.stream;
      case 'Cache':
      case 'cache':
        return VideoCacheMode.cache;
      case 'Stream+Cache':
      case 'streamCache':
        return VideoCacheMode.streamCache;
    }
    return defaultValue;
  }

  static VideoCacheMode get defaultValue => VideoCacheMode.stream;

  bool get isStream => this == VideoCacheMode.stream;
  bool get isCache => this == VideoCacheMode.cache;
  bool get isStreamCache => this == VideoCacheMode.streamCache;

  @override
  String locName(BuildContext context) {
    switch (this) {
      case VideoCacheMode.stream:
        return context.loc.settings.video.cacheModeValues.stream;
      case VideoCacheMode.cache:
        return context.loc.settings.video.cacheModeValues.cache;
      case VideoCacheMode.streamCache:
        return context.loc.settings.video.cacheModeValues.streamCache;
    }
  }
}
