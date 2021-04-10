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
          yield await storeBooruItem(req, settingsHandler);
          break;
        case("/lolisync/settings"):
          yield await storeSettings(req, settingsHandler);
          break;
        case("/lolisync/booru"):
          yield await storeBooru(req, settingsHandler);
          break;
      }
      await req.response.close();
    }
  }
  Future<String> storeSettings(var req, SettingsHandler settingsHandler) async{
    if (req.method == 'POST') {
      try {
        print("request to update settings recieved");
        String content = await utf8.decoder.bind(req).join(); /*2*/
        await settingsHandler.loadFromJSON(content);
        req.response.statusCode = 200;
        req.response.write("Settings Sent");
        return "Settings Saved";
      } catch (e) {
        print(e);
      }
    } else {
      req.response.statusCode = 404;
      req.response.write("Invalid Query");
      return "Invalid Query";
    }
    return "Something went wrong";
  }

  Future<String> storeBooruItem(var req, SettingsHandler settingsHandler) async{
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
          req.response.statusCode = 200;
          req.response.write(result);
          if (current == amount - 1){
            return "Favourites Synced";
          } else {
            return "$current / $amount - $result";
          }
        }

      } catch (e) {
        print(e);
      }
    } else {
      req.response.statusCode = 404;
      req.response.write("Invalid Query");
      return "Invalid Query";
    }
    return "Something went wrong";
  }
  Future<String> storeBooru(var req, SettingsHandler settingsHandler) async{
    if (req.method == 'POST') {
      try {
        print(req.uri.queryParametersAll.toString());
        print("request to add item recieved");
        amount = int.parse(req.uri.queryParameters["amount"]!);
        current = int.parse(req.uri.queryParameters["current"]!);
        String content = await utf8.decoder.bind(req).join(); /*2*/
        Booru booru = Booru.fromJSON(content);
        if (booru.name != "Favourites"){
          for (int i=0; i < settingsHandler.booruList.length; i++){
            if (settingsHandler.booruList.isNotEmpty) {
              if (settingsHandler.booruList[i].baseURL == booru.baseURL) {
                settingsHandler.booruList.removeAt(i);
              }
            }
          }
          await settingsHandler.saveBooru(booru);
        }
        req.response.statusCode = 200;
        req.response.write("Success");
        if (current == amount - 1){
          return "Booru Configs Synced";
        } else {
          return "$current / $amount - ${booru.name}";
        }
      } catch (e) {
        print(e);
      }
    } else {
      req.response.statusCode = 404;
      req.response.write("Invalid Query");
      return "Invalid Query";
    }
    return "Something went wrong";
  }
  void killServer() async{
    await server.close();
    ServiceHandler.displayToast("LoliSync server killed");
  }


  void killSync(){
    syncKilled = true;
  }
  Future<String> sendBooruItem(BooruItem item, String ip, String port, int favouritesCount, int current) async{
    print("Sending item $current / $favouritesCount");
    HttpClientRequest request = await HttpClient().post(ip, int.parse(port), "/lolisync/booruitem?amount=$favouritesCount&current=$current")
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(item.toJSON())); /*3*/
    HttpClientResponse response = await request.close();
    String responseStr = await utf8.decoder.bind(response).join();
    return responseStr;
  }
  Future<String> sendSettings(Map settingsJSON, String ip, String port) async{
    print("Sending settings $settingsJSON");
    HttpClientRequest request = await HttpClient().post(ip, int.parse(port), "/lolisync/settings")
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(settingsJSON));
    HttpClientResponse response = await request.close();
    String responseStr = await utf8.decoder.bind(response).join();
    return responseStr;
  }
  Future<String> sendBooru(Booru booru, String ip, String port, int booruCount, int current) async{
    print("Sending item $current / $booruCount");
    HttpClientRequest request = await HttpClient().post(ip, int.parse(port), "/lolisync/booru?amount=$booruCount&current=$current")
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(booru.toJSON()));
    HttpClientResponse response = await request.close();
    String responseStr = await utf8.decoder.bind(response).join();
    return responseStr;
  }
  Stream<String> startSync(SettingsHandler settingsHandler, String ip, String port, List<String> toSync) async*{
    for (int i = 0; i < toSync.length; i++){
      switch(toSync.elementAt(i)){
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
                    String resp = await sendBooruItem(fetched.elementAt(x), ip, port, favouritesCount, count);
                    yield "$count / $favouritesCount - $resp";
                  } else {
                    print("skipping");
                  }
                }
              }
            }
            yield "Favourites sent";
          } else {
            yield "No Favourites";
          }
          break;
        case "Settings":
          yield "Sync Starting";
          String resp = await sendSettings(settingsHandler.toJSON(), ip, port);
          yield resp;
          break;
        case "Booru":
          yield "Sync Starting";
          int booruCount = await settingsHandler.booruList.length;
          if (booruCount > 0){
            for (int i = 0; i < booruCount; i++){
              if (!syncKilled){
                if (i < booruCount){
                  String resp = await sendBooru(settingsHandler.booruList.elementAt(i), ip, port, booruCount, i);
                  yield "$i / $booruCount - $resp";
                } else {
                  print("skipping");
                }
              }
            }
            yield "Booru Configs sent";
          } else {
            yield "No Booru Configs";
          }
          break;
      }
    }

  }
}