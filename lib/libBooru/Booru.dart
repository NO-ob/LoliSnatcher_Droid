import 'dart:convert';
import 'dart:io';

import 'package:LoliSnatcher/utilities/Logger.dart';

class Booru {
  String? name = "", faviconURL = "", type = "", baseURL = "", apiKey = "", userID = "", defTags = "";
  Booru(this.name, this.type, this.faviconURL, this.baseURL, this.defTags);
  Booru.withKey(this.name, this.type, this.faviconURL, this.baseURL, this.defTags, this.apiKey, this.userID);

  Booru.fromFileLegacy(File booru) {
    List<String> booruString = booru.readAsLinesSync();
    for (int i=0;i < booruString.length; i++){
      switch(booruString[i].split(" = ")[0]){
        case("Booru Name"):
          Logger.Inst().log(booruString[i].split(" = ")[1], "Booru", "fromFile", LogTypes.booruItemLoad);
          this.name = booruString[i].split(" = ")[1];
          break;
        case("Favicon URL"):
          Logger.Inst().log(booruString[i].split(" = ")[1], "Booru", "fromFile", LogTypes.booruItemLoad);
          this.faviconURL = booruString[i].split(" = ")[1];
          break;
        case("Booru Type"):
          Logger.Inst().log(booruString[i].split(" = ")[1], "Booru", "fromFile", LogTypes.booruItemLoad);
          this.type = booruString[i].split(" = ")[1];
          break;
        case("Base URL"):
          Logger.Inst().log(booruString[i].split(" = ")[1], "Booru", "fromFile", LogTypes.booruItemLoad);
          this.baseURL = booruString[i].split(" = ")[1];
          break;
        case("API Key"):
          Logger.Inst().log(booruString[i].split(" = ")[1], "Booru", "fromFile", LogTypes.booruItemLoad);
          this.apiKey = booruString[i].split(" = ")[1];
          break;
        case("User ID"):
          Logger.Inst().log(booruString[i].split(" = ")[1], "Booru", "fromFile", LogTypes.booruItemLoad);
          this.userID = booruString[i].split(" = ")[1];
          break;
        case("Default Tags"):
          Logger.Inst().log(booruString[i].split(" = ")[1], "Booru", "fromFile", LogTypes.booruItemLoad);
          this.defTags = booruString[i].split(" = ")[1];
          break;
      }
    }
  }

  Map toJSON() {
    return {
      "name": name,
      "type": type,
      "faviconURL": faviconURL,
      "baseURL": baseURL,
      "defTags": defTags,
      "apiKey": apiKey,
      "userID" : userID
    };
  }

  Booru.fromJSON(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    this.name = json["name"].toString();
    this.type = json["type"].toString();
    this.faviconURL = json["faviconURL"].toString();
    this.baseURL = json["baseURL"].toString();
    this.defTags = json["defTags"].toString();
    this.apiKey = json["apiKey"].toString();
    this.userID = json["userID"].toString();
  }

  String toLink(bool withSensitiveData) {
    Map json = this.toJSON();
    if(withSensitiveData == false) {
      json.remove("apiKey");
      json.remove("userID");
    }
    String jsonString = jsonEncode(json);
    print(jsonString);
    return 'https://www.loli.snatcher?' + base64UrlEncode(jsonString.codeUnits);
  }

  Booru.fromLink(String link) {
    String jsonString = String.fromCharCodes(base64Decode(link.split("?")[1]));
    Map<String, dynamic> json = jsonDecode(jsonString);
    this.name = json["name"].toString();
    this.type = json["type"].toString();
    this.faviconURL = json["faviconURL"].toString();
    this.baseURL = json["baseURL"].toString();
    this.defTags = json["defTags"].toString();
    this.apiKey = json["apiKey"].toString();
    this.userID = json["userID"].toString();
  }

  @override
  String toString() {
    return ("Name: $name, Type: $type, BaseURL: $baseURL, FaviconURL: $faviconURL, APIKey: $apiKey, UserID: $userID");
  }
}
