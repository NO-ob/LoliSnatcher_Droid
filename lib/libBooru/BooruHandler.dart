abstract class BooruHandler {
  int pageNum;
  int limit = 20;
  String baseURL = "";
  String prevTags = "";
  BooruHandler(this.baseURL,this.limit);
  Future Search(String tags, int pageNum){}
  String makeURL(String tags){}
}