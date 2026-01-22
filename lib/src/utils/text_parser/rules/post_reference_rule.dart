import 'package:lolisnatcher/src/utils/text_parser/text_parser.dart';

/// Rule for parsing post references (e.g., >>12345, post #12345)
class PostReferenceParseRule extends TextParseRule {
  const PostReferenceParseRule();

  @override
  String get type => 'post_reference';

  @override
  int get priority => 75;

  // Matches >>12345 style references (imageboard style)
  static final RegExp _doubleArrowRegex = RegExp(
    r'>>(\d+)',
  );

  // Matches post #12345 or post#12345
  static final RegExp _postHashRegex = RegExp(
    r'post\s*#(\d+)',
    caseSensitive: false,
  );

  // Matches comment #12345
  static final RegExp _commentHashRegex = RegExp(
    r'comment\s*#(\d+)',
    caseSensitive: false,
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    // Find >>12345 style
    for (final match in _doubleArrowRegex.allMatches(text)) {
      final postId = match.group(1)!;
      matches.add(TextParseMatch(
        start: match.start,
        end: match.end,
        segment: ParsedTextSegment(
          text: match.group(0)!,
          type: type,
          metadata: {'postId': postId, 'style': 'arrow'},
        ),
      ));
    }

    // Find post #12345 style
    for (final match in _postHashRegex.allMatches(text)) {
      final postId = match.group(1)!;
      matches.add(TextParseMatch(
        start: match.start,
        end: match.end,
        segment: ParsedTextSegment(
          text: match.group(0)!,
          type: type,
          metadata: {'postId': postId, 'style': 'post'},
        ),
      ));
    }

    // Find comment #12345 style
    for (final match in _commentHashRegex.allMatches(text)) {
      final postId = match.group(1)!;
      matches.add(TextParseMatch(
        start: match.start,
        end: match.end,
        segment: ParsedTextSegment(
          text: match.group(0)!,
          type: type,
          metadata: {'postId': postId, 'style': 'comment'},
        ),
      ));
    }

    return matches;
  }
}
