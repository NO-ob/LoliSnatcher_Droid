import 'dart:convert';
import 'dart:io';

import 'package:LoliSnatcher/utilities/Logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum TagType {
  artist,
  character,
  copyright,
  meta,
  none
}

class Tag {
  String displayString = "", fullString = "";
  TagType tagType = TagType.none;
  Tag (this.displayString, this.fullString, this.tagType);

  Map<String,dynamic> toJson() {
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

  Color getColour(){
    switch(tagType){
      case(TagType.artist):
        return Colors.red;
      case(TagType.copyright):
        return Colors.purple;
      case(TagType.character):
        return Colors.green;
      case(TagType.meta):
        return Colors.orange;
      default:{
        return Colors.transparent;
      }
    }
  }
}
