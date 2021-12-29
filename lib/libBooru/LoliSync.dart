import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/utilities/Logger.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BooruItem.dart';

class LoliSync{
  String ip = "127.0.0.1";
  int port = 8080;

  int amount = -1;
  int current = -1;

  var server;
  bool syncKilled = false;

  Stream<String> startServer(String? ipOverride, String? portOverride) async* {
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();

    String newIp = ipOverride ?? await ServiceHandler.getIP();
    int newPort = int.tryParse(portOverride ?? '8080') ?? 8080;

    this.ip = newIp;
    this.port = newPort;
    server = await HttpServer.bind(ip, port);

    yield "Server active at $ip:$port";
    await for (var req in server) {
      Logger.Inst().log(req.uri.path.toString(), "LoliSync", "startServer", LogTypes.loliSyncInfo);
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
        case("/lolisync/tabs"):
          yield await storeTabs(req, settingsHandler);
          break;
        case("/lolisync/test"):
          yield 'Test';
          break;
      }
      await req.response.close();
    }
  }

  Future<String> storeSettings(var req, SettingsHandler settingsHandler) async{
    if (req.method == 'POST') {
      try {
        Logger.Inst().log("request to update settings recieved", "LoliSync", "storeSettings", LogTypes.loliSyncInfo);
        String content = await utf8.decoder.bind(req).join(); /*2*/
        await settingsHandler.loadFromJSON(content, false);
        req.response.statusCode = 200;
        req.response.write("Settings Sent");
        return "Settings Saved";
      } catch (e) {
        Logger.Inst().log(e.toString(), "LoliSync", "storeSettings", LogTypes.exception);
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
        amount = int.parse(req.uri.queryParameters["amount"]!);
        current = int.parse(req.uri.queryParameters["current"]!);
        Logger.Inst().log("request to update booru item recieved", "LoliSync", "storeBooruItem", LogTypes.loliSyncInfo);
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
        Logger.Inst().log(e.toString(), "LoliSync", "storeBooruItem", LogTypes.exception);
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
        Logger.Inst().log("request to add item recieved", "LoliSync", "storeBooru", LogTypes.loliSyncInfo);
        amount = int.parse(req.uri.queryParameters["amount"]!);
        current = int.parse(req.uri.queryParameters["current"]!);
        String content = await utf8.decoder.bind(req).join(); /*2*/
        Booru booru = Booru.fromJSON(content);

        if (booru.name != "Favourites") {
          // Remove existing booru if base url is the same
          // TODO merge their data (i.e. api keys) or don't do anything if they have the same name+base url instead
          // for (int i=0; i < settingsHandler.booruList.length; i++){
          //   if (settingsHandler.booruList.isNotEmpty) {
          //     if (settingsHandler.booruList[i].baseURL == booru.baseURL) {
          //       settingsHandler.booruList.removeAt(i);
          //     }
          //   }
          // }
          bool alreadyExists = settingsHandler.booruList.indexWhere((el) => el.baseURL == booru.baseURL && el.name == booru.name) != -1;
          if(!alreadyExists) await settingsHandler.saveBooru(booru);
        }
        req.response.statusCode = 200;
        req.response.write("Success");
        if (current == amount - 1){
          return "Booru Configs Synced";
        } else {
          return "$current / $amount - ${booru.name}";
        }
      } catch (e) {
        Logger.Inst().log(e.toString(), "LoliSync", "storeBooru", LogTypes.exception);
      }
    } else {
      req.response.statusCode = 404;
      req.response.write("Invalid Query");
      return "Invalid Query";
    }
    req.response.statusCode = 404;
    req.response.write("Invalid Query");
    return "Something went wrong";
  }

  Future<String> storeTabs(var req, SettingsHandler settingsHandler) async {
    final SearchHandler searchHandler = Get.find<SearchHandler>();
    if (req.method == 'POST') {
      try {
        Logger.Inst().log("request to update tabs recieved", "LoliSync", "storeTabs", LogTypes.loliSyncInfo);
        String content = await utf8.decoder.bind(req).join(); /*2*/
        String mode = req.uri.queryParameters["mode"]!;
        String? tabsString = jsonDecode(content)?["tabs"];
        // print('tabsString: $tabsString');
        // print('mode: $mode');
        if(tabsString != null && tabsString.isNotEmpty) {
          if(mode == 'Merge') {
            searchHandler.mergeTabs(tabsString);
          } else if(mode == 'Replace') {
            searchHandler.replaceTabs(tabsString);
          }
        }

        req.response.statusCode = 200;
        req.response.write("Tabs Sent");
        return "Tabs Saved";
      } catch (e) {
        Logger.Inst().log(e.toString(), "LoliSync", "storeTabs", LogTypes.exception);
      }
    } else {
      req.response.statusCode = 404;
      req.response.write("Invalid Query");
      return "Invalid Query";
    }
    return "Something went wrong";
  }




  void killServer() async {
    await server.close();
    FlashElements.showSnackbar(
      title: Text(
        "LoliSync server killed!",
        style: TextStyle(fontSize: 20)
      ),
      leadingIcon: Icons.warning_amber,
      leadingIconColor: Colors.yellow,
      sideColor: Colors.yellow,
    );
  }


  void killSync(){
    syncKilled = true;
  }

  Future<String> sendBooruItem(BooruItem item, int favouritesCount, int current) async {
    Logger.Inst().log("Sending item $current / $favouritesCount", "LoliSync", "sendBooruItem", LogTypes.loliSyncInfo);
    HttpClientRequest request = await HttpClient().post(ip, port, "/lolisync/booruitem?amount=$favouritesCount&current=$current")
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(item.toJSON())); /*3*/
    HttpClientResponse response = await request.close();
    String responseStr = await utf8.decoder.bind(response).join();
    return responseStr;
  }

  Future<String> sendSettings(Map settingsJSON) async {
    Logger.Inst().log("Sending settings $settingsJSON", "LoliSync", "sendSettings", LogTypes.loliSyncInfo);
    HttpClientRequest request = await HttpClient().post(ip, port, "/lolisync/settings")
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(settingsJSON));
    HttpClientResponse response = await request.close();
    String responseStr = await utf8.decoder.bind(response).join();
    return responseStr;
  }

  Future<String> sendBooru(Booru booru, int booruCount, int current) async {
    Logger.Inst().log("Sending item $current / $booruCount", "LoliSync", "sendBooru", LogTypes.loliSyncInfo);
    HttpClientRequest request = await HttpClient().post(ip, port, "/lolisync/booru?amount=$booruCount&current=$current")
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(booru.toJSON()));
    HttpClientResponse response = await request.close();
    String responseStr = await utf8.decoder.bind(response).join();
    return responseStr;
  }

  Future<String> sendTabs(String? tabsString, String mode) async {
    Logger.Inst().log("Sending tabs $tabsString", "LoliSync", "sendTabs", LogTypes.loliSyncInfo);
    HttpClientRequest request = await HttpClient().post(ip, port, "/lolisync/tabs?mode=$mode")
      ..headers.contentType = ContentType.json
      ..write(jsonEncode({
        "tabs": tabsString
      }));
    HttpClientResponse response = await request.close();
    String responseStr = await utf8.decoder.bind(response).join();
    return responseStr;
  }

  Future<String> sendTest() async {
    Logger.Inst().log("Sending test", "LoliSync", "sendTabs", LogTypes.loliSyncInfo);
    HttpClientRequest request = await HttpClient().post(ip, port, "/lolisync/test");
    HttpClientResponse response = await request.close();
    if(response.statusCode != 200) {
      FlashElements.showSnackbar(
        title: Text(
          "Test error: ${response.statusCode} ${response.reasonPhrase}",
          style: TextStyle(fontSize: 20)
        ),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.red,
        sideColor: Colors.red,
      );
      return "Test error";
    } else {
      return 'Test OK';
    }
  }

  Stream<String> startSync(String ipOverride, String portOverride, List<String> toSync, int favSkip, String tabsMode) async* {
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
    final SearchHandler searchHandler = Get.find<SearchHandler>();

    this.ip = ipOverride;
    this.port = int.tryParse(portOverride) ?? 8080;
    final String address = '$ip:$port';

    for (int i = 0; i < toSync.length; i++) {
      switch(toSync.elementAt(i)) {
        case "Favourites":
          yield "Sync Starting $address";
          int favouritesCount = await settingsHandler.dbHandler.getFavouritesCount();
          if (favouritesCount > 0) {
            int limit = 100;
            int ceiling = (favouritesCount / limit).ceil();

            // If favSkip is set, start from skipAmount/limit, but limitted to (last 100 items (ceiling - 1))
            int startFrom = min((ceiling - 1), (favSkip == 0 ? 0 : (favSkip / limit).floor()));

            for(int i = startFrom; i < ceiling; i++) {
              if (!syncKilled) {
                int offset = i * limit;
                // TODO rework to send only missing ones?
                List<BooruItem> fetched = await settingsHandler.dbHandler.searchDB("", offset.toString(), limit.toString(), "ASC", "loliSyncFav");
                Logger.Inst().log("fetched is ${fetched.length} i is $i", "LoliSync", "startSync", LogTypes.loliSyncInfo);
                for (int x = 0; x < fetched.length; x++){
                  int count = offset + x;
                  if (count < favouritesCount) {
                    // TODO send in batches, not in singles
                    String resp = await sendBooruItem(fetched.elementAt(x), favouritesCount, count);
                    yield "$count / $favouritesCount - $resp";
                  } else {
                    Logger.Inst().log("skipping", "LoliSync", "startSync", LogTypes.loliSyncInfo);
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
          yield "Sync Starting $address";
          Map<String, dynamic> settingsJSON = settingsHandler.toJSON();
          settingsHandler.deviceSpecificSettings.forEach((element) {
            settingsJSON.remove(element);
          });
          String resp = await sendSettings(settingsJSON);
          yield resp;
          break;
        case "Booru":
          yield "Sync Starting $address";
          int booruCount = settingsHandler.booruList.length;
          if (booruCount > 0){
            for (int i = 0; i < booruCount; i++){
              if (!syncKilled){
                if (i < booruCount){
                  String resp = await sendBooru(settingsHandler.booruList.elementAt(i), booruCount, i);
                  yield "$i / $booruCount - $resp";
                } else {
                  Logger.Inst().log("skipping", "LoliSync", "startSync", LogTypes.loliSyncInfo);
                }
              }
            }
            yield "Booru Configs sent";
          } else {
            yield "No Booru Configs";
          }
          break;
        case "Tabs":
          yield "Sync Starting $address";
          String resp = await sendTabs(searchHandler.getBackupString(), tabsMode);
          yield resp;
          break;
      }
    }

  }
}