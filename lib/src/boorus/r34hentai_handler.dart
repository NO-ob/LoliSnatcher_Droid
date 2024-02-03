import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:html/parser.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/boorus/shimmie_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

class R34HentaiHandler extends ShimmieHandler {
  R34HentaiHandler(super.booru, super.limit);

  @override
  bool get hasSizeData => true;

  @override
  String validateTags(String tags) {
    return tags;
  }

  @override
  List parseListFromResponse(dynamic response) {
    final document = parse(response.data);
    return document.getElementsByClassName('thumb');
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    final current = responseItem;

    final String id = current.attributes['data-post-id']!;
    final String fileExt = current.attributes['data-mime']?.split('/')[1] ?? 'png';
    final String thumbURL = current.firstChild!.attributes['src']!;
    final double? thumbWidth = double.tryParse(current.firstChild!.attributes['width'] ?? '');
    final double? thumbHeight = double.tryParse(current.firstChild!.attributes['height'] ?? '');
    final double? fileWidth = double.tryParse(current.attributes['data-width'] ?? '');
    final double? fileHeight = double.tryParse(current.attributes['data-height'] ?? '');
    final String fileURL =
        thumbURL.replaceFirst('_thumbs', '_images').replaceFirst('thumbnails', 'images').replaceFirst('thumbnail_', '').replaceFirst('.jpg', '.$fileExt');
    final List<String> tags = current.attributes['data-tags']?.split(' ') ?? [];

    final BooruItem item = BooruItem(
      thumbnailURL: booru.baseURL! + thumbURL,
      sampleURL: booru.baseURL! + fileURL,
      fileURL: booru.baseURL! + fileURL,
      previewWidth: thumbWidth,
      previewHeight: thumbHeight,
      fileWidth: fileWidth,
      fileHeight: fileHeight,
      tagsList: tags,
      md5String: getHashFromURL(thumbURL),
      postURL: makePostURL(id),
      serverId: id,
    );

    return item;
  }

  String getHashFromURL(String url) {
    final String hash = url.substring(url.lastIndexOf('_') + 1, url.lastIndexOf('.'));
    return hash;
  }

  @override
  String makeURL(String tags) {
    String tagsText = tags.replaceAll(' ', '+');
    tagsText = tagsText.isEmpty ? '' : '$tagsText/';
    return '${booru.baseURL}/post/list/$tagsText$pageNum';
  }

  @override
  bool get hasSignInSupport => true;

  @override
  Future<bool> signIn() async {
    final CookieManager cookieManager = CookieManager.instance();
    List<String>? setCookies;
    try {
      final res = await DioNetwork.post(
        '${booru.baseURL}/user_admin/login',
        data: {
          'user': booru.userID,
          'pass': booru.apiKey,
          'gobu': 'Log+In',
        },
        options: Options(
          contentType: 'application/x-www-form-urlencoded',
        ),
        headers: await Tools.getFileCustomHeaders(
          Booru(
            'R34Hentai',
            BooruType.R34Hentai,
            '${booru.baseURL}/favicon.ico',
            booru.baseURL,
            '',
          ),
        ),
      );
      setCookies = res.headers['set-cookie'];
    } catch (e) {
      if (e is DioException) {
        setCookies = e.response?.headers['set-cookie'];
      }
    }
    if (setCookies != null) {
      for (final cookie in setCookies) {
        final name = cookie.split(';')[0].split('=')[0];
        final value = cookie.split(';')[0].split('=')[1];

        await cookieManager.setCookie(
          url: WebUri(booru.baseURL!),
          name: name,
          value: value,
        );
      }
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> isSignedIn() async {
    final CookieManager cookieManager = CookieManager.instance();
    final cookies = await cookieManager.getCookies(url: WebUri(booru.baseURL!));
    final bool hasCookies = cookies.any((e) => e.name == 'shm_user') && cookies.any((e) => e.name == 'shm_session');

    if (!hasCookies) {
      return false;
    } else {
      // TODO here could be a check if the cookies are still valid/not expired, but webview lib doesn't support expire dates for cookies? are they just dropping them if expired on next read?
      // or maybe do a network request to check if the cookies are still valid?
      return true;
    }
  }

  @override
  Future<bool?> signOut({bool fromError = false}) async {
    bool success = false;
    if (fromError) {
      success = true;
    } else {
      try {
        final res = await DioNetwork.get(
          '${booru.baseURL}/user_admin/logout',
          headers: await Tools.getFileCustomHeaders(
            Booru(
              'R34Hentai',
              BooruType.R34Hentai,
              '${booru.baseURL}/favicon.ico',
              booru.baseURL,
              '',
            ),
          ),
        );
        success = res.statusCode == 200;
      } catch (e) {
        if (e is DioException) {
          success = false;
        }
      }
    }

    final CookieManager cookieManager = CookieManager.instance();
    await cookieManager.deleteCookies(
      url: WebUri(booru.baseURL!),
    );

    return success;
  }
}

/// Booru Handler for the r34hentai engine
// TODO they removed their api, both shimmie and custom one, but maybe it is still hidden somewhere?
class R34HentaiHandlerOld extends R34HentaiHandler {
  R34HentaiHandlerOld(super.booru, super.limit);

  @override
  List parseListFromResponse(dynamic response) {
    final List<dynamic> parsedResponse = response.data;
    return parsedResponse; // Limit doesn't work with this api
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    final current = responseItem;
    final String imageUrl = current['file_url'];
    final String sampleUrl = current['sample_url'];
    final String thumbnailUrl = current['preview_url'];

    final BooruItem item = BooruItem(
      fileURL: imageUrl,
      sampleURL: sampleUrl,
      thumbnailURL: thumbnailUrl,
      tagsList: current['tags'].split(' '),
      postURL: makePostURL(current['id'].toString()),
    );

    return item;
  }

  @override
  String makeURL(String tags) {
    return '${booru.baseURL}/post/index.json?limit=$limit&page=$pageNum&tags=$tags';
  }
}
