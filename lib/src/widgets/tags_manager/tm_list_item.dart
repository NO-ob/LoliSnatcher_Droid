import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';

class TagsManagerListItem extends StatelessWidget {
  const TagsManagerListItem({
    required this.tag,
    this.isSelected = false,
    this.onSelect,
    this.onTap,
    this.debug = false,
    super.key,
  });

  final Tag tag;
  final bool isSelected;
  final void Function(bool?)? onSelect;
  final void Function()? onTap;
  final bool debug;

  @override
  Widget build(BuildContext context) {
    final bool isStale = tag.updatedAt < DateTime.now().subtract(const Duration(days: 3)).millisecondsSinceEpoch;
    final String staleText = (isStale && debug) ? ' (stale)' : '';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: Colors.grey),
        ),
        onTap: onTap,
        minLeadingWidth: 20,
        leading: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: tag.tagType.getColour(),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        trailing: onTap != null
            ? Checkbox(
                value: isSelected,
                onChanged: onSelect,
              )
            : null,
        title: SizedBox(
          height: 16,
          child: MarqueeText(
            key: ValueKey(tag.fullString),
            text: tag.fullString,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            isExpanded: false,
          ),
        ),
        subtitle: Text('${tag.tagType} $staleText'.trim()),
      ),
    );
  }
}
