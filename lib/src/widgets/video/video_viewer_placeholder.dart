import 'dart:io';

import 'package:flutter/material.dart';

import 'package:external_video_player_launcher/external_video_player_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
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
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 60,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 24,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    context.loc.media.video.videosDisabledOrNotSupported,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                if (Platform.isLinux || Platform.isAndroid)
                  ElevatedButton.icon(
                    label: Text(context.loc.media.video.openVideoInExternalPlayer),
                    icon: const Icon(Icons.play_arrow),
                    onPressed: () {
                      if (Platform.isLinux) {
                        Process.run('mpv', ['--loop', item.fileURL]);
                      } else if (Platform.isAndroid) {
                        ExternalVideoPlayerLauncher.launchOtherPlayer(
                          item.fileURL,
                          MIME.video,
                          null,
                        );
                      }
                    },
                  ),
                //
                ElevatedButton.icon(
                  label: Text(context.loc.media.video.openVideoInBrowser),
                  icon: const Icon(Icons.public),
                  onPressed: () {
                    launchUrlString(
                      item.fileURL,
                      mode: LaunchMode.externalApplication,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
