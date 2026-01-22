// ignore_for_file: comment_references

import 'package:lolisnatcher/src/utils/text_parser/text_parser.dart';

/// Rule for parsing bold text [b]...[/b] or <b>...</b> or <strong>...</strong>
class BoldParseRule extends TextParseRule {
  const BoldParseRule();

  @override
  String get type => 'bold';

  @override
  int get priority => 40;

  @override
  bool get allowNested => true;

  // Matches [b]...[/b], <b>...</b>, or <strong>...</strong>
  static final RegExp _boldRegex = RegExp(
    r'(?:\[b\]([\s\S]*?)\[\/b\]|<b>([\s\S]*?)<\/b>|<strong>([\s\S]*?)<\/strong>)',
    caseSensitive: false,
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    for (final match in _boldRegex.allMatches(text)) {
      // Get content from whichever group matched
      final content = match.group(1) ?? match.group(2) ?? match.group(3) ?? '';

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

/// Rule for parsing italic text [i]...[/i] or <i>...</i> or <em>...</em>
class ItalicParseRule extends TextParseRule {
  const ItalicParseRule();

  @override
  String get type => 'italic';

  @override
  int get priority => 40;

  @override
  bool get allowNested => true;

  // Matches [i]...[/i], <i>...</i>, or <em>...</em>
  static final RegExp _italicRegex = RegExp(
    r'(?:\[i\]([\s\S]*?)\[\/i\]|<i>([\s\S]*?)<\/i>|<em>([\s\S]*?)<\/em>)',
    caseSensitive: false,
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    for (final match in _italicRegex.allMatches(text)) {
      final content = match.group(1) ?? match.group(2) ?? match.group(3) ?? '';

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

/// Rule for parsing underlined text [u]...[/u] or <u>...</u>
class UnderlineParseRule extends TextParseRule {
  const UnderlineParseRule();

  @override
  String get type => 'underline';

  @override
  int get priority => 40;

  @override
  bool get allowNested => true;

  // Matches [u]...[/u] or <u>...</u>
  static final RegExp _underlineRegex = RegExp(
    r'(?:\[u\]([\s\S]*?)\[\/u\]|<u>([\s\S]*?)<\/u>)',
    caseSensitive: false,
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    for (final match in _underlineRegex.allMatches(text)) {
      final content = match.group(1) ?? match.group(2) ?? '';

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

// ignore: unintended_html_in_doc_comment
/// Rule for parsing strikethrough text [s]...[/s] or <s>...</s> or <strike>...</strike> or <del>...</del>
class StrikethroughParseRule extends TextParseRule {
  const StrikethroughParseRule();

  @override
  String get type => 'strikethrough';

  @override
  int get priority => 40;

  @override
  bool get allowNested => true;

  // Matches [s]...[/s], <s>...</s>, <strike>...</strike>, or <del>...</del>
  static final RegExp _strikeRegex = RegExp(
    r'(?:\[s\]([\s\S]*?)\[\/s\]|<s>([\s\S]*?)<\/s>|<strike>([\s\S]*?)<\/strike>|<del>([\s\S]*?)<\/del>)',
    caseSensitive: false,
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    for (final match in _strikeRegex.allMatches(text)) {
      final content = match.group(1) ?? match.group(2) ?? match.group(3) ?? match.group(4) ?? '';

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

/// Rule for parsing code blocks `[code]...[/code]` or `<code>...</code>`
class CodeParseRule extends TextParseRule {
  const CodeParseRule();

  @override
  String get type => 'code';

  @override
  int get priority => 85; // High priority to avoid parsing code content

  @override
  bool get allowNested => false; // Don't parse content inside code blocks

  // Matches [code]...[/code] or <code>...</code>
  static final RegExp _codeRegex = RegExp(
    r'(?:\[code\]([\s\S]*?)\[\/code\]|<code>([\s\S]*?)<\/code>)',
    caseSensitive: false,
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    for (final match in _codeRegex.allMatches(text)) {
      final content = match.group(1) ?? match.group(2) ?? '';

      matches.add(
        TextParseMatch(
          start: match.start,
          end: match.end,
          segment: ParsedTextSegment(
            text: match.group(0)!,
            type: type,
            metadata: {'content': content},
          ),
        ),
      );
    }

    return matches;
  }
}
