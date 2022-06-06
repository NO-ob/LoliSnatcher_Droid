import 'package:flutter/cupertino.dart';

import 'package:LoliSnatcher/src/handlers/search_handler.dart';
import 'package:LoliSnatcher/src/handlers/service_handler.dart';
import 'package:LoliSnatcher/src/data/booru_item.dart';
import 'package:LoliSnatcher/src/widgets/thumbnail/thumbnail.dart';
import 'package:LoliSnatcher/src/widgets/common/settings_widgets.dart';

class UnknownViewerPlaceholder extends StatelessWidget {
  const UnknownViewerPlaceholder({Key? key, required this.item, required this.index}) : super(key: key);
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
