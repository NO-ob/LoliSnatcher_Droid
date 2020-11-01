import 'Booru.dart';
import 'BooruItem.dart';
abstract class BooruHandler {
  int pageNum;
  int limit = 20;
  String prevTags = "";
  Booru booru;
  List<BooruItem> fetched;
  bool tagSearchEnabled = true;
  BooruHandler(this.booru,this.limit);
  Future Search(String tags, int pageNum){}
  String makeURL(String tags){}
  List getFetched(){
    return fetched;
  }
  tagSearch(String input) {}
}