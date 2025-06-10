import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/boorus/downloads_handler.dart';
import 'package:lolisnatcher/src/boorus/favourites_handler.dart';
import 'package:lolisnatcher/src/boorus/mergebooru_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/pulse_widget.dart';
import 'package:lolisnatcher/src/widgets/image/booru_favicon.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail.dart';
import 'package:lolisnatcher/src/widgets/webview/webview_page.dart';

class ThumbnailBuild extends StatelessWidget {
  const ThumbnailBuild({
    required this.item,
    required this.booru,
    this.handler,
    this.selectedIndex,
    this.selectable = true,
    this.onSelected,
    this.simple = false,
    super.key,
  });

  final BooruItem item;
  final Booru booru;
  final BooruHandler? handler;
  final int? selectedIndex;
  final bool selectable;
  final void Function()? onSelected;
  final bool simple;

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        alignment: settingsHandler.previewDisplay == 'Square' ? Alignment.center : Alignment.bottomCenter,
        children: [
          Thumbnail(
            item: item,
            booru: booru,
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

                  // TODO move all this away from this widget
                  // Merge/favourites/downloads booru favicon widgets
                  Builder(
                    builder: (context) {
                      final List<Widget> widgets = [];
                      // Merge booru
                      if (handler is MergebooruHandler) {
                        final fetchedMap = (handler! as MergebooruHandler).fetchedMap;

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
                          widgets.add(
                            Text(
                              '$booruIndex',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                height: 1,
                              ),
                            ),
                          );
                        }
                        widgets.add(
                          BooruFavicon(booru, size: 16),
                        );
                      }

                      // Favourites/Downloads booru
                      Booru? getMergeBooruEntry() {
                        if (handler is! MergebooruHandler) return null;

                        final fetchedMap = (handler! as MergebooruHandler).fetchedMap;
                        for (int i = 0; i < fetchedMap.entries.length; i++) {
                          final entry = fetchedMap.entries.elementAt(i);
                          if (entry.value.items.contains(item)) {
                            return entry.value.booru;
                          }
                        }
                        return null;
                      }

                      final bool isFavsOrDls =
                          handler is FavouritesHandler ||
                          handler is DownloadsHandler ||
                          getMergeBooruEntry()?.type?.isFavouritesOrDownloads == true;
                      if (isFavsOrDls) {
                        final itemFileHost = Uri.tryParse(item.fileURL)?.host;
                        final itemPostHost = Uri.tryParse(item.postURL)?.host;
                        final Booru? possibleBooru = settingsHandler.booruList.firstWhereOrNull((e) {
                          final booruHost = Uri.tryParse(e.baseURL ?? '')?.host;
                          return (itemFileHost != null &&
                                  booruHost != null &&
                                  itemFileHost.isNotEmpty == true &&
                                  booruHost.isNotEmpty == true &&
                                  itemFileHost.contains(booruHost)) ||
                              (itemPostHost != null &&
                                  booruHost != null &&
                                  itemPostHost.isNotEmpty == true &&
                                  booruHost.isNotEmpty == true &&
                                  itemPostHost.contains(booruHost));
                        });
                        if (possibleBooru?.type?.isFavouritesOrDownloads != true) {
                          final possibleFaviconUrl =
                              possibleBooru?.faviconURL ??
                              (itemPostHost != null ? 'https://$itemPostHost/favicon.ico' : null);

                          widgets.add(
                            GestureDetector(
                              onTap: possibleBooru != null
                                  ? () {
                                      final String? url = possibleBooru.baseURL;
                                      if (url == null || url.isEmpty) {
                                        return;
                                      }

                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => InAppWebviewView(
                                            initialUrl: url,
                                            userAgent: Tools.browserUserAgent,
                                          ),
                                        ),
                                      );
                                    }
                                  : null,
                              child: BooruFavicon(
                                possibleBooru,
                                customFaviconUrl: possibleFaviconUrl,
                                size: 16,
                              ),
                            ),
                          );
                        }
                      }

                      //

                      if (widgets.isNotEmpty) {
                        return Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.66),
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5)),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 2,
                            children: widgets,
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
                  Builder(
                    builder: (context) {
                      Widget bottomLeftWidget = const SizedBox.shrink();
                      if (selectable && onSelected != null) {
                        final bool isSelected = selectedIndex != null && selectedIndex != -1;

                        bottomLeftWidget = GestureDetector(
                          onTap: onSelected,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            constraints: const BoxConstraints(
                              minWidth: kMinInteractiveDimension - 2,
                              minHeight: kMinInteractiveDimension - 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.66),
                              borderRadius: const BorderRadius.only(topRight: Radius.circular(5)),
                            ),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: isSelected
                                  ? Container(
                                      height: 20,
                                      constraints: const BoxConstraints(minWidth: 20),
                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                      margin: const EdgeInsets.symmetric(horizontal: 4),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).colorScheme.secondary,
                                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                                      ),
                                      child: Text(
                                        ((selectedIndex ?? 0) + 1).toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).colorScheme.onSecondary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  : Checkbox(
                                      value: isSelected,
                                      onChanged: (_) {
                                        onSelected?.call();
                                      },
                                    ),
                            ),
                          ),
                        );
                      }

                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: bottomLeftWidget,
                      );
                    },
                  ),
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

    final tagsData = settingsHandler.parseTagsList(
      item.tagsList,
      isCapped: false,
    );
    final bool isSound = tagsData.soundTags.isNotEmpty;
    final bool isAi = tagsData.aiTags.isNotEmpty;
    final bool hasNotes = item.hasNotes == true;
    final bool hasComments = item.hasComments == true;

    return Obx(() {
      final IconData? itemIcon = Tools.getFileIcon(item.possibleMediaType.value ?? item.mediaType.value);

      final bool? isFav = item.isFavourite.value;
      final bool isFavOrLoved = isFav == true || tagsData.lovedTags.isNotEmpty;
      // final bool isHated = tagsData.hatedTags.isNotEmpty;
      final bool isSnatched = item.isSnatched.value == true;

      final bool isInQueueToBeSnatched =
          snatchHandler.current.value?.booruItems.any((booruItem) => booruItem == item) == true;
      final bool isCurrentlyBeingSnatched =
          snatchHandler.current.value?.booruItems[snatchHandler.queueProgress.value] == item &&
          snatchHandler.total.value != 0;

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
              if (isCurrentlyBeingSnatched || isInQueueToBeSnatched)
                const PulseWidget(child: snatchedIcon)
              else if (isSnatched)
                snatchedIcon,
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
