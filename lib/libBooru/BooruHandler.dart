import 'Booru.dart';
import 'BooruItem.dart';
import 'DBHandler.dart';
abstract class BooruHandler {
  int? pageNum;
  int limit = 20;
  String prevTags = "";
  bool locked = false;
  Booru booru;
  String verStr = "1.7.9";
  List<BooruItem>? fetched;
  bool tagSearchEnabled = true;
  bool isActive = false;
  DBHandler? dbHandler;
  BooruHandler(this.booru,this.limit);
  Future? Search(String tags, int pageNum){}
  String? makeURL(String tags){}
  String getFileExt(fileURL){
    return fileURL.substring(fileURL.lastIndexOf(".") + 1);
  }
  tagSearch(String input) {}

  //set the isSnatched and isFavourite booleans for a BooruItem in fetched
  Future setTrackedValues(int fetchedIndex) async{
    if (dbHandler!.db != null){
      List<bool> values = await dbHandler!.getTrackedValues(fetched![fetchedIndex].fileURL!);
      fetched![fetchedIndex].isSnatched = values[0];
      fetched![fetchedIndex].isFavourite = values[1];
    }
  }
}