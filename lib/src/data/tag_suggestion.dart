import 'package:flutter/widgets.dart';

import 'package:lolisnatcher/src/data/tag_type.dart';

class TagSuggestion {
  const TagSuggestion({
    required this.tag,
    this.description,
    this.count = 0,
    this.type = TagType.none,
    this.icon,
  });

  final String tag;
  final String? description;
  final int count;
  final TagType type;
  final Widget? icon;

  @override
  String toString() => 'TagSuggestion(tag: $tag, description: $description, count: $count, type: $type)';

  bool get hasDescription => description != null && description!.isNotEmpty;

  TagSuggestion copyWith({
    String? tag,
    String? description,
    int? count,
    TagType? type,
    Widget? icon,
  }) => TagSuggestion(
    tag: tag ?? this.tag,
    description: description ?? this.description,
    count: count ?? this.count,
    type: type ?? this.type,
    icon: icon ?? this.icon,
  );
}
