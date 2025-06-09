import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';

class TagChip extends StatelessWidget {
  TagChip({
    required this.tagString,
    this.trailing,
    this.color,
    super.key,
  });

  final String tagString;
  final Widget? trailing;
  final Color? color;

  final SearchHandler searchHandler = SearchHandler.instance;
  final TagHandler tagHandler = TagHandler.instance;

  @override
  Widget build(BuildContext context) {
    String stringContent = tagString;
    final List<Widget> tagPins = [];

    // exclude (-), or(~)
    final bool isExclude = stringContent.startsWith('-');
    final bool isOr = stringContent.startsWith('~');
    if (isExclude || isOr) {
      stringContent = stringContent.substring(1);
      tagPins.insert(0, TagPin(content: isOr ? '~' : '-', color: isOr ? Colors.purple : Colors.red));
    }

    // numbered tags for multibooru
    if (stringContent.startsWith(RegExp(r'\d+#'))) {
      final String multiIndex = stringContent.split('#')[0];
      stringContent = stringContent.split('#')[1];
      tagPins.add(TagPin(content: multiIndex, color: Colors.purple));
    }

    // color tag bg with their tag type corresponding color
    // (no type == blue here for cosmetic purposes, everywhere else they have no color)
    Color chipColour = color ?? tagHandler.getTag(stringContent).getColour();
    chipColour = chipColour == Colors.transparent ? Colors.blue : chipColour;

    // replace all _ with spaces and trim
    stringContent = stringContent.replaceAll(RegExp('_'), ' ').trim();

    return Container(
      decoration: BoxDecoration(
        color: chipColour,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 3, 0, 3),
            child: Row(
              children: [
                ...tagPins,
                Text(
                  stringContent,
                  style: TextStyle(
                    fontSize: 16,
                    color: isExclude ? Theme.of(context).colorScheme.onError : Colors.white,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing! else const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class TagPin extends StatelessWidget {
  const TagPin({
    required this.content,
    required this.color,
    super.key,
  });

  final String content;
  final Color color;

  String fixContent() {
    String fixed = content;
    if (content == '-') {
      // replace with longer dash
      fixed = '—';
    } else if (content == '~') {
      fixed = ' ~ ';
    }
    return fixed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.white),
      margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
      child: Text(
        fixContent(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: color,
        ),
      ),
    );
  }
}
