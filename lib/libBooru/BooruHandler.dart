import 'Booru.dart';
import 'BooruItem.dart';
abstract class BooruHandler {
  int pageNum;
  int limit = 20;
  String prevTags = "";
  bool locked = false;
  Booru booru;
  List<BooruItem> fetched;
  bool tagSearchEnabled = true;
  BooruHandler(this.booru,this.limit);
  Future Search(String tags, int pageNum){}
  String makeURL(String tags){}
  List getFetched(){
    return fetched;
  }
  String getFileExt(fileURL){
    return fileURL.substring(fileURL.lastIndexOf(".") + 1);
  }
  tagSearch(String input) {}
}