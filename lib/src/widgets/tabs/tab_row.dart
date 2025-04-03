import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart' hide FirstWhereOrNullExt;

import 'package:lolisnatcher/src/data/meta_tag.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';
import 'package:lolisnatcher/src/widgets/image/booru_favicon.dart';

class TabRow extends StatelessWidget {
  const TabRow({
    required this.tab,
    this.color,
    this.fontWeight,
    this.withFavicon = true,
    this.withColoredTags = true,
    this.filterText,
    this.isExpanded = true,
    super.key,
  });

  final SearchTab tab;
  final Color? color;
  final FontWeight? fontWeight;
  final bool withFavicon;
  final bool withColoredTags;
  final String? filterText;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final String rawTagsStr = tab.tags;
        final String tagText = (rawTagsStr.trim().isEmpty ? '[Empty]' : rawTagsStr).trim();

        final bool hasItems = tab.booruHandler.filteredFetched.isNotEmpty;

        Widget marquee = MarqueeText(
          key: ValueKey(tagText),
          text: tagText,
          isExpanded: isExpanded,
          style: TextStyle(
            fontSize: 16,
            fontStyle: hasItems ? FontStyle.normal : FontStyle.italic,
            fontWeight: fontWeight ?? FontWeight.normal,
            color: color ?? (tab.tags == '' ? Colors.grey : null) ?? Theme.of(context).colorScheme.onSurface,
          ),
        );

        if (tab.tags.trim().isNotEmpty) {
          if (filterText?.isNotEmpty == true) {
            final List<TextSpan> spans = [];
            final List<String> split = tagText.split(filterText!);

            for (int i = 0; i < split.length; i++) {
              final spanStyle = TextStyle(
                fontSize: 16,
                fontStyle: hasItems ? FontStyle.normal : FontStyle.italic,
                fontWeight: fontWeight ?? FontWeight.normal,
                color: color ?? (tab.tags == '' ? Colors.grey : null) ?? Theme.of(context).colorScheme.onSurface,
              );

              spans.add(
                TextSpan(
                  text: split[i],
                  style: spanStyle,
                ),
              );
              if (i < split.length - 1) {
                spans.add(
                  TextSpan(
                    text: filterText,
                    style: spanStyle.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.w900,
                      backgroundColor: Colors.green.withValues(alpha: 0.1),
                    ),
                  ),
                );
              }
            }

            marquee = MarqueeText.rich(
              key: ValueKey(tagText),
              textSpan: TextSpan(
                children: spans,
              ),
              isExpanded: isExpanded,
              style: TextStyle(
                fontSize: 16,
                fontStyle: hasItems ? FontStyle.normal : FontStyle.italic,
                fontWeight: fontWeight ?? FontWeight.normal,
                color: color ?? (tab.tags == '' ? Colors.grey : null) ?? Theme.of(context).colorScheme.onSurface,
              ),
            );
          } else if (withColoredTags) {
            final List<TextSpan> spans = [];
            final List<String> split = tagText.trim().split(' ');

            for (int i = 0; i < split.length; i++) {
              String tag = split[i].trim();
              final String prefix = (tag.startsWith('-') || tag.startsWith('~')) ? tag.substring(0, 1) : '';
              if (prefix.isNotEmpty) {
                tag = tag.substring(1);
              }

              final int? booruNumber = int.tryParse(tag.split('#').firstOrNull ?? '');
              if (booruNumber != null) {
                tag = tag.split('#').sublist(1).join('#');
              }

              final metaTags = tab.booruHandler.availableMetaTags();
              final MetaTag? metaTag = metaTags.firstWhereOrNull((p) => p.tagParser(tag).isNotEmpty);
              final bool isMetaTag = metaTag != null;

              final tagData = TagHandler.instance.getTag(tag);

              final bool isColored = !tagData.tagType.isNone || isMetaTag;

              final Color usedColor = (isColored ? (isMetaTag ? Colors.pink : tagData.tagType.getColour()) : null) ??
                  color ??
                  (tab.tags == '' ? Colors.grey : null) ??
                  Theme.of(context).colorScheme.onSurface;

              final spanStyle = TextStyle(
                fontSize: 16,
                fontStyle: hasItems ? FontStyle.normal : FontStyle.italic,
                fontWeight: fontWeight ?? FontWeight.normal,
                color: usedColor,
                backgroundColor: isColored ? usedColor.withValues(alpha: 0.1) : null,
              );

              if (prefix.isNotEmpty) {
                spans.add(
                  TextSpan(
                    text: prefix == '-' ? '—' : prefix,
                    style: spanStyle.copyWith(
                      color: prefix == '-'
                          ? Colors.redAccent
                          : prefix == '~'
                              ? Colors.purpleAccent
                              : Colors.transparent,
                    ),
                  ),
                );
              }

              if (booruNumber != null) {
                spans.add(
                  TextSpan(
                    text: '$booruNumber#',
                    style: spanStyle.copyWith(
                      color: spanStyle.color?.withValues(alpha: 0.5),
                    ),
                  ),
                );
              }

              spans.add(
                TextSpan(
                  // add non-breaking space to the end of italics to hide text overflowing the bgColor,
                  text: '$tag${(hasItems || !isColored) ? '' : '\u{00A0}'}',
                  style: spanStyle,
                ),
              );
              if (i < split.length - 1) {
                spans.add(
                  TextSpan(
                    text: ' ',
                    style: spanStyle.copyWith(
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                );
              }
            }

            marquee = MarqueeText.rich(
              key: ValueKey(tagText),
              textSpan: TextSpan(
                children: spans,
              ),
              isExpanded: isExpanded,
              style: TextStyle(
                fontSize: 16,
                fontStyle: hasItems ? FontStyle.normal : FontStyle.italic,
                fontWeight: fontWeight ?? FontWeight.normal,
                color: color ?? (tab.tags == '' ? Colors.grey : null),
              ),
            );
          }
        }

        return Row(
          children: [
            if (withFavicon) ...[
              ValueListenableBuilder(
                valueListenable: tab.selectedBooru,
                builder: (context, selectedBooru, child) {
                  if (selectedBooru.faviconURL == null) {
                    return const Icon(
                      CupertinoIcons.question,
                      size: 20,
                    );
                  }

                  return RepaintBoundary(
                    child: BooruFavicon(
                      selectedBooru,
                      color: color,
                    ),
                  );
                },
              ),
              //
              const SizedBox(width: 4),
            ],
            marquee,
          ],
        );
      },
    );
  }
}
