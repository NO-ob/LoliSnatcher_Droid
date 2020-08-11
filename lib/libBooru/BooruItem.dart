class BooruItem{
  String fileURL,sampleURL,thumbnailURL,tagString,postURL;
  int id,width,height;
  List tagsList;
  BooruItem(this.fileURL,this.sampleURL,this.thumbnailURL,this.tagsList,this.postURL){
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



