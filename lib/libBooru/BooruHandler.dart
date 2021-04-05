import 'Booru.dart';
import 'BooruItem.dart';
import 'DBHandler.dart';
abstract class BooruHandler {
  // pagenum = -1 as "didn't load anything yet" state
  // gets set to higher number for special cases in handler factory
  int pageNum = -1; 
  int limit = 20;
  String prevTags = "";
  bool locked = false;
  Booru booru;
  String verStr = "1.8.0";
  List<BooruItem> fetched = [];
  bool tagSearchEnabled = true;
  bool hasSizeData = false;
  bool isActive = false;
  DBHandler? dbHandler;
  BooruHandler(this.booru,this.limit);
  Future? Search(String tags, int pageNum){}
  String? makeURL(String tags){}
  tagSearch(String input) {}

  String getDescription() {
    return '';
  }

  //set the isSnatched and isFavourite booleans for a BooruItem in fetched
  Future setTrackedValues(int fetchedIndex) async{
    if (dbHandler!.db != null){
      List<bool> values = await dbHandler!.getTrackedValues(fetched[fetchedIndex].fileURL);
      fetched[fetchedIndex].isSnatched = values[0];
      fetched[fetchedIndex].isFavourite = values[1];
    }
  }
}