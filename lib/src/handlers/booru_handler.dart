import 'dart:math';
import 'dart:async';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/comment_item.dart';
import 'package:lolisnatcher/src/data/note_item.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

// TODO better naming for some functions (i.e. Search => getSearch or smth like that)

abstract class BooruHandler {
  // pagenum = -1 as "didn't load anything yet" state
  // gets set to higher number for special cases in handler factory
  // TODO get rid of that logic and add pageOffset variable for special cases
  int pageNum = -1;
  int limit = 20;
  String prevTags = "";
  bool locked = false;
  Booru booru;
  
  String errorString = '';
  List failedItems = [];

  Map<String, TagType> tagTypeMap = {};
  Map<String,String> tagModifierMap = {
    "rating:" : "R",
    "artist:" : "A",
    "order:" : "O",
    "sort:" : "S",
  };

  RxList<BooruItem> fetched = RxList<BooruItem>([]);
  List<BooruItem> get filteredFetched => fetched.where((el) => SettingsHandler.instance.filterHated ? !el.isHated.value : true).toList();

  String get className => runtimeType.toString();

  bool hasSizeData = false;

  BooruHandler(this.booru, this.limit);

  /// This function will call a http request using the tags and pagenumber parsed to it
  /// it will then create a list of booruItems
  Future search(String tags, int? pageNumCustom) async {
    // set custom page number
    if (pageNumCustom != null) {
      pageNum = pageNumCustom;
    }

    // validate tags (usually just convert empty string to current booru "search all" query)
    tags = validateTags(tags);

    // if tags are different than previous tags, reset fetched
    if (prevTags != tags) {
      fetched.value = [];
      totalCount.value = 0;
    }

    // get amount of items before fetching
    int length = fetched.length;

    // create url
    final String url = makeURL(tags);
    if(url.isEmpty) return fetched;

    Uri uri;
    try {
      uri = Uri.parse(Uri.encodeFull(url));
    } catch (e) {
      Logger.Inst().log('invalid url: $url', className, "Search", LogTypes.booruHandlerFetchFailed);
      errorString = "Invalid URL ($url)";
      return fetched;
    }
    Logger.Inst().log('$url ${uri.toString()}', className, "Search", LogTypes.booruHandlerSearchURL);

    final dynamic response;
    try {
      response = await fetchSearch(uri);
      if (response.statusCode == 200) {
        // parse response data
        await parseResponse(response);

        // save tags for check on next search
        prevTags = tags;

        // if amount of items didn't change after fetching, then we consider that there are no more pages and lock future fetches
        if (fetched.length == length) {
          locked = true;
        }
      } else {
        Logger.Inst().log("error fetching url: $url", className, "Search", LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log("status: ${response.statusCode}", className, "Search", LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log("response: ${response.body}", className, "Search", LogTypes.booruHandlerFetchFailed);
        errorString = response.statusCode.toString();
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, "Search", LogTypes.booruHandlerFetchFailed);
      errorString = e.toString();
    }

    // print('Fetched: ${filteredFetched.length}');
    return fetched;
  }

  Future fetchSearch(Uri uri) async {
    return http.get(uri, headers: getHeaders());
  }

  FutureOr<void> parseResponse(response) async {
    List posts = [];
    try {
      posts = await parseListFromResponse(response);
    } catch (e) {
      Logger.Inst().log(e.toString(), className, "parseListFromResponse", LogTypes.booruHandlerRawFetched);
    }
    
    List<BooruItem> newItems = [];
    if (posts.isNotEmpty) {
      for (int i = 0; i < posts.length; i++) {
        var post = posts.elementAt(i);
        try {
          BooruItem? item = await parseItemFromResponse(post, i);
          if(item != null) {
            newItems.add(item);
          }
        } catch (e) {
          Logger.Inst().log('$e $post', className, "parseItemFromResponse", LogTypes.booruHandlerRawFetched);
          failedItems.add([post, e]);
        }
      }
    }

    afterParseResponse(newItems);
  }

  /// [SHOULD BE OVERRIDDEN]
  /// 
  /// parse raw response into a list of posts,
  /// here you should also parse any other info included with the response (i.e. totalcount)
  FutureOr<List> parseListFromResponse(response) {
    return [];
  }

  /// [SHOULD BE OVERRIDDEN]
  FutureOr<BooruItem?> parseItemFromResponse(responseItem, int index) {
    return BooruItem(fileURL: '', sampleURL: '', thumbnailURL: '', tagsList: [], postURL: '');
  }

  void afterParseResponse(List<BooruItem> newItems) {
    final int lengthBefore = fetched.length;
    fetched.addAll(newItems);
    setMultipleTrackedValues(lengthBefore, fetched.length);
    // TODO
    // notifyAboutFailed();
    failedItems.clear();
  }

  String validateTags(String tags) {
    return tags;
  }

  /// [SHOULD BE OVERRIDDEN]
  String makeURL(String tags) {
    return '';
  }

  ////////////////////////////////////////////////////////////////////////
  
  // TODO rename to getTagSuggestions
  // Future<List<String>>
  Future tagSearch(String input) async {
    List<String> tags = [];

    String url = makeTagURL(input);
    if(url.isEmpty) return tags;
    Uri uri;
    try {
      uri = Uri.parse(Uri.encodeFull(url));
    } catch (e) {
      Logger.Inst().log('invalid url: $url', className, "tagSearch", LogTypes.booruHandlerFetchFailed);
      return tags;
    }
    Logger.Inst().log('$url ${uri.toString()}', className, "tagSearch", LogTypes.booruHandlerSearchURL);

    final dynamic response;
    try {
      response = await fetchTagSuggestions(uri, input);
      if (response.statusCode == 200) {
        var rawTags = await parseTagSuggestionsList(response);
        for (int i = 0; i < rawTags.length; i++) {
          final rawTag = rawTags[i];
          try {
            String parsedTag = await parseTagSuggestion(rawTag, i) ?? '';
            if (parsedTag.isNotEmpty) {
              // TODO add tag to taghandler before adding it to list
              // addTagsWithType(parsedTag, tagType);
              tags.add(parsedTag);
            }
          } catch (e) {
            Logger.Inst().log('${e.toString()} $rawTag', className, "parseTagSuggestion", LogTypes.booruHandlerRawFetched);
          }
        }
      } else {
        Logger.Inst().log("error fetching url: $url", className, "tagSearch", LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log("status: ${response.statusCode}", className, "tagSearch", LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log("response: ${response.body}", className, "tagSearch", LogTypes.booruHandlerFetchFailed);
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, "tagSearch", LogTypes.booruHandlerFetchFailed);
    }
    return tags;
  }

  Future fetchTagSuggestions(Uri uri, String input) {
    return http.get(uri, headers: getHeaders());
  }

  /// [SHOULD BE OVERRIDDEN]
  FutureOr<List> parseTagSuggestionsList(response) {
    return [];
  }

  /// [SHOULD BE OVERRIDDEN]
  FutureOr<String?> parseTagSuggestion(responseItem, int index) {
    return '';
  }

  /// [SHOULD BE OVERRIDDEN]
  String makeTagURL(String input) {
    return '';
  }

  String makeDirectTagURL(List<String> tags) {
    return '';
  }

  ////////////////////////////////////////////////////////////////////////

  bool hasCommentsSupport = false;
  Future<List<CommentItem>> getComments(String postID, int pageNum) async {
    List<CommentItem> comments = [];

    String url = makeCommentsURL(postID, pageNum);
    if(url.isEmpty) return comments;
    Uri uri;
    try {
      uri = Uri.parse(Uri.encodeFull(url));
    } catch (e) {
      Logger.Inst().log('invalid url: $url', className, "getComments", LogTypes.booruHandlerFetchFailed);
      return comments;
    }
    Logger.Inst().log('$url ${uri.toString()}', className, "getComments", LogTypes.booruHandlerSearchURL);

    final dynamic response;
    try {
      response = await fetchComments(uri);
      if (response.statusCode == 200) {
        var rawComments = await parseCommentsList(response);
        for (int i = 0; i < rawComments.length; i++) {
          final rawComment = rawComments[i];
          try {
            CommentItem? parsedComment = await parseComment(rawComment, i);
            if (parsedComment != null) comments.add(parsedComment);
          } catch (e) {
            Logger.Inst().log('${e.toString()} $rawComment', className, "parseCommentsList", LogTypes.booruHandlerRawFetched);
          }
        }
      } else {
        Logger.Inst().log("error fetching url: $url", className, "getComments", LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log("status: ${response.statusCode}", className, "getComments", LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log("response: ${response.body}", className, "getComments", LogTypes.booruHandlerFetchFailed);
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, "getComments", LogTypes.booruHandlerFetchFailed);
    }
    return comments;
  }

  Future fetchComments(Uri uri) {
    return http.get(uri, headers: getHeaders());
  }

  /// [SHOULD BE OVERRIDDEN]
  FutureOr<List> parseCommentsList(response) {
    return [];
  }

  /// [SHOULD BE OVERRIDDEN]
  FutureOr<CommentItem?> parseComment(responseItem, int index) {
    return CommentItem();
  }

  /// [SHOULD BE OVERRIDDEN]
  String makeCommentsURL(String postID, int pageNum) {
    return '';
  }



  ////////////////////////////////////////////////////////////////////////

  // TODO
  bool hasLoadItemSupport = false;

  // TODO fetch and overwrite current item data when entering tag view with a newer / more complete data
  bool shouldUpdateIteminTagView = false;

  Future loadItem(BooruItem item) async {
    return null;
  }

  ////////////////////////////////////////////////////////////////////////

  bool hasNotesSupport = false;
  Future<List<NoteItem>> getNotes(String postID) async {
    List<NoteItem> notes = [];

    String url = makeNotesURL(postID);
    if(url.isEmpty) return notes;
    Uri uri;
    try {
      uri = Uri.parse(Uri.encodeFull(url));
    } catch (e) {
      Logger.Inst().log('invalid url: $url', className, "getNotes", LogTypes.booruHandlerFetchFailed);
      return notes;
    }
    Logger.Inst().log('$url ${uri.toString()}', className, "getNotes", LogTypes.booruHandlerSearchURL);

    final dynamic response;
    try {
      response = await fetchNotes(uri);
      if (response.statusCode == 200) {
        var rawNotes = await parseNotesList(response);
        for (int i = 0; i < rawNotes.length; i++) {
          final rawNote = rawNotes[i];
          try {
            NoteItem? parsedNote = await parseNote(rawNote, i);
            if (parsedNote != null) notes.add(parsedNote);
          } catch (e) {
            Logger.Inst().log('${e.toString()} $rawNote', className, "parseNotesList", LogTypes.booruHandlerRawFetched);
          }
        }
      } else {
        Logger.Inst().log("error fetching url: $url", className, "getNotes", LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log("status: ${response.statusCode}", className, "getNotes", LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log("response: ${response.body}", className, "getNotes", LogTypes.booruHandlerFetchFailed);
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, "getNotes", LogTypes.booruHandlerFetchFailed);
    }
    return notes;
  }

  Future fetchNotes(Uri uri) async {
    return http.get(uri, headers: getHeaders());
  }

  /// [SHOULD BE OVERRIDDEN]
  FutureOr<List> parseNotesList(response) {
    return [];
  }

  /// [SHOULD BE OVERRIDDEN]
  FutureOr<NoteItem?> parseNote(responseItem, int index) {
    return NoteItem(
      id: '',
      postID: '',
      content: '',
      height: 0,
      width: 0,
      posX: 0,
      posY: 0,
    );
  }

  /// [SHOULD BE OVERRIDDEN]
  String makeNotesURL(String postID) {
    return '';
  }

  ////////////////////////////////////////////////////////////////////////

  RxInt totalCount = 0.obs;
  // TODO for boorus where api doesn't give amount outright and we have to calculate it based on smth (last page*items per page, for example) - show "~" symbol to indicate that
  bool countIsQuestionable = false;
  Future<void> searchCount(String input) async {
    totalCount.value = 0;
    return;
  }

  ////////////////////////////////////////////////////////////////////////

  String makePostURL(String id) {
    return '';
  }

  Map<String, String> getHeaders() {
    return {
      "Accept": "text/html,application/xml,application/json",
      "user-agent": Tools.appUserAgent(),
    };
  }

  void addTagsWithType(List<String> tags, TagType type) {
    TagHandler.instance.addTagsWithType(tags, type);
  }

  void populateTagHandler(List<BooruItem> items) async{
    List<String> unTyped = [];
    for(int x = 0; x < items.length; x++) {
      for (int i = 0; i < items[x].tagsList.length; i++) {
        final String tag = items[x].tagsList[i];

        final bool alreadyStoredAndNotStale = TagHandler.instance.isTagStale(tag); //TagHandler.instance.hasTag(tag);
        if (!alreadyStoredAndNotStale) {
          final bool isPresent = unTyped.contains(tag);
          if(!isPresent) {
            unTyped.add(tag);
          }
        }
      }
    }

    if (unTyped.isNotEmpty) {
      TagHandler.instance.queue(unTyped, booru, 200);
    }
  }

  String getTagDisplayString(String tag){
    // TODO Convert tag from things like artist:artistname to artistname
    return tag;
  }

  Future<List<Tag>> genTagObjects(List<String> tags) async{
    return [];
  }

  String getDescription() {
    return '';
  }

  List<String> searchModifiers() {
    return [];
  }

  //set the isSnatched and isFavourite booleans for a BooruItem in fetched
  Future<void> setTrackedValues(int fetchedIndex) async {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    if (settingsHandler.favDbHandler.db != null) {
      // TODO make this work in batches, not calling it on every single item ???
      List<bool> values = await settingsHandler.favDbHandler.getTrackedValues(fetched[fetchedIndex]);
      fetched[fetchedIndex].isSnatched.value = values[0];
      fetched[fetchedIndex].isFavourite.value = values[1];
    }
    List<List<String>> tagLists = settingsHandler.parseTagsList(fetched[fetchedIndex].tagsList);
    fetched[fetchedIndex].isHated.value = tagLists[0].isNotEmpty;
    // fetched[fetchedIndex].isLoved.value = tagLists[1].length > 0;
    return;
  }

  Future<void> setMultipleTrackedValues(int beforeLength, int afterLength) async {
    // beforeLength can be -1, clamp to 0
    final int beforePos = max(0, beforeLength);
    // diff can be negative, clamp to 0
    int diff = max(0, afterLength - beforeLength);
    diff = diff > 0 ? diff + 1 : diff;
    // we need +1 to make sure we don't miss the last item, because sublist doesn't include the item with the end index
    // so this way we exceed the possible length of fetched to get it

    if (diff == 0) {
      // do nothing if nothing was added
      return;
    }

    // generate list of new fetched indexes
    final List<int> fetchedIndexes = List.generate(diff, (index) => beforePos + index);

    final SettingsHandler settingsHandler = SettingsHandler.instance;
    if (settingsHandler.favDbHandler.db != null && diff > 0) {
      List<List<bool>> valuesList = await settingsHandler.favDbHandler
          .getMultipleTrackedValues(fetched.sublist(fetchedIndexes.first, fetchedIndexes.last)); //.map((e) => e.fileURL).toList()

      valuesList.asMap().forEach((index, values) {
        fetched[fetchedIndexes[index]].isSnatched.value = values[0];
        fetched[fetchedIndexes[index]].isFavourite.value = values[1];

        // TODO probably leads to worse performance on page loads, change to isolate or async maybe?
        List<List<String>> tagLists = settingsHandler.parseTagsList(fetched[fetchedIndexes[index]].tagsList);
        fetched[fetchedIndexes[index]].isHated.value = tagLists[0].isNotEmpty;
        // fetched[fetchedIndex].isLoved.value = tagLists[1].length > 0;
      });
    }

    return;
  }
}
