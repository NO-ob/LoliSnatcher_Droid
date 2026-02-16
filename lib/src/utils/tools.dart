import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/boorus/idol_sankaku_handler.dart';
import 'package:lolisnatcher/src/boorus/sankaku_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/widgets/webview/webview_page.dart';

class Tools {
  // code taken from: https://gist.github.com/zzpmaster/ec51afdbbfa5b2bf6ced13374ff891d9
  static String formatBytes(
    int bytes,
    int decimals, {
    bool withSpace = true,
    bool withTrailingZeroes = true,
  }) {
    if (bytes <= 0) {
      return '0 B';
    }
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    final i = (log(bytes) / log(1024)).floor();

    final num = bytes / pow(1024, i);
    return '${num.toStringAsFixed(withTrailingZeroes ? decimals : (num.truncateToDouble() == num ? 0 : decimals))}${withSpace ? ' ' : ''}${suffixes[i]}';
  }

  static int parseFormattedBytes(String bytes) {
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

    if (bytes.isEmpty) {
      return 0;
    }
    // parse bytes (string of format: 1.1GB)
    String suffixStr = bytes.substring(bytes.length - 2);
    if (!suffixes.contains(suffixStr)) {
      suffixStr = bytes.substring(bytes.length - 1);
    }
    if (!suffixes.contains(suffixStr)) {
      return 0;
    }

    final String bytesStr = bytes.substring(0, bytes.length - suffixStr.length);
    final int suffixIndex = suffixes.indexOf(suffixStr);

    return ((double.tryParse(bytesStr) ?? 0) * pow(1024, suffixIndex)).round();
  }

  static int boolToInt(bool boolean) {
    return boolean ? 1 : 0;
  }

  static bool intToBool(int boolean) {
    return boolean != 0;
  }

  static bool stringToBool(String boolean) {
    return boolean == 'true';
  }

  static String getFileExt(String fileURL) {
    if (fileURL.contains('paheal') && fileURL.contains('file_ext')) {
      return Uri.parse(fileURL).queryParameters['file_ext'] ?? 'png';
    }

    final int queryLastIndex = fileURL.lastIndexOf('?'); // if has GET query parameters
    final int lastIndex = queryLastIndex != -1 ? queryLastIndex : fileURL.length;
    final String fileExt = fileURL.substring(fileURL.lastIndexOf('.') + 1, lastIndex);
    return fileExt;
  }

  static String getFileName(String fileURL) {
    final int queryLastIndex = fileURL.lastIndexOf('?'); // if has GET query parameters
    final int lastIndex = queryLastIndex != -1 ? queryLastIndex : fileURL.length;
    final String fileExt = fileURL.substring(fileURL.lastIndexOf('/') + 1, lastIndex);
    return fileExt;
  }

  static String sanitize(String str, {String replacement = ''}) {
    final RegExp illegalRe = RegExp(r'[\/\?<>\\:\*\|"]');
    final RegExp controlRe = RegExp(r'[\x00-\x1f\x80-\x9f]');
    final RegExp reservedRe = RegExp(r'^\.+$');
    final RegExp windowsReservedRe = RegExp(r'^(con|prn|aux|nul|com[0-9]|lpt[0-9])(\..*)?$', caseSensitive: false);
    final RegExp windowsTrailingRe = RegExp(r'[\. ]+$');

    // TODO truncate to 255 symbols for windows?
    return str
        .replaceAll(illegalRe, replacement)
        .replaceAll(controlRe, replacement)
        .replaceAll(reservedRe, replacement)
        .replaceAll(windowsReservedRe, replacement)
        .replaceAll(windowsTrailingRe, replacement)
        .replaceAll('%20', '_');
  }

  // unified http headers list generator for dio in thumb/media/video loaders
  static Future<Map<String, String>> getFileCustomHeaders(
    Booru? booru, {
    BooruItem? item,
    bool checkForReferer = false,
  }) async {
    final uri = Uri.parse((booru?.baseURL?.isNotEmpty == true ? booru?.baseURL : item?.postURL) ?? '');
    if (uri.host.isEmpty) {
      return {};
    }

    // a few boorus don't work without a browser useragent
    final Map<String, String> headers = {'User-Agent': browserUserAgent};
    if (uri.host.contains('danbooru.donmai.us')) {
      headers['User-Agent'] = appUserAgent;
    } else if (IdolSankakuHandler.knownUrls.contains(uri.host)) {
      headers['User-Agent'] = Constants.sankakuIdolAppUserAgent;
    } else if ([
      ...SankakuHandler.knownUrls,
      'sankakuapi.com',
    ].any(uri.host.contains)) {
      headers['User-Agent'] = Constants.sankakuAppUserAgent;
    }

    if (!isTestMode) {
      try {
        final cookiesStr = await getCookies(uri.toString());
        if (cookiesStr.isNotEmpty) {
          headers['Cookie'] = cookiesStr;
        }
      } catch (e) {
        print('Error getting cookies: $e');
      }
    }

    // some boorus require referer header
    if (checkForReferer) {
      if (uri.host.contains('rule34.xyz')) {
        headers['Referer'] = 'https://rule34xyz.b-cdn.net';
      } else if (uri.host.contains('rule34.world')) {
        headers['Referer'] = 'https://rule34storage.b-cdn.net';
      } else if (uri.host.contains('gelbooru.com')) {
        headers['Referer'] = 'https://gelbooru.com';
      }
    }

    return headers;
  }

  static IconData? getFileIcon(MediaType? mediaType) {
    switch (mediaType) {
      case MediaType.image:
        return null; // Icons.photo;
      case MediaType.video:
        return CupertinoIcons.videocam_fill;
      case MediaType.animation:
        return CupertinoIcons.play_fill;
      case MediaType.notSupportedAnimation:
        return Icons.play_disabled;
      default:
        return CupertinoIcons.question;
    }
  }

  static void forceClearMemoryCache({bool withLive = false}) {
    // clears memory image cache on timer or when changing tabs
    PaintingBinding.instance.imageCache.clear();
    if (withLive) {
      PaintingBinding.instance.imageCache.clearLiveImages();
    }
  }

  static String pluralize(String str, int count) {
    return count == 1 ? str : '${str}s';
  }

  static bool isGoodStatusCode(int? statusCode) {
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }

  static bool isGoodResponse(Response response) {
    if (!isGoodStatusCode(response.statusCode)) {
      return false;
    }

    final isSankaku = response.realUri.toString().contains('sankakucomplex.com');
    final isImageOrVideo =
        response.headers['content-type']?.any((t) => t.contains('image') || t.contains('video')) == true;
    if (isSankaku && isImageOrVideo) {
      final int? contentLength = int.tryParse(response.headers['content-length']?.firstOrNull ?? '');
      if (contentLength != null) {
        // TODO investigate better ways/possibility of this number changing
        // Image with "Expired link - please reload site" text
        const int expiredLinkFileSize = 14802;
        return contentLength != expiredLinkFileSize;
      }
    }

    // TODO add more checks
    return true;
  }

  static final String appUserAgent = 'LoliSnatcher_Droid/${Constants.updateInfo.versionName}';
  static String get browserUserAgent {
    return (isTestMode || SettingsHandler.instance.customUserAgent.isEmpty)
        ? appUserAgent
        : SettingsHandler.instance.customUserAgent;
  }

  static bool get isTestMode => Platform.environment.containsKey('FLUTTER_TEST');

  static bool get isOnPlatformWithWebviewSupport =>
      Platform.isAndroid || Platform.isIOS || Platform.isWindows || Platform.isMacOS;

  static const String captchaCheckHeader = 'LSCaptchaCheck';

  static Future<bool> checkForCaptcha(Response? response, Uri uri, {String? customUserAgent}) async {
    if (captchaScreenActive || isTestMode || response?.requestOptions.headers.containsKey(captchaCheckHeader) == true) {
      return false;
    }

    final String host = uri.host;

    final Map<String, List<String>> knownCaptchaStrings = {
      // TODO add multiple strings for each, then try to find as much as possible and decide if it's a captcha based on the ratio of found/total
      'booru.allthefallen.moe': [
        'processChallenge',
      ],
      'derpibooru.org': [
        'derpi-challenge',
      ],
    };
    final List<String>? stringsToFind = knownCaptchaStrings.entries
        .firstWhereOrNull((e) => host.contains(e.key))
        ?.value;
    final bool hasCaptchaContent = (stringsToFind == null || response?.data is! String)
        ? false
        : stringsToFind.any((t) => response?.data.toString().contains(t) ?? false);

    if (isOnPlatformWithWebviewSupport &&
        (response?.statusCode == HttpStatus.forbidden ||
            response?.statusCode == HttpStatus.serviceUnavailable ||
            hasCaptchaContent)) {
      captchaScreenActive = true;
      await Navigator.push(
        NavigationHandler.instance.navContext,
        MaterialPageRoute(
          builder: (context) => InAppWebviewView(
            initialUrl: '${uri.scheme}://$host${uri.hasPort && uri.port != 80 ? ':${uri.port}' : ''}',
            userAgent: customUserAgent,
            title: 'Captcha check',
            subtitle:
                "Possible captcha detected, please solve it and press back after that. If there is no captcha then it's probably some other authentication issue.",
          ),
        ),
      );
      captchaScreenActive = false;
      return true;
    }
    return false;
  }

  static Future<String> getCookies(String uri) async {
    String cookieString = '';
    if (isOnPlatformWithWebviewSupport) {
      try {
        final CookieManager cookieManager = CookieManager.instance(webViewEnvironment: webViewEnvironment);
        List<Cookie> cookies = [];
        if (Platform.isWindows) {
          cookies.addAll(globalWindowsCookies[WebUri(uri).host] ?? []);
        } else {
          cookies = await cookieManager.getCookies(url: WebUri(uri));
        }
        for (final Cookie cookie in cookies) {
          cookieString += '${cookie.name}=${cookie.value}; ';
        }
      } catch (e, s) {
        Logger.Inst().log(
          e.toString(),
          'Tools',
          'getCookies',
          LogTypes.exception,
          s: s,
        );
      }
    }

    return cookieString.trim();
  }

  static Future<bool> saveCookies(String uri, List<String> cookies) async {
    if (cookies.isEmpty) return true;

    if (isOnPlatformWithWebviewSupport) {
      try {
        final CookieManager cookieManager = CookieManager.instance(webViewEnvironment: webViewEnvironment);
        final List<Cookie?> parsedCookies = [];
        for (final c in cookies) {
          try {
            final parts = c.split(';').map((p) => p.split('='));

            final name = parts.first.first.trim();
            final value = parts.first.last.trim();
            final domain = parts.firstWhereOrNull((p) => p.first.toLowerCase() == 'domain')?.last.trim();
            final path = parts.firstWhereOrNull((p) => p.first.toLowerCase() == 'path')?.last.trim();
            final expires = DateTime.tryParse(
              parts.firstWhereOrNull((p) => p.first.toLowerCase() == 'expires')?.last.trim() ?? '',
            );
            final isSecure = parts.firstWhereOrNull((p) => p.first.toLowerCase() == 'secure') != null;
            final isHttpOnly = parts.firstWhereOrNull((p) => p.first.toLowerCase() == 'httponly') != null;

            parsedCookies.add(
              Cookie(
                name: name,
                value: value,
                domain: domain,
                path: path,
                expiresDate: expires?.millisecondsSinceEpoch,
                isSecure: isSecure,
                isHttpOnly: isHttpOnly,
              ),
            );
          } catch (_) {}
        }

        for (final cookie in parsedCookies) {
          if (cookie == null) continue;
          if (Platform.isWindows) {
            globalWindowsCookies[WebUri(uri).host]?.add(cookie);
          }
          await cookieManager.setCookie(
            url: WebUri(uri),
            name: cookie.name,
            value: cookie.value,
            domain: cookie.domain,
            path: cookie.path ?? '/',
            expiresDate: cookie.expiresDate,
            isSecure: cookie.isSecure,
            isHttpOnly: cookie.isHttpOnly,
          );
        }
        return true;
      } catch (e, s) {
        Logger.Inst().log(
          e.toString(),
          'Tools',
          'saveCookies',
          LogTypes.exception,
          s: s,
        );
      }
    }

    return false;
  }
}

bool captchaScreenActive = false;
