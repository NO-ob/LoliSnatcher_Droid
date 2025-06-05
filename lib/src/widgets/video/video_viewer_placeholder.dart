import 'dart:io';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail.dart';

class VideoViewerPlaceholder extends StatelessWidget {
  const VideoViewerPlaceholder({
    required this.item,
    required this.booru,
    super.key,
  });

  final BooruItem item;
  final Booru booru;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Thumbnail(
            item: item,
            booru: booru,
            isStandalone: false,
          ),
          // Image.network(item.thumbnailURL, fit: BoxFit.fill),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 3,
            child: SettingsButton(
              name: Platform.isLinux ? 'Open Video in External Player' : 'Open Video in Browser',
              action: () {
                if (Platform.isLinux) {
                  Process.run('mpv', ['--loop', item.fileURL]);
                } else {
                  launchUrlString(
                    item.fileURL,
                    mode: LaunchMode.externalApplication,
                  );
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
