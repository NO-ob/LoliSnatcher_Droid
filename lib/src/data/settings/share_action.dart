import 'package:flutter/widgets.dart';

import 'package:lolisnatcher/gen/strings.g.dart';
import 'package:lolisnatcher/src/data/settings/settings_enum.dart';

enum ShareAction with SettingsEnum<ShareAction> {
  ask,
  postUrl,
  postUrlWithTags,
  fileUrl,
  fileUrlWithTags,
  file,
  fileWithTags,
  hydrus,
  ;

  // For JSON serialization - returns ORIGINAL string values for backwards compatibility
  // New format (uncomment after grace period): ask => 'ask', postUrl => 'postUrl', etc.
  @override
  String toJson() {
    switch (this) {
      case ShareAction.ask:
        return 'Ask';
      case ShareAction.postUrl:
        return 'Post URL';
      case ShareAction.postUrlWithTags:
        return 'Post URL with tags';
      case ShareAction.fileUrl:
        return 'File URL';
      case ShareAction.fileUrlWithTags:
        return 'File URL with tags';
      case ShareAction.file:
        return 'File';
      case ShareAction.fileWithTags:
        return 'File with tags';
      case ShareAction.hydrus:
        return 'Hydrus';
    }
  }

  static ShareAction fromString(String name) {
    switch (name) {
      case 'Ask':
      case 'ask':
        return ShareAction.ask;
      case 'Post URL':
      case 'postUrl':
        return ShareAction.postUrl;
      case 'Post URL with tags':
      case 'postUrlWithTags':
        return ShareAction.postUrlWithTags;
      case 'File URL':
      case 'fileUrl':
        return ShareAction.fileUrl;
      case 'File URL with tags':
      case 'fileUrlWithTags':
        return ShareAction.fileUrlWithTags;
      case 'File':
      case 'file':
        return ShareAction.file;
      case 'File with tags':
      case 'fileWithTags':
        return ShareAction.fileWithTags;
      case 'Hydrus':
      case 'hydrus':
        return ShareAction.hydrus;
    }
    return defaultValue;
  }

  static ShareAction get defaultValue => ShareAction.ask;

  bool get isAsk => this == ShareAction.ask;
  bool get isPostUrl => this == ShareAction.postUrl;
  bool get isPostUrlWithTags => this == ShareAction.postUrlWithTags;
  bool get isFileUrl => this == ShareAction.fileUrl;
  bool get isFileUrlWithTags => this == ShareAction.fileUrlWithTags;
  bool get isFile => this == ShareAction.file;
  bool get isFileWithTags => this == ShareAction.fileWithTags;
  bool get isHydrus => this == ShareAction.hydrus;

  @override
  String locName(BuildContext context) {
    switch (this) {
      case ShareAction.ask:
        return context.loc.settings.viewer.shareActionValues.ask;
      case ShareAction.postUrl:
        return context.loc.settings.viewer.shareActionValues.postUrl;
      case ShareAction.postUrlWithTags:
        return context.loc.settings.viewer.shareActionValues.postUrlWithTags;
      case ShareAction.fileUrl:
        return context.loc.settings.viewer.shareActionValues.fileUrl;
      case ShareAction.fileUrlWithTags:
        return context.loc.settings.viewer.shareActionValues.fileUrlWithTags;
      case ShareAction.file:
        return context.loc.settings.viewer.shareActionValues.file;
      case ShareAction.fileWithTags:
        return context.loc.settings.viewer.shareActionValues.fileWithTags;
      case ShareAction.hydrus:
        return context.loc.settings.viewer.shareActionValues.hydrus;
    }
  }
}
