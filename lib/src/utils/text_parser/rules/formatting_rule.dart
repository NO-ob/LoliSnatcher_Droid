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
  // Uses [\s\S]*? for non-greedy matching of any content
  static final RegExp _regex = RegExp(
    r'(?:\[b\]([\s\S]*?)\[\/b\]|<b>([\s\S]*?)<\/b>|<strong>([\s\S]*?)<\/strong>)',
    caseSensitive: false,
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    for (final match in _regex.allMatches(text)) {
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

  static final RegExp _regex = RegExp(
    r'(?:\[i\]([\s\S]*?)\[\/i\]|<i>([\s\S]*?)<\/i>|<em>([\s\S]*?)<\/em>)',
    caseSensitive: false,
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    for (final match in _regex.allMatches(text)) {
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

  static final RegExp _regex = RegExp(
    r'(?:\[u\]([\s\S]*?)\[\/u\]|<u>([\s\S]*?)<\/u>)',
    caseSensitive: false,
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    for (final match in _regex.allMatches(text)) {
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

  static final RegExp _regex = RegExp(
    r'(?:\[s\]([\s\S]*?)\[\/s\]|<s>([\s\S]*?)<\/s>|<strike>([\s\S]*?)<\/strike>|<del>([\s\S]*?)<\/del>)',
    caseSensitive: false,
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    for (final match in _regex.allMatches(text)) {
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

/// Rule for parsing ruby (furigana) text.
/// Supports:
///   HTML: `<ruby>base<rt>reading</rt></ruby>`
///   HTML with rb: `<ruby><rb>base</rb><rt>reading</rt></ruby>`
///   BBCode: `[ruby]base[rt]reading[/ruby]`
class RubyParseRule extends TextParseRule {
  const RubyParseRule();

  @override
  String get type => 'ruby';

  @override
  int get priority => 40;

  @override
  bool get allowNested => false;

  // Groups:
  //   HTML form: group(1) = <rb> base (optional), group(2) = bare base, group(3) = <rt> content
  //   BBCode form: group(4) = base, group(5) = rt content
  static final RegExp _regex = RegExp(
    '(?:'
    r'<ruby>(?:<rb>([\s\S]*?)<\/rb>)?([\s\S]*?)<rt>([\s\S]*?)<\/rt><\/ruby>'
    '|'
    r'\[ruby\]([\s\S]*?)\[rt\]([\s\S]*?)\[\/ruby\]'
    ')',
    caseSensitive: false,
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    for (final match in _regex.allMatches(text)) {
      final String base;
      final String ruby;
      if (match.group(4) != null) {
        // BBCode form
        base = match.group(4)!;
        ruby = match.group(5) ?? '';
      } else {
        // HTML form — prefer explicit <rb> content, fall back to bare base
        base = match.group(1) ?? match.group(2) ?? '';
        ruby = match.group(3) ?? '';
      }

      matches.add(
        TextParseMatch(
          start: match.start,
          end: match.end,
          segment: ParsedTextSegment(
            text: match.group(0)!,
            type: type,
            metadata: {'base': base, 'ruby': ruby},
          ),
        ),
      );
    }

    return matches;
  }
}

/// Rule for parsing code blocks [code]...[/code] or <code>...</code>
class CodeParseRule extends TextParseRule {
  const CodeParseRule();

  @override
  String get type => 'code';

  @override
  int get priority => 85; // High priority to avoid parsing code content

  @override
  bool get allowNested => false; // Don't parse content inside code blocks

  static final RegExp _regex = RegExp(
    r'(?:\[code\]([\s\S]*?)\[\/code\]|<code>([\s\S]*?)<\/code>)',
    caseSensitive: false,
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    for (final match in _regex.allMatches(text)) {
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
