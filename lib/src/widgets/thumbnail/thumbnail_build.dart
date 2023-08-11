import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail.dart';

class ThumbnailBuild extends StatelessWidget {
  const ThumbnailBuild({
    required this.item,
    super.key,
  });

  final BooruItem item;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final SearchHandler searchHandler = SearchHandler.instance;
      final SettingsHandler settingsHandler = SettingsHandler.instance;
      final IconData itemIcon = Tools.getFileIcon(item.possibleExt.value ?? item.mediaType.toJson());

      final List<List<String>> parsedTags = settingsHandler.parseTagsList(
        item.tagsList,
        isCapped: false,
      );
      final bool isHated = parsedTags[0].isNotEmpty;
      final bool isLoved = parsedTags[1].isNotEmpty;
      final bool isSound = parsedTags[2].isNotEmpty;
      final bool hasNotes = item.hasNotes == true;
      final bool hasComments = item.hasComments == true;

      // reset the isHated and isLoved values since we already re-check them on every render
      item.isHated.value = isHated;
      item.isLoved.value = isLoved;

      // print('ThumbnailBuild $index');

      return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          alignment: settingsHandler.previewDisplay == 'Square' ? Alignment.center : Alignment.bottomCenter,
          children: [
            Thumbnail(
              item: item,
              isStandalone: true,
            ),
            // Image(
            //   image: ResizeImage(NetworkImage(item.thumbnailURL), width: (MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio / 3).round()),
            //   fit: BoxFit.cover,
            //   isAntiAlias: true,
            //   filterQuality: FilterQuality.medium,
            //   width: double.infinity,
            //   height: double.infinity,
            // ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Obx(() {
                    final selected = searchHandler.currentTab.selected;
                    if (selected.isNotEmpty) {
                      final itemIndex = searchHandler.getItemIndex(item);

                      return Checkbox(
                        value: selected.contains(itemIndex),
                        onChanged: (bool? value) {
                          if (value != null) {
                            if (value) {
                              searchHandler.currentTab.selected.add(itemIndex);
                            } else {
                              searchHandler.currentTab.selected.remove(itemIndex);
                            }
                          }
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
                  //
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.66),
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(5)),
                    ),
                    child: Obx(
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Text('  ${(index + 1)}  ', style: TextStyle(fontSize: 10, color: Colors.white)),

                          if (item.isFavourite.value == null) const Text('.'),

                          AnimatedCrossFade(
                            duration: const Duration(milliseconds: 200),
                            crossFadeState: (item.isFavourite.value == true || isLoved) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                            firstChild: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: Icon(
                                item.isFavourite.value == true ? Icons.favorite : Icons.star,
                                color: item.isFavourite.value == true ? Colors.red : Colors.grey,
                                key: ValueKey<Color>(item.isFavourite.value == true ? Colors.red : Colors.grey),
                                size: 14,
                              ),
                            ),
                            secondChild: const SizedBox(),
                          ),

                          if (item.isSnatched.value == true)
                            const Icon(
                              Icons.save_alt,
                              color: Colors.white,
                              size: 14,
                            ),

                          if (isSound)
                            const Icon(
                              Icons.volume_up_rounded,
                              color: Colors.white,
                              size: 14,
                            ),

                          if (hasNotes)
                            const Icon(
                              Icons.note_add,
                              color: Colors.white,
                              size: 14,
                            ),

                          Icon(
                            itemIcon,
                            color: Colors.white,
                            size: 14,
                          ),

                          if (settingsHandler.isDebug.value)
                            Container(
                              color: Colors.grey,
                              width: 1,
                              height: 10,
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                            ),

                          if (settingsHandler.isDebug.value)
                            Icon(
                              Icons.crop_original,
                              color: (item.sampleURL == item.thumbnailURL
                                      ? Colors.red
                                      : item.sampleURL == item.fileURL
                                          ? Colors.green
                                          : Colors.white)
                                  .withOpacity(0.66),
                              size: 14,
                            ),

                          if (settingsHandler.isDebug.value && hasComments)
                            const Icon(
                              Icons.comment,
                              color: Colors.white,
                              size: 14,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
