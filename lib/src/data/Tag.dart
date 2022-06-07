import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/tag_type.dart';

class Tag {
  String displayString = "", fullString = "";
  TagType tagType = TagType.none;
  Tag(this.displayString, this.fullString, this.tagType);

  Map<String, dynamic> toJson() {
    return {
      "displayString": displayString,
      "fullString": fullString,
      "tagType": tagType.name,
    };
  }

  Tag.fromJson(Map<String, dynamic> json) {
    displayString = json["displayString"].toString();
    fullString = json["fullString"].toString();
    tagType = TagType.values.byName(json["tagType"].toString());
  }

  @override
  String toString() {
    return ("displayString: $displayString, fullString: $fullString, tagType: ${tagType.name}");
  }

  Color getColour() {
    switch (tagType) {
      case (TagType.artist):
        return Colors.red;
      case (TagType.copyright):
        return Colors.purple;
      case (TagType.character):
        return Colors.green;
      case (TagType.species):
        return Colors.brown;
      case (TagType.meta):
        return Colors.orange;
      default:
        return Colors.transparent;
    }
  }
}
