import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
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
    super.key,
  });

  final SearchTab tab;
  final Color? color;
  final FontWeight? fontWeight;
  final bool withFavicon;
  final bool withColoredTags;
  final String? filterText;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // print(tab.tags);
      final String rawTagsStr = tab.tags;
      final String tagText = (rawTagsStr.trim().isEmpty ? '[No Tags]' : rawTagsStr).trim();

      final bool hasItems = tab.booruHandler.filteredFetched.isNotEmpty;
      final bool isNotEmptyBooru = tab.selectedBooru.value.faviconURL != null;

      Widget marquee = MarqueeText(
        key: ValueKey(tagText),
        text: tagText,
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
                  style: spanStyle.copyWith(backgroundColor: Colors.green),
                ),
              );
            }
          }

          marquee = MarqueeText.rich(
            key: ValueKey(tagText),
            textSpan: TextSpan(
              children: spans,
            ),
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

            final tagData = TagHandler.instance.getTag(tag);

            final bool isColored = !tagData.tagType.isNone;

            final spanStyle = TextStyle(
              fontSize: 16,
              fontStyle: hasItems ? FontStyle.normal : FontStyle.italic,
              fontWeight: fontWeight ?? FontWeight.normal,
              color: color ?? (tab.tags == '' ? Colors.grey : null) ?? Theme.of(context).colorScheme.onSurface,
              backgroundColor: isColored ? tagData.tagType.getColour().withValues(alpha: 0.66) : null,
            );

            spans.add(
              TextSpan(
                // add non-breaking space to the end of italics to hide text overflowing the bgColor,
                text: '$prefix$tag${(hasItems || !isColored) ? '' : '\u{00A0}'}',
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
            style: TextStyle(
              fontSize: 16,
              fontStyle: hasItems ? FontStyle.normal : FontStyle.italic,
              fontWeight: fontWeight ?? FontWeight.normal,
              color: color ?? (tab.tags == '' ? Colors.grey : null),
            ),
          );
        }
      }

      return SizedBox(
        width: double.maxFinite,
        child: Row(
          children: [
            if (withFavicon) ...[
              if (isNotEmptyBooru)
                BooruFavicon(
                  tab.selectedBooru.value,
                  color: color,
                )
              else
                const Icon(
                  CupertinoIcons.question,
                  size: 20,
                ),
              //
              const SizedBox(width: 4),
            ],
            marquee,
          ],
        ),
      );
    });
  }
}
