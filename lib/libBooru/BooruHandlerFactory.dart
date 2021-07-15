import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:LoliSnatcher/libBooru/FavouritesHandler.dart';
import 'package:LoliSnatcher/libBooru/MergebooruHandler.dart';
import 'package:LoliSnatcher/libBooru/RainbooruHandler.dart';

import 'Booru.dart';
import 'BooruItem.dart';
import 'BooruOnRailsHandler.dart';
import 'DBHandler.dart';
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
import 'WorldHandler.dart';
import 'R34HentaiHandler.dart';
import 'IdolSankakuHandler.dart';

class BooruHandlerFactory{
  BooruHandler? booruHandler;
  int pageNum = -1;
  List getBooruHandler(List<Booru> booru, int limit, DBHandler? dbHandler){
    if (booru.length == 1){
      switch (booru[0].type) {
        case("Moebooru"):
          pageNum = 0;
          booruHandler = new MoebooruHandler(booru[0], limit);
          break;
        case("Gelbooru"):
          booruHandler = new GelbooruHandler(booru[0], limit);
          break;
        case("Danbooru"):
          pageNum = 0;
          booruHandler = new DanbooruHandler(booru[0], limit);
          break;
        case("e621"):
          pageNum = 0;
          booruHandler = new e621Handler(booru[0], limit);
          break;
        case("Shimmie"):
          pageNum = 0;
          booruHandler = new ShimmieHandler(booru[0], limit);
          break;
        case("Philomena"):
          pageNum = 0;
          booruHandler = new PhilomenaHandler(booru[0], limit);
          break;
        case("Szurubooru"):
          booruHandler = new SzurubooruHandler(booru[0], limit);
          break;
        case("Sankaku"):
          pageNum = 0;
          booruHandler = new SankakuHandler(booru[0], limit);
          break;
        case("Hydrus"):
          booruHandler = new HydrusHandler(booru[0], limit);
          break;
        case("GelbooruV1"):
          booruHandler = new GelbooruV1Handler(booru[0], limit);
          break;
        case("BooruOnRails"):
          pageNum = 0;
          booruHandler = new BooruOnRailsHandler(booru[0], limit);
          break;
        case("Favourites"):
          booruHandler = new FavouritesHandler(booru[0], limit);
          break;
        case("Rainbooru"):
          pageNum = 0;
          booruHandler = new RainbooruHandler(booru[0], limit);
          break;
        case("R34Hentai"):
          pageNum = 0;
          booruHandler = new R34HentaiHandler(booru[0], limit);
          break;
        case("World"):
          booruHandler = new WorldHandler(booru[0], limit);
          break;
        case("IdolSankaku"):
          pageNum = 0;
          booruHandler = new IdolSankakuHandler(booru[0], limit);
          break;
      }
    } else {
      booruHandler = new MergebooruHandler(Booru("Merge","Merge","","",""), limit);
      booruHandler!.dbHandler = dbHandler;
      booruHandler!.setupMerge(booru);
    }

    booruHandler!.dbHandler = dbHandler;
    return [booruHandler, pageNum];
  }
}