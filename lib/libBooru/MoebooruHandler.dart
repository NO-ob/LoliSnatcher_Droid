import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml2json/xml2json.dart';
import 'dart:async';
import 'GelbooruHandler.dart';
import 'BooruItem.dart';
class MoebooruHandler extends GelbooruHandler{
  MoebooruHandler(String baseURL,int limit) : super(baseURL,limit);
  @override
  String makeURL(String tags){
    return baseURL + "/post.xml?tags=" + tags + "&limit=" + limit.toString();
  }
}