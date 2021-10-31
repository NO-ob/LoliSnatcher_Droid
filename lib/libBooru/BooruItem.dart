import 'dart:convert';
import 'package:LoliSnatcher/Tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BooruItem{
  late Key key;
  String fileURL, sampleURL, thumbnailURL, postURL;
  List<String> tagsList;
  String? mediaType;
  RxnBool isSnatched = RxnBool(null), isFavourite = RxnBool(null);
  RxBool isHated = false.obs, isNoScale = false.obs;

  String? fileExt, serverId, rating, score, md5String, postDate, postDateFormat;
  List<String>? sources;
  bool? hasNotes;
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
    if (["jpg", "jpeg", "png", "webp"].any((val) => this.fileExt == val)) {
      this.mediaType = "image";
    } else if (["webm", "mp4"].any((val) => this.fileExt == val)) {
      this.mediaType = "video";
    } else if (["gif"].any((val) => this.fileExt == val)) {
      this.mediaType = "animation";
    } else if (["apng"].any((val) => this.fileExt == val)) {
      this.mediaType = "not_supported_animation";
    } else {
      this.mediaType = "other";
    }
  }
  bool isVideo() {
    return (this.mediaType == "video");
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
    };
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
}



