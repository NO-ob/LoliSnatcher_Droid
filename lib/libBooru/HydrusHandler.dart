import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'Booru.dart';

/**
 * Booru Handler for the gelbooru engine
 */
class HydrusHandler extends BooruHandler{
  List<BooruItem> fetched = new List();
  bool tagSearchEnabled = false;
  // Dart constructors are weird so it has to call super with the args
  HydrusHandler(Booru booru,int limit): super(booru,limit);

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags,int pageNum) async{
    if(this.pageNum == pageNum){
      return fetched;
    }
    this.pageNum = pageNum;
    if (prevTags != tags){
      fetched = new List();
    }
    String url = makeURL(tags);
    print(url);
    try {
      int length = fetched.length;
      final response = await http.get(url,headers: {"Accept": "text/html,application/xml", "user-agent":"LoliSnatcher_Droid/1.7.0","Hydrus-Client-API-Access-Key" : booru.apiKey});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        Map<String, dynamic> parsedResponse = jsonDecode(response.body);
        if (parsedResponse['file_ids'] != null) {
          try {
            url = "${booru.baseURL}/get_files/file_metadata?file_ids=${jsonEncode(parsedResponse['file_ids'])}";
            final response = await http.get(url,headers: {"Accept": "text/html,application/xml", "user-agent":"LoliSnatcher_Droid/1.7.0","Hydrus-Client-API-Access-Key" : booru.apiKey});
            if (response.statusCode == 200) {
              parsedResponse = jsonDecode(response.body);
              print(parsedResponse['metadata']);
              for (int i = 0; i < parsedResponse['metadata'].length; i++){
                if (!parsedResponse['metadata'][i]['mime'].toString().contains("video")){
                  List<String> tagList = new List();
                  for (int x = 0; x < parsedResponse['metadata'][i]['service_names_to_statuses_to_tags']['my tags']['0'].length; x++){
                    tagList.add(parsedResponse['metadata'][i]['service_names_to_statuses_to_tags']['my tags']['0'][x].toString());
                  }
                  fetched.add(new BooruItem("${booru.baseURL}/get_files/file?file_id=${parsedResponse['metadata'][i]['file_id']}&Hydrus-Client-API-Access-Key=${booru.apiKey}", "${booru.baseURL}/get_files/thumbnail?file_id=${parsedResponse['metadata'][i]['file_id']}&Hydrus-Client-API-Access-Key=${booru.apiKey}", "${booru.baseURL}/get_files/thumbnail?file_id=${parsedResponse['metadata'][i]['file_id']}&Hydrus-Client-API-Access-Key=${booru.apiKey}", tagList, "postURL"));
                } else {
                }
                //print(fetched.elementAt(0).toJSON());
              }
            }
          }catch(e){

          }
        }
        prevTags = tags;
        locked = true;
        return fetched;
      }
    } catch(e) {
      print(e);
      return fetched;
    }

    }
    Future getAccessKey() async{
      String url = "${booru.baseURL}/request_new_permissions?name=LoliSnatcher&basic_permissions=[3]";
      try {
        final response = await http.get(url,headers: {"Accept": "text/html,application/xml", "user-agent":"LoliSnatcher_Droid/1.7.0","Hydrus-Client-API-Access-Key" : booru.apiKey});
        if (response.statusCode == 200) {
          var parsedResponse = jsonDecode(response.body);
          return parsedResponse['access_key'].toString();
        }
      } catch (e){
        print("HydrusHandler::getAccessKey::AccessKeyError");
      }
      return "";
    }
    // This will create a url for the http request
    String makeURL(String tags){
      String tag;
      print(tags);
      if (tags.isEmpty){
        tag = "[]";
      } else if (tags.contains(" ")){
        tag = jsonEncode(tags.split(" "));
      } else {
        tag = "[${jsonEncode(tags)}]";
      }
      return "${booru.baseURL}/get_files/search_files?tags=$tag";
    }
    String makeTagURL(String input){
      return "${booru.baseURL}/index.php?page=dapi&s=tag&q=index&name_pattern=$input%&limit=5";
    }

}