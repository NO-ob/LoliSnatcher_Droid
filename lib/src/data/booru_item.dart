import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/note_item.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

// ignore: must_be_immutable
class BooruItem extends Equatable {
  BooruItem({
    required this.fileURL,
    required this.sampleURL,
    required this.thumbnailURL,
    required this.tagsList,
    required this.postURL,
    this.fileExt,
    this.fileNameExtras = '',
    this.fileSize,
    this.fileWidth,
    this.fileHeight,
    this.sampleWidth,
    this.sampleHeight,
    this.previewWidth,
    this.previewHeight,
    this.hasNotes,
    this.hasComments,
    this.serverId,
    this.rating, // safe, explicit...
    this.score,
    this.uploaderName,
    this.description,
    this.sources,
    this.md5String,
    this.postDate,
    this.postDateFormat,
  }) {
    // Create a unique key for every loaded item, to later use them to read the state of their viewer
    key = GlobalKey();

    if (sampleURL.isEmpty || sampleURL == 'null') {
      sampleURL = thumbnailURL;
    }
    fileExt = (fileExt ?? Tools.getFileExt(fileURL)).toLowerCase();

    if (fileWidth != null && fileHeight != null) {
      fileAspectRatio = fileWidth! / fileHeight!;
    }
    if (sampleWidth != null && sampleHeight != null) {
      sampleAspectRatio = sampleWidth! / sampleHeight!;
    }
    if (previewWidth != null && previewHeight != null) {
      previewAspectRatio = previewWidth! / previewHeight!;
    }

    mediaType = Rx<MediaType>(MediaType.fromExtension(fileExt));
  }

  late Key key;
  String fileURL;
  String sampleURL;
  String thumbnailURL;
  String postURL;
  List<Tag> tagsList;
  late Rx<MediaType> mediaType;
  Rxn<MediaType> possibleMediaType = Rxn<MediaType>(null);
  RxnBool isSnatched = RxnBool(null), isFavourite = RxnBool(null);
  RxBool isNoScale = false.obs, toggleQuality = false.obs;
  bool isUpdated = false;

  String? fileExt;
  String? serverId;
  String? rating;
  String? score;
  String? uploaderName;
  String? description;
  String? md5String;
  String? postDate;
  String? postDateFormat;
  String fileNameExtras;
  List<String>? sources;
  RxList<NoteItem> notes = RxList([]);
  bool? hasNotes, hasComments;
  double? fileWidth;
  double? fileHeight;
  double? fileAspectRatio;
  double? sampleWidth;
  double? sampleHeight;
  double? sampleAspectRatio;
  double? previewWidth;
  double? previewHeight;
  double? previewAspectRatio;
  int? fileSize;

  bool get isLong {
    return fileAspectRatio != null && fileAspectRatio! < 0.3;
  }

  bool get isHidden {
    return SettingsHandler.instance.containsHidden(tagsList.map((t) => t.fullString).toList());
  }

  bool get isMarked {
    return SettingsHandler.instance.containsMarked(tagsList.map((t) => t.fullString).toList());
  }

  bool get isSound {
    return SettingsHandler.instance.containsSound(tagsList.map((t) => t.fullString).toList());
  }

  bool get isAI {
    return SettingsHandler.instance.containsAI(tagsList.map((t) => t.fullString).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'postURL': postURL,
      'fileURL': fileURL,
      'sampleURL': sampleURL,
      'thumbnailURL': thumbnailURL,
      'tags': tagsList,
      'fileExt': fileExt,
      'isFavourite': isFavourite.value,
      'isSnatched': isSnatched.value,
      'serverId': serverId,
      'rating': rating,
      'score': score,
      'sources': sources,
      'md5String': md5String,
      'postDate': postDate,
      'postDateFormat': postDateFormat,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  @override
  List<Object?> get props => [
    key,
    fileURL,
    sampleURL,
    thumbnailURL,
    postURL,
    tagsList,
    mediaType,
    possibleMediaType,
    isSnatched,
    isFavourite,
    isNoScale,
    toggleQuality,
    isUpdated,
    fileExt,
    serverId,
    rating,
    score,
    uploaderName,
    description,
    md5String,
    postDate,
    postDateFormat,
    fileNameExtras,
    sources,
    notes,
    hasNotes,
    hasComments,
    fileWidth,
    fileHeight,
    fileAspectRatio,
    sampleWidth,
    sampleHeight,
    sampleAspectRatio,
    previewWidth,
    previewHeight,
    previewAspectRatio,
    fileSize,
  ];

  static BooruItem fromJSON(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return BooruItem.fromMap(json);
  }

  static BooruItem fromMap(Map<String, dynamic> json) {
    final List<String> tags = [];
    final List tagz = json['tags'];
    for (int i = 0; i < tagz.length; i++) {
      tags.add(tagz[i].toString());
    }
    //BooruItem(this.fileURL,this.sampleURL,this.thumbnailURL,this.tagsList,this.postURL,this.fileExt
    final BooruItem item = BooruItem(
      fileURL: json['fileURL'].toString(),
      sampleURL: json['sampleURL'].toString(),
      thumbnailURL: json['thumbnailURL'].toString(),
      tagsList: tags.map(Tag.new).toList(),
      postURL: json['postURL'].toString(),
      // TODO stringify other options here
    );
    item.isFavourite.value = json['isFavourite'].toString() == 'true';
    item.isSnatched.value = json['isSnatched'].toString() == 'true';
    return item;
  }

  static BooruItem fromDBRow(dynamic row, List<String> tags) {
    final BooruItem item = BooruItem(
      fileURL: row['fileURL'].toString(),
      sampleURL: row['sampleURL'].toString(),
      thumbnailURL: row['thumbnailURL'].toString(),
      // use custom separator to avoid conflicts with tags containing commas
      fileExt: row['fileURL'].toString().contains('Hydrus-Client-API') ? 'extra' : null,
      tagsList: tags.map(Tag.new).toList(),
      postURL: row['postURL'].toString(),
    );
    item.isFavourite.value = Tools.intToBool(row['isFavourite']);
    item.isSnatched.value = Tools.intToBool(row['isSnatched']);
    return item;
  }
}

enum MediaType {
  image,
  video,
  animation,
  notSupportedAnimation,
  unknown,
  needToGuess,
  needToLoadItem
  ;

  bool get isImage {
    return this == MediaType.image;
  }

  bool get isImageOrAnimation {
    return this == MediaType.image || this == MediaType.animation || this == MediaType.notSupportedAnimation;
  }

  bool get isVideo {
    return this == MediaType.video;
  }

  bool get isAnimation {
    return this == MediaType.animation;
  }

  bool get isNotSupportedAnimation {
    return this == MediaType.notSupportedAnimation;
  }

  bool get isUnknown {
    return this == MediaType.unknown;
  }

  bool get isNeedToGuess {
    return this == MediaType.needToGuess;
  }

  bool get isNeedToLoadItem {
    return this == MediaType.needToLoadItem;
  }

  String toJson() {
    return name.replaceAll(RegExp('(?<=[a-z])(?=[A-Z])'), '_').toLowerCase();
  }

  static MediaType fromExtension(String? ext) {
    switch (ext) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'webp':
      case 'avif':
        return MediaType.image;

      case 'mp4':
      case 'webm':
        return MediaType.video;

      case 'gif':
        return MediaType.animation;

      case 'apng':
        return MediaType.notSupportedAnimation;

      case 'extra':
        return MediaType.needToGuess;

      case 'loadItem':
        return MediaType.needToLoadItem;

      default:
        return MediaType.unknown;
    }
  }
}
