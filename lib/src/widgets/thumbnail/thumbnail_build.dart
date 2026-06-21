import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/boorus/downloads_handler.dart';
import 'package:lolisnatcher/src/boorus/favourites_handler.dart';
import 'package:lolisnatcher/src/boorus/idol_sankaku_handler.dart';
import 'package:lolisnatcher/src/boorus/mergebooru_handler.dart';
import 'package:lolisnatcher/src/boorus/sankaku_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/utils/clipboard.dart';
import 'package:lolisnatcher/src/utils/content_policy.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/pulse_widget.dart';
import 'package:lolisnatcher/src/widgets/image/booru_favicon.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail.dart';
import 'package:lolisnatcher/src/widgets/webview/webview_page.dart';

class _SourceCacheEntry {
  const _SourceCacheEntry(this.version, this.booru);

  final int version;
  final Booru? booru;
}

final Expando<_SourceCacheEntry> _sourceCache = Expando<_SourceCacheEntry>();

class ThumbnailBuild extends StatelessWidget {
  const ThumbnailBuild({
    required this.item,
    this.handler,
    this.selectedIndex,
    this.selectable = true,
    this.onSelected,
    this.simple = false,
    super.key,
  });

  final BooruItem item;
  final BooruHandler? handler;
  final int? selectedIndex;
  final bool selectable;
  final void Function()? onSelected;
  final bool simple;

  Booru? _resolveSourceBooru(SettingsHandler settingsHandler) {
    final cached = _sourceCache[item];
    if (cached?.version == settingsHandler.booruListVersion) {
      return cached?.booru;
    }

    final itemFileHost = Uri.tryParse(item.fileURL)?.host;
    final itemPostHost = Uri.tryParse(item.postURL)?.host;
    final possibleBooru = settingsHandler.booruList.firstWhereOrNull((e) {
      final booruHost = Uri.tryParse(e.baseURL ?? '')?.host;

      return (itemPostHost?.isNotEmpty == true &&
              booruHost?.isNotEmpty == true &&
              (itemPostHost == booruHost ||
                  switch (e.type) {
                    BooruType.IdolSankaku => IdolSankakuHandler.knownUrls.contains(itemPostHost),
                    BooruType.Sankaku => SankakuHandler.knownPostUrls.contains(itemPostHost),
                    _ => false,
                  })) ||
          (itemFileHost?.isNotEmpty == true && booruHost?.isNotEmpty == true && itemFileHost == booruHost);
    });
    final result = possibleBooru?.type?.isFavouritesOrDownloads == true ? null : possibleBooru;
    _sourceCache[item] = _SourceCacheEntry(settingsHandler.booruListVersion, result);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        alignment: settingsHandler.previewDisplay.isSquare ? .center : .bottomCenter,
        children: [
          RepaintBoundary(
            child: Builder(
              builder: (context) {
                final bool isFavsOrDls = handler is FavouritesHandler || handler is DownloadsHandler;
                final possibleBooru = isFavsOrDls ? _resolveSourceBooru(settingsHandler) : null;

                return Thumbnail(
                  item: item,
                  booru: possibleBooru ?? handler?.booru,
                  isStandalone: true,
                  useHero: selectable,
                );
              },
            ),
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
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (settingsHandler.isDebug.value == true)
                    InkWell(
                      onTap: () {
                        ClipboardUtils.copyTextToClipboard(
                          item.toString(),
                          subtitle: context.loc.common.booruItemCopiedToClipboard,
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
                  const SizedBox(width: 4),

                  // TODO move all this away from this widget
                  // Merge/favourites/downloads booru favicon widgets
                  Builder(
                    builder: (context) {
                      final List<Widget> widgets = [];
                      final mergeSource = handler is MergebooruHandler
                          ? (handler! as MergebooruHandler).sourceFor(item)
                          : null;
                      // Merge booru
                      if (handler is MergebooruHandler) {
                        if (mergeSource == null) {
                          return const SizedBox.shrink();
                        }

                        widgets.add(
                          Text(
                            '${mergeSource.index + 1}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              height: 1,
                            ),
                          ),
                        );
                        widgets.add(
                          BooruFavicon(mergeSource.booru, size: 16),
                        );
                      }

                      // Favourites/Downloads booru
                      final bool isFavsOrDls =
                          handler is FavouritesHandler ||
                          handler is DownloadsHandler ||
                          mergeSource?.booru.type?.isFavouritesOrDownloads == true;
                      if (isFavsOrDls) {
                        final itemPostHost = Uri.tryParse(item.postURL)?.host;
                        final possibleBooru = _resolveSourceBooru(settingsHandler);
                        final possibleFaviconUrl =
                            possibleBooru?.faviconURL ??
                            (itemPostHost != null ? 'https://$itemPostHost/favicon.ico' : null);

                        if (possibleBooru?.name != null) {
                          widgets.add(
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Text(
                                  possibleBooru?.name ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 8,
                                    color: Colors.white,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }

                        widgets.add(
                          GestureDetector(
                            onTap: possibleBooru != null && ContentPolicy.canOpenWebview
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

                      //

                      if (widgets.isNotEmpty) {
                        return Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.66),
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 4,
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

    final bool isSound = item.isSound;
    final bool isAi = item.isAI;
    final bool hasNotes = item.hasNotes == true;
    final bool hasComments = item.hasComments == true;

    return Obx(() {
      final IconData? itemIcon = Tools.getFileIcon(item.possibleMediaType.value ?? item.mediaType.value);

      final bool? isFav = item.isFavourite.value;
      final bool isFavOrMarked = isFav == true || item.isMarked;
      // final bool isHidden = tagsData.hiddenTags.isNotEmpty;
      final bool isSnatched = item.isSnatched.value == true;

      final bool isInQueueToBeSnatched = snatchHandler.currentItemKeys.contains(item.key);
      final bool isCurrentlyBeingSnatched = snatchHandler.activeItem.value == item;

      int bottomRightAmount = 0;
      if (isFavOrMarked) bottomRightAmount += 1;
      // if (isHidden) bottomRightAmount += 1;
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
                crossFadeState: isFavOrMarked ? CrossFadeState.showFirst : CrossFadeState.showSecond,
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
              // if (isHidden)
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
