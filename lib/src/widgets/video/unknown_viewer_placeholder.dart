import 'package:flutter/cupertino.dart';

import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class UnknownViewerPlaceholder extends StatelessWidget {
  const UnknownViewerPlaceholder({Key? key, required this.item, required this.index}) : super(key: key);

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
