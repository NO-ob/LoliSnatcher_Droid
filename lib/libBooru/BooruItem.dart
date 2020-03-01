class BooruItem{
  String fileURL,sampleURL,thumbnailURL,tagString,postURL;
  int id,width,height;

  BooruItem(String fileURL,String sampleURL,String thumbnailURL,String tags,String postURL){
    this.fileURL = fileURL;
    this.sampleURL = sampleURL;
    this.thumbnailURL = thumbnailURL;
    this.tagString = tags;
    this.postURL = postURL;
    print("Item created: " + postURL);
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
}