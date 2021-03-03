import 'package:LoliSnatcher/libBooru/DBHandler.dart';
import 'Booru.dart';
import 'BooruHandler.dart';
import 'BooruItem.dart';

class FavouritesHandler extends BooruHandler{
  List<BooruItem> fetched = new List();
  DBHandler dbHandler;
  bool tagSearchEnabled = false;
  FavouritesHandler(Booru booru,int limit): super(booru,limit);


  Future Search(String tags, int pageNum) async{
    isActive = true;
    int length = fetched.length;
    if(this.pageNum == pageNum){
      return fetched;
    }
    this.pageNum = pageNum;
    if (prevTags != tags){
      fetched = new List();
    }
    fetched.addAll(await dbHandler.searchDB(tags,fetched.length.toString(),limit.toString()));
    prevTags = tags;
    if (fetched.length == length){locked = true;}
    isActive = false;
    return fetched;
  }


  String makeURL(String tags){
  }
  String getFileExt(fileURL){
  }
  tagSearch(String input) {
  }
}