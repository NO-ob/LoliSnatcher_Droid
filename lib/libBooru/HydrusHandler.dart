import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/utilities/Logger.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';

/**
 * Booru Handler for the gelbooru engine
 */
class HydrusHandler extends BooruHandler{
  bool tagSearchEnabled = false;
  var _fileIDs;
  // Dart constructors are weird so it has to call super with the args
  HydrusHandler(Booru booru,int limit): super(booru,limit);

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  @override
  Future Search(String tags, int? pageNumCustom) async {
    List tagList = [];
  
    if (limit > 20){
      this.limit = 20;
    }

    if (prevTags != tags){
      fetched.value = [];
      prevTags = tags;
    }

    String url = makeURL(tags);
    Logger.Inst().log(url, "HydrusHandler", "Search", LogTypes.booruHandlerSearchURL);

    if (_fileIDs == null) {
      try {
        Uri uri = Uri.parse(url);
        final response = await http.get(uri,headers: {"Accept": "text/html,application/xml", "user-agent":"LoliSnatcher_Droid/$verStr","Hydrus-Client-API-Access-Key" : booru.apiKey!});
        if (response.statusCode == 200) {
          Map<String, dynamic> parsedResponse = jsonDecode(response.body);
          if (parsedResponse['file_ids'] != null) {
            _fileIDs = parsedResponse['file_ids'];
            return await getResultsPage(pageNum);
          }
          prevTags = tags;
          return fetched;
        }
      } catch(e) {
        Logger.Inst().log(e.toString(), "HydrusHandler", "Search", LogTypes.exception);
        return fetched;
      }
    } else {
      return await getResultsPage(pageNum);
    }
  }

  Future getResultsPage(int pageNum) async{
    try {
      int pageMax = (_fileIDs.length > limit ? (_fileIDs.length / limit).ceil() : 1);
      if (pageNum >= pageMax) {
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
        String url = "${booru.baseURL}/get_files/file_metadata?file_ids=$fileIDString";
        Uri uri = Uri.parse(url);
        final response = await http.get(uri,headers: {"Accept": "text/html,application/xml", "user-agent":"LoliSnatcher_Droid/$verStr","Hydrus-Client-API-Access-Key" : booru.apiKey!});
        if (response.statusCode == 200) {
          var parsedResponse = jsonDecode(response.body);
          Logger.Inst().log(response.body, "HydrusHandler", "getResultsPage", LogTypes.booruHandlerRawFetched);

          List<BooruItem> newItems = [];
          for (int i = 0; i < parsedResponse['metadata'].length; i++) {
              List<String> tagList = [];
              var responseTags;
              //@seniorm0ment
              if (parsedResponse['metadata'][i]['service_names_to_statuses_to_display_tags']['all known tags'] != null) {
                responseTags = (parsedResponse['metadata'][i]['service_names_to_statuses_to_display_tags']['all known tags']['0'] == null) ? parsedResponse['metadata'][i]['service_names_to_statuses_to_display_tags']['all known tags']['1'] : parsedResponse['metadata'][i]['service_names_to_statuses_to_display_tags']['all known tags']['0'];
              }
              if(parsedResponse['metadata'][i]['service_names_to_statuses_to_tags']['all known tags'] != null && responseTags == null){
                responseTags = (parsedResponse['metadata'][i]['service_names_to_statuses_to_tags']['all known tags']['0'] == null) ? parsedResponse['metadata'][i]['service_names_to_statuses_to_tags']['all known tags']['1'] : parsedResponse['metadata'][i]['service_names_to_statuses_to_tags']['all known tags']['0'];
              }
              if (responseTags != null){
                for (int x = 0; x < responseTags.length; x++){
                  tagList.add(responseTags[x].toString());
                }
              }
              if (parsedResponse['metadata'][i]['file_id'] != null){
                List dynKnownUrls = parsedResponse['metadata'][i]['known_urls'];
                List<String> knownUrls = [];
                if (dynKnownUrls.isNotEmpty){
                  for (var element in dynKnownUrls) {
                    knownUrls.add(element.toString());
                  }
                }
                BooruItem item = BooruItem(
                  fileURL: "${booru.baseURL}/get_files/file?file_id=${parsedResponse['metadata'][i]['file_id']}&Hydrus-Client-API-Access-Key=${booru.apiKey}",
                  sampleURL: "${booru.baseURL}/get_files/thumbnail?file_id=${parsedResponse['metadata'][i]['file_id']}&Hydrus-Client-API-Access-Key=${booru.apiKey}",
                  thumbnailURL: "${booru.baseURL}/get_files/thumbnail?file_id=${parsedResponse['metadata'][i]['file_id']}&Hydrus-Client-API-Access-Key=${booru.apiKey}",
                  tagsList: tagList,
                  postURL: '',
                  fileExt: parsedResponse['metadata'][i]['ext'].toString().substring(1),
                  fileWidth: parsedResponse['metadata'][i]['width'].toDouble(),
                  fileHeight: parsedResponse['metadata'][i]['height'].toDouble(),
                  md5String: parsedResponse['metadata'][i]['hash'],
                  sources: knownUrls,
                );

                newItems.add(item);
              }
          }

          int lengthBefore = fetched.length;
          fetched.addAll(newItems);
          setMultipleTrackedValues(lengthBefore, fetched.length);
          return fetched;
        } else {
          Logger.Inst().log("Getting metadata failed", "HydrusHandler", "getResultsPage", LogTypes.booruHandlerInfo);
        }
      }
    }catch(e){
      Logger.Inst().log(e.toString(), "HydrusHandler", "getResultsPage", LogTypes.exception);
    }
    return fetched;
  }

  Future addURL(BooruItem item) async{
    try {
      String url = "${booru.baseURL}/add_urls/add_url";
      Uri uri = Uri.parse(url);
      Logger.Inst().log(url, "HydrusHandler", "addURL", LogTypes.booruHandlerInfo);
      Logger.Inst().log(booru.apiKey!, "HydrusHandler", "addURL", LogTypes.booruHandlerInfo);
      // Uses dio because darts http post doesn't send the content type header correctly and the post doesn't work
      var dio = Dio();
      List<String> tags = [];
      String tagString = '';
      for (var element in item.tagsList) {
        tags.add(element.replaceAll("_", " "));
        tagString += '"$element",';
      }
      tagString = tagString.substring(0,tagString.length -1);
      Response dioResponse = await dio.post(url,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          "Hydrus-Client-API-Access-Key":booru.apiKey!
        }),
        data: jsonEncode({"url": item.fileURL,
          "filterable_tags":item.tagsList
        }),
      );
    } catch(e) {
      FlashElements.showSnackbar(
        duration: null,
        title: Text(
          "Error!",
          style: TextStyle(fontSize: 20)
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Something went wrong importing to hydrus. You might not have given the correct api permissions, this can be edited in Review Services. Add tags to file and Add Urls'),
            Text('You might not have given the correct api permissions, this can be edited in Review Services.'),
            Text('Add tags to file and Add Urls.'),
          ],
        ),
        leadingIcon: Icons.error_outline,
        leadingIconColor: Colors.red,
        sideColor: Colors.red,
      );

      Logger.Inst().log(e.toString(), "HydrusHandler", "addURL", LogTypes.exception);
    }
    return fetched;
  }

  Future getAccessKey() async {
    String url = "${booru.baseURL}/request_new_permissions?name=LoliSnatcher&basic_permissions=[3,0,2]";
    Logger.Inst().log("Requesting key: " + url, "HydrusHandler", "getAccessKey", LogTypes.booruHandlerInfo);
    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri,headers: {"Accept": "text/html,application/xml", "user-agent":"LoliSnatcher_Droid/$verStr","Hydrus-Client-API-Access-Key" : booru.apiKey!});
      if (response.statusCode == 200) {
        var parsedResponse = jsonDecode(response.body);
        Logger.Inst().log("Key Request Successful: " + parsedResponse['access_key'].toString(), "HydrusHandler", "getAccessKey", LogTypes.booruHandlerInfo);
        return parsedResponse['access_key'].toString();
      } else {
        Logger.Inst().log("Key Request Failed: " + response.statusCode.toString(), "HydrusHandler", "getAccessKey", LogTypes.booruHandlerInfo);
        Logger.Inst().log(response.body, "HydrusHandler", "getAccessKey", LogTypes.booruHandlerInfo);
      }
    } catch (e){
      Logger.Inst().log(e.toString(), "HydrusHandler", "getAccessKey", LogTypes.exception);
    }
    return "";
  }

  // This will create a url for the http request
  String makeURL(String tags) {
    String tag;
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
