import 'package:flutter/material.dart';
import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';

enum TagType {
  artist,
  character,
  copyright,
  meta,
  species,
  lore,
  none;

  bool get isArtist => this == TagType.artist;
  bool get isCharacter => this == TagType.character;
  bool get isCopyright => this == TagType.copyright;
  bool get isMeta => this == TagType.meta;
  bool get isSpecies => this == TagType.species;
  bool get isLore => this == TagType.lore;
  bool get isNone => this == TagType.none;

  static TagType fromString(String string) {
    try {
      return TagType.values.byName(string);
    } catch (e) {
      return TagType.none;
    }
  }

  @override
  String toString() {
    return name;
  }

  Color? getColour() {
    switch (this) {
      case artist:
        return Colors.red;
      case character:
        return Colors.green;
      case copyright:
        return Colors.purple;
      case meta:
        return Colors.orange;
      case species:
        return Colors.brown;
      case lore:
        return Colors.lightGreen;
      default:
        return null;
    }
  }

  String get locName {
    final ctx = NavigationHandler.instance.navContext;
    switch (this) {
      case artist:
        return ctx.loc.tagType.artist;
      case character:
        return ctx.loc.tagType.character;
      case copyright:
        return ctx.loc.tagType.copyright;
      case meta:
        return ctx.loc.tagType.meta;
      case species:
        return ctx.loc.tagType.species;
      case lore:
        return ctx.loc.tagType.lore;
      case none:
        return ctx.loc.tagType.none;
    }
  }
}
