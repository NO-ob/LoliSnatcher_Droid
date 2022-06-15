import 'dart:io';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class VideoViewerPlaceholder extends StatelessWidget {
  const VideoViewerPlaceholder({Key? key, required this.item, required this.index}) : super(key: key);

  final BooruItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Thumbnail(
            item: item,
            index: index,
            isStandalone: false,
            ignoreColumnsCount: true,
          ),
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
