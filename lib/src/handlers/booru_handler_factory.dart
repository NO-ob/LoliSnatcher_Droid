import 'package:lolisnatcher/src/boorus/agnph_handler.dart';
import 'package:lolisnatcher/src/boorus/booru_on_rails_handler.dart';
import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/boorus/danbooru_handler.dart';
import 'package:lolisnatcher/src/boorus/downloads_handler.dart';
import 'package:lolisnatcher/src/boorus/e621_handler.dart';
import 'package:lolisnatcher/src/boorus/empty_handler.dart';
import 'package:lolisnatcher/src/boorus/favourites_handler.dart';
import 'package:lolisnatcher/src/boorus/gelbooru_alikes_handler.dart';
import 'package:lolisnatcher/src/boorus/gelbooru_handler.dart';
import 'package:lolisnatcher/src/boorus/gelbooruv1_handler.dart';
import 'package:lolisnatcher/src/boorus/hydrus_handler.dart';
import 'package:lolisnatcher/src/boorus/idol_sankaku_handler.dart';
import 'package:lolisnatcher/src/boorus/ink_bunny_handler.dart';
import 'package:lolisnatcher/src/boorus/mergebooru_handler.dart';
import 'package:lolisnatcher/src/boorus/moebooru_handler.dart';
import 'package:lolisnatcher/src/boorus/nyanpals_handler.dart';
import 'package:lolisnatcher/src/boorus/philomena_handler.dart';
import 'package:lolisnatcher/src/boorus/r34hentai_handler.dart';
import 'package:lolisnatcher/src/boorus/rainbooru_handler.dart';
import 'package:lolisnatcher/src/boorus/sankaku_handler.dart';
import 'package:lolisnatcher/src/boorus/shimmie_handler.dart';
import 'package:lolisnatcher/src/boorus/szurubooru_handler.dart';
import 'package:lolisnatcher/src/boorus/wildcritters_handler.dart';
import 'package:lolisnatcher/src/boorus/worldxyz_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';

class BooruHandlerFactory {
  late BooruHandler booruHandler;
  int pageNum = -1;

  List getBooruHandler(List<Booru> boorus, int? customLimit) {
    final int limit = customLimit ?? SettingsHandler.instance.limit;

    if (boorus.length == 1) {
      final Booru booru = boorus.first;

      switch (booru.type) {
        case BooruType.Moebooru:
          pageNum = 0;
          booruHandler = MoebooruHandler(booru, limit);
          break;
        case BooruType.Gelbooru:
          // current gelbooru is v.0.2.5, while safe and others are 0.2.0, but sice we had them under the same type from the start
          // we should keep them like that, but change sub-handler depending on the link
          // TODO are there only these 4 sites, or possible more?
          const List<String> gelbooruAlikes = ['rule34.xxx', 'safebooru.org', 'realbooru.com', 'furry.booru.org'];

          if (booru.baseURL!.contains('gelbooru.com')) {
            booruHandler = GelbooruHandler(booru, limit);
          } else if (gelbooruAlikes.any((element) => booru.baseURL!.contains(element))) {
            booruHandler = GelbooruAlikesHandler(booru, limit);
          } else {
            // fallback to alikes handler since probably no one else has latest version of gelbooru
            booruHandler = GelbooruAlikesHandler(booru, limit);
          }
          break;
        case BooruType.GelbooruAlike:
          // this type is not available in type selector
          booruHandler = GelbooruAlikesHandler(booru, limit);
          break;
        case BooruType.Danbooru:
          pageNum = 0;
          booruHandler = DanbooruHandler(booru, limit);
          break;
        case BooruType.e621:
          pageNum = 0;
          booruHandler = e621Handler(booru, limit);
          break;
        case BooruType.Shimmie:
          pageNum = 0;
          booruHandler = ShimmieHandler(booru, limit);
          break;
        case BooruType.Philomena:
          pageNum = 0;
          booruHandler = PhilomenaHandler(booru, limit);
          break;
        case BooruType.Szurubooru:
          booruHandler = SzurubooruHandler(booru, limit);
          break;
        case BooruType.Sankaku:
          pageNum = 0;
          booruHandler = SankakuHandler(booru, limit);
          break;
        case BooruType.Hydrus:
          booruHandler = HydrusHandler(booru, limit);
          break;
        case BooruType.GelbooruV1:
          booruHandler = GelbooruV1Handler(booru, limit);
          break;
        case BooruType.BooruOnRails:
          pageNum = 0;
          booruHandler = BooruOnRailsHandler(booru, limit);
          break;
        case BooruType.Downloads:
          booruHandler = DownloadsHandler(booru, limit);
          break;
        case BooruType.Favourites:
          booruHandler = FavouritesHandler(booru, limit);
          break;
        case BooruType.Rainbooru:
          pageNum = 0;
          booruHandler = RainbooruHandler(booru, limit);
          break;
        case BooruType.R34Hentai:
          pageNum = 0;
          booruHandler = R34HentaiHandler(booru, limit);
          break;
        case BooruType.World:
          booruHandler = WorldXyzHandler(booru, limit);
          break;
        case BooruType.IdolSankaku:
          pageNum = 0;
          booruHandler = IdolSankakuHandler(booru, limit);
          break;
        case BooruType.InkBunny:
          pageNum = 0;
          booruHandler = InkBunnyHandler(booru, limit);
          break;
        case BooruType.AGNPH:
          pageNum = 0;
          booruHandler = AGNPHHandler(booru, limit);
          break;
        case BooruType.NyanPals:
          pageNum = 0;
          booruHandler = NyanPalsHandler(booru, limit);
          break;
        case BooruType.WildCritters:
          pageNum = 0;
          booruHandler = WildCrittersHandler(booru, limit);
          break;
        /*   case (BooruType.FurAffinity):
          pageNum = 0;
          booruHandler = FurAffinityHandler(booru, limit);
          break;*/
        default:
          booruHandler = EmptyHandler(Booru(null, null, null, null, null), limit);
          break;
      }
    } else {
      booruHandler = MergebooruHandler(Booru('Merge', BooruType.Merge, '', '', ''), limit);
      (booruHandler as MergebooruHandler).setupMerge(boorus);
    }
    return [booruHandler, pageNum];
  }
}
