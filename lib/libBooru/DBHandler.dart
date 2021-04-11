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
    if (fileURL.contains("s.sankakucomplex.com") || fileURL.contains("rule34.xxx")){
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
      result = await db?.rawQuery(
          "SELECT booruItemID as id FROM ImageTag INNER JOIN Tag on ImageTag.tagID = Tag.id "
              "WHERE Tag.name IN ($questionMarks) GROUP BY booruItemID "
              "HAVING COUNT(*) = ${tags.length} ORDER BY id $order LIMIT $limit OFFSET $offset", tags);
    } else {
      result = await db?.rawQuery(
          "SELECT id FROM BooruItem ORDER BY id $order LIMIT $limit OFFSET $offset");
    }
    print("got results from db");
    print(result);
    if (result != null && result.isNotEmpty){
      for(int i=0; i < result.length; i++){
        BooruItem? temp = await getBooruItem(result[i]["id"], mode);
        if (temp != null){
          fetched.add(temp);
        } else {
          print("skipped ${result[i]["id"]}");
        }
      }
    }
    return fetched;
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
    var metaData = await db?.rawQuery("SELECT * FROM BooruItem WHERE ID IN (?) AND isFavourite = 1",[itemID]);
    BooruItem item;
    List<String> tagsList = [];
    if (metaData != null && metaData.isNotEmpty){
      item = new BooruItem(metaData.first["fileURL"].toString(), metaData.first["fileURL"].toString(), metaData.first["thumbnailURL"].toString(), [], metaData.first["postURL"].toString(), Tools.getFileExt(metaData.first["fileURL"].toString()));
      var tags = await db?.rawQuery("SELECT name FROM ImageTag INNER JOIN Tag on ImageTag.tagID = Tag.ID WHERE booruItemID in (?)", [itemID]);
      tags?.forEach((tag) {tagsList.add(tag["name"].toString());});
      if (mode == "loliSyncFav"){
        item.isSnatched = false;
      } else {
        item.isSnatched = Tools.intToBool(int.parse(metaData.first["isSnatched"].toString()));
      }
      item.isFavourite = Tools.intToBool(int.parse(metaData.first["isFavourite"].toString()));
      item.tagsList = tagsList;
      return item;
    } else {
      return null;
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
    var result = await db?.rawQuery("SELECT name FROM Tag WHERE name LIKE (?) LIMIT $limit",["$queryStr%"]);
    if (result != null && result.isNotEmpty){
      for (int i = 0; i < result.length; i++){
        tags.add(result[i]["name"].toString());
      }
    }
    return tags;
  }

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

    // remove everything except last 500 entries (ignores favourited)
    await db?.rawDelete("DELETE FROM SearchHistory WHERE $notFavouriteQuery AND id NOT IN (SELECT id FROM SearchHistory WHERE $notFavouriteQuery ORDER BY id DESC LIMIT 500);");
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
    if (fileURL.contains("s.sankakucomplex.com") || fileURL.contains("rule34.xxx")){
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