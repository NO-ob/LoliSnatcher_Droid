import 'dart:convert';

import 'package:get/utils.dart';
import 'package:lolisnatcher/src/boorus/booru_type.dart';

class Booru {
  String? name = "", faviconURL = "", baseURL = "", apiKey = "", userID = "", defTags = "";
  BooruType? type;
  Booru(this.name, this.type, this.faviconURL, this.baseURL, this.defTags);
  Booru.withKey(this.name, this.type, this.faviconURL, this.baseURL, this.defTags, this.apiKey, this.userID);

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "type": type?.name,
      "faviconURL": faviconURL,
      "baseURL": baseURL,
      "defTags": defTags,
      "apiKey": apiKey,
      "userID": userID,
    };
  }

  Booru.fromJSON(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    setFromMap(json);
  }

  Booru.fromMap(Map<String, dynamic> json) {
    setFromMap(json);
  }

  String toLink(bool withSensitiveData) {
    Map json = toJson();
    if (withSensitiveData == false) {
      json.remove("apiKey");
      json.remove("userID");
    }
    String jsonString = jsonEncode(json);
    print(jsonString);
    return 'https://www.loli.snatcher?${base64UrlEncode(jsonString.codeUnits)}';
  }

  Booru.fromLink(String link) {
    String jsonString = String.fromCharCodes(base64Decode(link.split("?")[1]));
    Map<String, dynamic> json = jsonDecode(jsonString);
    setFromMap(json);
  }

  void setFromMap(Map<String, dynamic> json) {
    name = json["name"]?.toString();
    type = BooruType.values.firstWhereOrNull((e) => e.name.toLowerCase() == json["type"]?.toString().toLowerCase());
    faviconURL = json["faviconURL"]?.toString();
    baseURL = json["baseURL"]?.toString();
    defTags = json["defTags"]?.toString();
    apiKey = json["apiKey"]?.toString();
    userID = json["userID"]?.toString();
  }

  @override
  String toString() {
    return ("Name: $name, Type: $type, BaseURL: $baseURL, FaviconURL: $faviconURL, APIKey: $apiKey, UserID: $userID");
  }
}
