import 'package:LoliSnatcher/libBooru/BooruHandler.dart';

import 'Booru.dart';
import 'BooruItem.dart';
import 'DanbooruHandler.dart';
import 'GelbooruHandler.dart';
import 'GelbooruV1Handler.dart';
import 'HydrusHandler.dart';
import 'MoebooruHandler.dart';
import 'PhilomenaHandler.dart';
import 'SankakuHandler.dart';
import 'ShimmieHandler.dart';
import 'SzurubooruHandler.dart';
import 'e621Handler.dart';
class BooruHandlerFactory{
  BooruHandler booruHandler;
  int pageNum = 0;
  List getBooruHandler(Booru booru, int limit){
    switch (booru.type) {
      case("Moebooru"):
        booruHandler = new MoebooruHandler(booru, limit);
        break;
      case("Gelbooru"):
        booruHandler = new GelbooruHandler(booru, limit);
        break;
      case("Danbooru"):
        pageNum = 1;
        booruHandler = new DanbooruHandler(booru, limit);
        break;
      case("e621"):
        booruHandler = new e621Handler(booru, limit);
        break;
      case("Shimmie"):
        pageNum = 1;
        booruHandler = new ShimmieHandler(booru, limit);
        break;
      case("Philomena"):
        pageNum = 1;
        booruHandler = new PhilomenaHandler(booru, limit);
        break;
      case("Szurubooru"):
        booruHandler = new SzurubooruHandler(booru, limit);
        break;
      case("Sankaku"):
        pageNum = 1;
        booruHandler = new SankakuHandler(booru, limit);
        break;
      case("Hydrus"):
        booruHandler = new HydrusHandler(booru, limit);
        break;
      case("GelbooruV1"):
        booruHandler = new GelbooruV1Handler(booru, limit);
        break;
    }
    print(booruHandler.booru.toString());
    return [booruHandler,pageNum];
  }
}