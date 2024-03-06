import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/boorus/mergebooru_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/image/favicon.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail.dart';

class ThumbnailBuild extends StatelessWidget {
  const ThumbnailBuild({
    required this.item,
    this.selectable = true,
    this.simple = false,
    super.key,
  });

  final BooruItem item;
  final bool selectable;
  final bool simple;

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
      final bool hasComments = item.hasComments == true;

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

            if (!simple)
              Container(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(
                      builder: (context) {
                        if (settingsHandler.isDebug.value == true) {
                          return InkWell(
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: item.toString()));
                              FlashElements.showSnackbar(
                                context: context,
                                title: const Text('Copied!', style: TextStyle(fontSize: 20)),
                                content: const Text('Booru item copied to clipboard'),
                                sideColor: Colors.green,
                                leadingIcon: Icons.copy,
                                leadingIconColor: Colors.white,
                                duration: const Duration(seconds: 2),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.66),
                                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(5)),
                                border: Border(
                                  bottom: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.66), width: 1),
                                  right: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.66), width: 1),
                                ),
                              ),
                              child: const Icon(
                                Icons.copy,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                    const Spacer(),
                    Builder(
                      builder: (context) {
                        if (searchHandler.currentTab.secondaryBoorus?.isNotEmpty == true) {
                          final handler = searchHandler.currentBooruHandler as MergebooruHandler;
                          final fetchedMap = handler.fetchedMap;

                          Booru? booru;
                          for (final entry in fetchedMap.entries) {
                            if (entry.value.contains(item)) {
                              booru = entry.key;
                              break;
                            }
                          }

                          if (booru == null) {
                            return const SizedBox.shrink();
                          }

                          return Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.66),
                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5)),
                              border: Border(
                                bottom: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.66), width: 1),
                                left: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.66), width: 1),
                              ),
                            ),
                            child: Favicon(booru, size: 16),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ],
                ),
              ),

            if (!simple)
              Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (selectable)
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
                              border: Border(
                                top: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.66), width: 1),
                                right: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.66), width: 1),
                              ),
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
                      })
                    else
                      const SizedBox.shrink(),
                    //
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.66),
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5)),
                          border: Border(
                            top: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.66), width: 1),
                            left: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.66), width: 1),
                          ),
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
                              if (settingsHandler.isDebug.value && hasComments)
                                const Icon(
                                  Icons.comment,
                                  color: Colors.white,
                                  size: 14,
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
