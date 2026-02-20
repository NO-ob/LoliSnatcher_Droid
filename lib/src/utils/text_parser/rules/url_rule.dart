import 'package:lolisnatcher/src/utils/text_parser/text_parser.dart';

/// Rule for parsing URLs in text
class UrlParseRule extends TextParseRule {
  const UrlParseRule({
    this.schemes = const ['http', 'https', 'ftp'],
    this.requireScheme = false,
    this.matchBareUrls = true,
  });

  final List<String> schemes;
  final bool requireScheme;
  final bool matchBareUrls;

  @override
  String get type => 'url';

  @override
  int get priority => 100; // High priority to match URLs before other patterns

  // Comprehensive URL regex that handles most common URL formats
  static final RegExp _urlWithSchemeRegex = RegExp(
    r'(https?|ftp):\/\/[^\s<>\[\]"]+[^\s<>\[\]".,;:!?\)\]\}]',
    caseSensitive: false,
  );

  // Regex for URLs without scheme (www.example.com)
  static final RegExp _urlWithoutSchemeRegex = RegExp(
    r'(?<![/@])www\.[^\s<>\[\]"]+[^\s<>\[\]".,;:!?\)\]\}]',
    caseSensitive: false,
  );

  // Common TLDs for bare URL matching (to avoid false positives)
  static const _commonTlds = [
    'app',
    'art',
    'au',
    'biz',
    'br',
    'ca',
    'co',
    'com',
    'de',
    'dev',
    'edu',
    'es',
    'fr',
    'gov',
    'info',
    'io',
    'it',
    'jp',
    'me',
    'moe',
    'net',
    'online',
    'org',
    'ru',
    'site',
    'tech',
    'tv',
    'uk',
    'us',
    'xxx',
    'xyz',
  ];

  // Regex for bare URLs (domain.tld/path) - more restrictive to avoid false positives
  // Must have a known TLD and either a path or query string to be considered a URL
  static final RegExp _bareUrlRegex = RegExp(
    r'(?<![/@\w])([a-zA-Z0-9][-a-zA-Z0-9]*\.)+(' +
        _commonTlds.join('|') +
        r')(\/[^\s<>\[\]"]*[^\s<>\[\]".,;:!?\)\]\}])?',
    caseSensitive: false,
  );

  @override
  List<TextParseMatch> findMatches(String text) {
    final List<TextParseMatch> matches = [];

    // Find URLs with scheme
    for (final match in _urlWithSchemeRegex.allMatches(text)) {
      final url = match.group(0)!;
      // Skip if scheme is not in allowed list
      final scheme = Uri.tryParse(url)?.scheme ?? '';
      if (!schemes.contains(scheme.toLowerCase())) continue;

      matches.add(
        TextParseMatch(
          start: match.start,
          end: match.end,
          segment: ParsedTextSegment(
            text: url,
            type: type,
            metadata: {'url': url},
          ),
        ),
      );
    }

    // Find URLs without scheme (www.)
    if (!requireScheme) {
      for (final match in _urlWithoutSchemeRegex.allMatches(text)) {
        final url = match.group(0)!;
        // Check if this position is already covered by a match with scheme
        final isOverlapping = matches.any(
          (m) => match.start >= m.start && match.start < m.end,
        );
        if (isOverlapping) continue;

        matches.add(
          TextParseMatch(
            start: match.start,
            end: match.end,
            segment: ParsedTextSegment(
              text: url,
              type: type,
              metadata: {'url': 'https://$url'},
            ),
          ),
        );
      }
    }

    // Find bare URLs (example.com, example.com/path)
    if (matchBareUrls && !requireScheme) {
      for (final match in _bareUrlRegex.allMatches(text)) {
        final url = match.group(0)!;

        // Skip if this position is already covered by another match
        final isOverlapping = matches.any(
          (m) => (match.start >= m.start && match.start < m.end) || (match.end > m.start && match.end <= m.end),
        );
        if (isOverlapping) continue;

        // Skip if it looks like an email (has @ before it)
        if (match.start > 0 && text[match.start - 1] == '@') continue;

        // Skip if it's just a TLD without path (too likely to be false positive)
        // Only match if it has a path component OR is a well-known domain pattern
        final hasPath = url.contains('/');
        final parts = url.split('.');
        final isLikelyUrl = hasPath || parts.length >= 2;

        if (!isLikelyUrl) continue;

        matches.add(
          TextParseMatch(
            start: match.start,
            end: match.end,
            segment: ParsedTextSegment(
              text: url,
              type: type,
              metadata: {'url': 'https://$url'},
            ),
          ),
        );
      }
    }

    return matches;
  }

  /// Returns the resolved URL string if [source] consists of exactly one URL
  /// spanning the entire (trimmed) string. Returns null for mixed content,
  /// plain text, or multiple URLs.
  static String? detectPureUrl(String source) {
    final trimmed = source.trim();
    if (trimmed.isEmpty) return null;
    const rule = UrlParseRule();
    final matches = rule.findMatches(trimmed);
    if (matches.length == 1 && matches.first.start == 0 && matches.first.end == trimmed.length) {
      return matches.first.segment.metadata['url'] as String? ?? trimmed;
    }
    return null;
  }
}
