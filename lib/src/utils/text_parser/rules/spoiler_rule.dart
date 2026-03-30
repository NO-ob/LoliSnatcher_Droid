// ignore_for_file: comment_references

import 'package:lolisnatcher/src/utils/text_parser/text_parser.dart';

/// Rule for parsing BBCode-style spoiler blocks [spoiler]...[/spoiler]
class SpoilerParseRule extends TextParseRule {
  const SpoilerParseRule();

  @override
  String get type => 'spoiler';

  @override
  int get priority => 80;

  @override
  bool get allowNested => true;

  // Matches [spoiler]content[/spoiler]
  static final RegExp _spoilerRegex = RegExp(
    r'\[spoiler\]([\s\S]*?)\[\/spoiler\]',
    caseSensitive: false,
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    for (final match in _spoilerRegex.allMatches(text)) {
      final content = match.group(1) ?? '';

      matches.add(
        TextParseMatch(
          start: match.start,
          end: match.end,
          segment: ParsedTextSegment(
            text: match.group(0)!,
            type: type,
            metadata: {'content': content},
          ),
          innerContent: content,
        ),
      );
    }

    return matches;
  }
}

/// Rule for parsing ||spoiler|| Discord-style spoilers
class DiscordSpoilerParseRule extends TextParseRule {
  const DiscordSpoilerParseRule();

  @override
  String get type => 'discord_spoiler';

  @override
  int get priority => 78;

  @override
  bool get allowNested => true;

  // Matches ||spoiler content||
  static final RegExp _discordSpoilerRegex = RegExp(
    r'\|\|([^|]+)\|\|',
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    for (final match in _discordSpoilerRegex.allMatches(text)) {
      final content = match.group(1) ?? '';

      matches.add(
        TextParseMatch(
          start: match.start,
          end: match.end,
          segment: ParsedTextSegment(
            text: match.group(0)!,
            type: type,
            metadata: {'content': content},
          ),
          innerContent: content,
        ),
      );
    }

    return matches;
  }
}
