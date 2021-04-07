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
  toJSON() {
    return {'postURL': "$postURL",'fileURL': "$fileURL", 'sampleURL': "$sampleURL", 'thumbnailURL': "$thumbnailURL", 'tags': tagsList, 'fileExt': fileExt};
  }
}



