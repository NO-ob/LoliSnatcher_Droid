import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
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
    final host = Uri.parse((booru?.baseURL?.isNotEmpty == true ? booru?.baseURL : item?.postURL) ?? '').host;
    if (host.isEmpty) return {};

    // a few boorus don't work without a browser useragent
    final Map<String, String> headers = {'User-Agent': browserUserAgent};
    if (host.contains('danbooru.donmai.us')) {
      headers['User-Agent'] = appUserAgent;
    }
    if ([
      ...SankakuHandler.knownUrls,
      'sankakuapi.com',
    ].any(host.contains)) {
      headers['User-Agent'] = Constants.sankakuAppUserAgent;
    }

    if (!isTestMode) {
      try {
        final cookiesStr = await getCookies(host);
        if (cookiesStr.isNotEmpty) {
          headers['Cookie'] = cookiesStr;
        }
      } catch (e) {
        print('Error getting cookies: $e');
      }
    }

    // some boorus require referer header
    if (checkForReferer) {
      switch (booru?.type) {
        case BooruType.World:
          if (host.contains('rule34.xyz')) {
            headers['Referer'] = 'https://rule34xyz.b-cdn.net';
          } else if (host.contains('rule34.world')) {
            headers['Referer'] = 'https://rule34storage.b-cdn.net';
          }
          break;

        default:
          break;
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

  static const String appUserAgent = 'LoliSnatcher_Droid/${Constants.appVersion}';
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

    final Map<String, String> knownCaptchaStrings = {
      'booru.allthefallen.moe': 'processChallenge',
    };
    final String? textToFind = knownCaptchaStrings.entries.firstWhereOrNull((e) => host.contains(e.key))?.value;
    final bool hasCaptchaContent = (textToFind == null || response?.data is! String)
        ? false
        : response?.data.toString().contains(textToFind) ?? false;

    if (isOnPlatformWithWebviewSupport &&
        (response?.statusCode == HttpStatus.forbidden ||
            response?.statusCode == HttpStatus.serviceUnavailable ||
            hasCaptchaContent)) {
      captchaScreenActive = true;
      await Navigator.push(
        NavigationHandler.instance.navContext,
        MaterialPageRoute(
          builder: (context) => InAppWebviewView(
            initialUrl: '${uri.scheme}://$host',
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
}

bool captchaScreenActive = false;
