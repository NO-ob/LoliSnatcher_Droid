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
  List<BooruItem>? fetched = [];
  bool tagSearchEnabled = false;
  var _fileIDs;
  // Dart constructors are weird so it has to call super with the args
  HydrusHandler(Booru booru,int limit): super(booru,limit);

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags,int pageNum) async{
    List tagList = [];
    isActive = true;
    if (limit > 20){this.limit = 20;}
    if(this.pageNum == pageNum){
      return fetched;
    }
    this.pageNum = pageNum;
    if (prevTags != tags){
      print("making new fetched list");
      fetched = [];
      prevTags = tags;
    }
    String url = makeURL(tags);
    print(url);
    if (_fileIDs == null) {
      try {
        Uri uri = Uri.parse(url);
        final response = await http.get(uri,headers: {"Accept": "text/html,application/xml", "user-agent":"LoliSnatcher_Droid/$verStr","Hydrus-Client-API-Access-Key" : booru.apiKey!});
        //print("----------------Hydrus Search----------------------");
        //print("Search url: " + url);
        //print("Hydrus key: " + booru.apiKey);
        //print("Status code: " + response.statusCode.toString());
        //print(response.body);
        if (response.statusCode == 200) {
          Map<String, dynamic> parsedResponse = jsonDecode(response.body);
          if (parsedResponse['file_ids'] != null) {
            _fileIDs = parsedResponse['file_ids'];
            return await getResultsPage(pageNum);
          }
          prevTags = tags;
          isActive = false;
          return fetched;
        }
      } catch(e) {
        print(e);
        isActive = false;
        return fetched;
      }
    } else {
      return await getResultsPage(pageNum);
    }
    }

    Future getResultsPage(pageNum) async{
      try {
        int pageMax = (_fileIDs.length > limit ? (_fileIDs.length / limit).ceil() : 1);
        if (pageNum >= pageMax){
          locked = true;
        } else {
          int lowerBound = ((pageNum < 1) ? 0 : pageNum * limit);
          int upperBound = (pageNum + 1< pageMax) ? (lowerBound + limit) : _fileIDs.length;
          String fileIDString = '[';
          for (int i = lowerBound; i < upperBound ; i++){
            fileIDString += _fileIDs[i].toString();
            if(i != upperBound - 1) {fileIDString +=',';}
          }
          fileIDString += ']';
          print(fileIDString);
          String url = "${booru.baseURL}/get_files/file_metadata?file_ids=$fileIDString";
          Uri uri = Uri.parse(url);
          final response = await http.get(uri,headers: {"Accept": "text/html,application/xml", "user-agent":"LoliSnatcher_Droid/$verStr","Hydrus-Client-API-Access-Key" : booru.apiKey!});
          //print("----------------Hydrus Search----------------------");
          //print("Metadata url: " + url);
          //print("Hydrus key: " + booru.apiKey);
          //print("Status code: " + response.statusCode.toString());
          //print(response.body);
          if (response.statusCode == 200) {
            var parsedResponse = jsonDecode(response.body);
            for (int i = 0; i < parsedResponse['metadata'].length; i++){
                List<String> tagList = [];
                print(parsedResponse['metadata'][i]['service_names_to_statuses_to_tags']);
                var responseTags = (parsedResponse['metadata'][i]['service_names_to_statuses_to_tags']['all known tags']['0'] == null) ? parsedResponse['metadata'][i]['service_names_to_statuses_to_tags']['all known tags']['1'] : parsedResponse['metadata'][i]['service_names_to_statuses_to_tags']['all known tags']['0'];
                if (responseTags != null){
                  for (int x = 0; x < responseTags.length; x++){
                    tagList.add(responseTags[x].toString());
                  }
                }
                fetched!.add(new BooruItem("${booru.baseURL}/get_files/file?file_id=${parsedResponse['metadata'][i]['file_id']}&Hydrus-Client-API-Access-Key=${booru.apiKey}", "${booru.baseURL}/get_files/thumbnail?file_id=${parsedResponse['metadata'][i]['file_id']}&Hydrus-Client-API-Access-Key=${booru.apiKey}", "${booru.baseURL}/get_files/thumbnail?file_id=${parsedResponse['metadata'][i]['file_id']}&Hydrus-Client-API-Access-Key=${booru.apiKey}", tagList, "postURL", parsedResponse['metadata'][i]['ext'].toString().substring(1)));
                if(dbHandler!.db != null){
                  setTrackedValues(fetched!.length - 1);
                }
            }
            isActive = false;
            return fetched;
          } else {
            print("Getting metadata failed");
          }
        }
      }catch(e){
        print("Except caught when fetching metadata");
        print(e);
      }
      isActive = false;
      return fetched;
    }

    Future getAccessKey() async{
      String url = "${booru.baseURL}/request_new_permissions?name=LoliSnatcher&basic_permissions=[3]";
      print("Requesting key: " + url);
      try {
        Uri uri = Uri.parse(url);
        final response = await http.get(uri,headers: {"Accept": "text/html,application/xml", "user-agent":"LoliSnatcher_Droid/$verStr","Hydrus-Client-API-Access-Key" : booru.apiKey!});
        if (response.statusCode == 200) {
          var parsedResponse = jsonDecode(response.body);
          print("Key Request Successful: " + parsedResponse['access_key'].toString());
          return parsedResponse['access_key'].toString();
        } else {
          print("Key Request Failed: " + response.statusCode.toString());
          print(response.body);
        }
      } catch (e){
        print("HydrusHandler::getAccessKey::AccessKeyError");
        print("e");
      }
      return "";
    }

    // This will create a url for the http request
    String makeURL(String tags){
      String tag;
      print(tags);
      if (tags.isEmpty){
        tag = "[]";
      } else if (tags.contains(",")){
        tag = jsonEncode(tags.split(","));
      } else {
        tag = "[${jsonEncode(tags)}]";
      }
      return "${booru.baseURL}/get_files/search_files?tags=$tag";
    }
    String makeTagURL(String input){
      return "${booru.baseURL}/index.php?page=dapi&s=tag&q=index&name_pattern=$input%&limit=10";
    }

}
