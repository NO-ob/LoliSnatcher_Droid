import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

      final tagsData = settingsHandler.parseTagsList(
        item.tagsList,
        isCapped: false,
      );
      // final bool isHated = tagsData.hatedTags.isNotEmpty;
      final bool isLoved = tagsData.lovedTags.isNotEmpty;
      final bool isSound = tagsData.soundTags.isNotEmpty;
      final bool isAi = tagsData.aiTags.isNotEmpty;
      final bool hasNotes = item.hasNotes == true;

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
            //   image: ResizeImage(NetworkImage(item.thumbnailURL),
            //   width: (MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio / 3).round()),
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

                    Widget checkboxWidget = const SizedBox.shrink();
                    if (selected.isNotEmpty) {
                      final isSelected = selected.contains(item);
                      final int selectedIndex = selected.indexOf(item);

                      checkboxWidget = Container(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.66),
                          borderRadius: const BorderRadius.only(topRight: Radius.circular(5)),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: isSelected,
                              onChanged: (bool? value) {
                                if (value != null) {
                                  if (value) {
                                    searchHandler.currentTab.selected.add(item);
                                  } else {
                                    searchHandler.currentTab.selected.remove(item);
                                  }
                                }
                              },
                            ),
                            if (isSelected)
                              Text(
                                (selectedIndex + 1).toString(),
                                style: const TextStyle(fontSize: 12, color: Colors.white),
                              ),
                          ],
                        ),
                      );
                    }

                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: checkboxWidget,
                    );
                  }),
                  //
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.66),
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(5)),
                      ),
                      child: Obx(
                        () => Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 1.5,
                          runSpacing: 2,
                          children: [
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 200),
                              crossFadeState: (item.isFavourite.value == true || isLoved) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                              firstChild: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 200),
                                child: (settingsHandler.dbEnabled && item.isFavourite.value == null)
                                    ? const SizedBox(
                                        height: 14,
                                        width: 14,
                                        child: Center(
                                          child: Text(
                                            '.',
                                            style: TextStyle(fontSize: 14, height: 1),
                                          ),
                                        ),
                                      )
                                    : Icon(
                                        item.isFavourite.value == true ? Icons.favorite : Icons.star,
                                        color: item.isFavourite.value == true ? Colors.red : Colors.grey,
                                        key: ValueKey<Color>(item.isFavourite.value == true ? Colors.red : Colors.grey),
                                        size: 14,
                                      ),
                              ),
                              secondChild: const SizedBox.shrink(),
                            ),
                            if (item.isSnatched.value == true)
                              const Icon(
                                Icons.save_alt,
                                color: Colors.white,
                                size: 14,
                              ),
                            if (isAi)
                              const FaIcon(
                                FontAwesomeIcons.robot,
                                color: Colors.white,
                                size: 13,
                              ),
                            if (hasNotes)
                              const Icon(
                                Icons.note_add,
                                color: Colors.white,
                                size: 14,
                              ),
                            if (isSound)
                              const Icon(
                                Icons.volume_up_rounded,
                                color: Colors.white,
                                size: 14,
                              ),
                            Icon(
                              itemIcon,
                              color: Colors.white,
                              size: 14,
                            ),
                          ],
                        ),
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
