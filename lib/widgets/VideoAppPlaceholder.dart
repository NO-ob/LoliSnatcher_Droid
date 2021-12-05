import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/CachedThumbBetter.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';

class VideoAppPlaceholder extends StatefulWidget {
  final BooruItem item;
  final int index;
  VideoAppPlaceholder({required this.item, required this.index});

  @override
  _VideoAppPlaceholderState createState() => _VideoAppPlaceholderState();
}

class _VideoAppPlaceholderState extends State<VideoAppPlaceholder> {
  final SearchHandler searchHandler = Get.find<SearchHandler>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CachedThumbBetter(widget.item, widget.index, searchHandler.currentTab, 1, false),
          // Image.network(item.thumbnailURL, fit: BoxFit.fill),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            child: SettingsButton(
              name: Platform.isLinux ? 'Open Video in External Player' : 'Open Video in Browser',
              action: () {
                if (Platform.isLinux) {
                  Process.run('mpv', ["--loop", widget.item.fileURL]);
                } else {
                  ServiceHandler.launchURL(widget.item.fileURL);
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
