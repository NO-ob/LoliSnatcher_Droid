import 'dart:convert';
import 'dart:io';

import 'package:LoliSnatcher/utilities/Logger.dart';

class Booru {
  String? name = "", faviconURL = "", type = "", baseURL = "", apiKey = "", userID = "", defTags = "";
  Booru(this.name, this.type, this.faviconURL, this.baseURL, this.defTags);
  Booru.withKey(this.name, this.type, this.faviconURL, this.baseURL, this.defTags, this.apiKey, this.userID);

  Map<String,dynamic> toJson() {
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
    name = json["name"].toString();
    type = json["type"].toString();
    faviconURL = json["faviconURL"].toString();
    baseURL = json["baseURL"].toString();
    defTags = json["defTags"].toString();
    apiKey = json["apiKey"].toString();
    userID = json["userID"].toString();
  }

  Booru.fromJsonObject(Map<String, dynamic> json) {
    name = json["name"].toString();
    type = json["type"].toString();
    faviconURL = json["faviconURL"].toString();
    baseURL = json["baseURL"].toString();
    defTags = json["defTags"].toString();
    apiKey = json["apiKey"].toString();
    userID = json["userID"].toString();
  }

  String toLink(bool withSensitiveData) {
    Map json = toJson();
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
    name = json["name"].toString();
    type = json["type"].toString();
    faviconURL = json["faviconURL"]?.toString() ?? "";
    baseURL = json["baseURL"].toString();
    defTags = json["defTags"]?.toString() ?? "";
    apiKey = json["apiKey"]?.toString() ?? "";
    userID = json["userID"]?.toString() ?? "";
  }

  @override
  String toString() {
    return ("Name: $name, Type: $type, BaseURL: $baseURL, FaviconURL: $faviconURL, APIKey: $apiKey, UserID: $userID");
  }
}
