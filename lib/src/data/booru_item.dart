import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/note_item.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

class BooruItem{
  late Key key;
  String fileURL, sampleURL, thumbnailURL, postURL;
  List<String> tagsList;
  late String mediaType;
  RxnBool isSnatched = RxnBool(null), isFavourite = RxnBool(null);
  RxBool isHated = false.obs, isNoScale = false.obs;

  String? fileExt, serverId, rating, score, uploaderName, description, md5String, postDate, postDateFormat;
  String fileNameExtras;
  List<String>? sources;
  RxList<NoteItem> notes = RxList([]);
  bool? hasNotes, hasComments;
  double? fileWidth, fileHeight, sampleWidth, sampleHeight, previewWidth, previewHeight;
  int? fileSize;

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
  }){
    // Create a unique key for every loaded item, to later use them to read the state of their viewer
    key = GlobalKey();

    if (sampleURL.isEmpty || sampleURL == "null"){
      sampleURL = thumbnailURL;
    }
    fileExt = (fileExt ?? Tools.getFileExt(fileURL)).toLowerCase();

    switch (fileExt) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'webp':
        mediaType = 'image';
        break;

      case 'mp4':
      case 'webm':
        mediaType = 'video';
        break;

      case 'gif':
        mediaType = 'animation';
        break;

      case 'apng':
        mediaType = 'not_supported_animation';
        break;

      default:
        mediaType = 'unknown';
        break;
    }
  }

  bool isVideo() {
    return mediaType == "video";
  }

  bool isImage() {
    return mediaType == "image" || mediaType == "animation" || mediaType == "not_supported_animation";
  }

  Map<String, dynamic> toJson() {
    return {
      "postURL": postURL,
      "fileURL": fileURL,
      "sampleURL": sampleURL,
      "thumbnailURL": thumbnailURL,
      "tags": tagsList,
      "fileExt": fileExt,
      "isFavourite": isFavourite.value,
      "isSnatched" : isSnatched.value,
      "serverId": serverId,
      "rating": rating,
      "score": score,
      "sources": sources,
      "md5String": md5String,
      "postDate": postDate,
      "postDateFormat": postDateFormat,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  static BooruItem fromJSON(String jsonString){
    Map<String, dynamic> json = jsonDecode(jsonString);
    List<String> tags = [];
    List tagz = json["tags"];
    for (int i = 0; i < tagz.length; i++){
      tags.add(tagz[i].toString());
    }
    //BooruItem(this.fileURL,this.sampleURL,this.thumbnailURL,this.tagsList,this.postURL,this.fileExt
    BooruItem item = BooruItem(
      fileURL: json["fileURL"].toString(),
      sampleURL: json["sampleURL"].toString(),
      thumbnailURL: json["thumbnailURL"].toString(),
      tagsList: tags,
      postURL: json["postURL"].toString()
      // TODO stringify other options here
    );
    item.isFavourite.value = json["isFavourite"].toString() == "true" ? true : false;
    item.isSnatched.value = json["isSnatched"].toString() == "true"? true : false;
    return item;
  }

  static BooruItem fromDBRow(dynamic row, List<String> tags) {
    BooruItem item = BooruItem(
      fileURL: row["fileURL"].toString(),
      sampleURL: row["sampleURL"].toString(),
      thumbnailURL: row["thumbnailURL"].toString(),
      // use custom separator to avoid conflicts with tags containing commas
      tagsList: tags,
      postURL: row["postURL"].toString(),
    );
    item.isFavourite.value = Tools.intToBool(row["isFavourite"]) ;
    item.isSnatched.value = Tools.intToBool(row["isSnatched"]);
    return item;
  }
}



