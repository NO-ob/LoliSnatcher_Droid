import 'dart:convert';
import 'dart:io';

class Booru {
  String? name = "",faviconURL = "",type = "",baseURL = "",apiKey = "",userID = "",defTags = "";
  Booru(this.name,this.type,this.faviconURL,this.baseURL,this.defTags);
  Booru.withKey(this.name,this.type,this.faviconURL,this.baseURL,this.defTags,this.apiKey,this.userID);

  Booru.fromFile(File booru){
    List<String> booruString = booru.readAsLinesSync();
    for (int i=0;i < booruString.length; i++){
        switch(booruString[i].split(" = ")[0]){
          case("Booru Name"):
            print(booruString[i].split(" = ")[1]);
            this.name = booruString[i].split(" = ")[1];
            break;
          case("Favicon URL"):
            print(booruString[i].split(" = ")[1]);
            this.faviconURL = booruString[i].split(" = ")[1];
            break;
          case("Booru Type"):
            print(booruString[i].split(" = ")[1]);
            this.type = booruString[i].split(" = ")[1];
            break;
          case("Base URL"):
            print(booruString[i].split(" = ")[1]);
            this.baseURL = booruString[i].split(" = ")[1];
            break;
          case("API Key"):
            print(booruString[i].split(" = ")[1]);
            this.apiKey = booruString[i].split(" = ")[1];
            break;
          case("User ID"):
            print(booruString[i].split(" = ")[1]);
            this.userID = booruString[i].split(" = ")[1];
            break;
          case("Default Tags"):
            print(booruString[i].split(" = ")[1]);
            this.defTags = booruString[i].split(" = ")[1];
            break;
        }
      }
    }
  Map toJSON() {
    return {
      "name": "$name",
      "type": "$type",
      "faviconURL": "$faviconURL",
      "baseURL": "$baseURL",
      "defTags": "$defTags",
      "apiKey": "$apiKey",
      "userID" : "$userID"};
  }
  Booru.fromJSON(String jsonString){
    Map<String, dynamic> json = jsonDecode(jsonString);
    this.name = json["name"].toString();
    this.type = json["type"].toString();
    this.faviconURL = json["faviconURL"].toString();
    this.baseURL = json["baseURL"].toString();
    this.defTags = json["defTags"].toString();
    this.apiKey = json["apiKey"].toString();
    this.userID = json["userID"].toString();
    print(toJSON());
  }
    @override
    String toString() {
      return ("Name: $name Type: $type BaseURL: $baseURL FaviconURL: $faviconURL APIKey: $apiKey UserID: $userID");
    }
  }
