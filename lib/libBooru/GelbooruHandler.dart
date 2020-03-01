import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:xml/xml.dart' as xml;
import 'dart:convert';
import 'package:xml2json/xml2json.dart';
import 'dart:async';
import 'BooruHandler.dart';
import 'dart:developer';
import 'BooruItem.dart';
class GelbooruHandler extends BooruHandler{
  int pageNum = 0;
  int limit = 20;
  String prevTags = "";
  String baseURL = "https://gelbooru.com" + "/index.php?page=dapi&s=post&q=index&tags=";
  List<BooruItem> fetched = new List();


  Future Search(String tags) async{
    final response = await http.get(baseURL + tags + "&limit=100",headers: {"Accept": "text/html,application/xml"});
    if (response.statusCode == 200) {
      final Xml2Json myTransformer = Xml2Json();
      myTransformer.parse(response.body);
      var uwu = myTransformer.toGData();
      List<dynamic> list = json.decode(uwu)["posts"]["post"];
      for (int i =0; i < list.length; i++){
        fetched.add(new BooruItem(list[i]["file_url"],list[i]["sample_url"],list[i]["preview_url"],list[i]["tags"],list[i]["id"]));
      }
      return fetched;
    } else {
      throw Exception('Search Failed');
    }
    }
}