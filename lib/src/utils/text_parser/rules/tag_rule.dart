import 'package:lolisnatcher/src/utils/text_parser/text_parser.dart';

/// Rule for parsing booru-style tags (e.g., tag_name, some_artist)
/// Matches words with underscores that look like tags
class TagParseRule extends TextParseRule {
  const TagParseRule({
    this.minLength = 2,
    this.requireUnderscore = true,
  });

  final int minLength;
  final bool requireUnderscore;

  @override
  String get type => 'tag';

  @override
  int get priority => 50;

  // Matches tag-like patterns: word_word or word_word_word etc.
  // Must contain at least one underscore and consist of alphanumeric + underscore
  static final RegExp _tagWithUnderscoreRegex = RegExp(
    r'(?<![/\w])([a-zA-Z0-9]+(?:_[a-zA-Z0-9]+)+)(?![/\w])',
  );

  // More permissive: any word-like sequence (for when requireUnderscore is false)
  static final RegExp _tagPermissiveRegex = RegExp(
    r'(?<![/\w@#])([a-zA-Z][a-zA-Z0-9_]{1,})(?![/\w])',
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];
    final regex = requireUnderscore ? _tagWithUnderscoreRegex : _tagPermissiveRegex;

    for (final match in regex.allMatches(text)) {
      final tag = match.group(1)!;
      if (tag.length < minLength) continue;

      matches.add(
        TextParseMatch(
          start: match.start,
          end: match.end,
          segment: ParsedTextSegment(
            text: match.group(0)!,
            type: type,
            metadata: {'tag': tag},
          ),
        ),
      );
    }

    return matches;
  }
}

/// Rule for parsing hashtag-style tags (e.g., #tag, #some_tag)
class HashtagParseRule extends TextParseRule {
  const HashtagParseRule({
    this.minLength = 1,
  });

  final int minLength;

  @override
  String get type => 'hashtag';

  @override
  int get priority => 60;

  static final RegExp _hashtagRegex = RegExp(
    r'(?<!\w)#([a-zA-Z][a-zA-Z0-9_]*)',
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    for (final match in _hashtagRegex.allMatches(text)) {
      final tag = match.group(1)!;
      if (tag.length < minLength) continue;

      matches.add(
        TextParseMatch(
          start: match.start,
          end: match.end,
          segment: ParsedTextSegment(
            text: match.group(0)!,
            type: type,
            metadata: {'tag': tag},
          ),
        ),
      );
    }

    return matches;
  }
}
