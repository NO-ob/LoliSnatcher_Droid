// ignore_for_file: comment_references

import 'package:lolisnatcher/src/utils/text_parser/text_parser.dart';

/// Rule for parsing BBCode-style quote blocks [quote]...[/quote]
/// Supports nested quotes by using balanced tag matching
class QuoteParseRule extends TextParseRule {
  const QuoteParseRule();

  @override
  String get type => 'quote';

  @override
  int get priority => 80;

  @override
  bool get allowNested => true;

  // Pattern to find opening quote tags
  static final RegExp _openTagRegex = RegExp(
    r'\[quote(?:=([^\]]*))?\]',
    caseSensitive: false,
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];
    final lowerText = text.toLowerCase();

    int searchStart = 0;
    while (searchStart < text.length) {
      // Find next opening tag
      final openMatch = _openTagRegex.firstMatch(text.substring(searchStart));
      if (openMatch == null) break;

      final absoluteStart = searchStart + openMatch.start;
      final contentStart = searchStart + openMatch.end;
      final author = openMatch.group(1);

      // Find matching closing tag (accounting for nesting)
      int depth = 1;
      int pos = contentStart;

      while (depth > 0 && pos < text.length) {
        final nextOpen = lowerText.indexOf('[quote', pos);
        final nextClose = lowerText.indexOf('[/quote]', pos);

        if (nextClose == -1) {
          // No closing tag found, invalid
          break;
        }

        if (nextOpen != -1 && nextOpen < nextClose) {
          // Found another opening tag before closing
          depth++;
          pos = nextOpen + 6; // Move past "[quote"
        } else {
          // Found closing tag
          depth--;
          if (depth == 0) {
            // This is our matching closing tag
            final content = text.substring(contentStart, nextClose);
            final absoluteEnd = nextClose + 8; // Length of "[/quote]"

            matches.add(
              TextParseMatch(
                start: absoluteStart,
                end: absoluteEnd,
                segment: ParsedTextSegment(
                  text: text.substring(absoluteStart, absoluteEnd),
                  type: type,
                  metadata: {
                    'content': content.trim(),
                    if (author != null && author.isNotEmpty) 'author': author,
                  },
                ),
                innerContent: content.trim(),
              ),
            );
          }
          pos = nextClose + 8; // Move past "[/quote]"
        }
      }

      // Move search start past this opening tag to find more quotes
      searchStart = contentStart;
    }

    return matches;
  }
}

/// Rule for parsing simple quote markers like > at start of line
class LineQuoteParseRule extends TextParseRule {
  const LineQuoteParseRule();

  @override
  String get type => 'line_quote';

  @override
  int get priority => 70;

  // Matches lines starting with > (greentext style)
  static final RegExp _lineQuoteRegex = RegExp(
    r'^(>[^\n]+)$',
    multiLine: true,
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    for (final match in _lineQuoteRegex.allMatches(text)) {
      final content = match.group(1)!;

      matches.add(
        TextParseMatch(
          start: match.start,
          end: match.end,
          segment: ParsedTextSegment(
            text: content,
            type: type,
            metadata: {
              'content': content.substring(1).trim(), // Remove the > prefix
            },
          ),
        ),
      );
    }

    return matches;
  }
}
