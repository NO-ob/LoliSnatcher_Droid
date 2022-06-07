import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/boorus/booru_on_rails_handler.dart';
import 'package:lolisnatcher/src/boorus/danbooru_handler.dart';
import 'package:lolisnatcher/src/boorus/empty_handler.dart';
import 'package:lolisnatcher/src/boorus/gelbooru_handler.dart';
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
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/boorus/favourites_handler.dart';
import 'package:lolisnatcher/src/boorus/ink_bunny_handler.dart';
import 'package:lolisnatcher/src/boorus/mergebooru_handler.dart';
import 'package:lolisnatcher/src/boorus/nyanpals_handler.dart';
import 'package:lolisnatcher/src/boorus/rainbooru_handler.dart';
import 'package:lolisnatcher/src/boorus/realbooru_handler.dart';



class BooruHandlerFactory {
  BooruHandler? booruHandler;
  int pageNum = -1;

  List getBooruHandler(List<Booru> boorus, int? customLimit) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final int limit = customLimit ?? settingsHandler.limit;

    if (boorus.length == 1) {
      switch (boorus[0].type) {
        case("Moebooru"):
          pageNum = 0;
          booruHandler = MoebooruHandler(boorus[0], limit);
          break;
        case("Gelbooru"):
          booruHandler = GelbooruHandler(boorus[0], limit);
          break;
        case("Realbooru"):
          booruHandler = RealbooruHandler(boorus[0], limit);
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
          booruHandler = WorldXyzHandler(boorus[0], limit);
          break;
        case("IdolSankaku"):
          pageNum = 0;
          booruHandler = IdolSankakuHandler(boorus[0], limit);
          break;
        case("InkBunny"):
          pageNum = 0;
          booruHandler = InkBunnyHandler(boorus[0], limit);
          break;
        case("AGNPH"):
          pageNum = 0;
          booruHandler = AGNPHHandler(boorus[0], limit);
          break;
        case("NyanPals"):
          pageNum = -1;
          booruHandler = NyanPalsHandler(boorus[0], limit);
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