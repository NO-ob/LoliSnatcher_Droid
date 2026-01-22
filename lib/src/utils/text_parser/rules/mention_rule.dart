import 'package:lolisnatcher/src/utils/text_parser/text_parser.dart';

/// Rule for parsing @mentions (e.g., @username)
class MentionParseRule extends TextParseRule {
  const MentionParseRule({
    this.minLength = 1,
  });

  final int minLength;

  @override
  String get type => 'mention';

  @override
  int get priority => 60;

  // Matches @username patterns
  static final RegExp _mentionRegex = RegExp(
    r'(?<!\w)@([a-zA-Z][a-zA-Z0-9_]*)',
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    for (final match in _mentionRegex.allMatches(text)) {
      final username = match.group(1)!;
      if (username.length < minLength) continue;

      matches.add(TextParseMatch(
        start: match.start,
        end: match.end,
        segment: ParsedTextSegment(
          text: match.group(0)!,
          type: type,
          metadata: {'username': username},
        ),
      ));
    }

    return matches;
  }
}

/// Rule for parsing "said:" attribution patterns common in forums
class SaidParseRule extends TextParseRule {
  const SaidParseRule();

  @override
  String get type => 'said';

  @override
  int get priority => 65;

  // Matches "Username said:" patterns
  static final RegExp _saidRegex = RegExp(
    r'([a-zA-Z][a-zA-Z0-9_]*)\s+said:',
    caseSensitive: false,
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    for (final match in _saidRegex.allMatches(text)) {
      final username = match.group(1)!;

      matches.add(TextParseMatch(
        start: match.start,
        end: match.end,
        segment: ParsedTextSegment(
          text: match.group(0)!,
          type: type,
          metadata: {'username': username},
        ),
      ));
    }

    return matches;
  }
}
