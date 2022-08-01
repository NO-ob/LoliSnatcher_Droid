import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';

class TagsManagerListItem extends StatelessWidget {
  const TagsManagerListItem({
    Key? key,
    required this.tag,
    this.isSelected = false,
    this.onSelect,
    this.onTap,
  }) : super(key: key);

  final Tag tag;
  final bool isSelected;
  final void Function(bool?)? onSelect;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    bool isStale = tag.updatedAt < DateTime.now().subtract(const Duration(days: 3)).millisecondsSinceEpoch;
    String staleText = isStale ? " (stale)" : "";

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
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (onTap != null)
              Checkbox(
                value: isSelected,
                onChanged: onSelect,
              ),
          ],
        ),
        title: MarqueeText(
          key: ValueKey(tag.fullString),
          text: tag.fullString,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          isExpanded: false,
        ),
        subtitle: Text('${tag.tagType.toString()} $staleText'.trim()),
      ),
    );
  }
}
