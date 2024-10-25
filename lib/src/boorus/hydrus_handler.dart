import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';

// TODO refactor

class HydrusHandler extends BooruHandler {
  HydrusHandler(super.booru, super.limit);

  dynamic _fileIDs;

  @override
  Map<String, String> getHeaders() {
    return {
      ...super.getHeaders(),
      'Hydrus-Client-API-Access-Key': booru.apiKey!,
    };
  }

  @override
  Future<List> parseListFromResponse(dynamic response) async {
    final Map<String, dynamic> parsedResponse = response.data is String ? jsonDecode(response.data) : response.data;
    if (parsedResponse['file_ids'] != null) {
      _fileIDs = parsedResponse['file_ids'];
      return await getResultsPage(pageNum);
    } else {
      return [];
    }
  }

  Future<bool> verifyApiAccess() async {
    Logger.Inst().log('Verifying access', 'HydrusHandler', 'verifyApiAccess', LogTypes.booruHandlerInfo);
    try {
      final response = await DioNetwork.head('${booru.baseURL}/verify_access_key', headers: getHeaders());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), 'HydrusHandler', 'verifyApiAccess', LogTypes.exception);
    }
    return false;
  }

  @override
  Future search(String tags, int? pageNumCustom, {bool withCaptchaCheck = true}) async {
    if (prevTags != tags) {
      fetched.value = [];
      prevTags = tags;
    }

    final String url = makeURL(tags);
    Logger.Inst().log(url, 'HydrusHandler', 'Search', LogTypes.booruHandlerSearchURL);

    if (_fileIDs == null) {
      try {
        final response = await DioNetwork.get(url, headers: getHeaders());
        if (response.statusCode == 200) {
          final Map<String, dynamic> parsedResponse = response.data is String ? jsonDecode(response.data) : response.data;
          if (parsedResponse['file_ids'] != null) {
            _fileIDs = parsedResponse['file_ids'];
            return await getResultsPage(pageNum);
          }
          prevTags = tags;
          return fetched;
        }
      } catch (e, s) {
        Logger.Inst().log(
          e.toString(),
          'HydrusHandler',
          'Search',
          LogTypes.exception,
          s: s,
        );
        return fetched;
      }
    } else {
      return getResultsPage(pageNum);
    }
  }

  Future getResultsPage(int pageNum) async {
    limit = limit > 20 ? 20 : limit;

    try {
      final int pageMax = (_fileIDs.length > limit ? (_fileIDs.length / limit).ceil() : 1);
      if (pageNum >= pageMax) {
        locked = true;
      } else {
        final int lowerBound = ((pageNum < 1) ? 0 : pageNum * limit);
        final int upperBound = (pageNum + 1 < pageMax) ? (lowerBound + limit) : _fileIDs.length;
        String fileIDString = '[';
        for (int i = lowerBound; i < upperBound; i++) {
          fileIDString += _fileIDs[i].toString();
          if (i != upperBound - 1) {
            fileIDString += ',';
          }
        }
        fileIDString += ']';
        final String url = '${booru.baseURL}/get_files/file_metadata?file_ids=$fileIDString';
        final response = await DioNetwork.get(
          url,
          headers: {
            ...super.getHeaders(),
            if (booru.apiKey?.isNotEmpty == true) 'Hydrus-Client-API-Access-Key': booru.apiKey,
          },
        );
        if (response.statusCode == 200) {
          final parsedResponse = response.data;
          //Logger.Inst().log(response.data, "HydrusHandler", "getResultsPage", LogTypes.booruHandlerRawFetched);

          final List<BooruItem> newItems = [];
          for (int i = 0; i < parsedResponse['metadata'].length; i++) {
            final List<String> tagList = [];
            List responseTags = [];

            final Map<String, dynamic>? tagsMap = parsedResponse['metadata'][i]['tags'];
            if (tagsMap != null) {
              for (final MapEntry entry in tagsMap.entries) {
                if (entry.value['name'] == 'all known tags') {
                  responseTags = entry.value['display_tags']['0'] ?? [];
                }
              }
            }

            for (int x = 0; x < responseTags.length; x++) {
              tagList.add(responseTags[x].toString());
            }
            if (parsedResponse['metadata'][i]['file_id'] != null) {
              final List dynKnownUrls = parsedResponse['metadata'][i]['known_urls'];
              final List<String> knownUrls = [];
              if (dynKnownUrls.isNotEmpty) {
                for (final element in dynKnownUrls) {
                  knownUrls.add(element.toString());
                }
              }
              final BooruItem item = BooruItem(
                fileURL: "${booru.baseURL}/get_files/file?file_id=${parsedResponse['metadata'][i]['file_id']}&Hydrus-Client-API-Access-Key=${booru.apiKey}",
                sampleURL:
                    "${booru.baseURL}/get_files/thumbnail?file_id=${parsedResponse['metadata'][i]['file_id']}&Hydrus-Client-API-Access-Key=${booru.apiKey}",
                thumbnailURL:
                    "${booru.baseURL}/get_files/thumbnail?file_id=${parsedResponse['metadata'][i]['file_id']}&Hydrus-Client-API-Access-Key=${booru.apiKey}",
                tagsList: tagList,
                postURL:
                    "${booru.baseURL}/get_files/file_metadata?file_ids=[${parsedResponse['metadata'][i]['file_id']}]&Hydrus-Client-API-Access-Key=${booru.apiKey}",
                fileExt: parsedResponse['metadata'][i]['ext'].toString().substring(1),
                fileWidth: parsedResponse['metadata'][i]['width'].toDouble(),
                fileHeight: parsedResponse['metadata'][i]['height'].toDouble(),
                md5String: parsedResponse['metadata'][i]['hash'],
                sources: knownUrls,
                fileNameExtras: 'Hydrus_',
              );

              newItems.add(item);
            }
          }

          await afterParseResponse(newItems);
          return fetched;
        } else {
          Logger.Inst().log('Getting metadata failed', 'HydrusHandler', 'getResultsPage', LogTypes.booruHandlerInfo);
        }
      }
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        'HydrusHandler',
        'getResultsPage',
        LogTypes.exception,
        s: s,
      );
    }
    return fetched;
  }

  Future addURL(BooruItem item, {bool usePostUrl = false}) async {
    try {
      final String url = '${booru.baseURL}/add_urls/add_url';
      Logger.Inst().log(url, 'HydrusHandler', 'addURL', LogTypes.booruHandlerInfo);
      Logger.Inst().log(booru.apiKey, 'HydrusHandler', 'addURL', LogTypes.booruHandlerInfo);
      // Uses dio because darts http post doesn't send the content type header correctly and the post doesn't work
      final List<String> tags = [];
      String tagString = '';
      for (final element in item.tagsList) {
        tags.add(element.replaceAll('_', ' '));
        tagString += '"$element",';
      }
      tagString = tagString.substring(0, tagString.length - 1);
      await DioNetwork.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          if (booru.apiKey?.isNotEmpty == true) 'Hydrus-Client-API-Access-Key': booru.apiKey,
        },
        data: {
          'url': usePostUrl ? item.postURL : item.fileURL,
          'filterable_tags': item.tagsList,
        },
      );
    } catch (e, s) {
      FlashElements.showSnackbar(
        duration: null,
        title: const Text(
          'Error!',
          style: TextStyle(fontSize: 20),
        ),
        content: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Something went wrong importing to hydrus. You might not have given the correct api permissions, this can be edited in Review Services. Add tags to file and Add Urls',
            ),
            Text('You might not have given the correct api permissions, this can be edited in Review Services.'),
            Text('Add tags to file and Add Urls.'),
          ],
        ),
        leadingIcon: Icons.error_outline,
        leadingIconColor: Colors.red,
        sideColor: Colors.red,
      );

      Logger.Inst().log(
        e.toString(),
        'HydrusHandler',
        'addURL',
        LogTypes.exception,
        s: s,
      );
    }
    return fetched;
  }

  Future getAccessKey() async {
    final String url = '${booru.baseURL}/request_new_permissions?name=LoliSnatcher&basic_permissions=[3,0,2]';
    Logger.Inst().log('Requesting key: $url', 'HydrusHandler', 'getAccessKey', LogTypes.booruHandlerInfo);
    try {
      final response = await DioNetwork.get(
        url,
        headers: {
          ...super.getHeaders(),
          if (booru.apiKey?.isNotEmpty == true) 'Hydrus-Client-API-Access-Key': booru.apiKey,
        },
      );
      if (response.statusCode == 200) {
        final parsedResponse = response.data;
        Logger.Inst().log("Key Request Successful: ${parsedResponse['access_key']}", 'HydrusHandler', 'getAccessKey', LogTypes.booruHandlerInfo);
        return parsedResponse['access_key'].toString();
      } else {
        Logger.Inst().log('Key Request Failed: ${response.statusCode}', 'HydrusHandler', 'getAccessKey', LogTypes.booruHandlerInfo);
        Logger.Inst().log(response.data, 'HydrusHandler', 'getAccessKey', LogTypes.booruHandlerInfo);
      }
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        'HydrusHandler',
        'getAccessKey',
        LogTypes.exception,
        s: s,
      );
    }
    return '';
  }

  @override
  String makeURL(String tags) {
    if (tags.trim().isEmpty) {
      tags = '*';
    }
    final List<String> tagList = tags.split(',');
    int sortType = -1;
    bool ascending = false;
    for (int i = tagList.length - 1; i >= 0; i--) {
      if (tagList[i].contains('sort:')) {
        sortType = getSortType(tagList[i].split(':')[1]);
        tagList.remove(tagList[i].trim().toLowerCase());
      } else if (tagList[i].contains('order:asc')) {
        ascending = true;
        tagList.remove(tagList[i].trim().toLowerCase());
      } else if (tagList[i].contains('order:desc')) {
        ascending = false;
        tagList.remove(tagList[i].trim().toLowerCase());
      }
    }
    return "${booru.baseURL}/get_files/search_files?tags=${jsonEncode(tagList).replaceAll("%22", "'")}${sortType > -1 ? "&file_sort_type=$sortType" : ""}&file_sort_asc=$ascending";
  }

  int getSortType(String orderString) {
    switch (orderString) {
      case 'filesize':
        return 0;
      case 'duration':
        return 1;
      case 'importtime':
        return 2;
      case 'filetype':
        return 3;
      case 'random':
        return 4;
      case 'width':
        return 5;
      case 'height':
        return 6;
      case 'ratio':
        return 7;
      case 'numpixels':
        return 8;
      case 'numtags':
        return 9;
      case 'numviews':
        return 10;
      case 'totalviewtime':
        return 11;
      case 'bitrate':
        return 12;
      case 'hasaudio':
        return 13;
      case 'modifiedtime':
        return 14;
      case 'framerate':
        return 15;
      case 'framecount':
        return 16;
      case 'lastviewed':
        return 17;
      case 'archivetime':
        return 18;
      case 'hashhex':
        return 19;
      default:
        return -1;
    }
  }
}
