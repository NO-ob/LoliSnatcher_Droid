import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:LoliSnatcher/libBooru/FavouritesHandler.dart';
import 'package:LoliSnatcher/libBooru/InkBunnyHandler.dart';
import 'package:LoliSnatcher/libBooru/MergebooruHandler.dart';
import 'package:LoliSnatcher/libBooru/RainbooruHandler.dart';
import 'package:get/get.dart';

import 'Booru.dart';
import 'BooruOnRailsHandler.dart';
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
import 'Emptyhandler.dart';

class BooruHandlerFactory{
  BooruHandler? booruHandler;
  int pageNum = -1;
  List getBooruHandler(List<Booru> boorus, int? customLimit){
    final SettingsHandler settingsHandler = Get.find();
    final int limit = customLimit == null ? settingsHandler.limit : customLimit;
    if (boorus.length == 1) {
      switch (boorus[0].type) {
        case("Moebooru"):
          pageNum = 0;
          booruHandler = MoebooruHandler(boorus[0], limit);
          break;
        case("Gelbooru"):
          booruHandler = GelbooruHandler(boorus[0], limit);
          break;
        case("Danbooru"):
          pageNum = 0;
          booruHandler = DanbooruHandler(boorus[0], limit);
          break;
        case("e621"):
          pageNum = 0;
          booruHandler = e621Handler(boorus[0], limit);
          break;
        case("Shimmie"):
          pageNum = 0;
          booruHandler = ShimmieHandler(boorus[0], limit);
          break;
        case("Philomena"):
          pageNum = 0;
          booruHandler = PhilomenaHandler(boorus[0], limit);
          break;
        case("Szurubooru"):
          booruHandler = SzurubooruHandler(boorus[0], limit);
          break;
        case("Sankaku"):
          pageNum = 0;
          booruHandler = SankakuHandler(boorus[0], limit);
          break;
        case("Hydrus"):
          booruHandler = HydrusHandler(boorus[0], limit);
          break;
        case("GelbooruV1"):
          booruHandler = GelbooruV1Handler(boorus[0], limit);
          break;
        case("BooruOnRails"):
          pageNum = 0;
          booruHandler = BooruOnRailsHandler(boorus[0], limit);
          break;
        case("Favourites"):
          booruHandler = FavouritesHandler(boorus[0], limit);
          break;
        case("Rainbooru"):
          pageNum = 0;
          booruHandler = RainbooruHandler(boorus[0], limit);
          break;
        case("R34Hentai"):
          pageNum = 0;
          booruHandler = R34HentaiHandler(boorus[0], limit);
          break;
        case("World"):
          booruHandler = WorldHandler(boorus[0], limit);
          break;
        case("IdolSankaku"):
          pageNum = 0;
          booruHandler = IdolSankakuHandler(boorus[0], limit);
          break;
        case("InkBunny"):
          pageNum = 0;
          booruHandler = InkBunnyHandler(boorus[0], limit);
          break;
        default:
          booruHandler = EmptyHandler(Booru(null, null, null, null, null), limit);
          break;
        
      }
    } else {
      booruHandler = MergebooruHandler(Booru("Merge", "Merge", "", "", ""), limit);
      booruHandler!.setupMerge(boorus);
    }
    return [booruHandler, pageNum];
  }
}