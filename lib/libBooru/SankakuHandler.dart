import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'Booru.dart';
import 'BooruHandler.dart';
import 'BooruItem.dart';

class SankakuHandler extends BooruHandler{
  SankakuHandler(Booru booru,int limit) : super(booru,limit);
  bool tagSearchEnabled = true;
  String authToken = '';

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags,int pageNum) async{
    isActive = true;
    hasSizeData = true;
    int length = fetched.length;
    // if(this.pageNum == pageNum){
    //   return fetched;
    // }
    this.pageNum = pageNum;
    if (prevTags != tags){
      fetched = [];
    }
    String url = makeURL(tags);
    print(url);
    try {
      if(authToken == '' && booru.userID != '' && booru.apiKey != '') {
        authToken = await getAuthToken();
        print("++++++++++++++++++++++++++++++++++++++++++++++++++");
        print(authToken);
      }
      Map<String,String> headers = authToken == ''
      ? {
        "Content-Type":"application/json",
        "Accept": "application/json",
        "user-agent":"Mozilla/5.0 (Linux x86_64; rv:86.0) Gecko/20100101 Firefox/86.0"
      }
      : {
        "Content-Type":"application/json",
        "Accept": "application/json",
        "Authorization": authToken,
        "user-agent":"Mozilla/5.0 (Linux x86_64; rv:86.0) Gecko/20100101 Firefox/86.0"
      };
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: headers);
      // 200 is the success http response code
      if (response.statusCode == 200) {
        List<dynamic> parsedResponse = jsonDecode(response.body);
        // Create a BooruItem for each post in the list
        for (int i = 0; i < parsedResponse.length; i++){
          var current = parsedResponse[i];
          List<String> tags = [];
          for (int x=0; x < current['tags'].length; x++) {
            tags.add(current['tags'][x]['name'].toString());
          }
          if (current['file_url'] != null) {
            String fileExt = current['file_type'].split('/')[1]; // image/jpeg
            fetched.add(BooruItem(
              fileURL: current['file_url'],
              sampleURL: current['sample_url'],
              thumbnailURL: current['preview_url'],
              tagsList: tags,
              postURL: makePostURL(current['id'].toString()),
              fileSize: current['file_size'],
              fileWidth: current['width'].toDouble(),
              fileHeight: current['height'].toDouble(),
              sampleWidth: current['sample_width'].toDouble(),
              sampleHeight: current['sample_height'].toDouble(),
              previewWidth: current['preview_width'].toDouble(),
              previewHeight: current['preview_height'].toDouble(),
              hasNotes: current['has_notes'],
              serverId: current['id'].toString(),
              rating: current['rating'],
              score: current['total_score'].toString(),
              sources: [current['source']],
              md5String: current['md5'],
              postDate: DateTime.fromMillisecondsSinceEpoch(int.parse(current['created_at']['s'].toString() + '000')).toString(), // unix time without in seconds (need to x1000?)
              postDateFormat: "yyyy-MM-dd HH:mm:ss.SSS",
            ));
            if (dbHandler!.db != null) {
              setTrackedValues(fetched.length - 1);
            }
          }
        }
        prevTags = tags;
        if (fetched.length == length){locked = true;}
        isActive = false;
        return fetched;
      } else {
        print('Sankaku load fail ${response.statusCode}');
        print(response.body);

      }
    } catch(e) {
      print(e);
      isActive = false;
      return fetched;
    }

  }
  // This will create a url to goto the images page in the browser
  String makePostURL(String id){
    return "https://chan.sankakucomplex.com/post/show/$id";
  }
  // This will create a url for the http request
  String makeURL(String tags){
    return "${booru.baseURL}/posts?tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
  }

  // This will fetch authToken on the first load
  Future<String> getAuthToken() async {
    String token = '';
    Uri uri = Uri.parse('${booru.baseURL}/auth/token?lang=english');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json', "user-agent":"Mozilla/5.0 (Linux x86_64; rv:81.0) Gecko/20100101 Firefox/81.0"},
      body: jsonEncode({'login': booru.userID, 'password': booru.apiKey}),
      encoding: Encoding.getByName("utf-8"),
    );

    if (response.statusCode == 200) {
      var parsedResponse = jsonDecode(response.body);
      if(parsedResponse['success']) {
        print('Sankaku auth token loaded');
        token = '${parsedResponse['token_type']} ${parsedResponse['access_token']}';
      }
    }
    if(token == '') {
      print('Sankaku auth error');
      print(response.statusCode);
    }

    return token;
  }

  String makeTagURL(String input){
    return "${booru.baseURL}/tags?name=${input.toLowerCase()}&limit=10";
  }
  @override
  Future tagSearch(String input) async {
    List<String> searchTags = [];
    String url = makeTagURL(input);
    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri,headers: {"Accept": "application/json", "user-agent":"Mozilla/5.0 (Linux x86_64; rv:81.0) Gecko/20100101 Firefox/81.0"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var parsedResponse = jsonDecode(response.body);
        // print(parsedResponse);
        if (parsedResponse.length > 0){
          for (int i=0; i < parsedResponse.length; i++){
            searchTags.add(parsedResponse[i]['name']);
          }
        }
      }
    } catch(e) {
      print(e);
    }
    print(searchTags.length);
    return searchTags;
  }
  }


