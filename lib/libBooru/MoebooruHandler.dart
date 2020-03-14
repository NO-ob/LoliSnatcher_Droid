import 'GelbooruHandler.dart';
/**
 * Booru Handler for the gelbooru engine only difference do gelbooru is the search/api url all the returned data is the same
 */
class MoebooruHandler extends GelbooruHandler{
  MoebooruHandler(String baseURL,int limit) : super(baseURL,limit);
  @override
  // This will create a url for the http request
  String makeURL(String tags){
    return "$baseURL/post.xml?tags=$tags&limit=${limit.toString()}&page=$pageNum";
  }
}