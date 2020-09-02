import 'GelbooruHandler.dart';
import 'Booru.dart';
/**
 * Booru Handler for the gelbooru engine only difference do gelbooru is the search/api url all the returned data is the same
 */
class MoebooruHandler extends GelbooruHandler{
  MoebooruHandler(Booru booru,int limit) : super(booru,limit);
  @override
  // This will create a url to goto the images page in the browser
  String makePostURL(String id){
    return "${booru.baseURL}/post/show/$id/";
  }
  @override
  // This will create a url for the http request
  String makeURL(String tags){
    if (booru.apiKey == ""){
      return "${booru.baseURL}/post.xml?tags=$tags&limit=${limit.toString()}&page=$pageNum";
    } else {
      return "${booru.baseURL}/post.xml?login=${booru.userID}&api_key=${booru.apiKey}&tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
    }
  }
}