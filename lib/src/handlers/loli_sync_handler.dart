import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/handlers/database_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';

class LoliSync {
  String ip = '127.0.0.1';
  int port = 8080;

  HttpServer? server;
  bool syncKilled = false;

  Stream<String> startServer(String? ipOverride, String? portOverride) async* {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    final String newIp = ipOverride ?? await ServiceHandler.getIP();
    final int newPort = int.tryParse(portOverride ?? '8080') ?? 8080;

    ip = newIp;
    port = newPort;
    server = await HttpServer.bind(ip, port);

    yield 'Server active at $ip:$port';
    await for (final req in server!) {
      Logger.Inst().log(req.uri.path, 'LoliSync', 'startServer', LogTypes.loliSyncInfo);
      switch (req.uri.path) {
        case '/lolisync/boorubatch':
          yield 'Received booru items batch';
          yield await storeBooruBatch(req, settingsHandler);
          break;
        case '/lolisync/booruitem':
          yield await storeBooruItem(req, settingsHandler);
          break;
        case '/lolisync/settings':
          yield await storeSettings(req, settingsHandler);
          break;
        case '/lolisync/booru':
          yield await storeBooru(req, settingsHandler);
          break;
        case '/lolisync/tabs':
          yield await storeTabs(req, settingsHandler);
          break;
        case '/lolisync/tags':
          yield await storeTags(req, settingsHandler);
          break;
        case '/lolisync/test':
          yield 'Test';
          break;
        case '/lolisync/complete':
          yield 'Sync Complete';
          break;
      }
      await req.response.close();
    }
  }

  Future<String> storeSettings(dynamic req, SettingsHandler settingsHandler) async {
    if (req.method == 'POST') {
      try {
        Logger.Inst().log('request to update settings recieved', 'LoliSync', 'storeSettings', LogTypes.loliSyncInfo);
        final String content = await utf8.decoder.bind(req).join(); /*2*/
        await settingsHandler.loadFromJSON(content, false);
        req.response.statusCode = 200;
        req.response.write('Settings Sent');
        return 'Settings Saved';
      } catch (e, s) {
        Logger.Inst().log(
          e.toString(),
          'LoliSync',
          'storeSettings',
          LogTypes.exception,
          s: s,
        );
        req.response.statusCode = 404;
        req.response.write('Invalid Query');
        return 'Something went wrong $e';
      }
    } else {
      req.response.statusCode = 404;
      req.response.write('Invalid Query');
      return 'Invalid Query';
    }
  }

  Future<String> storeBooruBatch(dynamic req, SettingsHandler settingsHandler) async {
    if (req.method == 'POST') {
      try {
        final int amount = int.parse(req.uri.queryParameters['amount']!);
        final int offset = int.parse(req.uri.queryParameters['offset']!);
        final int size = int.parse(req.uri.queryParameters['size']!);
        Logger.Inst().log('request to update booru batch recieved', 'LoliSync', 'storeBooruItem', LogTypes.loliSyncInfo);
        final String content = await utf8.decoder.bind(req).join();
        final List<BooruItem> items = List.from(jsonDecode(content)).map((e) => BooruItem.fromJSON(jsonEncode(e))).toList();
        if (settingsHandler.dbEnabled) {
          final Map<String, int> result = await settingsHandler.dbHandler.updateMultipleBooruItems(items, BooruUpdateMode.sync);
          final int saved = result['saved'] ?? 0;
          final int exist = result['exist'] ?? 0;

          final String savedString = saved > 0 ? 'Added $saved' : '';
          final String existString = exist > 0 ? 'Skipped $exist' : '';
          final String divider = (savedString != '' && existString != '') ? '/' : '';
          final String totalResult = savedString + divider + existString;
          req.response.statusCode = 200;
          req.response.write(totalResult);

          final int lastIndex = offset + size;
          if (lastIndex == amount - 1) {
            return 'Favourites Synced';
          } else {
            return '$offset-$lastIndex / $amount - $totalResult';
          }
        } else {
          req.response.statusCode = 200;
          req.response.write('DB is disabled');
          return 'DB is disabled';
        }
      } catch (e, s) {
        Logger.Inst().log(
          e.toString(),
          'LoliSync',
          'storeBooruItem',
          LogTypes.exception,
          s: s,
        );
        req.response.statusCode = 404;
        req.response.write('Invalid Query');
        return 'Something went wrong $e';
      }
    } else {
      req.response.statusCode = 404;
      req.response.write('Invalid Query');
      return 'Invalid Query';
    }
  }

  Future<String> storeBooruItem(dynamic req, SettingsHandler settingsHandler) async {
    if (req.method == 'POST') {
      try {
        final int amount = int.parse(req.uri.queryParameters['amount']!);
        final int current = int.parse(req.uri.queryParameters['current']!);
        Logger.Inst().log('request to update booru item recieved', 'LoliSync', 'storeBooruItem', LogTypes.loliSyncInfo);
        final String content = await utf8.decoder.bind(req).join(); /*2*/
        final BooruItem item = BooruItem.fromJSON(content);
        if (settingsHandler.dbEnabled) {
          final String? result = await settingsHandler.dbHandler.updateBooruItem(item, BooruUpdateMode.sync);
          req.response.statusCode = 200;
          req.response.write(result);
          if (current == amount - 1) {
            return 'Favourites Synced';
          } else {
            return '$current / $amount - $result';
          }
        } else {
          req.response.statusCode = 200;
          req.response.write('DB is disabled');
          return 'DB is disabled';
        }
      } catch (e, s) {
        Logger.Inst().log(
          e.toString(),
          'LoliSync',
          'storeBooruItem',
          LogTypes.exception,
          s: s,
        );
        req.response.statusCode = 404;
        req.response.write('Invalid Query');
        return 'Something went wrong $e';
      }
    } else {
      req.response.statusCode = 404;
      req.response.write('Invalid Query');
      return 'Invalid Query';
    }
  }

  Future<String> storeBooru(dynamic req, SettingsHandler settingsHandler) async {
    if (req.method == 'POST') {
      try {
        Logger.Inst().log('request to add item recieved', 'LoliSync', 'storeBooru', LogTypes.loliSyncInfo);
        final int amount = int.parse(req.uri.queryParameters['amount']!);
        final int current = int.parse(req.uri.queryParameters['current']!);
        final String content = await utf8.decoder.bind(req).join(); /*2*/
        final Booru booru = Booru.fromJSON(content);

        if (booru.name != 'Favourites') {
          // Remove existing booru if base url is the same
          // TODO merge their data (i.e. api keys) or don't do anything if they have the same name+base url instead
          // for (int i=0; i < settingsHandler.booruList.length; i++){
          //   if (settingsHandler.booruList.isNotEmpty) {
          //     if (settingsHandler.booruList[i].baseURL == booru.baseURL) {
          //       settingsHandler.booruList.removeAt(i);
          //     }
          //   }
          // }
          final bool alreadyExists = settingsHandler.booruList.indexWhere((el) => el.baseURL == booru.baseURL && el.name == booru.name) != -1;
          if (!alreadyExists) {
            await settingsHandler.saveBooru(booru);
          }
        }
        req.response.statusCode = 200;
        req.response.write('Success');
        if (current == amount - 1) {
          return 'Booru Configs Synced';
        } else {
          return '$current / $amount - ${booru.name}';
        }
      } catch (e, s) {
        Logger.Inst().log(
          e.toString(),
          'LoliSync',
          'storeBooru',
          LogTypes.exception,
          s: s,
        );
        req.response.statusCode = 404;
        req.response.write('Invalid Query');
        return 'Something went wrong $e';
      }
    } else {
      req.response.statusCode = 404;
      req.response.write('Invalid Query');
      return 'Invalid Query';
    }
  }

  Future<String> storeTabs(dynamic req, SettingsHandler settingsHandler) async {
    final SearchHandler searchHandler = SearchHandler.instance;

    if (req.method == 'POST') {
      try {
        Logger.Inst().log('request to update tabs recieved', 'LoliSync', 'storeTabs', LogTypes.loliSyncInfo);
        final String content = await utf8.decoder.bind(req).join(); /*2*/
        final String mode = req.uri.queryParameters['mode']!;
        final String? tabsString = jsonDecode(content)?['tabs'];
        // print('tabsString: $tabsString');
        // print('mode: $mode');
        if (tabsString != null && tabsString.isNotEmpty) {
          if (mode == 'Merge') {
            searchHandler.mergeTabs(tabsString);
          } else if (mode == 'Replace') {
            searchHandler.replaceTabs(tabsString);
          }
        }

        req.response.statusCode = 200;
        req.response.write('Tabs Sent');
        return 'Tabs Saved';
      } catch (e, s) {
        Logger.Inst().log(
          e.toString(),
          'LoliSync',
          'storeTabs',
          LogTypes.exception,
          s: s,
        );
        req.response.statusCode = 404;
        req.response.write('Invalid Query');
        return 'Something went wrong $e';
      }
    } else {
      req.response.statusCode = 404;
      req.response.write('Invalid Query');
      return 'Invalid Query';
    }
  }

  Future<String> storeTags(dynamic req, SettingsHandler settingsHandler) async {
    final TagHandler tagHandler = TagHandler.instance;

    if (req.method == 'POST') {
      try {
        Logger.Inst().log('request to update tags recieved', 'LoliSync', 'storeTags', LogTypes.loliSyncInfo);
        final String content = await utf8.decoder.bind(req).join(); /*2*/
        final String mode = req.uri.queryParameters['mode']!;
        final List<dynamic> tags = jsonDecode(content);
        Logger.Inst().log('Received ${tags.length} tags', 'LoliSync', 'storeTags', LogTypes.loliSyncInfo);
        if (tags.isNotEmpty) {
          if (mode == 'Overwrite') {
            unawaited(tagHandler.loadFromJSON(content, preferTagTypeIfNone: false));
          } else if (mode == 'PreferTypeIfNone') {
            unawaited(tagHandler.loadFromJSON(content, preferTagTypeIfNone: true));
          }
        }

        req.response.statusCode = 200;
        req.response.write('Tags Sent');
        return 'Tags Saved';
      } catch (e, s) {
        Logger.Inst().log(
          e.toString(),
          'LoliSync',
          'storeTags',
          LogTypes.exception,
          s: s,
        );
        req.response.statusCode = 404;
        req.response.write('Invalid Query');
        return 'Something went wrong $e';
      }
    } else {
      req.response.statusCode = 404;
      req.response.write('Invalid Query');
      return 'Invalid Query';
    }
  }

  Future<void> killServer() async {
    await server?.close();
    FlashElements.showSnackbar(
      title: const Text(
        'LoliSync server killed!',
        style: TextStyle(fontSize: 20),
      ),
      leadingIcon: Icons.warning_amber,
      leadingIconColor: Colors.yellow,
      sideColor: Colors.yellow,
    );
  }

  void killSync() {
    syncKilled = true;
  }

  Future<String> sendBooruBatch(List<BooruItem> items, int favouritesCount, int offset) async {
    final int lastIndex = offset + items.length;
    Logger.Inst().log('Sending batch $offset-$lastIndex / $favouritesCount', 'LoliSync', 'sendBooruItem', LogTypes.loliSyncInfo);
    final HttpClientRequest request = await HttpClient().post(ip, port, '/lolisync/boorubatch?amount=$favouritesCount&offset=$offset&size=${items.length}')
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(items.map((e) => e.toJson()).toList()));
    final HttpClientResponse response = await request.close();
    final String responseStr = await utf8.decoder.bind(response).join();
    return responseStr;
  }

  Future<String> sendBooruItem(BooruItem item, int favouritesCount, int current) async {
    Logger.Inst().log('Sending item $current / $favouritesCount', 'LoliSync', 'sendBooruItem', LogTypes.loliSyncInfo);
    final HttpClientRequest request = await HttpClient().post(ip, port, '/lolisync/booruitem?amount=$favouritesCount&current=$current')
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(item.toJson())); /*3*/
    final HttpClientResponse response = await request.close();
    final String responseStr = await utf8.decoder.bind(response).join();
    return responseStr;
  }

  Future<String> sendSettings(Map settingsJSON) async {
    Logger.Inst().log('Sending settings $settingsJSON', 'LoliSync', 'sendSettings', LogTypes.loliSyncInfo);
    final HttpClientRequest request = await HttpClient().post(ip, port, '/lolisync/settings')
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(settingsJSON));
    final HttpClientResponse response = await request.close();
    final String responseStr = await utf8.decoder.bind(response).join();
    return responseStr;
  }

  Future<String> sendBooru(Booru booru, int booruCount, int current) async {
    Logger.Inst().log('Sending item $current / $booruCount', 'LoliSync', 'sendBooru', LogTypes.loliSyncInfo);
    final HttpClientRequest request = await HttpClient().post(ip, port, '/lolisync/booru?amount=$booruCount&current=$current')
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(booru.toJson()));
    final HttpClientResponse response = await request.close();
    final String responseStr = await utf8.decoder.bind(response).join();
    return responseStr;
  }

  Future<String> sendTabs(String? tabsString, String mode) async {
    Logger.Inst().log('Sending tabs $tabsString', 'LoliSync', 'sendTabs', LogTypes.loliSyncInfo);
    final HttpClientRequest request = await HttpClient().post(ip, port, '/lolisync/tabs?mode=$mode')
      ..headers.contentType = ContentType.json
      ..write(
        jsonEncode({'tabs': tabsString}),
      );
    final HttpClientResponse response = await request.close();
    final String responseStr = await utf8.decoder.bind(response).join();
    return responseStr;
  }

  Future<String> sendTags(List<Tag> tagList, String mode) async {
    Logger.Inst().log('Sending tags: ${tagList.length}', 'LoliSync', 'sendTags', LogTypes.loliSyncInfo);
    final HttpClientRequest request = await HttpClient().post(ip, port, '/lolisync/tags?mode=$mode')
      ..headers.contentType = ContentType.json
      ..write(
        jsonEncode(
          tagList,
        ),
      );
    final HttpClientResponse response = await request.close();
    final String responseStr = await utf8.decoder.bind(response).join();
    return responseStr;
  }

  // TODO add timeout
  Future<String> sendTest() async {
    Logger.Inst().log('Sending test', 'LoliSync', 'sendTest', LogTypes.loliSyncInfo);
    try {
      final HttpClientRequest request = await HttpClient().post(ip, port, '/lolisync/test');
      final HttpClientResponse response = await request.close();
      if (response.statusCode != 200) {
        FlashElements.showSnackbar(
          title: Text(
            'Test error: ${response.statusCode} ${response.reasonPhrase}',
            style: const TextStyle(fontSize: 20),
          ),
          leadingIcon: Icons.warning_amber,
          leadingIconColor: Colors.red,
          sideColor: Colors.red,
        );
        return 'Test error';
      } else {
        FlashElements.showSnackbar(
          title: const Text(
            'Test request received a positive response',
            style: TextStyle(fontSize: 20),
          ),
          content: const Text(
            "There should be a 'Test' message on the other device",
            style: TextStyle(fontSize: 20),
          ),
          leadingIcon: Icons.warning_amber,
          leadingIconColor: Colors.green,
          sideColor: Colors.green,
        );
        return 'Test OK';
      }
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        'LoliSync',
        'sendTest',
        LogTypes.exception,
        s: s,
      );
      FlashElements.showSnackbar(
        title: Text(
          'Test error: $e',
          style: const TextStyle(fontSize: 20),
        ),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.red,
        sideColor: Colors.red,
      );
      return 'Test error';
    }
  }

  Future<String> sendSyncComplete() async {
    Logger.Inst().log('Sending sync complete', 'LoliSync', 'sendSyncComplete', LogTypes.loliSyncInfo);
    try {
      final HttpClientRequest request = await HttpClient().post(ip, port, '/lolisync/complete');
      final HttpClientResponse response = await request.close();
      return response.statusCode.toString();
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        'LoliSync',
        'sendSyncComplete',
        LogTypes.exception,
        s: s,
      );
      return 'Sync Complete error $e';
    }
  }

  Stream<String> startSync(String ipOverride, String portOverride, List<String> toSync, int favSkip, String tabsMode, String tagsMode) async* {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final SearchHandler searchHandler = SearchHandler.instance;
    final TagHandler tagHandler = TagHandler.instance;
    ip = ipOverride;
    port = int.tryParse(portOverride) ?? 8080;
    final String address = '$ip:$port';
    syncKilled = false;

    for (int i = 0; i < toSync.length; i++) {
      switch (toSync.elementAt(i)) {
        case 'Favouritesv2':
          yield 'Sync Starting $address';
          yield 'Preparing favourites data';
          final int favouritesCount = await settingsHandler.dbHandler.getFavouritesCount();
          yield 'Favourites count: $favouritesCount';
          if (favouritesCount > 0) {
            const int limit = 100;
            final int ceiling = (favouritesCount / limit).ceil();

            // If favSkip is set, start from skipAmount/limit, but limitted to (last 1000 items (ceiling - 1))
            final int startFrom = min(ceiling - 1, (favSkip == 0 ? 0 : (favSkip / limit).floor()));

            for (int i = startFrom; i < ceiling; i++) {
              if (!syncKilled) {
                final int offset = i * limit;
                // TODO rework to send only missing ones?
                yield 'Fetching favourites $offset / $favouritesCount';
                final List<BooruItem> fetched = await settingsHandler.dbHandler.searchDB('', offset.toString(), limit.toString(), 'ASC', 'loliSyncFav');
                Logger.Inst().log('fetched is ${fetched.length} i is $i', 'LoliSync', 'startSync', LogTypes.loliSyncInfo);

                final String resp = await sendBooruBatch(fetched, favouritesCount, offset);
                final int count = offset + fetched.length;
                yield '$offset-$count / $favouritesCount - $resp';
              }
            }
            yield 'Favourites sent';
          } else {
            yield 'No Favourites';
          }
          break;
        case 'Favourites':
          yield 'Sync Starting $address';
          yield 'Preparing favourites data';
          final int favouritesCount = await settingsHandler.dbHandler.getFavouritesCount();
          yield 'Favourites count: $favouritesCount';
          if (favouritesCount > 0) {
            const int limit = 100;
            final int ceiling = (favouritesCount / limit).ceil();

            // If favSkip is set, start from skipAmount/limit, but limitted to (last 100 items (ceiling - 1))
            final int startFrom = min(ceiling - 1, (favSkip == 0 ? 0 : (favSkip / limit).floor()));

            for (int i = startFrom; i < ceiling; i++) {
              if (!syncKilled) {
                final int offset = i * limit;
                // TODO rework to send only missing ones?
                yield 'Fetching favourites $offset / $favouritesCount';
                final List<BooruItem> fetched = await settingsHandler.dbHandler.searchDB('', offset.toString(), limit.toString(), 'ASC', 'loliSyncFav');
                yield 'Fetched ${fetched.length} favourites';
                Logger.Inst().log('fetched is ${fetched.length} i is $i', 'LoliSync', 'startSync', LogTypes.loliSyncInfo);
                for (int x = 0; x < fetched.length; x++) {
                  final int count = offset + x;
                  if (count < favouritesCount) {
                    // TODO send in batches, not in singles
                    final String resp = await sendBooruItem(fetched.elementAt(x), favouritesCount, count);
                    yield '$count / $favouritesCount - $resp';
                  } else {
                    Logger.Inst().log('skipping', 'LoliSync', 'startSync', LogTypes.loliSyncInfo);
                  }
                }
              }
            }
            yield 'Favourites sent';
          } else {
            yield 'No Favourites';
          }
          break;
        case 'Settings':
          yield 'Sync Starting $address';
          yield 'Preparing settings data';
          final Map<String, dynamic> settingsJSON = settingsHandler.toJson();
          for (final element in settingsHandler.deviceSpecificSettings) {
            settingsJSON.remove(element);
          }
          final String resp = await sendSettings(settingsJSON);
          yield resp;
          break;
        case 'Booru':
          yield 'Sync Starting $address';
          yield 'Preparing booru data';
          final List<Booru> booruList = settingsHandler.booruList.where((e) => BooruType.saveable.contains(e.type)).toList();
          final int booruCount = booruList.length;
          if (booruCount > 0) {
            for (int i = 0; i < booruCount; i++) {
              if (!syncKilled) {
                if (i < booruCount) {
                  final String resp = await sendBooru(booruList.elementAt(i), booruCount, i);
                  yield '$i / $booruCount - $resp';
                } else {
                  Logger.Inst().log('skipping', 'LoliSync', 'startSync', LogTypes.loliSyncInfo);
                }
              }
            }
            yield 'Booru Configs sent';
          } else {
            yield 'No Booru Configs';
          }
          break;
        case 'Tabs':
          yield 'Sync Starting $address';
          yield 'Preparing tabs data';
          final String resp = await sendTabs(searchHandler.generateBackupJson(), tabsMode);
          yield resp;
          break;
        case 'Test':
          yield 'Sync Starting $address';
          yield 'Preparing test data';
          final String resp = await sendTest();
          yield resp;
          break;
        case 'Tags':
          yield 'Sync Starting $address';
          yield 'Preparing tag data';
          final String resp = await sendTags(tagHandler.toList(), tagsMode);
          yield resp;
          break;
      }
    }

    yield 'Sync Complete';
    await sendSyncComplete();
  }
}
