import 'Booru.dart';
abstract class BooruHandler {
  int pageNum;
  int limit = 20;
  String prevTags = "";
  Booru booru;
  BooruHandler(this.booru,this.limit);
  Future Search(String tags, int pageNum){}
  String makeURL(String tags){}
}