import 'dart:io';

import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../Tools.dart';

class DBHandler{
  Database? db;
  DBHandler();

  //Connects to the database file and create the database if the tables dont exist
  void dbConnect(String path)async{
    if(Platform.isAndroid){
      db = await openDatabase(path+"store.db", version: 1);
    } else {
      sqfliteFfiInit();
      var databaseFactory = databaseFactoryFfi;
      db = await databaseFactory.openDatabase(path+"store.db");
    }
    await updateTable();
    await deleteUntracked();
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
  void updateBooruItem(BooruItem item) async{
    print("updateBooruItem called fileURL is:" + item.fileURL);
    String? itemID = await getItemID(item.fileURL);
    if (itemID == null || itemID.isEmpty) {
      var result = await db?.rawInsert("INSERT INTO BooruItem(thumbnailURL,sampleURL,fileURL,postURL,mediaType,isSnatched,isFavourite) VALUES(?,?,?,?,?,?,?)",
          [item.thumbnailURL, item.sampleURL, item.fileURL, item.postURL, item.mediaType, Tools.boolToInt(item.isSnatched), Tools.boolToInt(item.isFavourite)]);
      itemID = result?.toString();
      updateTags(item.tagsList!, itemID);
    } else {
      await db?.rawUpdate("UPDATE BooruItem SET isSnatched = ?, isFavourite = ? WHERE id = ?", [Tools.boolToInt(item.isSnatched), Tools.boolToInt(item.isFavourite), itemID]);
    }
  }


  //Gets a BooruItem id from the database based on a fileurl
  Future<String?> getItemID(String fileURL) async{
    var result;
    if (fileURL.contains("s.sankakucomplex.com")){
      result = await db?.rawQuery("SELECT id FROM BooruItem WHERE fileURL LIKE (?)", [fileURL.split("?")[0]+"%"]);
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
  Future<List<BooruItem>> searchDB(String tagString, String offset, String limit) async {
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
              "HAVING COUNT(*) = ${tags.length} ORDER BY id DESC LIMIT $limit OFFSET $offset", tags);
    } else {
      result = await db?.rawQuery(
          "SELECT id FROM BooruItem ORDER BY id DESC LIMIT $limit OFFSET $offset");
    }
    print("got results from db");
    print(result);
    if (result != null && result.isNotEmpty){
      for(int i=0; i < result.length; i++){
        BooruItem? temp = await getBooruItem(result[i]["id"]);
        if (temp != null){
          fetched.add(temp);
        }
      }
    }
    return fetched;
  }

  //Creates a BooruItem from a BooruItem id
  Future<BooruItem?> getBooruItem(int itemID) async{
    var metaData = await db?.rawQuery("SELECT * FROM BooruItem WHERE ID IN (?) AND isFavourite = 1",[itemID]);
    BooruItem item;
    List<String> tagsList = [];
    if (metaData != null && metaData.isNotEmpty){
      item = new BooruItem(metaData.first["fileURL"].toString(), metaData.first["fileURL"].toString(), metaData.first["thumbnailURL"].toString(), null,  metaData.first["postURL"].toString(), metaData.first["fileURL"].toString().substring(metaData.first["fileURL"].toString().lastIndexOf(".") + 1));
      var tags = await db?.rawQuery("SELECT name FROM ImageTag INNER JOIN Tag on ImageTag.tagID = Tag.ID WHERE booruItemID in (?)", [itemID]);
      tags?.forEach((tag) {tagsList.add(tag["name"].toString());});
      item.isSnatched = Tools.intToBool(int.parse(metaData.first["isSnatched"].toString()));
      item.isFavourite = Tools.intToBool(int.parse(metaData.first["isFavourite"].toString()));
      item.tagsList = tagsList;
      return item;
    } else {
      return null;
    }
  }
  void clearSnatched() async{
    await db?.rawUpdate("UPDATE BooruItem SET isSnatched = 0");
  }
  void clearFavourites() async{
    await db?.rawUpdate("UPDATE BooruItem SET isFavourite = 0");
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

    await db?.rawDelete("DELETE FROM SearchHistory WHERE searchText=? AND booruType=? AND booruName=? AND isFavourite != '1'", [searchText, booruType, booruName]); // remove non-favourite duplicates of new entry

    var favouriteDuplicates = await db?.rawQuery("SELECT * FROM SearchHistory WHERE searchText=? AND booruType=? AND booruName=? AND isFavourite == '1'", [searchText, booruType, booruName]); // insert new entry only if it wasn't favourited before
    if(favouriteDuplicates == null || favouriteDuplicates.isEmpty) {
      await db?.rawInsert("INSERT INTO SearchHistory(searchText, booruType, booruName) VALUES(?,?,?)", [searchText, booruType, booruName]);
    } else { // otherwise update the last seartch time
      await db?.rawUpdate("UPDATE SearchHistory SET timestamp = CURRENT_TIMESTAMP WHERE searchText=? AND booruType=? AND booruName=? AND isFavourite == '1'", [searchText, booruType, booruName]);
    }

    await db?.rawDelete("DELETE FROM SearchHistory WHERE isFavourite != '1' AND id NOT IN (SELECT id FROM SearchHistory WHERE isFavourite != '1' ORDER BY id DESC LIMIT 200)"); // remove everything except last 200 entries (ignores favourited)
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
    if (fileURL.contains("s.sankakucomplex.com")){
      result = await db?.rawQuery("SELECT isFavourite,isSnatched FROM BooruItem WHERE fileURL LIKE (?)", [fileURL.split("?")[0]+"%"]);
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
      result.forEach((element) async{
        deleteItem(int.parse(element["id"].toString()));
      });
    }
    return true;
  }

  //Deletes a BooruItem and its tags from the database
  void deleteItem(int itemID) async{
    print("DBHandler deleting: $itemID");
    await db?.rawDelete("DELETE FROM BooruItem WHERE id IN (?)", [itemID]);
    await db?.rawDelete("DELETE FROM ImageTag WHERE booruItemID IN (?)", [itemID]);
  }
}