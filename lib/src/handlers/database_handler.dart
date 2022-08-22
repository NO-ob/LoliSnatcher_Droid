import 'dart:async';
import 'dart:io';

import 'package:sqflite/sqflite.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';


///////////////////////////////////////////////////////////////
/// WARNING:
/// On desktop releases you need to add sqlite3.dll for windows and have sqlite3 installed for linux
/// https://www.sqlite.org/download.html
/// https://archlinux.org/packages/core/x86_64/sqlite/
/// https://pub.dev/packages/sqflite_common_ffi
///////////////////////////////////////////////////////////////

class DBHandler{
  Database? db;
  DBHandler();

  /// Connects to the database file and create the database if the tables dont exist
  Future<bool> dbConnect(String path) async {
    // await Sqflite.devSetDebugModeOn(true);
    if(Platform.isAndroid || Platform.isIOS){
      db = await openDatabase("${path}store.db", version: 1, singleInstance: false);
    } else if(Platform.isWindows || Platform.isLinux) {
      db = await databaseFactory.openDatabase("${path}store.db");
    }
    await updateTable();
    await createIndexes();
    await deleteUntracked();
    return true;
  }

  Future<bool> dbConnectReadOnly(String path) async {
    if(Platform.isAndroid || Platform.isIOS){
      db = await openDatabase("${path}store.db", version: 1, singleInstance: false);
    } else if(Platform.isWindows || Platform.isLinux) {
      db = await databaseFactory.openDatabase("${path}store.db");
    }
    return true;
  }

  Future<bool> updateTable() async{
    await db?.execute("CREATE TABLE IF NOT EXISTS BooruItem"
        "(id INTEGER PRIMARY KEY,"
        "thumbnailURL TEXT,"
        "sampleURL TEXT,"
        "fileURL TEXT,"
        "postURL TEXT,"
        "mediaType TEXT,"
        "isSnatched INTEGER,"
        "isFavourite INTEGER"
        ")");
    await db?.execute("CREATE TABLE IF NOT EXISTS Tag ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT"
        "tagType TEXT"
        "updatedAt INTEGER"
        ")");
    await db?.execute("CREATE TABLE IF NOT EXISTS ImageTag ("
        "tagID INTEGER,"
        "booruItemID INTEGER"
        ")");
    await db?.execute("CREATE TABLE IF NOT EXISTS SearchHistory ("
        "id INTEGER PRIMARY KEY,"
        "booruType TEXT,"
        "booruName TEXT,"
        "searchText TEXT,"
        "isFavourite INTEGER,"
        "timestamp TEXT DEFAULT CURRENT_TIMESTAMP"
        ")");
    await db?.execute("CREATE TABLE IF NOT EXISTS TabRestore ("
        "id INTEGER PRIMARY KEY,"
        "restore TEXT"
        ")");
    try{

      if (!await columnExists('SearchHistory', 'isFavourite')){
        print('creating isFavourite');
        await db?.execute("ALTER TABLE SearchHistory ADD COLUMN isFavourite INTEGER;");
      }
      if (!await columnExists('Tag', 'tagType'))  {
        print('creating tagType');
        await db?.execute("ALTER TABLE Tag ADD COLUMN tagType TEXT;");
      }
      if(!await columnExists('Tag', 'updatedAt')){
        print('creating updatedAt');
        await db?.execute("ALTER TABLE Tag ADD COLUMN updatedAt INTEGER;");
      }

    } catch(e) {
      //print(e);
    }
    return true;
  }

  Future<bool> columnExists(String tableName, String columnName) async{
    List<Map<String, Object?>>? result = await db?.rawQuery(
        "SELECT COUNT(*) AS count FROM pragma_table_info('$tableName') WHERE name='$columnName'")
    ;
    if (result != null && result.isNotEmpty) {
      if ((result[0]['count'] ?? 0) == 1){
        return true;
      }
    }
    return false;
  }

  Future<bool> createIndexes() async {
    // TODO Indexes dont seem to help that much? + they double the size of the db
    // await db?.execute("CREATE INDEX IF NOT EXISTS ImageTag_tagID_index ON ImageTag (tagID);");
    // await db?.execute("CREATE INDEX IF NOT EXISTS ImageTag_booruItemID_index ON ImageTag (booruItemID);");
    // await db?.execute("CREATE INDEX IF NOT EXISTS BooruItem_isSnatched_index ON BooruItem (isSnatched);");
    // await db?.execute("CREATE INDEX IF NOT EXISTS BooruItem_isFavourite_index ON BooruItem (isFavourite);");
    // await db?.execute("CREATE INDEX IF NOT EXISTS BooruItem_fileURL_index ON BooruItem (fileURL);");
    // await db?.execute("CREATE INDEX IF NOT EXISTS BooruItem_id_index ON BooruItem (id);");
    // await db?.execute("CREATE INDEX IF NOT EXISTS BooruItem_fileURL_isFavourite_isSnatched_index ON BooruItem (fileURL, isFavourite, isSnatched);");
    // await db?.execute("CREATE INDEX IF NOT EXISTS Tag_name_index ON Tag (name);");
    // await db?.execute("CREATE INDEX IF NOT EXISTS Tag_id_index ON Tag (id);");
    return true;
  }

  Future<bool> dropIndexes() async {
    await db?.execute("DROP INDEX IF EXISTS ImageTag_tagID_index;");
    await db?.execute("DROP INDEX IF EXISTS ImageTag_booruItemID_index;");
    await db?.execute("DROP INDEX IF EXISTS BooruItem_isSnatched_index;");
    await db?.execute("DROP INDEX IF EXISTS BooruItem_isFavourite_index;");
    await db?.execute("DROP INDEX IF EXISTS BooruItem_fileURL_index;");
    await db?.execute("DROP INDEX IF EXISTS BooruItem_id_index;");
    await db?.execute("DROP INDEX IF EXISTS BooruItem_fileURL_isFavourite_isSnatched_index;");
    await db?.execute("DROP INDEX IF EXISTS Tag_name_index;");
    await db?.execute("DROP INDEX IF EXISTS Tag_id_index;");
    return true;
  }

  /// Inserts a new booruItem or updates the isSnatched and isFavourite values of an existing BooruItem in the database
  Future<String?> updateBooruItem(BooruItem item, String mode) async {
    Logger.Inst().log("updateBooruItem called fileURL is: ${item.fileURL}", "DBHandler", "updateBooruItem", LogTypes.booruHandlerInfo);
    String? itemID = await getItemID(item.postURL);
    String resultStr = "";
    if (itemID == null || itemID.isEmpty) {
      var result = await db?.rawInsert("INSERT INTO BooruItem(thumbnailURL, sampleURL, fileURL, postURL, mediaType, isSnatched, isFavourite) VALUES(?,?,?,?,?,?,?)",
          [item.thumbnailURL, item.sampleURL, item.fileURL, item.postURL, item.mediaType, Tools.boolToInt(item.isSnatched.value == true), Tools.boolToInt(item.isFavourite.value == true)]);
      itemID = result?.toString();
      updateTags(item.tagsList, itemID);
      resultStr = "Inserted";
    } else if (mode == "local") {
      await db?.rawUpdate("UPDATE BooruItem SET isSnatched = ?, isFavourite = ? WHERE id = ?", [Tools.boolToInt(item.isSnatched.value == true), Tools.boolToInt(item.isFavourite.value == true), itemID]);
      resultStr = "Updated";
    } else if (mode == "urlUpdate"){
      await db?.rawUpdate("UPDATE BooruItem SET thumbnailURL = ?,sampleURL = ?,fileURL = ? WHERE id = ?", [item.thumbnailURL,item.sampleURL,item.fileURL, itemID]);
      resultStr = "Updated Urls";
    } else {
      resultStr = "Already Exists";
    }
    await deleteUntracked();
    return resultStr;
  }

  Future<Map<String,int>> updateMultipleBooruItems(List<BooruItem> items) async {
    List<String> itemIDs = await getItemIDs(items.map((item) => item.postURL).toList());

    int saved = 0, exist = 0;
    for (BooruItem item in items) {
      int itemIndex = items.indexWhere((element) => element.postURL == item.postURL);
      String? itemID = (itemIDs.isNotEmpty && itemIndex != -1) ? itemIDs[itemIndex] : null;

      if (itemID == null || itemID.isEmpty) {
        var result = await db?.rawInsert("INSERT INTO BooruItem(thumbnailURL, sampleURL, fileURL, postURL, mediaType, isSnatched, isFavourite) VALUES(?,?,?,?,?,?,?)",
            [item.thumbnailURL, item.sampleURL, item.fileURL, item.postURL, item.mediaType, Tools.boolToInt(item.isSnatched.value == true), Tools.boolToInt(item.isFavourite.value == true)]);
        itemID = result?.toString();
        updateTags(item.tagsList, itemID);
        saved++;
      } else {
        exist++;
      }
    }
    await deleteUntracked();

    return {
      "saved": saved,
      "exist": exist
    };
  }


  /// Gets a BooruItem id from the database based on a fileurl
  Future<String?> getItemID(String postURL) async {
    List? result;
    result = await db?.rawQuery("SELECT id FROM BooruItem WHERE postURL = ?", [postURL]);

    if (result != null && result.isNotEmpty) {
      return result.first["id"].toString();
    } else {
      return null;
    }
  }

  Future<List<String>> getItemIDs(List<String> postURLs) async {
    List? result = await db?.rawQuery("SELECT id, postURL FROM BooruItem WHERE postURL IN (${List.generate(postURLs.length, (_) => '?').join(',')})", postURLs);

    List<String> ids = List.generate(postURLs.length, (index) => "");
    if (result != null && result.isNotEmpty) {
      for (Map<String, dynamic> item in result) {
        int postIndex = postURLs.indexOf(item["postURL"]);
        if (postIndex != -1) {
          ids[postIndex] = item["id"].toString();
        }
      }
    }
    return ids;
  }

  Future<List<BooruItem>> getSankakuItems() async {
    List? result = await db?.rawQuery(
        "SELECT BooruItem.id as ItemID, thumbnailURL, sampleURL, fileURL, postURL, mediaType, isSnatched, isFavourite FROM BooruItem WHERE postURL like '%chan.sankakucomplex%'");
    List<BooruItem> items = [];
    if (result != null && result.isNotEmpty) {
      for(int i=0; i < result.length; i++){
        var currentItem = result[i];
        if(currentItem != null && currentItem.isNotEmpty) {
          BooruItem bItem = BooruItem(
            fileURL: currentItem["fileURL"].toString(),
            sampleURL: currentItem["sampleURL"].toString(),
            thumbnailURL: currentItem["thumbnailURL"].toString(),
            tagsList: [],
            postURL: currentItem["postURL"].toString(),
          );
          bItem.isSnatched.value = Tools.intToBool(currentItem["isSnatched"]);
          bItem.isFavourite.value = Tools.intToBool(currentItem["isFavourite"]);
          items.add(bItem);
        }
      }
    }
    return items;
  }

  /// Gets a list of BooruItem from the database
  Future<List<BooruItem>> searchDB(String searchTagsString, String offset, String limit, String order, String mode) async {
    // TODO multiple tags in search can lead to wrong results
    List<String> searchTags;
    List? result;

    Logger.Inst().log("Searching DB for tags $searchTagsString", "DBHandler", "searchDB", LogTypes.booruHandlerInfo);

    searchTagsString = searchTagsString.trim();
    searchTags = searchTagsString.split(" ").where((tag) => tag.isNotEmpty).toList();

    // this adds support of filtering by posturls which have site:*some text* as their substring
    String siteSearch = searchTags.firstWhere((tag) => tag.startsWith('site:'), orElse: () => "");
    String siteQuery = "";
    if (siteSearch.isNotEmpty) {
      searchTags.remove(siteSearch);
      siteSearch = siteSearch.replaceAll("site:", "");
      siteQuery = "BooruItem.postURL LIKE '%$siteSearch%' AND ";
    }

    // benchmark reqest time
    // DateTime start = DateTime.now();

    if (searchTags.isNotEmpty) {
      result = await db?.rawQuery(
        "SELECT bi.id as dbid, bi.thumbnailURL, bi.sampleURL, bi.fileURL, bi.postURL, bi.mediaType, bi.isSnatched, bi.isFavourite FROM BooruItem bi "
        "JOIN (SELECT it.booruItemID FROM ImageTag it JOIN Tag t ON t.id = it.tagID "
              "WHERE t.name IN (${List.generate(searchTags.length, (_) => '?').join(',')}) "
              "GROUP BY it.booruItemID HAVING COUNT(DISTINCT t.name) = ${searchTags.length}) tags ON tags.booruItemID = dbid "

        "WHERE $siteQuery bi.isFavourite = 1 GROUP BY dbid ORDER BY dbid $order LIMIT $limit OFFSET $offset", searchTags);
    } else {
      result = await db?.rawQuery(
          "SELECT bi.id as dbid, bi.thumbnailURL, bi.sampleURL, bi.fileURL, bi.postURL, bi.mediaType, bi.isSnatched, bi.isFavourite FROM BooruItem bi "
            "WHERE $siteQuery bi.isFavourite = 1 GROUP BY dbid ORDER BY dbid $order LIMIT $limit OFFSET $offset");
    }

    // benchmark reqest time
    // DateTime end = DateTime.now();
    // Duration diff = end.difference(start);
    // print('Searching DB took: ${diff.inMilliseconds} ms');

    Logger.Inst().log("got results from db", "DBHandler", "searchDB", LogTypes.booruHandlerInfo);
    Logger.Inst().log(result.toString(), "DBHandler", "searchDB", LogTypes.booruHandlerInfo);

    if (result != null && result.isNotEmpty) {
      // start = DateTime.now();

      // TODO can be improved?
      List<dynamic>? tags = await getTagsList(List<int>.from(result.map((e) => e["dbid"])));

      List<BooruItem> items = result.map((r) {
        List<String> itemTags = List<String>.from(tags?.where((el) => el["booruItemID"] == r["dbid"]).map((el) => el["name"].toString()) ?? []);
        BooruItem item = BooruItem.fromDBRow(r, itemTags);
        if (mode == "loliSyncFav") {
          item.isSnatched.value = false;
        }
        return item;
      }).toList();

      // end = DateTime.now();
      // diff = end.difference(start);
      // print('Fetching tags took: ${diff.inMilliseconds} ms');

      return items;
    } else {
      return [];
    }
  }

  /// Gets a list of tags related to given posts ids
  Future<dynamic> getTagsList(List<int> postIDs) async {
    List<String> postIDsString = postIDs.map((id) => "'$id'").toList();
    List? result = await db?.rawQuery(
        "SELECT ImageTag.booruItemID, Tag.name FROM Tag "
            "INNER JOIN ImageTag on Tag.id = ImageTag.tagID "
            "WHERE ImageTag.booruItemID IN (${postIDsString.join(',')})");
    return result;
  }

  /// Gets a list of tags related to given posts ids
  Future<List<Tag>> getAllTags() async {
    List? result = await db?.rawQuery(
        "SELECT name, tagType, updatedAt FROM Tag");
    List<Tag> tags = [];
    if (result != null && result.isNotEmpty) {
      for(int i=0; i < result.length; i++){
        var currentItem = result[i];
        if(currentItem != null && currentItem.isNotEmpty) {
          tags.add(Tag.fromJson(currentItem));
        }
      }
    }
    return tags;
  }

  /// Gets amount of BooruItems from the database
  Future<int> searchDBCount(String searchTagsString) async {
    List<String> searchTags = [];
    List? result;

    searchTagsString = searchTagsString.trim();
    searchTags = searchTagsString.split(" ").where((tag) => tag.isNotEmpty).toList();

    // this adds support of filtering by posturls which have site:*some text* as their substring
    String siteSearch = searchTags.firstWhere((tag) => tag.startsWith('site:'), orElse: () => "");
    String siteQuery = "";
    if (siteSearch.isNotEmpty) {
      searchTags.remove(siteSearch);
      siteSearch = siteSearch.replaceAll("site:", "");
      siteQuery = "BooruItem.postURL LIKE '%$siteSearch%' AND ";
    }

    if (searchTags.isNotEmpty){
      result = await db?.rawQuery(
          "SELECT COUNT(*) as count FROM BooruItem "
              "LEFT JOIN ImageTag on BooruItem.id = ImageTag.booruItemID "
              "LEFT JOIN Tag on ImageTag.tagID = Tag.id "
              "WHERE $siteQuery Tag.name IN (${List.generate(searchTags.length, (_) => '?').join(',')}) AND isFavourite = 1 GROUP BY BooruItem.id "
              "HAVING COUNT(DISTINCT Tag.name) = ${searchTags.length}", searchTags);
    } else {
      result = await db?.rawQuery("SELECT COUNT(*) as count FROM BooruItem WHERE $siteQuery isFavourite = 1");
    }

    Logger.Inst().log("got results from db", "DBHandler", "searchDBCount", LogTypes.booruHandlerInfo);
    Logger.Inst().log(result.toString(), "DBHandler", "searchDBCount", LogTypes.booruHandlerInfo);

    if (result != null && result.isNotEmpty) {
      if(result.length > 1) {
        return result.length;
      } else if(result.length == 1) {
        return result[0]["count"];
      } else {
        return 0;
      }
    } else {
      return 0;
    }
  }

  /// Gets the favourites count from db
  Future<int> getFavouritesCount() async {
    List? result;
    result = await db?.rawQuery("SELECT COUNT(*) as count FROM BooruItem WHERE isFavourite = 1");

    Logger.Inst().log("got results from db", "DBHandler", "getFavouritesCount", LogTypes.booruHandlerInfo);
    Logger.Inst().log(result.toString(), "DBHandler", "getFavouritesCount", LogTypes.booruHandlerInfo);

    if (result != null) {
      return result.first["count"];
    } else {
      return 0;
    }
  }


  void clearSnatched() async{
    await db?.rawUpdate("UPDATE BooruItem SET isSnatched = 0");
    deleteUntracked();
  }
  void clearFavourites() async{
    await db?.rawUpdate("UPDATE BooruItem SET isFavourite = 0");
    deleteUntracked();
  }

  /// Adds tags for a BooruItem to the database
  void updateTags(List tags, String? itemID) async{
    if(itemID == null) return;
    String? id = "";
    for (var tag in tags) {
      id = await getTagID(tag);
      if (id.isEmpty) {
        var result = await db?.rawInsert("INSERT INTO Tag(name) VALUES(?)", [tag]);
        id = result?.toString();
      }
      await db?.rawInsert("INSERT INTO ImageTag(tagID, booruItemID) VALUES(?,?)", [id,itemID]);
    }
  }

  /// Adds tags for a BooruItem to the database
  Future<void> updateTagsFromObjects(List<Tag> tags) async{
    String? id = "";
    for (var tag in tags) {
      id = await getTagID(tag.fullString);
      if (id.isEmpty) {
        var result = await db?.rawInsert("INSERT INTO Tag(name, tagType, updatedAt) VALUES(?,?,?)", [tag.fullString, tag.tagType.name, tag.updatedAt]);
        id = result?.toString();
      } else {
        await db?.rawUpdate("UPDATE Tag SET tagType = ?,updatedAt = ? WHERE id = ?", [tag.tagType.name,tag.updatedAt,id]);
      }
    }
    return;
  }

  /// Gets a tag id from the database
  Future<String> getTagID(String tagName) async{
    var result = await db?.rawQuery("SELECT id FROM Tag WHERE name IN (?)", [tagName]);
    if (result != null && result.isNotEmpty){
      return result.first["id"].toString();
    } else {
      return "";
    }
  }
  /// Get a list of tags from the database based on an input
  Future<List<String>> getTags(String queryStr, int limit) async{
    List<String> tags = [];
    var result = await db?.rawQuery("SELECT DISTINCT name FROM Tag WHERE lower(name) LIKE (?) LIMIT $limit",["${queryStr.toLowerCase()}%"]);
    if (result != null && result.isNotEmpty){
      for (int i = 0; i < result.length; i++){
        tags.add(result[i]["name"].toString());
      }
    }
    return tags;
  }

  /// functions related to tab backup logic:
  Future<void> addTabRestore(String restore) async {
    var result = await db?.rawQuery("SELECT id FROM TabRestore ORDER BY id DESC LIMIT 1");
    if(result != null && result.isNotEmpty) {
      // replace existing entry
      await db?.rawUpdate("UPDATE TabRestore SET restore = ? WHERE id = ?;", [restore, result[0]["id"].toString()]);
    } else {
      // or add new if no entries
      await db?.rawInsert("INSERT INTO TabRestore(restore) VALUES(?);", [restore]);
    }

    // clear all then add a new one
    // await clearTabRestore();
    // await db?.rawInsert("INSERT INTO TabRestore(restore) VALUES(?);", [restore]);
    return;
  }

  Future<void> clearTabRestore() async {
    await db?.rawDelete("DELETE FROM TabRestore WHERE id IS NOT NULL;"); // remove previous items
    return;
  }

  Future<List<String>> getTabRestore() async {
    var result = await db?.rawQuery("SELECT id, restore FROM TabRestore ORDER BY id DESC LIMIT 1;");
    List<String> restoreItem = []; // id, restoreString
    if (result != null && result.isNotEmpty) {
      restoreItem.add(result[0]["id"].toString());
      restoreItem.add(result[0]["restore"].toString());
    }
    return restoreItem;
  }

  Future<void> removeTabRestore(String id) async {
    await db?.rawDelete("DELETE FROM TabRestore WHERE id=?;", [id]);
    return;
  }
  ///////

  /// Remove duplicates and add every new search to history table
  void updateSearchHistory(String searchText, String? booruType, String? booruName) async{
    // trim extra spaces
    searchText = searchText.trim();

    // remove non-favourite duplicates of new entry
    const String notFavouriteQuery = "(isFavourite != '1' OR isFavourite is null)";
    await db?.rawDelete("DELETE FROM SearchHistory WHERE searchText=? AND booruType=? AND booruName=? AND $notFavouriteQuery;", [searchText, booruType, booruName]);

    var favouriteDuplicates = await db?.rawQuery("SELECT * FROM SearchHistory WHERE searchText=? AND booruType=? AND booruName=? AND isFavourite == '1';", [searchText, booruType, booruName]);
    if(favouriteDuplicates == null || favouriteDuplicates.isEmpty) { // insert new entry only if it wasn't favourited before
      await db?.rawInsert("INSERT INTO SearchHistory(searchText, booruType, booruName) VALUES(?,?,?)", [searchText, booruType, booruName]);
    } else { // otherwise update the last seartch time
      await db?.rawUpdate("UPDATE SearchHistory SET timestamp = CURRENT_TIMESTAMP WHERE searchText=? AND booruType=? AND booruName=? AND isFavourite == '1';", [searchText, booruType, booruName]);
    }

    // remove everything except last X entries (ignores favourited)
    await db?.rawDelete("DELETE FROM SearchHistory WHERE $notFavouriteQuery AND id NOT IN (SELECT id FROM SearchHistory WHERE $notFavouriteQuery ORDER BY id DESC LIMIT 5000);");
  }

  /// Get search history entries
  Future<List<Map<String, dynamic>>> getSearchHistory() async{
    var metaData = await db?.rawQuery("SELECT * FROM SearchHistory GROUP BY searchText, booruName ORDER BY id DESC");
    List<Map<String, dynamic>> result = [];
    metaData?.forEach((s) {
      result.add({
        'id': s['id'],
        'searchText': s['searchText'].toString(),
        'booruType': s['booruType'].toString(),
        'booruName': s['booruName'].toString(),
        'isFavourite': s['isFavourite'].toString(),
        'timestamp': s['timestamp'].toString(),
      });
    });
    return result;
  }

  Future<List<String>> getSearchHistoryByInput(String queryStr, int limit) async{
    List<String> tags = [];
    var result = await db?.rawQuery("SELECT DISTINCT searchText FROM SearchHistory WHERE lower(searchText) LIKE (?) LIMIT $limit",["${queryStr.toLowerCase()}%"]);
    if (result != null && result.isNotEmpty){
      for (int i = 0; i < result.length; i++){
        tags.add(result[i]["searchText"].toString());
      }
    }
    return tags;
  }

  /// Delete entry from search history (if no id given - clears everything)
  Future<void> deleteFromSearchHistory(int? id) async{
    if(id != null) {
      await db?.rawDelete("DELETE FROM SearchHistory WHERE id IN (?)", [id]);
    } else {
      await db?.rawDelete("DELETE FROM SearchHistory WHERE id IS NOT NULL");
    }
    return;
  }

  /// Set/unset search history entry as favourite
  Future<void> setFavouriteSearchHistory(int id, bool isFavourite) async{
    await db?.rawUpdate("UPDATE SearchHistory SET isFavourite = ? WHERE id = ?", [Tools.boolToInt(isFavourite), id]);
    return;
  }

  /// Return a list of boolean for isSnatched and isFavourite
  Future<List<bool>> getTrackedValues(BooruItem item) async {
    List<bool> values = [false,false];
    List? result;

    // DateTime startTime = DateTime.now();
    if (item.fileURL.contains("sankakucomplex.com") || item.fileURL.contains("rule34.xxx") || item.fileURL.contains("paheal.net")){
      // compare by post url, not file url (for example: r34xxx changes urls based on country)
      result = await db?.rawQuery("SELECT isFavourite, isSnatched FROM BooruItem WHERE postURL = ?", [item.postURL]);
    } else {
      result = await db?.rawQuery("SELECT isFavourite, isSnatched FROM BooruItem WHERE fileURL = ?", [item.fileURL]);
    }
    // print("getTrackedValues: ${DateTime.now().difference(startTime).inMilliseconds}ms"); // performance test
    if (result != null && result.isNotEmpty){
      Logger.Inst().log("file url is: ${item.fileURL}", "DBHandler", "getTrackedValues", LogTypes.booruHandlerInfo);
      Logger.Inst().log(result.toString(), "DBHandler", "getTrackedValues", LogTypes.booruHandlerInfo);
      values[0] = Tools.intToBool(result.first["isSnatched"]);
      values[1] = Tools.intToBool(result.first["isFavourite"]);
    }
    return values;
  }

  /// Return a list of lists of boolean for isSnatched and isFavourite, attempt to make a bulk fetcher
  Future<List<List<bool>>> getMultipleTrackedValues(List<BooruItem> items) async {
    List<List<bool>> values = [];

    List<String> queryParts = [];
    List<String> queryArgs = [];
    for (BooruItem item in items) {
      if (item.fileURL.contains("sankakucomplex.com") || item.fileURL.contains("rule34.xxx") || item.fileURL.contains("paheal.net")) {
        // compare by post url, not file url (for example: r34xxx changes urls based on country)
        // TODO merge them by type? i.e. - (postURL in [] OR fileURL in [])
        queryParts.add("postURL = ?");
        queryArgs.add(item.postURL);
      } else {
        queryParts.add('fileURL = ?');
        queryArgs.add(item.fileURL);
      }
    }

    // DEBUG output query string
    // String query = "SELECT fileURL, postURL, isFavourite, isSnatched FROM BooruItem WHERE ";
    // for (int i = 0; i < queryParts.length; i++) {
    //   query += queryParts[i].replaceFirst('?', "'${queryArgs[i]}'");
    //   if (i < queryParts.length - 1) {
    //     query += " OR ";
    //   }
    // }
    // // split string into chunks of 1000, otherwise console could slice off the last part
    // for(int i = 0; i < (query.length / 1000).ceil(); i++) {
    //   print(query.substring(i * 1000, min(query.length, (i + 1) * 1000)));
    // }

    // DateTime startTime = DateTime.now();
    List? result = await db?.rawQuery("SELECT fileURL, postURL, isFavourite, isSnatched FROM BooruItem WHERE ${queryParts.join(' OR ')};", queryArgs);
    // print("Query took ${DateTime.now().difference(startTime).inMilliseconds}ms"); // performance test

    if (result != null) {
      for (BooruItem item in items) {
        final res = result.firstWhere((el) => el["postURL"].toString() == item.postURL, orElse: () => {"isSnatched": 0, "isFavourite": 0});
        // Logger.Inst().log("file url is: $fileURL", "DBHandler", "getTrackedValues", LogTypes.booruHandlerInfo);
        Logger.Inst().log(res.toString(), "DBHandler", "getTrackedValues", LogTypes.booruHandlerInfo);
        values.add([
          Tools.intToBool(res["isSnatched"]),
          Tools.intToBool(res["isFavourite"])
        ]);
      }
    }
    return values;
  }

  /// Deletes booruItems which are no longer favourited or snatched
  Future<bool> deleteUntracked() async {
    var result = await db?.rawQuery("SELECT id FROM BooruItem WHERE isFavourite = 0 and isSnatched = 0");
    if (result != null && result.isNotEmpty) {
      deleteItem(result.map((r) => r["id"].toString()).toList());
    }
    return true;
  }

  /// Deletes a BooruItem and its tags from the database
  void deleteItem(List<String> itemIDs) async {
    Logger.Inst().log("DBHandler deleting: $itemIDs", "DBHandler", "deleteItem", LogTypes.booruHandlerInfo);
    String questionMarks = List.generate(itemIDs.length, (_) => '?').join(',');
    await db?.rawDelete("DELETE FROM BooruItem WHERE id IN ($questionMarks)", itemIDs);
    await db?.rawDelete("DELETE FROM ImageTag WHERE booruItemID IN ($questionMarks)", itemIDs);
  }
}