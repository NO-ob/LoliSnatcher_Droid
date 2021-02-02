class BooruItem{
  String fileURL,sampleURL,thumbnailURL,tagString,postURL,fileExt;
  List tagsList;
  String mediaType;
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

  String get file{
    return fileURL;
  }
  String get sample{
    return sampleURL;
  }
  String get thumbnail {
    return thumbnailURL;
  }
  List<String> get tags{
    return tagString.split(" ");
  }
  bool isVideo(){
    return (this.mediaType == "video");
  }
  toJSON(){
    return {'postURL': "$postURL",'fileURL': "$fileURL", 'sampleURL': "$sampleURL", 'thumbnailURL': "$thumbnailURL", 'tags': tagsList, 'fileExt': fileExt};
  }
}



