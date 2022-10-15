import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';
import 'package:lolisnatcher/src/widgets/image/favicon.dart';

class TabRow extends StatelessWidget {
  const TabRow({
    Key? key,
    required this.tab,
    this.color,
    this.fontWeight,
    this.withFavicon = true,
  }) : super(key: key);

  final SearchTab tab;
  final Color? color;
  final FontWeight? fontWeight;
  final bool withFavicon;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // print(value.tags);
      final int totalCount = tab.booruHandler.totalCount.value;
      final String totalCountText = (totalCount > 0) ? " ($totalCount)" : "";
      final String multiText = (tab.secondaryBoorus?.isNotEmpty ?? false) ? " [M]" : "";
      final String tagText = "${tab.tags == "" ? "[No Tags]" : tab.tags}$totalCountText$multiText".trim();

      final bool hasItems = tab.booruHandler.filteredFetched.isNotEmpty;
      final bool isNotEmptyBooru = tab.selectedBooru.value.faviconURL != null;

      return SizedBox(
        width: double.maxFinite,
        child: Row(
          children: [
            if (withFavicon)
              isNotEmptyBooru
                  ? (tab.selectedBooru.value.type == "Favourites"
                      ? const Icon(Icons.favorite, color: Colors.red, size: 18)
                      : Favicon(tab.selectedBooru.value.faviconURL!))
                  : const Icon(CupertinoIcons.question, size: 18),
            const SizedBox(width: 3),
            MarqueeText(
              key: ValueKey(tagText),
              text: tagText,
              fontSize: 16,
              fontStyle: hasItems ? FontStyle.normal : FontStyle.italic,
              fontWeight: fontWeight ?? FontWeight.normal,
              color: color ?? (tab.tags == "" ? Colors.grey : null),
            ),
          ],
        ),
      );
    });
  }
}
