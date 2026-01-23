import 'package:flutter/widgets.dart';

import 'package:lolisnatcher/src/data/settings/settings_enum.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';

enum MpvHardwareDecoding with SettingsEnum<MpvHardwareDecoding> {
  auto,
  autoSafe,
  autoCopy,
  mediacodec,
  mediacodecCopy,
  vulkan,
  vulkanCopy;

  // For JSON serialization - returns ORIGINAL string values for backwards compatibility
  // New format (uncomment after grace period): auto => 'auto', autoSafe => 'autoSafe', etc.
  @override
  String toJson() {
    switch (this) {
      case MpvHardwareDecoding.auto:
        return 'auto';
      case MpvHardwareDecoding.autoSafe:
        return 'auto-safe';
      case MpvHardwareDecoding.autoCopy:
        return 'auto-copy';
      case MpvHardwareDecoding.mediacodec:
        return 'mediacodec';
      case MpvHardwareDecoding.mediacodecCopy:
        return 'mediacodec-copy';
      case MpvHardwareDecoding.vulkan:
        return 'vulkan';
      case MpvHardwareDecoding.vulkanCopy:
        return 'vulkan-copy';
    }
  }

  static MpvHardwareDecoding fromString(String name) {
    switch (name) {
      case 'auto':
        return MpvHardwareDecoding.auto;
      case 'auto-safe':
      case 'autoSafe':
        return MpvHardwareDecoding.autoSafe;
      case 'auto-copy':
      case 'autoCopy':
        return MpvHardwareDecoding.autoCopy;
      case 'mediacodec':
        return MpvHardwareDecoding.mediacodec;
      case 'mediacodec-copy':
      case 'mediacodecCopy':
        return MpvHardwareDecoding.mediacodecCopy;
      case 'vulkan':
        return MpvHardwareDecoding.vulkan;
      case 'vulkan-copy':
      case 'vulkanCopy':
        return MpvHardwareDecoding.vulkanCopy;
    }
    return defaultValue;
  }

  static MpvHardwareDecoding get defaultValue {
    return SettingsHandler.isDesktopPlatform ? MpvHardwareDecoding.auto : MpvHardwareDecoding.autoSafe;
  }

  bool get isAuto => this == MpvHardwareDecoding.auto;
  bool get isAutoSafe => this == MpvHardwareDecoding.autoSafe;
  bool get isAutoCopy => this == MpvHardwareDecoding.autoCopy;
  bool get isMediacodec => this == MpvHardwareDecoding.mediacodec;
  bool get isMediacodecCopy => this == MpvHardwareDecoding.mediacodecCopy;
  bool get isVulkan => this == MpvHardwareDecoding.vulkan;
  bool get isVulkanCopy => this == MpvHardwareDecoding.vulkanCopy;

  @override
  String locName(BuildContext context) {
    return toJson();
  }
}
