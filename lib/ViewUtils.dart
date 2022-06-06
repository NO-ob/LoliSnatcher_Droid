import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:LoliSnatcher/src/data/Booru.dart';

class ViewUtils {

  // unified http headers list generator for dio in thumb/media/video loaders
  static Map<String, String> getFileCustomHeaders(Booru booru, {bool checkForReferer = false}) {
    // a few boorus doesn't work without a browser useragent
    Map<String,String> headers = {"user-agent": "Mozilla/5.0 (Linux x86_64; rv:86.0) Gecko/20100101 Firefox/86.0"};
    // some boorus require referer header
    if(checkForReferer) {
      switch (booru.type) {
        case 'World':
          if(booru.baseURL!.contains('rule34.xyz')) {
            headers["referer"] = "https://rule34xyz.b-cdn.net";
          } else if(booru.baseURL!.contains('rule34.world')) {
            headers["referer"] = "https://rule34storage.b-cdn.net";
          }
          break;

        default:
          break;
      }
    }

    return headers;
  }

  static IconData getFileIcon(String? mediaType) {
    switch (mediaType) {
      case 'image':
        return Icons.photo;
      case 'video':
        return CupertinoIcons.videocam_fill;
      case 'animation':
        return CupertinoIcons.play_fill;
      case 'not_supported_animation':
        return Icons.play_disabled;
      default:
        return CupertinoIcons.question;
    }
  }
}
