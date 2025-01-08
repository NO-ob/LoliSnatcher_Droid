import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/boorus/agnph_handler.dart';
import 'package:lolisnatcher/src/boorus/booru_on_rails_handler.dart';
import 'package:lolisnatcher/src/boorus/booru_type.dart';
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
import 'package:lolisnatcher/src/utils/dio_network.dart';

// TODO: Create a bunch of fake accounts for testing auth
// TODO hydrus?

// Test config:
const bool runWithImages = false;
const int itemLimit = Constants.defaultItemLimit;
const int imageLimit = 5;
const bool withTagSuggestions = false;
const String defaultInput = '';
//

Future<void> main() async {
  // prepare/init handlers and stuff
  final SettingsHandler settingsHandler = Get.put(SettingsHandler());
  await settingsHandler.initialize();
  final TagHandler tagHandler = Get.put(TagHandler());
  await tagHandler.initialize();
  SettingsHandler.instance.tagTypeFetchEnabled = false;
  SettingsHandler.instance.itemLimit = itemLimit;

  group('booru tests', () {
    test('BooruOnRailsHandler', () async {
      final BooruHandler booruHandler = await testBooru(Booru('twibooru', BooruType.BooruOnRails, '', 'https://twibooru.org', ''));
      expect(booruHandler, isA<BooruOnRailsHandler>());
    });
    test('DanbooruHandler', () async {
      final BooruHandler booruHandler = await testBooru(Booru('danbooru', BooruType.Danbooru, '', 'https://danbooru.donmai.us/', ''), hardFetchedLength: false);
      expect(booruHandler, isA<DanbooruHandler>());
    });
    test('e621Handler', () async {
      final BooruHandler booruHandler = await testBooru(Booru('e621', BooruType.e621, '', 'https://e621.net/', ''));
      expect(booruHandler, isA<e621Handler>());
    });

    group('GelbooruAlikesHandler(s)', () {
      test('Rule34xxx', () async {
        final BooruHandler booruHandler = await testBooru(Booru('rule34', BooruType.Gelbooru, '', 'https://rule34.xxx', ''), hardFetchedLength: false);
        expect(booruHandler, isA<GelbooruAlikesHandler>());
      });
      test('Safebooru', () async {
        final BooruHandler booruHandler = await testBooru(Booru('safebooru', BooruType.Gelbooru, '', 'https://safebooru.org', ''));
        expect(booruHandler, isA<GelbooruAlikesHandler>());
      });
      test('Realbooru', () async {
        // TODO first page doesn't give correct amount of items? api side problem?
        final BooruHandler booruHandler = await testBooru(Booru('realbooru', BooruType.Gelbooru, '', 'https://realbooru.com', ''), hardFetchedLength: false);
        expect(booruHandler, isA<GelbooruAlikesHandler>());
      });
    });
    test('GelbooruHandler', () async {
      final BooruHandler booruHandler = await testBooru(Booru('gelbooru', BooruType.Gelbooru, '', 'https://gelbooru.com', ''));
      expect(booruHandler, isA<GelbooruHandler>());
    });
    test('GelbooruV1Handler', () async {
      final BooruHandler booruHandler = await testBooru(Booru('os tan', BooruType.GelbooruV1, '', 'https://os-tan.booru.org', ''), hardFetchedLength: false);
      expect(booruHandler, isA<GelbooruV1Handler>());
    });
    test('InkBunnyHandler', () async {
      final BooruHandler booruHandler = await testBooru(Booru('inkbunny', BooruType.InkBunny, '', 'https://inkbunny.net', ''), hardFetchedLength: false);
      expect(booruHandler, isA<InkBunnyHandler>());
    });
    test('MoebooruHandler', () async {
      final BooruHandler booruHandler = await testBooru(Booru('lolibooru', BooruType.Moebooru, '', 'https://lolibooru.moe', ''));
      expect(booruHandler, isA<MoebooruHandler>());
    });
    test('NyanPalsHandler', () async {
      final BooruHandler booruHandler = await testBooru(Booru('nyanpals', BooruType.NyanPals, '', 'https://nyanpals.com', ''));
      expect(booruHandler, isA<NyanPalsHandler>());
    });
    test('PhilomenaHandler', () async {
      final BooruHandler booruHandler = await testBooru(Booru('derpibooru', BooruType.Philomena, '', 'https://derpibooru.org', ''));
      expect(booruHandler, isA<PhilomenaHandler>());
    });
    test('R34HentaiHandler', () async {
      // requires USA proxy
      final BooruHandler booruHandler = await testBooru(Booru('r34hentai', BooruType.R34Hentai, '', 'https://r34hentai.com', ''));
      expect(booruHandler, isA<PhilomenaHandler>());
    });
    //Not in the factory?
    /*test('R34USHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("r34US", "R34US","","https://rule34.us",""));
      expect(booruHandler, isA<R34USHandler>());
    });*/
    test('SankakuHandler', () async {
      // TODO doesn't parse all items correctly?
      final BooruHandler booruHandler = await testBooru(Booru('sankaku', BooruType.Sankaku, '', 'https://capi-v2.sankakucomplex.com', ''));
      expect(booruHandler, isA<SankakuHandler>());
    });
    test('IdolSankakuHandler', () async {
      final BooruHandler booruHandler = await testBooru(Booru('idolsankaku', BooruType.IdolSankaku, '', 'https://iapi.sankakucomplex.com', ''));
      expect(booruHandler, isA<IdolSankakuHandler>());
    });
    test('ShimmieHandler', () async {
      final BooruHandler booruHandler = await testBooru(Booru('r34 paheal', BooruType.Shimmie, '', 'https://rule34.paheal.net', ''));
      expect(booruHandler, isA<ShimmieHandler>());
    });
    test('SzurubooruHandler', () async {
      final BooruHandler booruHandler =
          await testBooru(Booru('xivbooru', BooruType.Szurubooru, '', 'http://xivbooru.com', ''), customSuggestionsInput: 'tat'); // tat[too]
      expect(booruHandler, isA<SzurubooruHandler>());
    });
    group('WorldXyzHandler', () {
      test('World', () async {
        final BooruHandler booruHandler = await testBooru(Booru('r34world', BooruType.World, '', 'https://rule34.world', ''), hardFetchedLength: false);
        expect(booruHandler, isA<WorldXyzHandler>());
      });
      test('Xyz', () async {
        final BooruHandler booruHandler = await testBooru(Booru('r34xyz', BooruType.World, '', 'https://rule34.xyz', ''), hardFetchedLength: false);
        expect(booruHandler, isA<WorldXyzHandler>());
      });
    });
  });
  // Sometimes this fails maybe its giving the thumb urls but they aren't generated yet

  group('slow booru tests', () {
    test('AGNPHHandler', () async {
      final BooruHandler booruHandler = await testBooru(
        Booru('agn.ph', BooruType.AGNPH, '', 'https://agn.ph', ''),
        hardFetchedLength: false,
        timeoutBeforeTagCheck: true,
      );
      expect(booruHandler, isA<AGNPHHandler>());
    });
    test('RainbooruHandler', () async {
      final BooruHandler booruHandler = await testBooru(Booru('rainbooru', BooruType.Rainbooru, '', 'https://www.rainbooru.org', ''), hardFetchedLength: false);
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

  final List<BooruItem> fetched = await booruHandler.search(defaultInput, booruHandler.pageNum);
  if (booruHandler.errorString.isNotEmpty) {
    print('Error: ${booruHandler.errorString}');
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
      final BooruItem item = fetched[i];
      print('Fetching images for ${item.postURL}');
      print('${item.fileURL} ${item.sampleURL} ${item.thumbnailURL}');
      // file
      final resp = await DioNetwork.head(item.fileURL);
      expect(resp.statusCode, equals(200));
      // sample
      if (item.fileURL != item.sampleURL && item.sampleURL != item.thumbnailURL) {
        await DioNetwork.head(item.sampleURL);
        expect(resp.statusCode, equals(200));
      }
      // thumbnail
      await DioNetwork.head(item.thumbnailURL);
      expect(resp.statusCode, equals(200));
      // tags
      print('tags: ${item.tagsList}');
      expect(item.tagsList.isNotEmpty, equals(true));
    }
  }

  if (withTagSuggestions) {
    await testSuggestions(booruHandler, customSuggestionsInput: customSuggestionsInput);
  }

  return booruHandler;
}

Future<void> testSuggestions(BooruHandler booruHandler, {String? customSuggestionsInput}) async {
  print('Testing suggestions for ${booruHandler.booru.name}');
  final String input = customSuggestionsInput ?? 'ani'; // ani[mated]
  final List<String> suggestions = await booruHandler.tagSearch(input);
  expect(suggestions.isNotEmpty, equals(true));
  expect(suggestions.length, equals(10));
}
