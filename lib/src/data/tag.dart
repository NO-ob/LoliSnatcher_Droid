import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';

class Tag {
  Tag(
    this.fullString, {
    this.tagType = TagType.none,
    this.updatedAt = 0,
  }) {
    if (updatedAt == 0) {
      updatedAt = DateTime.now().millisecondsSinceEpoch;
    }
  }

  Tag.fromJson(Map<String, dynamic> json) {
    fullString = json['fullString']?.toString() ?? json['name']?.toString() ?? 'unknown';
    // if no updatedAt is stored, set it to the current time minus 3 days (will make it stale)
    updatedAt = json['updatedAt'] ?? (DateTime.now().millisecondsSinceEpoch - Constants.tagStaleTime);
    tagType = TagType.values.byName(json['tagType']?.toString() ?? 'none');
  }

  String fullString = '';
  TagType tagType = TagType.none;
  int updatedAt = 0;

  Map<String, dynamic> toJson() {
    return {
      'fullString': fullString,
      'updatedAt': updatedAt,
      'tagType': tagType.name,
    };
  }

  @override
  String toString() {
    return 'fullString: $fullString, updatedAt: $updatedAt, tagType: ${tagType.name}';
  }

  Color getColour() {
    return tagType.getColour();
  }
}
