import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/CachedThumbBetter.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';

class VideoAppPlaceholder extends StatelessWidget {
  final BooruItem item;
  final int index;
  VideoAppPlaceholder({required this.item, required this.index});

  final SearchHandler searchHandler = Get.find<SearchHandler>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CachedThumbBetter(item, index, searchHandler.currentTab, 1, false),
          // Image.network(item.thumbnailURL, fit: BoxFit.fill),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            child: SettingsButton(
              name: Platform.isLinux ? 'Open Video in External Player' : 'Open Video in Browser',
              action: () {
                if (Platform.isLinux) {
                  Process.run('mpv', ["--loop", item.fileURL]);
                } else {
                  ServiceHandler.launchURL(item.fileURL);
                }
              },
              icon: Icon(Icons.play_arrow),
              drawTopBorder: true,
            ),
          ),
        ],
      ),
    );
  }
}

class UnknownPlaceholder extends StatelessWidget {
  final BooruItem item;
  final int index;
  UnknownPlaceholder({required this.item, required this.index});

  final SearchHandler searchHandler = Get.find<SearchHandler>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CachedThumbBetter(item, index, searchHandler.currentTab, 1, false),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            child: SettingsButton(
              name: 'Unknown file format, click here to open in browser',
              action: () {
                ServiceHandler.launchURL(item.postURL);
              },
              icon: Icon(CupertinoIcons.question),
              drawTopBorder: true,
            ),
          ),
        ],
      ),
    );
  }
}
