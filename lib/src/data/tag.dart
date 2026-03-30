import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';

class Tag {
  Tag(
    this.fullString, {
    this.tagType = TagType.none,
    this.count = 0,
    this.updatedAt = 0,
  }) {
    if (updatedAt == 0) {
      updatedAt = DateTime.now().millisecondsSinceEpoch;
    }
  }

  static Tag fromJson(Map<String, dynamic> json) {
    return Tag(
      json['fullString']?.toString() ?? json['name']?.toString() ?? 'unknown',
      tagType: TagType.values.byName(json['tagType']?.toString() ?? 'none'),
      count: json['count'] ?? 0,
      updatedAt: json['updatedAt'] ?? (DateTime.now().millisecondsSinceEpoch - Constants.tagStaleTime),
    );
  }

  String fullString;
  TagType tagType;
  int count;
  int updatedAt;

  Map<String, dynamic> toJson() {
    return {
      'fullString': fullString,
      'updatedAt': updatedAt,
      'tagType': tagType.name,
      if (count > 0) 'count': count,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }

  Color? getColour() {
    return tagType.getColour();
  }

  Tag copyWith({
    String? fullString,
    TagType? tagType,
    int? count,
    int? updatedAt,
  }) {
    return Tag(
      fullString ?? this.fullString,
      tagType: tagType ?? this.tagType,
      count: count ?? this.count,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
