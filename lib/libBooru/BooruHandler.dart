import 'Booru.dart';
import 'BooruItem.dart';
import 'DBHandler.dart';
abstract class BooruHandler {
  int pageNum;
  int limit = 20;
  String prevTags = "";
  bool locked = false;
  Booru booru;
  String verStr = "1.7.5";
  List<BooruItem> fetched;
  bool tagSearchEnabled = true;
  bool isActive = false;
  DBHandler dbHandler;
  BooruHandler(this.booru,this.limit);
  Future Search(String tags, int pageNum){}
  String makeURL(String tags){}
  String getFileExt(fileURL){
    return fileURL.substring(fileURL.lastIndexOf(".") + 1);
  }
  tagSearch(String input) {}
}