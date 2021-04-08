import 'dart:convert';
import 'dart:io';

import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:flutter/services.dart';

import 'BooruItem.dart';

class LoliSync{
  String ip = "";
  String port = "1234";
 static void send(BooruItem item, String ip, String port) async{
   HttpClientRequest request = await HttpClient().post(ip, 1234, "/lolisync/booruitem")
     ..headers.contentType = ContentType.json
     ..write(jsonEncode(item.toJSON())); /*3*/
   HttpClientResponse response = await request.close(); /*4*/
   await utf8.decoder.bind(response /*5*/).forEach(print);
  }
  Stream<String> startServer(SettingsHandler settingsHandler) async*{
   ip = await ServiceHandler.getIP();
    var server = await HttpServer.bind(ip, 1234);
    yield "Server active at $ip:$port";
    await for (var req in server) {
      switch (req.uri.path.toString()){
        case("/lolisync/booruitem"):
          if (req.method == 'POST') {
            try {
              print("request to update booru item recieved");
              String content =
              await utf8.decoder.bind(req).join(); /*2*/
              BooruItem item = BooruItem.fromJSON(content);
              if (settingsHandler.dbEnabled){
                String? result = await settingsHandler.dbHandler.updateBooruItem(item, "sync");
                yield result!;
              }
            } catch (e) {
             print(e);
            }
          } else {
            req.response.statusCode = 200;
            req.response.write("success");
          }
      }
      await req.response.close();
    }
  }
}