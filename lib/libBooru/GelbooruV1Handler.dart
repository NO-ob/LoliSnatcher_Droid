import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'Booru.dart';
import 'package:LoliSnatcher/Tools.dart';

/**
 * Booru Handler for the gelbooru engine
 */
class GelbooruV1Handler extends BooruHandler{
  // Dart constructors are weird so it has to call super with the args
  GelbooruV1Handler(Booru booru,int limit): super(booru,limit);
  bool tagSearchEnabled = false;
    @override
    String validateTags(tags){
      if(tags == " " || tags == ""){
        return "all";
      } else {
        return tags;
      }
    }
    void parseResponse(response){
      var document = parse(response.body);
      var spans = document.getElementsByClassName("thumb");
      for (int i = 0; i < spans.length; i++){
        if (spans.elementAt(i).children[0].firstChild!.attributes["src"] != null){
          String id = spans.elementAt(i).children[0].attributes["id"]!.substring(1);
          String thumbURL = spans.elementAt(i).children[0].firstChild!.attributes["src"]!;
          String fileURL = thumbURL.replaceFirst("thumbs", "img").replaceFirst("thumbnails", "images").replaceFirst("thumbnail_", "");
          List<String> tags = spans.elementAt(i).children[0].firstChild!.attributes["title"]!.split(" ");
          /**
           * Add a new booruitem to the list .getAttribute will get the data assigned to a particular tag in the xml object
           */
          fetched.add(BooruItem(
            fileURL: fileURL,
            sampleURL: fileURL,
            thumbnailURL: thumbURL,
            tagsList: tags,
            postURL: makePostURL(id),
          ));
          if(dbHandler!.db != null){
            setTrackedValues(fetched.length - 1);
          }
        }
      }
    }
    // This will create a url to goto the images page in the browser
    String makePostURL(String id){
      return "${booru.baseURL}/index.php?page=post&s=view&id=$id";
    }
    // This will create a url for the http request
    String makeURL(String tags){
      return "${booru.baseURL}/index.php?page=post&s=list&tags=${tags.replaceAll(" ", "+")}&pid=${(pageNum * 20).toString()}";
    }
}