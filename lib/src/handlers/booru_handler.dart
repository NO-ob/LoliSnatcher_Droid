import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart' hide Response;
import 'package:html/parser.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/comment_item.dart';
import 'package:lolisnatcher/src/data/meta_tag.dart';
import 'package:lolisnatcher/src/data/note_item.dart';
import 'package:lolisnatcher/src/data/response_error.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/data/tag_suggestion.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

// TODO better naming for some functions (i.e. Search => getSearch or smth like that)

abstract class BooruHandler {
  BooruHandler(this.booru, this.limit);
  // pagenum = -1 as "didn't load anything yet" state
  // gets set to higher number for special cases in handler factory
  // TODO get rid of that logic and add pageOffset variable for special cases
  int pageNum = -1;
  int limit = 20;
  String prevTags = '';
  bool locked = false;
  Booru booru;

  String errorString = '';
  List failedItems = [];

  Map<String, TagType> get tagTypeMap => {};

  RxList<BooruItem> fetched = RxList<BooruItem>([]);
  RxList<BooruItem> filteredFetched = RxList<BooruItem>([]);

  /// Filters the list of fetched items and stores them in filteredFetched
  ///
  /// Should always be called after fetched changed (so don't forget to add it in custom afterParseResponse or search methods)
  /// (See gelbooru of favourites handlers for example)
  void filterFetched() {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    final List<BooruItem> itemsBeforeFilter = [...filteredFetched];

    final List<BooruItem> filteredItems = [];
    for (final item in fetched) {
      if (settingsHandler.filterHated && item.isHated) {
        continue;
      }

      if (settingsHandler.filterAi && item.isAI) {
        continue;
      }

      final bool filterFavourites = settingsHandler.filterFavourites && booru.type?.isFavourites != true;
      if (filterFavourites && item.isFavourite.value == true) {
        continue;
      }

      final bool filterSnatched = settingsHandler.filterSnatched && booru.type?.isDownloads != true;
      if (filterSnatched && item.isSnatched.value == true) {
        continue;
      }

      final bool isDuplicate = filteredItems.any(
        (e) => e.fileURL == item.fileURL || (e.serverId != null && e.serverId == item.serverId),
      );
      if (isDuplicate) {
        continue;
      }

      filteredItems.add(item);
    }

    if (!listEquals(itemsBeforeFilter, filteredItems)) {
      filteredFetched.value = filteredItems;
    }
  }

  String get className => runtimeType.toString();

  bool get hasSizeData => false;

  Future<bool> searchSetup() async {
    if (hasSignInSupport) {
      final bool canLogin = await canSignIn();
      if (canLogin) {
        final bool isLoggedIn = await isSignedIn();
        if (isLoggedIn) {
          //
        } else {
          // final bool didLogIn = await signIn();
          await signIn();
        }
      } else {
        //
      }
    }
    return true;
  }

  /// This function will call a http request using the tags and pagenumber parsed to it
  /// it will then create a list of booruItems
  Future search(String tags, int? pageNumCustom, {bool withCaptchaCheck = true}) async {
    // set custom page number
    if (pageNumCustom != null) {
      pageNum = pageNumCustom;
    }
    // Any setup that needs to happen before the url is created
    if (!await searchSetup()) {
      Logger.Inst().log('Search setup failed for booru: $booru', className, 'Search', LogTypes.booruHandlerFetchFailed);
      locked = true;
      return fetched;
    }

    // validate tags (usually just convert empty string to current booru "search all" query)
    tags = validateTags(tags.trim());

    // if tags are different than previous tags, reset fetched
    if (prevTags != tags) {
      fetched.value = [];
      totalCount.value = 0;
    }

    // get amount of items before fetching
    final int length = fetched.length;

    // create url
    final String url = makeURL(tags);
    if (url.isEmpty) {
      return fetched;
    }

    Uri uri;
    try {
      uri = Uri.parse(url);
    } catch (e, s) {
      Logger.Inst().log(
        'invalid url: $url',
        className,
        'Search',
        LogTypes.booruHandlerFetchFailed,
        s: s,
      );
      errorString = 'Invalid URL ($url)';
      return fetched;
    }
    Logger.Inst().log('$url $uri', className, 'Search', LogTypes.booruHandlerSearchURL);

    Response response;
    try {
      response = await fetchSearch(uri, tags, withCaptchaCheck: withCaptchaCheck);
      if (response.statusCode == 200) {
        // parse response data
        final List<BooruItem> newItems = await parseResponse(response);
        await afterParseResponse(newItems);

        // save tags for check on next search
        prevTags = tags;

        // if amount of items didn't change after fetching, then we consider that there are no more pages and lock future fetches
        if (fetched.length == length) {
          locked = true;
        }
      } else {
        Logger.Inst().log('error fetching url: $url', className, 'Search', LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log('status: ${response.statusCode}', className, 'Search', LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log('response: ${response.data}', className, 'Search', LogTypes.booruHandlerFetchFailed);
        errorString = response.statusCode.toString();
      }
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        className,
        'Search',
        LogTypes.booruHandlerFetchFailed,
        s: s,
      );
      if (e is DioException) {
        errorString = e.response?.statusCode != null
            ? '${e.response?.statusCode} - ${e.response?.statusMessage ?? DioNetwork.badResponseExceptionMessage(e.response?.statusCode)}'
            : (e.message ?? e.toString());

        // TODO move error handling to separate function and allow per booru changes?
        if (e.response?.statusCode == HttpStatus.unauthorized &&
            e.requestOptions.uri.toString().contains('gelbooru.com')) {
          // add a message to direct user to set his user ID and api key
          errorString +=
              '\n<p><b>You may need to add your User ID and API key. Go to <a href="/settings/booru">[Settings > Booru & Search]</a> to update the booru config. You can find your User ID and API key on <a href="https://gelbooru.com/index.php?page=account&s=options">Gelbooru settings page</a> under "API Access Credentials". Note: Anonymous access is NOT permitted.</b></p>';
        }
      } else {
        errorString = e.toString();
      }
    }
    return fetched;
  }

  Future<Response<dynamic>> fetchSearch(
    Uri uri,
    String input, {
    bool withCaptchaCheck = true,
    Map<String, dynamic>? queryParams,
  }) async {
    final String cookies = await getCookies() ?? '';
    final Map<String, String> headers = {
      ...getHeaders(),
      if (cookies.isNotEmpty) 'Cookie': cookies,
    };

    Logger.Inst().log(
      'fetching: $uri with headers: $headers',
      className,
      'Search',
      LogTypes.booruHandlerSearchURL,
    );

    return DioNetwork.get(
      uri.toString(),
      headers: headers,
      queryParameters: queryParams,
      options: fetchSearchOptions(),
      customInterceptor: withCaptchaCheck ? DioNetwork.captchaInterceptor : null,
    );
  }

  Options? fetchSearchOptions() {
    return null;
  }

  FutureOr<List<BooruItem>> parseResponse(dynamic response) async {
    List posts = [];
    try {
      posts = await parseListFromResponse(response);
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        className,
        'parseListFromResponse',
        LogTypes.booruHandlerRawFetched,
        s: s,
      );
      Logger.Inst().log(response.data, className, 'parseListFromResponse', LogTypes.booruHandlerRawFetched);
      Logger.Inst().log(response.data.runtimeType, className, 'parseListFromResponse', LogTypes.booruHandlerRawFetched);
      errorString = e.toString();
      rethrow;
    }

    final List<BooruItem> newItems = [];
    if (posts.isNotEmpty) {
      for (int i = 0; i < posts.length; i++) {
        final post = posts.elementAt(i);
        try {
          final BooruItem? item = await parseItemFromResponse(post, i);
          if (item != null) {
            newItems.add(item);
          }
        } catch (e, s) {
          Logger.Inst().log(
            '$e $post',
            className,
            'parseItemFromResponse',
            LogTypes.booruHandlerRawFetched,
            s: s,
          );
          failedItems.add([post, e]);
        }
      }
    }

    return newItems;
  }

  /// Parse raw response into a list of posts,
  /// here you should also parse any other info included with the response (i.e. totalcount)
  ///
  /// [SHOULD BE OVERRIDDEN]
  FutureOr<List> parseListFromResponse(dynamic response) {
    return [];
  }

  /// [SHOULD BE OVERRIDDEN]
  FutureOr<BooruItem?> parseItemFromResponse(dynamic responseItem, int index) {
    return BooruItem(
      fileURL: '',
      sampleURL: '',
      thumbnailURL: '',
      tagsList: const [],
      postURL: '',
    );
  }

  Future<void> afterParseResponse(List<BooruItem> newItems) async {
    final int lengthBefore = fetched.length;
    fetched.addAll(newItems);
    filterFetched();
    unawaited(setMultipleTrackedValues(lengthBefore, fetched.length));
    unawaited(populateTagHandler(newItems));

    // TODO
    // notifyAboutFailed();
    failedItems.clear();
  }

  String validateTags(String tags) {
    // remember to return super.validateTags(tags) if you override this function
    return Uri.encodeComponent(tags);
  }

  /// [SHOULD BE OVERRIDDEN]
  String makeURL(String tags) {
    return '';
  }

  ////////////////////////////////////////////////////////////////////////

  bool get hasTagSuggestions => false;

  Future<Either<ResponseError, List<TagSuggestion>>> getTagSuggestions(String input, {CancelToken? cancelToken}) async {
    final List<TagSuggestion> tags = [];

    final String url = makeTagURL(input);
    if (url.isEmpty) {
      return Left(ResponseError(message: 'invalid url: $url'));
    }

    Uri uri;
    try {
      uri = Uri.parse(url);
    } catch (e, s) {
      Logger.Inst().log(
        'invalid url: $url',
        className,
        'getTagSuggestions',
        LogTypes.booruHandlerFetchFailed,
        s: s,
      );
      return Left(
        ResponseError(
          message: 'invalid url: $url',
          error: e,
          stackTrace: s,
        ),
      );
    }
    Logger.Inst().log('$url $uri', className, 'getTagSuggestions', LogTypes.booruHandlerSearchURL);

    Response response;
    const int limit = 20;
    try {
      response = await fetchTagSuggestions(uri, input, cancelToken: cancelToken);
      if (response.statusCode == 200) {
        Logger.Inst().log('fetchTagSuggestions response: ${response.data}', className, 'getTagSuggestions', null);
        final rawTags = await parseTagSuggestionsList(response);
        for (int i = 0; i < rawTags.length; i++) {
          final rawTag = rawTags[i];
          try {
            if (tags.length < limit) {
              TagSuggestion? parsedTag = await parseTagSuggestion(rawTag, i);
              String parsedText = '';
              try {
                parsedText = parseFragment(parsedTag?.tag.trim()).text ?? '';
                parsedText = Uri.decodeComponent(parsedText).trim();
              } catch (_) {}
              parsedTag = parsedTag?.copyWith(
                tag: parsedText,
              );

              if (parsedTag != null && parsedTag.tag.isNotEmpty) {
                // TODO add tag to taghandler before adding it to list
                // addTagsWithType(parsedTag, tagType);
                tags.add(parsedTag);
              }
            }
          } catch (e, s) {
            Logger.Inst().log(
              '$e $rawTag',
              className,
              'parseTagSuggestion',
              LogTypes.booruHandlerRawFetched,
              s: s,
            );
            return Left(
              ResponseError(
                message: 'parseTagSuggestion error',
                error: e,
                stackTrace: s,
              ),
            );
          }
        }
      } else if (response.statusCode == 404) {
        // return nothing on 404
        return const Right([]);
      } else {
        Logger.Inst().log('error fetching url: $url', className, 'getTagSuggestions', LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log(
          'status: ${response.statusCode}',
          className,
          'getTagSuggestions',
          LogTypes.booruHandlerFetchFailed,
        );
        Logger.Inst().log(
          'response: ${response.data}',
          className,
          'getTagSuggestions',
          LogTypes.booruHandlerFetchFailed,
        );
        return Left(
          ResponseError(
            message: 'error fetching url: $url',
            statusCode: response.statusCode,
          ),
        );
      }
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        className,
        'getTagSuggestions',
        LogTypes.booruHandlerFetchFailed,
        s: s,
      );
      return Left(
        ResponseError(
          message: 'getTagSuggestions error',
          error: e,
          stackTrace: s,
        ),
      );
    }
    return Right(tags);
  }

  Future<Response<dynamic>> fetchTagSuggestions(Uri uri, String input, {CancelToken? cancelToken}) async {
    final String cookies = await getCookies() ?? '';
    final Map<String, String> headers = {
      ...getHeaders(),
      if (cookies.isNotEmpty) 'Cookie': cookies,
    };

    return DioNetwork.get(
      uri.toString(),
      headers: headers,
      options: fetchTagSuggestionsOptions(),
      cancelToken: cancelToken,
    );
  }

  Options? fetchTagSuggestionsOptions() {
    return null;
  }

  /// [SHOULD BE OVERRIDDEN]
  FutureOr<List> parseTagSuggestionsList(dynamic response) {
    return [];
  }

  /// [SHOULD BE OVERRIDDEN]
  FutureOr<TagSuggestion?> parseTagSuggestion(dynamic responseItem, int index) {
    return null;
  }

  /// [SHOULD BE OVERRIDDEN]
  String makeTagURL(String input) {
    return '';
  }

  String makeDirectTagURL(List<String> tags) {
    return '';
  }

  ////////////////////////////////////////////////////////////////////////

  bool get hasCommentsSupport => false;
  Future<List<CommentItem>> getComments(
    String postID,
    int pageNum, {
    CancelToken? cancelToken,
  }) async {
    final List<CommentItem> comments = [];

    final String url = makeCommentsURL(postID, pageNum);
    if (url.isEmpty) {
      return comments;
    }
    Uri uri;
    try {
      uri = Uri.parse(url);
    } catch (e, s) {
      Logger.Inst().log(
        'invalid url: $url',
        className,
        'getComments',
        LogTypes.booruHandlerFetchFailed,
        s: s,
      );
      return comments;
    }
    Logger.Inst().log('$url $uri', className, 'getComments', LogTypes.booruHandlerSearchURL);

    Response response;
    try {
      response = await fetchComments(uri, cancelToken: cancelToken);
      if (response.statusCode == 200) {
        final rawComments = await parseCommentsList(response);
        for (int i = 0; i < rawComments.length; i++) {
          final rawComment = rawComments[i];
          try {
            final CommentItem? parsedComment = await parseComment(rawComment, i);
            if (parsedComment != null) {
              comments.add(parsedComment);
            }
          } catch (e, s) {
            Logger.Inst().log(
              '$e $rawComment',
              className,
              'parseCommentsList',
              LogTypes.booruHandlerRawFetched,
              s: s,
            );
          }
        }
      } else {
        Logger.Inst().log('error fetching url: $url', className, 'getComments', LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log('status: ${response.statusCode}', className, 'getComments', LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log('response: ${response.data}', className, 'getComments', LogTypes.booruHandlerFetchFailed);
      }
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        className,
        'getComments',
        LogTypes.booruHandlerFetchFailed,
        s: s,
      );
    }
    return comments;
  }

  Future<Response<dynamic>> fetchComments(
    Uri uri, {
    CancelToken? cancelToken,
  }) async {
    final String cookies = await getCookies() ?? '';
    final Map<String, String> headers = {
      ...getHeaders(),
      if (cookies.isNotEmpty) 'Cookie': cookies,
    };

    return DioNetwork.get(
      uri.toString(),
      headers: headers,
      options: fetchCommentsOptions(),
      cancelToken: cancelToken,
    );
  }

  Options? fetchCommentsOptions() {
    return null;
  }

  /// [SHOULD BE OVERRIDDEN]
  FutureOr<List> parseCommentsList(dynamic response) {
    return [];
  }

  /// [SHOULD BE OVERRIDDEN]
  FutureOr<CommentItem?> parseComment(dynamic responseItem, int index) {
    return const CommentItem();
  }

  /// [SHOULD BE OVERRIDDEN]
  String makeCommentsURL(String postID, int pageNum) {
    return '';
  }

  ////////////////////////////////////////////////////////////////////////

  bool get hasLoadItemSupport => false;

  bool get shouldUpdateIteminTagView => false;

  Future<({BooruItem? item, bool failed, String? error})> loadItem({
    required BooruItem item,
    CancelToken? cancelToken,
    bool withCapcthaCheck = false,
  }) async {
    return (item: item, failed: false, error: null);
  }

  ////////////////////////////////////////////////////////////////////////

  bool get hasNotesSupport => false;
  Future<List<NoteItem>> getNotes(
    String postID, {
    CancelToken? cancelToken,
  }) async {
    final List<NoteItem> notes = [];

    final String url = makeNotesURL(postID);
    if (url.isEmpty) {
      return notes;
    }
    Uri uri;
    try {
      uri = Uri.parse(url);
    } catch (e, s) {
      Logger.Inst().log(
        'invalid url: $url',
        className,
        'getNotes',
        LogTypes.booruHandlerFetchFailed,
        s: s,
      );
      return notes;
    }
    Logger.Inst().log('$url $uri', className, 'getNotes', LogTypes.booruHandlerSearchURL);

    Response response;
    try {
      response = await fetchNotes(uri, cancelToken: cancelToken);
      if (response.statusCode == 200) {
        final rawNotes = await parseNotesList(response);
        for (int i = 0; i < rawNotes.length; i++) {
          final rawNote = rawNotes[i];
          try {
            final NoteItem? parsedNote = await parseNote(rawNote, i);
            if (parsedNote != null) {
              notes.add(parsedNote);
            }
          } catch (e, s) {
            Logger.Inst().log(
              '$e $rawNote',
              className,
              'parseNotesList',
              LogTypes.booruHandlerRawFetched,
              s: s,
            );
          }
        }
      } else {
        Logger.Inst().log('error fetching url: $url', className, 'getNotes', LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log('status: ${response.statusCode}', className, 'getNotes', LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log('response: ${response.data}', className, 'getNotes', LogTypes.booruHandlerFetchFailed);
      }
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        className,
        'getNotes',
        LogTypes.booruHandlerFetchFailed,
        s: s,
      );
    }
    return notes;
  }

  Future<Response<dynamic>> fetchNotes(
    Uri uri, {
    CancelToken? cancelToken,
  }) async {
    final String cookies = await getCookies() ?? '';
    final Map<String, String> headers = {
      ...getHeaders(),
      if (cookies.isNotEmpty) 'Cookie': cookies,
    };

    return DioNetwork.get(
      uri.toString(),
      headers: headers,
      options: Options(
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
      cancelToken: cancelToken,
    );
  }

  /// [SHOULD BE OVERRIDDEN]
  FutureOr<List> parseNotesList(dynamic response) {
    return [];
  }

  /// [SHOULD BE OVERRIDDEN]
  FutureOr<NoteItem?> parseNote(dynamic responseItem, int index) {
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
  bool get countIsQuestionable => false;
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
      'Accept': 'text/html,application/xml,application/json',
      'User-Agent': Tools.browserUserAgent,
    };
  }

  Future<String?> getCookies() async {
    String cookieString = await Tools.getCookies(booru.baseURL!);

    final Map<String, String> headers = getHeaders();
    if (headers['Cookie']?.isNotEmpty ?? false) {
      cookieString += headers['Cookie']!;
    }

    Logger.Inst().log('${booru.baseURL}: $cookieString', className, 'getCookies', LogTypes.booruHandlerSearchURL);

    return cookieString.trim();
  }

  void addTagsWithType(List<String> tags, TagType type) {
    TagHandler.instance.addTagsWithType(tags, type);
  }

  bool get shouldPopulateTags => false;

  Future<void> populateTagHandler(List<BooruItem> items) async {
    final List<String> unTyped = [];
    for (int x = 0; x < items.length; x++) {
      for (int i = 0; i < items[x].tagsList.length; i++) {
        final String tag = items[x].tagsList[i];

        final bool alreadyStoredAndNotStale = TagHandler.instance.hasTagAndNotStale(
          tag,
        ); //TagHandler.instance.hasTag(tag);
        if (!alreadyStoredAndNotStale) {
          final bool isPresent = unTyped.contains(tag);
          if (!isPresent) {
            unTyped.add(tag);
          }
        }
      }
    }

    if (unTyped.isNotEmpty) {
      TagHandler.instance.queue(unTyped, booru, 200);
    }
  }

  String getTagDisplayString(String tag) {
    // TODO Convert tag from things like artist:artistname to artistname
    return tag;
  }

  Future<List<Tag>> genTagObjects(List<String> tags) async {
    return [];
  }

  bool get hasSignInSupport => false;

  Future<bool> canSignIn() async {
    return booru.userID?.isNotEmpty == true && booru.apiKey?.isNotEmpty == true;
  }

  Future<dynamic> signIn() async {
    return;
  }

  Future<bool> isSignedIn() async {
    return false;
  }

  Future<dynamic> signOut({bool fromError = false}) async {
    return;
  }

  List<String> searchModifiers() {
    return [];
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
    if (settingsHandler.dbHandler.db != null && diff > 0) {
      final List<List<bool>> valuesList = await settingsHandler.dbHandler.getMultipleTrackedValues(
        fetched.sublist(fetchedIndexes.first, fetchedIndexes.last),
      ); //.map((e) => e.fileURL).toList()

      valuesList.asMap().forEach((index, values) {
        fetched[fetchedIndexes[index]].isSnatched.value = values[0];
        fetched[fetchedIndexes[index]].isFavourite.value = values[1];
      });
    }

    return;
  }

  String? get metatagsCheatSheetLink => null;

  List<MetaTag> availableMetaTags() {
    return [];
  }
}
