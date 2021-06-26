import 'dart:io';

import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:LoliSnatcher/Tools.dart';

class DBHandler{
  Database? db;
  DBHandler();

  //Connects to the database file and create the database if the tables dont exist
  Future<bool> dbConnect(String path)async{
    if(Platform.isAndroid){
      db = await openDatabase(path+"store.db", version: 1);
    } else {
      sqfliteFfiInit();
      var databaseFactory = databaseFactoryFfi;
      db = await databaseFactory.openDatabase(path+"store.db");
    }
    await updateTable();
    await deleteUntracked();
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
      // add new column, try-catch to ignore the "already added" error
      await db?.execute("ALTER TABLE SearchHistory ADD COLUMN isFavourite INTEGER;");
    } catch(e) {
      // print(e);
    }
    return true;
  }

  //Inserts a new booruItem or updates the isSnatched and isFavourite values of an existing BooruItem in the database
  Future<String?> updateBooruItem(BooruItem item, String mode) async{
    print("updateBooruItem called fileURL is:" + item.fileURL);
    String? itemID = await getItemID(item.fileURL);
    String resultStr = "";
    if (itemID == null || itemID.isEmpty) {
      var result = await db?.rawInsert("INSERT INTO BooruItem(thumbnailURL,sampleURL,fileURL,postURL,mediaType,isSnatched,isFavourite) VALUES(?,?,?,?,?,?,?)",
          [item.thumbnailURL, item.sampleURL, item.fileURL, item.postURL, item.mediaType, Tools.boolToInt(item.isSnatched), Tools.boolToInt(item.isFavourite)]);
      itemID = result?.toString();
      updateTags(item.tagsList, itemID);
      resultStr = "Inserted";
    } else if (mode == "local") {
      await db?.rawUpdate("UPDATE BooruItem SET isSnatched = ?, isFavourite = ? WHERE id = ?", [Tools.boolToInt(item.isSnatched), Tools.boolToInt(item.isFavourite), itemID]);
      resultStr = "Updated";
    } else {
      resultStr = "Already Exists";
    }
    await deleteUntracked();
    return resultStr;
  }


  //Gets a BooruItem id from the database based on a fileurl
  Future<String?> getItemID(String fileURL) async{
    var result;
    // search filename, not full url (for example: r34xxx changes urls based on country)
    if (fileURL.contains("s.sankakucomplex.com") || fileURL.contains("rule34.xxx") || fileURL.contains("paheal.net")){
      result = await db?.rawQuery("SELECT id FROM BooruItem WHERE fileURL LIKE (?)", ["%" + Tools.getFileName(fileURL) + "%"]);
    } else {
      result = await db?.rawQuery("SELECT id FROM BooruItem WHERE fileURL IN (?)", [fileURL]);
    }
    if (result != null && result.isNotEmpty){
      return result.first["id"].toString();
    } else {
      return null;
    }
  }

  //Gets a list of BooruItem from the database
  Future<List<BooruItem>> searchDB(String tagString, String offset, String limit, String order, String mode) async {
    List<String> tags;
    var result;
    List<BooruItem> fetched = [];
    String questionMarks = "?";
    print("Searching DB for tags ${tagString}");
    if (tagString.isNotEmpty){
      tags = tagString.split(" ");
      for (int i = 1; i < tags.length; i++){
        questionMarks += ",?";
      }
      /*
      var metaData = await db?.rawQuery("SELECT BooruItem.id as dbid, thumbnailURL,sampleURL,fileURL,postURL,mediaType,isSnatched,isFavourite, GROUP_CONCAT(Tag.name,',') as tags FROM BooruItem "
        "LEFT JOIN ImageTag on BooruItem.id = ImageTag.booruItemID "
        "LEFT JOIN Tag on ImageTag.tagID = Tag.id "
        "WHERE dbid IN (?) AND isFavourite = 1 GROUP BY dbid",[itemID]);
       */
      result = await db?.rawQuery(
          "SELECT BooruItem.id as dbid FROM BooruItem "
              "LEFT JOIN ImageTag on dbid = ImageTag.booruItemID "
              "LEFT JOIN Tag on ImageTag.tagID = Tag.id "
              "WHERE Tag.name IN ($questionMarks) AND isFavourite = 1 GROUP BY dbid "
              "HAVING COUNT(*) = ${tags.length} ORDER BY dbid $order LIMIT $limit OFFSET $offset", tags);
    } else {
      result = await db?.rawQuery(
          "SELECT id as dbid FROM BooruItem WHERE isFavourite = 1 ORDER BY id $order LIMIT $limit OFFSET $offset");
    }
    print("got results from db");
    print(result);
    if (result != null && result.isNotEmpty){
      List<BooruItem> booruItems = await getBooruItems(List<int>.from(result.map((r) {
        return r["dbid"];
      })), mode);
      fetched.addAll(booruItems);

      // for(int i=0; i < result.length; i++){
      //   BooruItem? temp = await getBooruItem(result[i]["dbid"], mode);
      //   if (temp != null){
      //     fetched.add(temp);
      //   } else {
      //     print("skipped ${result[i]["id"]}");
      //   }
      // }
    }
    return fetched;
  }
  //Gets amount of BooruItems from the database
  Future<int> searchDBCount(String tagString) async {
    List<String> tags;
    var result;
    int count = 0;
    String questionMarks = "?";
    if (tagString.isNotEmpty){
      tags = tagString.split(" ");
      for (int i = 1; i < tags.length; i++){
        questionMarks += ",?";
      }


      /*
      * "SELECT BooruItem.id as dbid, isFavourite FROM BooruItem "
              "LEFT JOIN ImageTag on dbid = ImageTag.booruItemID "
              "LEFT JOIN Tag on ImageTag.tagID = Tag.id "
              "WHERE Tag.name IN ($questionMarks) AND isFavourite = 1 GROUP BY dbid "
              "HAVING COUNT(*) = ${tags.length} ORDER BY dbid $order LIMIT $limit OFFSET $offset", tags);
      * */
      result = await db?.rawQuery(
          "SELECT COUNT(*) as count FROM BooruItem "
              "LEFT JOIN ImageTag on BooruItem.id = ImageTag.booruItemID "
              "LEFT JOIN Tag on ImageTag.tagID = Tag.id "
              "WHERE Tag.name IN ($questionMarks) AND isFavourite = 1 GROUP BY BooruItem.id "
              "HAVING COUNT(*) = ${tags.length}", tags);
    } else {
      result = await db?.rawQuery("SELECT COUNT(*) as count FROM BooruItem WHERE isFavourite = 1");
    }
    print("got count results from db");
    print(result);
    if (result != null && result.isNotEmpty){
      if(result.length > 1) {
        count = result.length;
      } else if(result.length == 1) {
        count = result[0]["count"];
      }
    }
    return count;
  }
  //Gets the favourites count from db
  Future<int> getFavouritesCount() async {
    var result;
    result = await db?.rawQuery("SELECT COUNT(*) as count FROM BooruItem WHERE isFavourite = 1");
    print("got results from db");
    print(result);
    if (result != null){
      return result.first["count"];
    }
    return 0;
  }

  //Creates a BooruItem from a BooruItem id
  Future<BooruItem?> getBooruItem(int itemID, String mode) async{
    var metaData = await db?.rawQuery("SELECT BooruItem.id as dbid, thumbnailURL,sampleURL,fileURL,postURL,mediaType,isSnatched,isFavourite, GROUP_CONCAT(Tag.name,',') as tags FROM BooruItem "
        "LEFT JOIN ImageTag on BooruItem.id = ImageTag.booruItemID "
        "LEFT JOIN Tag on ImageTag.tagID = Tag.id "
        "WHERE dbid IN (?) GROUP BY dbid",[itemID]);
    BooruItem item;
    if (metaData != null && metaData.isNotEmpty){
      item = new BooruItem(
        fileURL: metaData.first["fileURL"].toString(),
        sampleURL: metaData.first["fileURL"].toString(),
        thumbnailURL: metaData.first["thumbnailURL"].toString(),
        tagsList: metaData.first["tags"].toString().split(","),
        postURL: metaData.first["postURL"].toString(),
      );
      //var tags = await db?.rawQuery("SELECT name FROM ImageTag INNER JOIN Tag on ImageTag.tagID = Tag.ID WHERE booruItemID in (?)", [itemID]);
      //tags?.forEach((tag) {tagsList.add(tag["name"].toString());});
      if (mode == "loliSyncFav"){
        item.isSnatched = false;
      } else {
        item.isSnatched = Tools.intToBool(int.parse(metaData.first["isSnatched"].toString()));
      }
      item.isFavourite = Tools.intToBool(int.parse(metaData.first["isFavourite"].toString()));
      //item.tagsList = tagsList;
      return item;
    } else {
      return null;
    }
  }
  Future<List<BooruItem>> getBooruItems(List<int> itemIDs, String mode) async{
    var metaData = await db?.rawQuery("SELECT BooruItem.id as ItemID, thumbnailURL, sampleURL, fileURL, postURL, mediaType, isSnatched, isFavourite, GROUP_CONCAT(Tag.name,',') as tags FROM BooruItem "
        "LEFT JOIN ImageTag on BooruItem.id = ImageTag.booruItemID "
        "LEFT JOIN Tag on ImageTag.tagID = Tag.id "
        "WHERE ItemID IN (${itemIDs.join(',')}) GROUP BY ItemID ORDER BY ItemID DESC");

    List<BooruItem> items = [];
    if (metaData != null && metaData.isNotEmpty){
      for(int i=0; i < metaData.length; i++){
        var currentItem = metaData[i];
        if(currentItem != null && currentItem.isNotEmpty) {
          BooruItem bItem = new BooruItem(
            fileURL: currentItem["fileURL"].toString(),
            sampleURL: currentItem["sampleURL"].toString(),
            thumbnailURL: currentItem["thumbnailURL"].toString(),
            tagsList: currentItem["tags"].toString().split(","),
            postURL: currentItem["postURL"].toString(),
          );
          if (mode == "loliSyncFav"){
            bItem.isSnatched = false;
          } else {
            bItem.isSnatched = Tools.intToBool(int.parse(metaData.first["isSnatched"].toString()));
          }
          bItem.isFavourite = Tools.intToBool(int.parse(metaData.first["isFavourite"].toString()));
          items.add(bItem);
        }
      }
    }
    return items;
  }

  void clearSnatched() async{
    await db?.rawUpdate("UPDATE BooruItem SET isSnatched = 0");
    deleteUntracked();
  }
  void clearFavourites() async{
    await db?.rawUpdate("UPDATE BooruItem SET isFavourite = 0");
    deleteUntracked();
  }
  //Adds tags for a BooruItem to the database
  void updateTags(List tags, String? itemID) async{
    if(itemID == null) return;
    String? id = "";
    tags.forEach((tag) async{
      id = await getTagID(tag);
      if (id != null && id!.isEmpty){
        var result = await db?.rawInsert("INSERT INTO Tag(name) VALUES(?)", [tag]);
        id = result?.toString();
      }
      await db?.rawInsert("INSERT INTO ImageTag(tagID, booruItemID) VALUES(?,?)", [id,itemID]);
    });
  }

  //Gets a tag id from the database
  Future<String> getTagID(String tagName) async{
    var result = await db?.rawQuery("SELECT id FROM Tag WHERE name IN (?)", [tagName]);
    if (result != null && result.isNotEmpty){
      return result.first["id"].toString();
    } else {
      return "";
    }
  }
  //Get a list of tags from the database based on an input
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

  // functions related to tab backup logic:
  Future<void> addTabRestore(String restore) async {
    await clearTabRestore();
    await db?.rawInsert("INSERT INTO TabRestore(restore) VALUES(?)", [restore]);
    return;
  }
  Future<void> clearTabRestore() async {
    await db?.rawDelete("DELETE FROM TabRestore WHERE id IN (SELECT id FROM TabRestore);"); // remove previous items
    return;
  }
  Future<List<String>> getTabRestore() async {
    var result = await db?.rawQuery("SELECT id, restore FROM TabRestore ORDER BY id DESC LIMIT 1");
    List<String> restoreItem = []; // id, restoreString
    if (result != null && result.isNotEmpty){
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

  // Remove duplicates and add every new search to history table
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

  // Get search history entries
  Future<List<List<String>>> getSearchHistory() async{
    var metaData = await db?.rawQuery("SELECT * FROM SearchHistory GROUP BY searchText, booruName ORDER BY id DESC");
    List<List<String>> result = [];
    metaData?.forEach((s) {
      result.add([
        s['id'].toString(),
        s['searchText'].toString(),
        s['booruType'].toString(),
        s['booruName'].toString(),
        s['isFavourite'].toString(),
        s['timestamp'].toString(),
      ]);
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

  // Delete entry from search history (if no id given - clears everything)
  Future<void> deleteFromSearchHistory(String? id) async{
    if(id != null) {
      await db?.rawDelete("DELETE FROM SearchHistory WHERE id IN (?)", [id]);
    } else {
      await db?.rawDelete("DELETE FROM SearchHistory WHERE id IS NOT NULL");
    }
    return;
  }

  // Set/unset search history entry as favourite
  Future<void> setFavouriteSearchHistory(String id, bool isFavourite) async{
    await db?.rawUpdate("UPDATE SearchHistory SET isFavourite = ? WHERE id = ?", [Tools.boolToInt(isFavourite), id]);
    return;
  }

  //Return a list of boolean for isSnatched and isFavourite
  Future<List<bool>> getTrackedValues(String fileURL) async{
    List<bool> values = [false,false];
    var result;
    // search filename, not full url (for example: r34xxx changes urls based on country)
    if (fileURL.contains("s.sankakucomplex.com") || fileURL.contains("rule34.xxx") || fileURL.contains("paheal.net")){
      result = await db?.rawQuery("SELECT isFavourite,isSnatched FROM BooruItem WHERE fileURL LIKE (?)", ["%" + Tools.getFileName(fileURL) + "%"]);
    } else {
      result = await db?.rawQuery("SELECT isFavourite,isSnatched FROM BooruItem WHERE fileURL IN (?)", [fileURL]);
    }
    if (result != null && result.isNotEmpty){
      print("file url is: $fileURL");
      print(result.toString());
      values[0] = Tools.intToBool(result.first["isSnatched"]);
      values[1] = Tools.intToBool(result.first["isFavourite"]);
    }
    return values;
  }
  // Deletes booruItems which are no longer favourited or snatched
  Future<bool> deleteUntracked() async{
    var result = await db?.rawQuery("SELECT id FROM BooruItem WHERE isFavourite = 0 and isSnatched = 0");
    if (result != null && result.isNotEmpty){
      deleteItem(result.map((r) => r["id"].toString()).toList());
    }
    return true;
  }

  //Deletes a BooruItem and its tags from the database
  void deleteItem(List<String> itemIDs) async{
    print("DBHandler deleting: $itemIDs");
    String questionMarks = "?";
    for (int i = 1; i < itemIDs.length; i++){
      questionMarks += ",?";
    }
    await db?.rawDelete("DELETE FROM BooruItem WHERE id IN ($questionMarks)", itemIDs);
    await db?.rawDelete("DELETE FROM ImageTag WHERE booruItemID IN ($questionMarks)", itemIDs);
  }
}