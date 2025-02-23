import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/boorus/mergebooru_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/pulse_widget.dart';
import 'package:lolisnatcher/src/widgets/image/booru_favicon.dart';
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
    final SearchHandler searchHandler = SearchHandler.instance;
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        alignment: settingsHandler.previewDisplay == 'Square' ? Alignment.center : Alignment.bottomCenter,
        children: [
          Thumbnail(
            item: item,
            isStandalone: true,
            useHero: selectable,
          ),
          // Image(
          //   image: ResizeImage(NetworkImage(item.thumbnailURL),
          //   width: (MediaQuery.sizeOf(context).width * MediaQuery.devicePixelRatioOf(context) / 3).round()),
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
                  if (settingsHandler.isDebug.value == true)
                    InkWell(
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
                          color: Colors.black.withValues(alpha: 0.66),
                          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(5)),
                        ),
                        child: const Icon(
                          Icons.copy,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  //
                  const Spacer(),
                  Builder(
                    builder: (context) {
                      if (searchHandler.currentSecondaryBoorus.value?.isNotEmpty == true) {
                        final handler = searchHandler.currentBooruHandler as MergebooruHandler;
                        final fetchedMap = handler.fetchedMap;

                        Booru? booru;
                        int? booruIndex;
                        for (int i = 0; i < fetchedMap.entries.length; i++) {
                          final entry = fetchedMap.entries.elementAt(i);
                          if (entry.value.items.contains(item)) {
                            booruIndex = i;
                            booru = entry.value.booru;
                            break;
                          }
                        }

                        if (booru == null) {
                          return const SizedBox.shrink();
                        }

                        if (booruIndex != null) {
                          booruIndex += 1;
                        }

                        return Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.66),
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5)),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (booruIndex != null)
                                Text(
                                  '$booruIndex ',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    height: 1,
                                  ),
                                ),
                              BooruFavicon(booru, size: 16),
                            ],
                          ),
                        );
                      }

                      return const SizedBox.shrink();
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
                mainAxisSize: MainAxisSize.max,
                children: [
                  Obx(() {
                    final selected = searchHandler.currentSelected;

                    Widget bottomLeftWidget = const SizedBox.shrink();
                    if (selected.isNotEmpty && selectable) {
                      final bool isSelected = selected.contains(item);
                      final int selectedIndex = selected.indexOf(item);

                      bottomLeftWidget = Container(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.66),
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
                      child: bottomLeftWidget,
                    );
                  }),
                  //
                  Flexible(
                    child: _ThumbnailBottomRightIcons(item),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _ThumbnailBottomRightIcons extends StatelessWidget {
  const _ThumbnailBottomRightIcons(
    this.item,
  );

  final BooruItem item;

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final SnatchHandler snatchHandler = SnatchHandler.instance;

    return Obx(() {
      final IconData? itemIcon = Tools.getFileIcon(item.possibleMediaType.value ?? item.mediaType.value);

      final tagsData = settingsHandler.parseTagsList(
        item.tagsList,
        isCapped: false,
      );
      final bool? isFav = item.isFavourite.value;
      final bool isFavOrLoved = isFav == true || tagsData.lovedTags.isNotEmpty;
      // final bool isHated = tagsData.hatedTags.isNotEmpty;
      final bool isSound = tagsData.soundTags.isNotEmpty;
      final bool isAi = tagsData.aiTags.isNotEmpty;
      final bool hasNotes = item.hasNotes == true;
      final bool hasComments = item.hasComments == true;
      final bool isSnatched = item.isSnatched.value == true;
      final bool isInQueueToBeSnatched = snatchHandler.current.value?.booruItems.any((booruItem) => booruItem == item) == true;
      final bool isCurrentlyBeingSnatched =
          snatchHandler.current.value?.booruItems[snatchHandler.queueProgress.value] == item && snatchHandler.total.value != 0;

      int bottomRightAmount = 0;
      if (isFavOrLoved) bottomRightAmount += 1;
      // if (isHated) bottomRightAmount += 1;
      if (isCurrentlyBeingSnatched) bottomRightAmount += 1;
      if (isSnatched || isInQueueToBeSnatched || isCurrentlyBeingSnatched) bottomRightAmount += 1;
      if (isAi) bottomRightAmount += 1;
      if (hasComments) bottomRightAmount += 1;
      if (hasNotes) bottomRightAmount += 1;
      if (isSound) bottomRightAmount += 1;
      if (itemIcon != null) bottomRightAmount += 1;
      final bool isBottomRightEmpty = bottomRightAmount == 0;

      const snatchedIcon = Icon(
        Icons.save_alt,
        color: Colors.white,
        size: 14,
      );

      return AnimatedSize(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.bottomRight,
        child: Container(
          padding: isBottomRightEmpty ? EdgeInsets.zero : const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.66),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(5)),
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.end,
            runAlignment: WrapAlignment.end,
            spacing: 1.5,
            runSpacing: 2,
            children: [
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 200),
                crossFadeState: isFavOrLoved ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                firstChild: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: (settingsHandler.dbEnabled && isFav == null)
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
                          isFav == true ? Icons.favorite : Icons.star,
                          color: isFav == true ? Colors.red : Colors.grey,
                          key: ValueKey<Color>(isFav == true ? Colors.red : Colors.grey),
                          size: 14,
                        ),
                ),
                secondChild: const SizedBox.shrink(),
              ),
              //
              // if (isHated)
              //   const Icon(
              //     CupertinoIcons.eye_slash,
              //     color: Colors.white,
              //     size: 14,
              //   ),
              //
              if (isCurrentlyBeingSnatched || isInQueueToBeSnatched) const PulseWidget(child: snatchedIcon) else if (isSnatched) snatchedIcon,
              //
              if (isAi)
                const FaIcon(
                  FontAwesomeIcons.robot,
                  color: Colors.white,
                  size: 13,
                ),
              if (hasComments)
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
              if (itemIcon != null)
                Icon(
                  itemIcon,
                  color: Colors.white,
                  size: 14,
                ),
            ],
          ),
        ),
      );
    });
  }
}
