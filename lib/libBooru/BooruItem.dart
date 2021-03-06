class BooruItem{
  String fileURL,sampleURL,thumbnailURL,postURL,fileExt;
  List tagsList;
  String mediaType;
  bool isSnatched = false, isFavourite = false;
  String idOnHost = "";
  BooruItem(this.fileURL,this.sampleURL,this.thumbnailURL,this.tagsList,this.postURL, String fileExt){
    if (this.sampleURL.isEmpty){
      this.sampleURL = this.thumbnailURL;
    }
    this.fileExt = fileExt.toLowerCase();
    if (this.fileExt == "webm" || this.fileExt == "mp4"){
      this.mediaType = "video";
    } else {
      this.mediaType = "image";
    }
  }
  bool isVideo(){
    return (this.mediaType == "video");
  }
  toJSON(){
    return {'postURL': "$postURL",'fileURL': "$fileURL", 'sampleURL': "$sampleURL", 'thumbnailURL': "$thumbnailURL", 'tags': tagsList, 'fileExt': fileExt};
  }
}



