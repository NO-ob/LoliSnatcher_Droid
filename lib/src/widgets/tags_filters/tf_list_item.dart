import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';

class TagsFiltersListItem extends StatelessWidget {
  const TagsFiltersListItem({
    Key? key,
    required this.tag,
    this.onTap,
    this.overrideIcon,
  }) : super(key: key);

  final String tag;
  final Function(String)? onTap;
  final Widget? overrideIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        onTap: () => onTap?.call(tag),
        leading: overrideIcon ?? const Icon(CupertinoIcons.tag),
        title: MarqueeText(
          text: tag,
          fontSize: 16,
          isExpanded: false,
        ),
      ),
    );
  }
}
