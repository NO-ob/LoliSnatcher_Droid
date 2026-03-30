import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' hide ContextExt, FirstWhereOrNullExt;
import 'package:intl/intl.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/meta_tag.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/widgets/common/transparent_pointer.dart';
import 'package:lolisnatcher/src/widgets/image/booru_favicon.dart';

class MainSearchTagChip extends StatelessWidget {
  const MainSearchTagChip({
    required this.tag,
    this.tab,
    this.booru,
    this.onTap,
    this.onLongTap,
    this.onDeleteTap,
    this.canDelete = true,
    this.isSelected = false,
    super.key,
  });

  final String tag;
  final SearchTab? tab;
  final Booru? booru;
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final VoidCallback? onDeleteTap;
  final bool canDelete;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final searchHandler = SearchHandler.instance;
    final tagHandler = TagHandler.instance;

    return Material(
      color: Colors.transparent,
      child: Builder(
        key: Key(tag),
        builder: (context) {
          String formattedTag = tag;

          final List<Booru> usedBoorus = [
            ?tab?.selectedBooru.value ?? booru,
            ...?tab?.secondaryBoorus.value,
          ];
          final bool hasSecondaryBoorus = usedBoorus.length > 1;

          bool isExclude = formattedTag.startsWith('-');
          bool isOr = formattedTag.startsWith('~');
          bool isBoolMod = isExclude || isOr;
          formattedTag = formattedTag.replaceAll(RegExp('^-'), '').replaceAll(RegExp('^~'), '').trim();

          final bool isNumberMod = formattedTag.startsWith(RegExp(r'\d+#'));
          final int? booruNumber = int.tryParse(isNumberMod ? formattedTag.split('#')[0] : '');
          final bool hasBooruNumber = booruNumber != null;
          final bool isValidNumberMod =
              booruNumber != null && booruNumber > 0 && hasSecondaryBoorus && booruNumber <= usedBoorus.length;
          formattedTag = formattedTag.replaceAll(RegExp(r'^\d+#'), '').trim();

          // do it twitce because it will be false for mergebooru
          // (because proper tag query syntax is to place booru number in front of tag and all modifiers)
          isExclude = isExclude || formattedTag.startsWith('-');
          isOr = isOr || formattedTag.startsWith('~');
          isBoolMod = isExclude || isOr;
          formattedTag = formattedTag.replaceAll(RegExp('^-'), '').replaceAll(RegExp('^~'), '').trim();

          final String rawTag = formattedTag;

          final metaTags = searchHandler.currentBooruHandler.availableMetaTags();
          final MetaTag? metaTag = metaTags.firstWhereOrNull((p) => p.tagParser(formattedTag).isNotEmpty);
          final Map<String, dynamic>? metaTagParseData = metaTag?.tagParser(formattedTag);
          final bool isMetaTag = metaTagParseData != null && metaTagParseData.isNotEmpty;
          if (isMetaTag) {
            formattedTag = (metaTagParseData['value'] ?? '').trim();
          }

          // get color before removing underscores
          Color? tagColor = tagHandler.getTag(formattedTag).getColour();
          if (isMetaTag) tagColor = Colors.pink;
          tagColor ??= Colors.blue;

          formattedTag = formattedTag.replaceAll('_', ' ').trim();

          // LayoutBuilder gives a real maxWidth so ConstrainedBox can cap the chip,
          // while still allowing it to shrink smaller via the min-size Rows inside.
          return LayoutBuilder(
            builder: (context, constraints) => ConstrainedBox(
              constraints: BoxConstraints(maxWidth: constraints.maxWidth),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: tagColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Flexible here lets the inner content shrink when the chip
                        // hits the ConstrainedBox max width.
                        Flexible(
                          child: Stack(
                            fit: StackFit.passthrough,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center, // center the text
                                children: [
                                  // OR/EXCLUDE
                                  if (isBoolMod)
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6),
                                      decoration: BoxDecoration(
                                        color: isExclude
                                            ? Colors.redAccent
                                            : isOr
                                            ? Colors.purpleAccent
                                            : Colors.white.withValues(alpha: 0.8),
                                        border: Border(
                                          right: BorderSide(
                                            color: context.theme.colorScheme.onSurface.withValues(alpha: 0.5),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          isExclude
                                              ? '—'
                                              : isOr
                                              ? '~'
                                              : '',
                                          style: context.theme.textTheme.bodyLarge?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            height: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  // Multibooru numbers
                                  if (isNumberMod && hasBooruNumber) ...[
                                    if (isValidNumberMod)
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withValues(alpha: 0.8),
                                          border: Border(
                                            right: BorderSide(
                                              color: context.theme.colorScheme.onSurface.withValues(alpha: 0.5),
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Text(
                                                booruNumber.toString(),
                                                style: context.theme.textTheme.bodyLarge?.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1,
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              BooruFavicon(usedBoorus[booruNumber - 1]),
                                            ],
                                          ),
                                        ),
                                      )
                                    else
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          border: Border(
                                            right: BorderSide(
                                              color: context.theme.colorScheme.onSurface.withValues(alpha: 0.5),
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '?#',
                                            style: context.theme.textTheme.bodyLarge?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              height: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                  // Metatag
                                  if (isMetaTag)
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withValues(alpha: 0.8),
                                        border: Border(
                                          right: BorderSide(
                                            color: context.theme.colorScheme.onSurface.withValues(alpha: 0.5),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: switch (metaTag?.type) {
                                          MetaTagType.sort => Icon(
                                            Icons.sort,
                                            color: tagColor,
                                            size: 20,
                                          ),
                                          MetaTagType.date =>
                                            metaTag?.keyName == 'date'
                                                ? Icon(
                                                    Icons.calendar_month,
                                                    color: tagColor,
                                                    size: 20,
                                                  )
                                                : Text(
                                                    metaTagParseData['key'],
                                                    style: context.theme.textTheme.bodyLarge?.copyWith(
                                                      color: tagColor,
                                                      fontWeight: FontWeight.w600,
                                                      height: 1,
                                                    ),
                                                  ),
                                          _ => Text(
                                            metaTagParseData['key'],
                                            style: context.theme.textTheme.bodyLarge?.copyWith(
                                              color: tagColor,
                                              fontWeight: FontWeight.w600,
                                              height: 1,
                                            ),
                                          ),
                                        },
                                      ),
                                    ),
                                  const SizedBox(width: 10),
                                  // Divider
                                  if (metaTag is MetaTagWithCompareModes)
                                    Builder(
                                      builder: (context) {
                                        final mode = metaTag.compareModeFromDivider(metaTag.dividerParser(rawTag));

                                        if (mode.isExact) return const SizedBox.shrink();

                                        return Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 4),
                                            child: FaIcon(
                                              switch (mode) {
                                                CompareMode.exact => FontAwesomeIcons.equals,
                                                CompareMode.less => FontAwesomeIcons.lessThanEqual,
                                                CompareMode.greater => FontAwesomeIcons.greaterThanEqual,
                                              },
                                              size: 12,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  // Value
                                  if (metaTag is DateMetaTag)
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 4),
                                        child: Builder(
                                          builder: (context) {
                                            final dates = formattedTag
                                                .split(metaTag.valuesDivider)
                                                .map((d) {
                                                  final parsedDate = DateTime.tryParse(d);
                                                  if (parsedDate == null) {
                                                    return d;
                                                  }

                                                  return DateFormat(
                                                    metaTag.prettierDateFormat ?? metaTag.dateFormat,
                                                  ).format(parsedDate);
                                                })
                                                .toList()
                                                .join(metaTag.valuesDivider);

                                            return Text(
                                              dates,
                                              style: context.theme.textTheme.bodyLarge?.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  else
                                    Flexible(
                                      child: Text(
                                        formattedTag,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: context.theme.textTheme.bodyLarge?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                              //
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: onTap,
                                    onLongPress: onLongTap,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //
                        if (onDeleteTap != null)
                          Material(
                            color: Colors.white.withValues(alpha: 0.8),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              splashColor: Colors.black.withValues(alpha: 0.2),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                              onTap: canDelete ? onDeleteTap : null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                child: Icon(
                                  Icons.close_rounded,
                                  size: 20,
                                  color: canDelete ? tagColor : Colors.grey.shade400,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  //
                  Positioned.fill(
                    child: TransparentPointer(
                      // border moved here becuase if it's in the main container, there are rendering artifacts on borderRadius clipping
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? context.theme.colorScheme.secondary
                                : context.theme.colorScheme.onSurface.withValues(alpha: 0.5),
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
