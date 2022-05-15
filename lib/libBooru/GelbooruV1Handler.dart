import 'package:html/parser.dart';

import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/utilities/Logger.dart';

/**
 * Booru Handler for the gelbooru engine
 */
class GelbooruV1Handler extends BooruHandler{
  // Dart constructors are weird so it has to call super with the args
  GelbooruV1Handler(Booru booru,int limit): super(booru,limit);

  @override
  String className = "GelbooruV1Handler";

  @override
  bool tagSearchEnabled = false;

  @override
  String validateTags(tags){
    if(tags == " " || tags == ""){
      return "all";
    } else {
      return tags;
    }
  }

  @override
  void parseResponse(response) {
    var document = parse(response.body);
    var spans = document.getElementsByClassName("thumb");
    if(booru.baseURL!.contains("://realbooru.com")){
      return;
    }
    List<BooruItem> newItems = [];
    for (int i = 0; i < spans.length; i++){
      Logger.Inst().log(spans.elementAt(i).children[0].innerHtml, className, "parseResponse", LogTypes.booruHandlerRawFetched);
      if (spans.elementAt(i).children[0].firstChild!.attributes["src"] != null){
        String id = spans.elementAt(i).children[0].attributes["id"]!.substring(1);
        String thumbURL = spans.elementAt(i).children[0].firstChild!.attributes["src"]!;
        String fileURL = thumbURL.replaceFirst("thumbs", "img").replaceFirst("thumbnails", "images").replaceFirst("thumbnail_", "");
        List<String> tags = spans.elementAt(i).children[0].firstChild!.attributes["title"]!.split(" ");
        /**
         * Add a new booruitem to the list .getAttribute will get the data assigned to a particular tag in the xml object
         */
        BooruItem item = BooruItem(
          fileURL: fileURL,
          sampleURL: fileURL,
          thumbnailURL: thumbURL,
          tagsList: tags,
          md5String: getHashFromURL(thumbURL),
          postURL: makePostURL(id),
        );

        newItems.add(item);
      }
    }

    int lengthBefore = fetched.length;
    fetched.addAll(newItems);
    setMultipleTrackedValues(lengthBefore, fetched.length);
  }

  String getHashFromURL(String url){
    String hash = url.substring(url.lastIndexOf("_") + 1,url.lastIndexOf("."));
    return hash;
  }

  // This will create a url to goto the images page in the browser
  @override
  String makePostURL(String id){
    return "${booru.baseURL}/index.php?page=post&s=view&id=$id";
  }

  // This will create a url for the http request
  @override
  String makeURL(String tags){
    return "${booru.baseURL}/index.php?page=post&s=list&tags=${tags.replaceAll(" ", "+")}&pid=${(pageNum * 20).toString()}";
  }
}