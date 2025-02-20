import 'package:lolisnatcher/src/data/tag_type.dart';

class TagSuggestion {
  const TagSuggestion({
    required this.tag,
    this.count = 0,
    this.type = TagType.none,
  });

  final String tag;
  final int count;
  final TagType type;

  @override
  String toString() => 'TagSuggestion(tag: $tag, count: $count, type: $type)';

  TagSuggestion copyWith({
    String? tag,
    int? count,
    TagType? type,
  }) =>
      TagSuggestion(
        tag: tag ?? this.tag,
        count: count ?? this.count,
        type: type ?? this.type,
      );
}
