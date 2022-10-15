import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:lolisnatcher/src/boorus/agnph_handler.dart';
import 'package:lolisnatcher/src/boorus/booru_on_rails_handler.dart';
import 'package:lolisnatcher/src/boorus/danbooru_handler.dart';
import 'package:lolisnatcher/src/boorus/e621_handler.dart';
import 'package:lolisnatcher/src/boorus/gelbooru_alikes_handler.dart';
import 'package:lolisnatcher/src/boorus/gelbooru_handler.dart';
import 'package:lolisnatcher/src/boorus/gelbooruv1_handler.dart';
import 'package:lolisnatcher/src/boorus/idol_sankaku_handler.dart';
import 'package:lolisnatcher/src/boorus/ink_bunny_handler.dart';
import 'package:lolisnatcher/src/boorus/moebooru_handler.dart';
import 'package:lolisnatcher/src/boorus/nyanpals_handler.dart';
import 'package:lolisnatcher/src/boorus/philomena_handler.dart';
import 'package:lolisnatcher/src/boorus/rainbooru_handler.dart';
import 'package:lolisnatcher/src/boorus/sankaku_handler.dart';
import 'package:lolisnatcher/src/boorus/shimmie_handler.dart';
import 'package:lolisnatcher/src/boorus/szurubooru_handler.dart';
import 'package:lolisnatcher/src/boorus/worldxyz_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';

// TODO: Create a bunch of fake accounts for testing auth
// TODO hydrus?

// Test config:
const bool runWithImages = false;
const int itemLimit = Constants.defaultItemLimit;
const int imageLimit = 5;
const bool withTagSuggestions = true;
//

Future<void> main() async {
  // prepare/init handlers and stuff
  final SettingsHandler settingsHandler = Get.put(SettingsHandler());
  await settingsHandler.initialize();
  TagHandler tagHandler = Get.put(TagHandler());
  await tagHandler.initialize();
  SettingsHandler.instance.tagTypeFetchEnabled = false;
  SettingsHandler.instance.limit = itemLimit;

  group("booru tests", () {
    test('BooruOnRailsHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("twibooru", "BooruOnRails", "", "https://twibooru.org", ""));
      expect(booruHandler, isA<BooruOnRailsHandler>());
    });
    test('DanbooruHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("danbooru", "Danbooru", "", "https://danbooru.donmai.us/", ""), hardFetchedLength: false);
      expect(booruHandler, isA<DanbooruHandler>());
    });
    test('e621Handler', () async {
      BooruHandler booruHandler = await testBooru(Booru("e621", "e621", "", "https://e621.net/", ""));
      expect(booruHandler, isA<e621Handler>());
    });

    group('GelbooruAlikesHandler(s)', () {
      test('Rule34xxx', () async {
        BooruHandler booruHandler = await testBooru(Booru("rule34", "Gelbooru", "", "https://rule34.xxx", ""), hardFetchedLength: false);
        expect(booruHandler, isA<GelbooruAlikesHandler>());
      });
      test('Safebooru', () async {
        BooruHandler booruHandler = await testBooru(Booru("safebooru", "Gelbooru", "", "https://safebooru.org", ""));
        expect(booruHandler, isA<GelbooruAlikesHandler>());
      });
      test('Realbooru', () async {
        // TODO first page doesn't give correct amount of items? api side problem?
        BooruHandler booruHandler = await testBooru(Booru("realbooru", "Gelbooru", "", "https://realbooru.com", ""));
        expect(booruHandler, isA<GelbooruAlikesHandler>());
      });
    });
    test('GelbooruHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("gelbooru", "Gelbooru", "", "https://gelbooru.com", ""));
      expect(booruHandler, isA<GelbooruHandler>());
    });
    test('GelbooruV1Handler', () async {
      BooruHandler booruHandler = await testBooru(Booru("os tan", "GelbooruV1", "", "https://os-tan.booru.org", ""), hardFetchedLength: false);
      expect(booruHandler, isA<GelbooruV1Handler>());
    });
    test('InkBunnyHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("inkbunny", "InkBunny", "", "https://inkbunny.net", ""), hardFetchedLength: false);
      expect(booruHandler, isA<InkBunnyHandler>());
    });
    test('MoebooruHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("lolibooru", "Moebooru", "", "https://lolibooru.moe", ""));
      expect(booruHandler, isA<MoebooruHandler>());
    });
    test('NyanPalsHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("nyanpals", "NyanPals", "", "https://nyanpals.com", ""));
      expect(booruHandler, isA<NyanPalsHandler>());
    });
    test('PhilomenaHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("derpibooru", "Philomena", "", "https://derpibooru.org", ""));
      expect(booruHandler, isA<PhilomenaHandler>());
    });
    test('R34HentaiHandler', () async {
      // requires USA proxy
      BooruHandler booruHandler = await testBooru(Booru("r34hentai", "R34Hentai", "", "https://r34hentai.com", ""));
      expect(booruHandler, isA<PhilomenaHandler>());
    });
    //Not in the factory?
    /*test('R34USHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("r34US", "R34US","","https://rule34.us",""));
      expect(booruHandler, isA<R34USHandler>());
    });*/
    test('SankakuHandler', () async {
      // TODO doesn't parse all items correctly?
      BooruHandler booruHandler = await testBooru(Booru("sankaku", "Sankaku", "", "https://capi-v2.sankakucomplex.com", ""));
      expect(booruHandler, isA<SankakuHandler>());
    });
    test('IdolSankakuHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("idolsankaku", "IdolSankaku", "", "https://iapi.sankakucomplex.com", ""));
      expect(booruHandler, isA<IdolSankakuHandler>());
    });
    test('ShimmieHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("r34 paheal", "Shimmie", "", "https://rule34.paheal.net", ""));
      expect(booruHandler, isA<ShimmieHandler>());
    });
    test('SzurubooruHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("xivbooru", "Szurubooru", "", "http://xivbooru.com", ""), customSuggestionsInput: 'tat'); // tat[too]
      expect(booruHandler, isA<SzurubooruHandler>());
    });
    group('WorldXyzHandler', () {
      test('World', () async {
        BooruHandler booruHandler = await testBooru(Booru("r34world", "World", "", "https://rule34.world", ""), hardFetchedLength: false);
        expect(booruHandler, isA<WorldXyzHandler>());
      });
      test('Xyz', () async {
        BooruHandler booruHandler = await testBooru(Booru("r34xyz", "World", "", "https://rule34.xyz", ""), hardFetchedLength: false);
        expect(booruHandler, isA<WorldXyzHandler>());
      });
    });
  });
  // Sometimes this fails maybe its giving the thumb urls but they aren't generated yet

  group("slow booru tests", () {
    test('AGNPHHandler', () async {
      BooruHandler booruHandler = await testBooru(
        Booru("agn.ph", "AGNPH", "", "https://agn.ph", ""),
        hardFetchedLength: false,
        timeoutBeforeTagCheck: true,
      );
      expect(booruHandler, isA<AGNPHHandler>());
    });
    test('RainbooruHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("rainbooru", "Rainbooru", "", "https://www.rainbooru.org", ""), hardFetchedLength: false);
      expect(booruHandler, isA<RainbooruHandler>());
    });
  });
}

Future<BooruHandler> testBooru(
  Booru booru, {
  bool hardFetchedLength = true,
  bool timeoutBeforeTagCheck = false,
  bool withImages = runWithImages,
  String? customSuggestionsInput,
}) async {
  final List temp = BooruHandlerFactory().getBooruHandler([booru], null);
  final BooruHandler booruHandler = temp[0] as BooruHandler;
  // +1 because starting page number is out of range
  booruHandler.pageNum = (temp[1] as int) + 1;

  List<BooruItem> fetched = await booruHandler.search("", booruHandler.pageNum);
  if (booruHandler.errorString.isNotEmpty) {
    print("Error: ${booruHandler.errorString}");
  }
  print('fetched length: ${fetched.length}');
  if (hardFetchedLength) {
    expect(fetched.length, equals(itemLimit));
  } else {
    expect(fetched.isNotEmpty, equals(true));
  }

  if (withImages) {
    if (timeoutBeforeTagCheck) {
      await Future.delayed(const Duration(seconds: 5));
    }
    //
    const int imageTestLimit = imageLimit; // hardFetchedLength ? itemLimit : fetched.length
    for (int i = 0; i < imageTestLimit; i++) {
      BooruItem item = fetched[i];
      print('Fetching images for ${item.postURL}');
      print('${item.fileURL} ${item.sampleURL} ${item.thumbnailURL}');
      // file
      var resp = await http.head(Uri.parse(item.fileURL));
      expect(resp.statusCode, equals(200));
      // sample
      if (item.fileURL != item.sampleURL && item.sampleURL != item.thumbnailURL) {
        await http.head(Uri.parse(item.sampleURL));
        expect(resp.statusCode, equals(200));
      }
      // thumbnail
      await http.head(Uri.parse(item.thumbnailURL));
      expect(resp.statusCode, equals(200));
      // tags
      print('tags: ${item.tagsList}');
      expect(item.tagsList.isNotEmpty, equals(true));
    }
  }

  if(withTagSuggestions) {
    await testSuggestions(booruHandler, customInput: customSuggestionsInput);
  }

  return booruHandler;
}

Future<void> testSuggestions(BooruHandler booruHandler, {String? customInput}) async {
  print ("Testing suggestions for ${booruHandler.booru.name}");
  String input = customInput ?? "ani"; // ani[mated]
  List<String> suggestions = await booruHandler.tagSearch(input);
  expect(suggestions.isNotEmpty, equals(true));
  expect(suggestions.length, equals(10));
}
