// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:lolisnatcher/src/boorus/agnph_handler.dart';
import 'package:lolisnatcher/src/boorus/booru_on_rails_handler.dart';
import 'package:http/http.dart' as http;
import 'package:lolisnatcher/src/boorus/danbooru_handler.dart';
import 'package:lolisnatcher/src/boorus/e621_handler.dart';
import 'package:lolisnatcher/src/boorus/gelbooru_alikes_handler.dart';
import 'package:lolisnatcher/src/boorus/gelbooru_handler.dart';
import 'package:lolisnatcher/src/boorus/gelbooruv1_handler.dart';
import 'package:lolisnatcher/src/boorus/ink_bunny_handler.dart';
import 'package:lolisnatcher/src/boorus/moebooru_handler.dart';
import 'package:lolisnatcher/src/boorus/nyanpals_handler.dart';
import 'package:lolisnatcher/src/boorus/philomena_handler.dart';
import 'package:lolisnatcher/src/boorus/r34hentai_handler.dart';
import 'package:lolisnatcher/src/boorus/r34us_handler.dart';
import 'package:lolisnatcher/src/boorus/rainbooru_handler.dart';
import 'package:lolisnatcher/src/boorus/shimmie_handler.dart';
import 'package:lolisnatcher/src/boorus/szurubooru_handler.dart';
import 'package:lolisnatcher/src/boorus/worldxyz_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';

void main() {
  //TODO: Create a bunch of fake accounts for testing auth
  Get.put(TagHandler());
  Get.put(SettingsHandler());
  SettingsHandler.instance.tagTypeFetchEnabled = false;
  SettingsHandler.instance.limit = 10;
  group("booru tests", (){
    test('$BooruOnRailsHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("twibooru", "BooruOnRails","","https://twibooru.org",""));
      expect(booruHandler, isA<BooruOnRailsHandler>());
    });
    test('$DanbooruHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("danbooru", "Danbooru","","https://danbooru.donmai.us/",""), hardFetchedLength: false);
      expect(booruHandler, isA<DanbooruHandler>());
    });
    test('$e621Handler', () async {
      BooruHandler booruHandler = await testBooru(Booru("e621", "e621","","https://e621.net/",""));
      expect(booruHandler, isA<e621Handler>());
    });
    test('$GelbooruAlikesHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("rule34", "Gelbooru","","https://rule34.xxx",""), hardFetchedLength: false);
      expect(booruHandler, isA<GelbooruAlikesHandler>());
      booruHandler = await testBooru(Booru("safebooru", "Gelbooru","","https://safebooru.org",""));
      expect(booruHandler, isA<GelbooruAlikesHandler>());
      booruHandler = await testBooru(Booru("realbooru", "Gelbooru","","https://realbooru.com",""));
      expect(booruHandler, isA<GelbooruAlikesHandler>());
    });
    test('$GelbooruHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("gelbooru", "Gelbooru","","https://gelbooru.com",""));
      expect(booruHandler, isA<GelbooruHandler>());
    });
    test('$GelbooruV1Handler', () async {
      BooruHandler booruHandler = await testBooru(Booru("os tan", "GelbooruV1","","https://os-tan.booru.org",""), hardFetchedLength: false);
      expect(booruHandler, isA<GelbooruV1Handler>());
    });
    test('$InkBunnyHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("inkbunny", "InkBunny","","https://inkbunny.net",""), hardFetchedLength: false);
      expect(booruHandler, isA<InkBunnyHandler>());
    });
    test('$MoebooruHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("lolibooru", "Moebooru","","https://lolibooru.moe",""));
      expect(booruHandler, isA<MoebooruHandler>());
    });
    test('$NyanPalsHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("nyanpals", "NyanPals","","https://nyanpals.com",""));
      expect(booruHandler, isA<NyanPalsHandler>());
    });
    test('$PhilomenaHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("derpibooru", "Philomena","","https://derpibooru.org",""));
      expect(booruHandler, isA<PhilomenaHandler>());
    });
    test('$R34HentaiHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("r34hentai", "R34Hentai","","https://r34hentai.com",""));
      expect(booruHandler, isA<PhilomenaHandler>());
    });
    //Not in the factory?
    /*test('$R34USHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("r34US", "R34US","","https://rule34.us",""));
      expect(booruHandler, isA<R34USHandler>());
    });*/

    test('$ShimmieHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("r34 paheal", "Shimmie","","https://rule34.paheal.net",""));
      expect(booruHandler, isA<ShimmieHandler>());
    });
    test('$SzurubooruHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("lewdtuber", "Szurubooru","","https://booru.lewdtuber.com",""));
      expect(booruHandler, isA<SzurubooruHandler>());
    });
    test('$WorldXyzHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("r34world", "World","","https://rule34.world",""), hardFetchedLength: false);
      expect(booruHandler, isA<WorldXyzHandler>());
    });
  });
  // Sometimes this fails maybe its giving the thumb urls but they aren't generated yet

  group("slow booru tests",(){
    test('$AGNPHHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("agn.ph", "AGNPH","", "https://agn.ph", ""), hardFetchedLength: false, timeoutBeforeTagCheck: true,);
      expect(booruHandler, isA<AGNPHHandler>());
    });
    test('$RainbooruHandler', () async {
      BooruHandler booruHandler = await testBooru(Booru("rainbooru", "Rainbooru","","https://www.rainbooru.org",""), hardFetchedLength: false);
      expect(booruHandler, isA<RainbooruHandler>());
    });
  });
}


Future<BooruHandler> testBooru(Booru booru, {bool hardFetchedLength = true,bool timeoutBeforeTagCheck = false} ) async{
  final List temp = BooruHandlerFactory().getBooruHandler([booru], null);
  final BooruHandler booruHandler = temp[0] as BooruHandler;
  booruHandler.pageNum = temp[1] as int;
  List<BooruItem> fetched = await booruHandler.search("", booruHandler.pageNum);
  if (hardFetchedLength){
    expect(fetched.length, equals(10));
  } else {
    expect(fetched.isNotEmpty, equals(true));
  }
  if(timeoutBeforeTagCheck){
    await Future.delayed(const Duration(seconds: 5));
  }
  for (int i = 0; i < (hardFetchedLength ? 10 : fetched.length); i++){
    BooruItem item = fetched[i];
    var resp = await http.head(Uri.parse(item.fileURL));
    expect(resp.statusCode, equals(200));
    await http.head(Uri.parse(item.thumbnailURL));
    expect(resp.statusCode, equals(200));
    await http.head(Uri.parse(item.sampleURL));
    expect(resp.statusCode, equals(200));
    expect(item.tagsList.isNotEmpty, equals(true));
  }
  return booruHandler;
}


