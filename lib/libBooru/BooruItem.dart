class BooruItem{
  String fileURL,sampleURL,thumbnailURL,tagString,postURL;
  int id,width,height;

  BooruItem(this.fileURL,this.sampleURL,this.thumbnailURL,this.tagString,this.postURL){
    print("Item created: " + postURL);
    print(this);
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