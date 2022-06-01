import 'package:flutter/material.dart';

enum TagType {
  artist,
  character,
  copyright,
  meta,
  species,
  none;

  static TagType fromString(String string) {
    switch (string) {
      case 'artist':
        return TagType.artist;
      case 'character':
        return TagType.character;
      case 'copyright':
        return TagType.copyright;
      case 'meta':
        return TagType.meta;
      case 'species':
        return TagType.species;
      default:
        return TagType.none;
    }
  }

  @override
  String toString() {
    switch (this) {
      case TagType.artist:
        return 'artist';
      case TagType.character:
        return 'character';
      case TagType.copyright:
        return 'copyright';
      case TagType.meta:
        return 'meta';
      case TagType.species:
        return 'species';
      default:
        return 'none';
    }
  }

  Color getColour() {
    switch (this) {
      case (artist):
        return Colors.red;
      case (copyright):
        return Colors.purple;
      case (character):
        return Colors.green;
      case (species):
        return Colors.brown;
      case (meta):
        return Colors.orange;
      default:
        return Colors.transparent;
    }
  }
}

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
