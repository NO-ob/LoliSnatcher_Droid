import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:sqflite/sqflite.dart';

import '../Tools.dart';

class DBHandler{
  Database db;
  DBHandler();
  void dbConnect(String path)async{
    db = await openDatabase(path+"store.db", version: 1,
        onCreate: (Database db, int version) async{
          await db.execute("CREATE TABLE BooruItem"
              "(id INTEGER PRIMARY KEY,"
              "thumbnailURL TEXT,"
              "sampleURL TEXT,"
              "fileURL TEXT,"
              "postURL TEXT,"
              "mediaType TEXT,"
              "isSnatched INTEGER,"
              "isFavourite INTEGER"
              ")");
          await db.execute("CREATE TABLE Tag ("
              "id INTEGER PRIMARY KEY,"
              "name TEXT"
              ")");
          await db.execute("CREATE TABLE ImageTag ("
              "tagID INTEGER,"
              "booruItemID INTEGER"
              ")");
        }
    );
    await deleteUntracked();
  }
  void updateBooruItem(BooruItem item) async{
    print("updateBooruItem called fileURL is:" + item.fileURL);
    String itemID = await getItemID(item.fileURL);
    if (itemID.isEmpty){
      var result = await db.rawInsert("INSERT INTO BooruItem(thumbnailURL,sampleURL,fileURL,postURL,mediaType,isSnatched,isFavourite) VALUES(?,?,?,?,?,?,?)",
          [item.thumbnailURL,item.sampleURL,item.fileURL,item.postURL,item.mediaType,Tools.boolToInt(item.isSnatched),Tools.boolToInt(item.isFavourite)]);
      itemID = result.toString();
      updateTags(item.tagsList, itemID);
    } else {
      await db.rawUpdate("UPDATE BooruItem SET isSnatched = ?, isFavourite = ? WHERE id = ?",[Tools.boolToInt(item.isSnatched),Tools.boolToInt(item.isFavourite),itemID]);
    }
  }

  Future<String> getItemID(String fileURL) async{
    var result = await db.rawQuery("SELECT id FROM BooruItem WHERE fileURL IN (?)",[fileURL]);
    print("getItemID id is: $result");
    if (result.isNotEmpty){
      return result.first["id"].toString();
    } else {
      return "";
    }
  }
  Future<List<BooruItem>> searchDB(String tagString, String offset, String limit) async {
    List<String> tags;
    var result;
    List<BooruItem> fetched = new List();
    String questionMarks = "?";
    print("Searching DB for tags ${tagString}");
    if (tagString.isNotEmpty){
      tags = tagString.split(" ");
      for (int i = 1; i < tags.length; i++){
        questionMarks += ",?";
      }
      result = await db.rawQuery(
          "SELECT booruItemID as id FROM ImageTag INNER JOIN Tag on ImageTag.tagID = Tag.id "
              "WHERE Tag.name IN ($questionMarks) GROUP BY booruItemID "
              "HAVING COUNT(*) = ${tags.length} LIMIT $limit OFFSET $offset",tags);
      print(result);
    } else {
      result = await db.rawQuery(
          "SELECT id FROM BooruItem LIMIT $limit OFFSET $offset");
    }
    if (result.isNotEmpty){
      // piece of shit
      /*await result.forEach((item) async{
        BooruItem temp = await getBooruItem(item["id"]);
        if(temp != null){
          print("DB Got item: ${temp.fileURL}");
          fetched.add(temp);
        }
      });*/
      for(int i=0; i < result.length; i++){
        BooruItem temp = await getBooruItem(result[i]["id"]);
        if(temp != null){
          fetched.add(temp);
        }
      }
    }
    return fetched;
  }
  Future<BooruItem> getBooruItem(int itemID) async{
    var metaData = await db.rawQuery("SELECT * FROM BooruItem WHERE ID IN (?)",[itemID]);
    BooruItem item;
    List<String> tagsList = new List();
    if (metaData.isNotEmpty){
      item = new BooruItem(metaData.first["fileURL"], metaData.first["fileURL"], metaData.first["thumbnailURL"], null,  metaData.first["postURL"], metaData.first["fileURL"].substring(metaData.first["fileURL"].lastIndexOf(".") + 1));
      var tags = await db.rawQuery("SELECT name FROM ImageTag INNER JOIN Tag on ImageTag.tagID = Tag.ID WHERE booruItemID in (?)",[itemID]);
      tags.forEach((tag) {tagsList.add(tag["name"]);});
      item.isSnatched = Tools.intToBool(metaData.first["isSnatched"]);
      item.isFavourite = Tools.intToBool(metaData.first["isFavourite"]);
      item.tagsList = tagsList;
      return item;
    } else {
      return null;
    }
  }
  void updateTags(List<String> tags, String itemID) async{
    String id = "";
    tags.forEach((tag) async{
      id = await getTagID(tag);
      if (id.isEmpty){
        var result = await db.rawInsert("INSERT INTO Tag(name) VALUES(?)",[tag]);
        id = result.toString();
      }
      await db.rawInsert("INSERT INTO ImageTag(tagID, booruItemID) VALUES(?,?)",[id,itemID]);
    });
  }

  Future<String> getTagID(String tagName) async{
    var result = await db.rawQuery("SELECT id FROM Tag WHERE name IN (?)",[tagName]);
    print("getTagID id is: $result");
    if (result.isNotEmpty){
      return result.first["id"].toString();
    } else {
      return "";
    }
  }

  Future<bool> deleteUntracked() async{
    var result = await db.rawQuery("SELECT id FROM BooruItem WHERE isFavourite = 0 and isSnatched = 0");
    if (result.isNotEmpty){
      result.forEach((element) async{
        deleteItem(element["id"]);
      });
    }
    return true;
  }

  void deleteItem(int itemID) async{
    print("DBHandler deleting: $itemID");
    await db.rawDelete("DELETE FROM BooruItem WHERE id IN (?)",[itemID]);
    await db.rawDelete("DELETE FROM ImageTag WHERE booruItemID IN (?)",[itemID]);
  }
}