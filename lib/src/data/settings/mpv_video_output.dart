import 'package:flutter/widgets.dart';

import 'package:lolisnatcher/src/data/settings/settings_enum.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';

enum MpvVideoOutput with SettingsEnum<MpvVideoOutput> {
  gpu,
  gpuNext,
  libmpv,
  mediacodecEmbed,
  sdl;

  // For JSON serialization - returns ORIGINAL string values for backwards compatibility
  // New format (uncomment after grace period): gpu => 'gpu', gpuNext => 'gpuNext', etc.
  @override
  String toJson() {
    switch (this) {
      case MpvVideoOutput.gpu:
        return 'gpu';
      case MpvVideoOutput.gpuNext:
        return 'gpu-next';
      case MpvVideoOutput.libmpv:
        return 'libmpv';
      case MpvVideoOutput.mediacodecEmbed:
        return 'mediacodec_embed';
      case MpvVideoOutput.sdl:
        return 'sdl';
    }
  }

  static MpvVideoOutput fromString(String name) {
    switch (name) {
      case 'gpu':
        return MpvVideoOutput.gpu;
      case 'gpu-next':
      case 'gpuNext':
        return MpvVideoOutput.gpuNext;
      case 'libmpv':
        return MpvVideoOutput.libmpv;
      case 'mediacodec_embed':
      case 'mediacodecEmbed':
        return MpvVideoOutput.mediacodecEmbed;
      case 'sdl':
        return MpvVideoOutput.sdl;
    }
    return defaultValue;
  }

  static MpvVideoOutput get defaultValue {
    return SettingsHandler.isDesktopPlatform ? MpvVideoOutput.libmpv : MpvVideoOutput.gpu;
  }

  bool get isGpu => this == MpvVideoOutput.gpu;
  bool get isGpuNext => this == MpvVideoOutput.gpuNext;
  bool get isLibmpv => this == MpvVideoOutput.libmpv;
  bool get isMediacodecEmbed => this == MpvVideoOutput.mediacodecEmbed;
  bool get isSdl => this == MpvVideoOutput.sdl;

  @override
  String locName(BuildContext context) {
    return toJson();
  }
}
