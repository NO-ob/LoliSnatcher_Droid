import 'package:lolisnatcher/src/utils/text_parser/rules/rules.dart';
import 'package:lolisnatcher/src/utils/text_parser/text_parser.dart';

export 'package:lolisnatcher/src/utils/text_parser/rules/rules.dart';
export 'package:lolisnatcher/src/utils/text_parser/text_parser.dart';

/// Pre-configured parser for booru-style comments
/// Includes common rules for URLs, tags, quotes, mentions, etc.
class CommentParser {
  CommentParser._();

  static TextParser? _instance;

  /// Get the default comment parser instance
  static TextParser get instance {
    _instance ??= createDefault();
    return _instance!;
  }

  /// Create a new parser with default rules for booru comments
  static TextParser createDefault() {
    return TextParser(
      rules: [
        // High priority - structural elements
        const UrlParseRule(),
        const CodeParseRule(),
        const QuoteParseRule(),
        const SpoilerParseRule(),
        const DiscordSpoilerParseRule(),

        // Medium priority - references and mentions
        const PostReferenceParseRule(),
        const MentionParseRule(),
        const SaidParseRule(),

        // Lower priority - formatting
        const BoldParseRule(),
        const ItalicParseRule(),
        const UnderlineParseRule(),
        const StrikethroughParseRule(),

        // Tags and hashtags
        const HashtagParseRule(),
        const TagParseRule(),

        // Line-based
        const LineQuoteParseRule(),
      ],
    );
  }

  /// Create a minimal parser with just URLs
  static TextParser createMinimal() {
    return TextParser(
      rules: [
        const UrlParseRule(),
      ],
    );
  }

  /// Create a custom parser with selected rules
  static TextParser createCustom({
    bool urls = true,
    bool quotes = true,
    bool spoilers = true,
    bool formatting = true,
    bool mentions = true,
    bool tags = true,
    bool postReferences = true,
    List<TextParseRule> additionalRules = const [],
  }) {
    final List<TextParseRule> rules = [];

    if (urls) {
      rules.add(const UrlParseRule());
    }

    if (quotes) {
      rules.add(const QuoteParseRule());
      rules.add(const LineQuoteParseRule());
    }

    if (spoilers) {
      rules.add(const SpoilerParseRule());
      rules.add(const DiscordSpoilerParseRule());
    }

    if (formatting) {
      rules.add(const CodeParseRule());
      rules.add(const BoldParseRule());
      rules.add(const ItalicParseRule());
      rules.add(const UnderlineParseRule());
      rules.add(const StrikethroughParseRule());
    }

    if (mentions) {
      rules.add(const MentionParseRule());
      rules.add(const SaidParseRule());
    }

    if (tags) {
      rules.add(const HashtagParseRule());
      rules.add(const TagParseRule());
    }

    if (postReferences) {
      rules.add(const PostReferenceParseRule());
    }

    rules.addAll(additionalRules);

    return TextParser(rules: rules);
  }
}
