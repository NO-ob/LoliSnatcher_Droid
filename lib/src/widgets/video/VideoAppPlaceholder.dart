import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:LoliSnatcher/src/handlers/search_handler.dart';
import 'package:LoliSnatcher/src/handlers/service_handler.dart';
import 'package:LoliSnatcher/src/data/BooruItem.dart';
import 'package:LoliSnatcher/src/widgets/thumbnail/thumbnail.dart';
import 'package:LoliSnatcher/src/widgets/common/SettingsWidgets.dart';

class VideoAppPlaceholder extends StatelessWidget {
  const VideoAppPlaceholder({Key? key, required this.item, required this.index}) : super(key: key);
  final BooruItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final SearchHandler searchHandler = SearchHandler.instance;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Thumbnail(item, index, searchHandler.currentTab, 1, false),
          // Image.network(item.thumbnailURL, fit: BoxFit.fill),
          SizedBox(
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
              icon: const Icon(Icons.play_arrow),
              drawTopBorder: true,
            ),
          ),
        ],
      ),
    );
  }
}

class UnknownPlaceholder extends StatelessWidget {
  const UnknownPlaceholder({Key? key, required this.item, required this.index}) : super(key: key);
  final BooruItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final SearchHandler searchHandler = SearchHandler.instance;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Thumbnail(item, index, searchHandler.currentTab, 1, false),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: SettingsButton(
              name: 'Unknown file format, click here to open in browser',
              action: () {
                ServiceHandler.launchURL(item.postURL);
              },
              icon: const Icon(CupertinoIcons.question),
              drawTopBorder: true,
            ),
          ),
        ],
      ),
    );
  }
}
