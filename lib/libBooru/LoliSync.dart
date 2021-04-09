import 'dart:convert';
import 'dart:io';

import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'BooruItem.dart';

class LoliSync{
  String ip = "";
  String port = "1234";
  int amount = -1;
  int current = -1;
  var server;
  bool syncKilled = false;
  Stream<String> startServer(SettingsHandler settingsHandler) async* {
    ip = await ServiceHandler.getIP();
    server = await HttpServer.bind(ip, 1234);
    yield "Server active at $ip:$port";
    await for (var req in server) {
      print(req.uri.path.toString());
      switch (req.uri.path.toString()) {
        case("/lolisync/booruitem"):
          if (req.method == 'POST') {
            try {
              print(req.uri.queryParametersAll.toString());
              amount = int.parse(req.uri.queryParameters["amount"]!);
              current = int.parse(req.uri.queryParameters["current"]!);
              print("request to update booru item recieved");
              String content = await utf8.decoder.bind(req).join(); /*2*/
              BooruItem item = BooruItem.fromJSON(content);
              if (settingsHandler.dbEnabled) {
                String? result = await settingsHandler.dbHandler
                    .updateBooruItem(item, "sync");
                yield "$current / $amount - $result";
                req.response.statusCode = 200;
                req.response.write(result);
              }
              if (current == amount - 1){
                await server.close();
                yield "Server closed";
              }
            } catch (e) {
              print(e);
            }
          } else {
            req.response.statusCode = 404;
            req.response.write("Invalid Query");
          }
          break;
      }
      await req.response.close();
    }
  }
  void killServer() async{
    await server.close();
    ServiceHandler.displayToast("LoliSync server killed");
  }
  void killSync(){
    syncKilled = true;
  }
  Future<String> send(BooruItem item, String ip, String port, int favouritesCount, int current) async{
    print("Sending item $current / $favouritesCount");
    HttpClientRequest request = await HttpClient().post(ip, int.parse(port), "/lolisync/booruitem?amount=$favouritesCount&current=$current")
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(item.toJSON())); /*3*/
    HttpClientResponse response = await request.close();
    String responseStr = await utf8.decoder.bind(response).join();
    return responseStr;
  }
  Stream<String> startSync(SettingsHandler settingsHandler, String ip, String port, String type) async*{
    switch(type){
      case "Favourites":
        yield "Sync Starting";
        int favouritesCount = await settingsHandler.dbHandler.getFavouritesCount();
        if (favouritesCount > 0){
          int ceiling = (favouritesCount / 10).ceil();
          for(int i=0; i < ceiling; i++){
            if (!syncKilled){
              int tens = i*10;
              List<BooruItem> fetched = await settingsHandler.dbHandler.searchDB("",tens.toString(),"10","ASC","loliSyncFav");
              print("fetched is ${fetched.length} i is $i");
              for (int x = 0; x < fetched.length; x++){
                int count = tens + x;
                print("count is $count");
                if (count < favouritesCount){
                  String resp = await send(fetched.elementAt(x), ip, port, favouritesCount, count);
                  yield "$count / $favouritesCount - $resp";
                } else {
                  print("skipping");
                }
              }
            }
          }
          yield "Sync complete";
        } else {
          yield "No Favourites";
        }
    }
  }
}