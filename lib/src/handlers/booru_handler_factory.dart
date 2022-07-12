import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';

import 'package:lolisnatcher/src/boorus/booru_on_rails_handler.dart';
import 'package:lolisnatcher/src/boorus/danbooru_handler.dart';
import 'package:lolisnatcher/src/boorus/empty_handler.dart';
import 'package:lolisnatcher/src/boorus/gelbooruv1_handler.dart';
import 'package:lolisnatcher/src/boorus/hydrus_handler.dart';
import 'package:lolisnatcher/src/boorus/moebooru_handler.dart';
import 'package:lolisnatcher/src/boorus/philomena_handler.dart';
import 'package:lolisnatcher/src/boorus/sankaku_handler.dart';
import 'package:lolisnatcher/src/boorus/shimmie_handler.dart';
import 'package:lolisnatcher/src/boorus/szurubooru_handler.dart';
import 'package:lolisnatcher/src/boorus/e621_handler.dart';
import 'package:lolisnatcher/src/boorus/worldxyz_handler.dart';
import 'package:lolisnatcher/src/boorus/r34hentai_handler.dart';
import 'package:lolisnatcher/src/boorus/idol_sankaku_handler.dart';
import 'package:lolisnatcher/src/boorus/agnph_handler.dart';
import 'package:lolisnatcher/src/boorus/favourites_handler.dart';
import 'package:lolisnatcher/src/boorus/ink_bunny_handler.dart';
import 'package:lolisnatcher/src/boorus/mergebooru_handler.dart';
import 'package:lolisnatcher/src/boorus/nyanpals_handler.dart';
import 'package:lolisnatcher/src/boorus/rainbooru_handler.dart';
import 'package:lolisnatcher/src/boorus/gelbooru_handler.dart';
import 'package:lolisnatcher/src/boorus/gelbooru_alikes_handler.dart';



class BooruHandlerFactory {
  BooruHandler? booruHandler;
  int pageNum = -1;

  List getBooruHandler(List<Booru> boorus, int? customLimit) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final int limit = customLimit ?? settingsHandler.limit;

    if (boorus.length == 1) {
      final Booru booru = boorus.first;

      switch (booru.type) {
        case("Moebooru"):
          pageNum = 0;
          booruHandler = MoebooruHandler(booru, limit);
          break;
        case("Gelbooru"):
          // current gelbooru is v.0.2.5, while safe and others are 0.2.0, but sice we had them under the same type from the start
          // we should keep them like that, but change sub-handler depending on the link
          // TODO are there only these 4 sites, or possible more?
          const List<String> gelbooruAlikes = ['rule34.xxx', 'safebooru.org', 'realbooru.com'];

          if(booru.baseURL!.contains("gelbooru.com")) {
            booruHandler = GelbooruHandler(booru, limit);
          } else if(gelbooruAlikes.any((element) => booru.baseURL!.contains(element))) {
            booruHandler = GelbooruAlikesHandler(booru, limit);
          } else {
            booruHandler = GelbooruHandler(booru, limit);
          }
          break;
        case("Danbooru"):
          pageNum = 0;
          booruHandler = DanbooruHandler(booru, limit);
          break;
        case("e621"):
          pageNum = 0;
          booruHandler = e621Handler(booru, limit);
          break;
        case("Shimmie"):
          pageNum = 0;
          booruHandler = ShimmieHandler(booru, limit);
          break;
        case("Philomena"):
          pageNum = 0;
          booruHandler = PhilomenaHandler(booru, limit);
          break;
        case("Szurubooru"):
          booruHandler = SzurubooruHandler(booru, limit);
          break;
        case("Sankaku"):
          pageNum = 0;
          booruHandler = SankakuHandler(booru, limit);
          break;
        case("Hydrus"):
          booruHandler = HydrusHandler(booru, limit);
          break;
        case("GelbooruV1"):
          booruHandler = GelbooruV1Handler(booru, limit);
          break;
        case("BooruOnRails"):
          pageNum = 0;
          booruHandler = BooruOnRailsHandler(booru, limit);
          break;
        case("Favourites"):
          booruHandler = FavouritesHandler(booru, limit);
          break;
        case("Rainbooru"):
          pageNum = 0;
          booruHandler = RainbooruHandler(booru, limit);
          break;
        case("R34Hentai"):
          pageNum = 0;
          booruHandler = R34HentaiHandler(booru, limit);
          break;
        case("World"):
          booruHandler = WorldXyzHandler(booru, limit);
          break;
        case("IdolSankaku"):
          pageNum = 0;
          booruHandler = IdolSankakuHandler(booru, limit);
          break;
        case("InkBunny"):
          pageNum = 0;
          booruHandler = InkBunnyHandler(booru, limit);
          break;
        case("AGNPH"):
          pageNum = 0;
          booruHandler = AGNPHHandler(booru, limit);
          break;
        case("NyanPals"):
          pageNum = 0;
          booruHandler = NyanPalsHandler(booru, limit);
          break;
        default:
          booruHandler = EmptyHandler(Booru(null, null, null, null, null), limit);
          break;
      }
    } else {
      booruHandler = MergebooruHandler(Booru("Merge", "Merge", "", "", ""), limit);
      (booruHandler as MergebooruHandler).setupMerge(boorus);
    }
    return [booruHandler, pageNum];
  }
}