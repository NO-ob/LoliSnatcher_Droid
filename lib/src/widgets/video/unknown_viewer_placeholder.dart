import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail.dart';

class UnknownViewerPlaceholder extends StatelessWidget {
  const UnknownViewerPlaceholder({required this.item, super.key,});

  final BooruItem item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Thumbnail(
              item: item,
              isStandalone: false,
              ignoreColumnsCount: true,
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
                        name: 'Unknown file format (.${item.fileExt}), tap here to open in browser',
                        action: () {
                          ServiceHandler.launchURL(item.postURL);
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
