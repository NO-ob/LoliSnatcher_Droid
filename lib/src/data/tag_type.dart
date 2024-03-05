import 'package:flutter/material.dart';

enum TagType {
  artist,
  character,
  copyright,
  meta,
  species,
  none;

  bool get isArtist => this == TagType.artist;
  bool get isCharacter => this == TagType.character;
  bool get isCopyright => this == TagType.copyright;
  bool get isMeta => this == TagType.meta;
  bool get isSpecies => this == TagType.species;
  bool get isNone => this == TagType.none;

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
      case artist:
        return Colors.red;
      case copyright:
        return Colors.purple;
      case character:
        return Colors.green;
      case species:
        return Colors.brown;
      case meta:
        return Colors.orange;
      default:
        return Colors.transparent;
    }
  }
}
