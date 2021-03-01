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
              "tagID INTEGER PRIMARY KEY,"
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
    } else {
      await db.rawUpdate("UPDATE BooruItem SET isSnatched = ?, isFavourite = ? WHERE id = ?",[Tools.boolToInt(item.isSnatched),Tools.boolToInt(item.isFavourite),itemID]);
    }
    var result = await db.rawQuery("SELECT * FROM BooruItem WHERE id IN (?)",[itemID]);
    print("Found item in db: ${result}");
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