import 'dart:convert';

class BooruItem{
  String fileURL, sampleURL, thumbnailURL, postURL, fileExt;
  List<String> tagsList;
  String? mediaType;
  bool isSnatched = false, isFavourite = false;
  String? idOnHost = "";
  double? fileWidth, fileHeight;
  BooruItem(this.fileURL,this.sampleURL,this.thumbnailURL,this.tagsList,this.postURL,this.fileExt, {this.fileWidth, this.fileHeight,this.idOnHost}){
    if (this.sampleURL.isEmpty || this.sampleURL == "null"){
      this.sampleURL = this.thumbnailURL;
    }
    this.fileExt = this.fileExt.toLowerCase();
    if (["jpg", "jpeg", "png"].any((val) => this.fileExt == val)) {
      this.mediaType = "image";
    } else if (["webm", "mp4"].any((val) => this.fileExt == val)) {
      this.mediaType = "video";
    } else if (this.fileExt == "gif") {
      this.mediaType = "animation";
    } else {
      this.mediaType = "other";
    }
  }
  bool isVideo() {
    return (this.mediaType == "video");
  }
  Map toJSON() {
    return {"postURL": "$postURL","fileURL": "$fileURL", "sampleURL": "$sampleURL", "thumbnailURL": "$thumbnailURL", "tags": tagsList, "fileExt": fileExt, "isFavourite": "${isFavourite.toString()}","isSnatched" : "${isSnatched.toString()}"};
  }
  static BooruItem fromJSON(String jsonString){
    Map<String, dynamic> json = jsonDecode(jsonString);
    List<String> tags = [];
    List tagz = json["tags"];
    for (int i = 0; i < tagz.length; i++){
      tags.add(tagz[i].toString());
    }
    //BooruItem(this.fileURL,this.sampleURL,this.thumbnailURL,this.tagsList,this.postURL,this.fileExt
    BooruItem item = new BooruItem(json["fileURL"].toString(), json["sampleURL"].toString(), json["thumbnailURL"].toString(), tags, json["postURL"].toString(), json["fileExt"].toString());
    item.isFavourite = json["isFavourite"].toString() == "true" ? true : false;
    item.isSnatched = json["isSnatched"].toString() == "true"? true : false;
    return item;
  }
}



