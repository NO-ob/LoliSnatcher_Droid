import 'dart:io';

class Booru {
  String name,faviconURL,type,baseURL;
  Booru(this.name,this.type,this.faviconURL,this.baseURL);

  Booru.fromFile(File booru){
    List<String> booruString = booru.readAsLinesSync();
    print(booruString);
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
        }
      }
    }
    @override
    String toString() {
      return ("Name: $name Type: $type BaseURL: $baseURL FaviconURL: $faviconURL");
    }
  }
