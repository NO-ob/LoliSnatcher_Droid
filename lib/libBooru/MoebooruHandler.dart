import 'GelbooruHandler.dart';
class MoebooruHandler extends GelbooruHandler{
  MoebooruHandler(String baseURL,int limit) : super(baseURL,limit);
  @override
  String makeURL(String tags){
    return "$baseURL/post.xml?tags=$tags&limit=${limit.toString()}&page=$pageNum";
  }
}