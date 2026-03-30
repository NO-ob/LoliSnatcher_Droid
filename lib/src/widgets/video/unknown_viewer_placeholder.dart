import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail.dart';
import 'package:lolisnatcher/gen/strings.g.dart';

class UnknownViewerPlaceholder extends StatelessWidget {
  const UnknownViewerPlaceholder({
    required this.item,
    required this.booru,
    super.key,
  });

  final BooruItem item;
  final Booru booru;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColoredBox(
        color: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Thumbnail(
              item: item,
              booru: booru,
              isStandalone: false,
            ),
            LayoutBuilder(
              builder: (BuildContext layoutContext, BoxConstraints constraints) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: constraints.maxWidth - 80,
                  height: constraints.maxHeight / 2,
                  child: Center(
                    child: SizedBox(
                      child: SettingsButton(
                        name: context.loc.media.video.unknownFileFormat(fileExt: item.fileExt ?? 'unknown'),
                        action: () {
                          launchUrlString(
                            item.postURL,
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        icon: const Icon(CupertinoIcons.question),
                        drawTopBorder: true,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
