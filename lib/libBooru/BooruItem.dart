import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/Tools.dart';
import 'package:LoliSnatcher/libBooru/NoteItem.dart';

class BooruItem{
  late Key key;
  String fileURL, sampleURL, thumbnailURL, postURL;
  List<String> tagsList;
  late String mediaType;
  RxnBool isSnatched = RxnBool(null), isFavourite = RxnBool(null);
  RxBool isHated = false.obs, isNoScale = false.obs;

  String? fileExt, serverId, rating, score, md5String, postDate, postDateFormat;
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
    this.sources,
    this.md5String,
    this.postDate,
    this.postDateFormat,
  }){
    // Create a unique key for every loaded item, to later use them to read the state of their viewer
    key = GlobalKey();

    if (this.sampleURL.isEmpty || this.sampleURL == "null"){
      this.sampleURL = this.thumbnailURL;
    }
    this.fileExt = this.fileExt != null ? this.fileExt : Tools.getFileExt(this.fileURL);
    this.fileExt = this.fileExt!.toLowerCase();
    switch (this.fileExt) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'webp':
        this.mediaType = 'image';
        break;

      case 'mp4':
      case 'webm':
        this.mediaType = 'video';
        break;

      case 'gif':
        this.mediaType = 'animation';
        break;

      case 'apng':
        this.mediaType = 'not_supported_animation';
        break;

      default:
        this.mediaType = 'unknown';
        break;
    }
  }

  bool isVideo() {
    return this.mediaType == "video";
  }

  bool isImage() {
    return this.mediaType == "image" || this.mediaType == "animation" || this.mediaType == "not_supported_animation";
  }

  Map toJSON() {
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

  String toString() {
    return jsonEncode(this.toJSON());
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



