import 'package:flutter/material.dart';

/// Represents a parsed segment of text with its type and metadata
class ParsedTextSegment {
  const ParsedTextSegment({
    required this.text,
    required this.type,
    this.metadata = const {},
  });

  /// The original text content of this segment
  final String text;

  /// The type identifier for this segment (e.g., 'url', 'tag', 'quote', 'text')
  final String type;

  /// Additional metadata associated with this segment
  /// For URLs: {'url': 'https://...'}, for tags: {'tag': 'tag_name'}, etc.
  final Map<String, dynamic> metadata;

  @override
  String toString() => 'ParsedTextSegment(type: $type, text: "$text", metadata: $metadata)';
}

/// Abstract base class for text parsing rules
/// Each rule defines how to match and parse specific patterns in text
abstract class TextParseRule {
  const TextParseRule();

  /// Unique identifier for this rule type
  String get type;

  /// Priority of this rule (higher = processed first)
  /// Default is 0, use higher values for rules that should take precedence
  int get priority => 0;

  /// Whether this rule can contain nested rules
  /// If true, the content inside matches will be recursively parsed
  bool get allowNested => false;

  /// Find all matches of this rule's pattern in the given text
  /// Returns a list of matches with their positions and parsed segments
  List<TextParseMatch> findMatches(String text);
}

/// Represents a match found by a parsing rule
class TextParseMatch {
  const TextParseMatch({
    required this.start,
    required this.end,
    required this.segment,
    this.innerContent,
  });

  /// Start position in the original text
  final int start;

  /// End position in the original text (exclusive)
  final int end;

  /// The parsed segment for this match
  final ParsedTextSegment segment;

  /// For nested rules, the inner content that should be recursively parsed
  /// If null, the segment.text is used as-is
  final String? innerContent;
}

/// Main text parser that combines multiple rules to parse text
class TextParser {
  TextParser({
    List<TextParseRule>? rules,
  }) : _rules = [...?rules]..sort((a, b) => b.priority.compareTo(a.priority));

  final List<TextParseRule> _rules;

  /// Add a rule to the parser
  void addRule(TextParseRule rule) {
    _rules.add(rule);
    _rules.sort((a, b) => b.priority.compareTo(a.priority));
  }

  /// Remove a rule by its type
  void removeRule(String type) {
    _rules.removeWhere((r) => r.type == type);
  }

  /// Parse text into a list of segments
  List<ParsedTextSegment> parse(String text) {
    if (text.isEmpty) return [];

    // Collect all matches from all rules
    final List<_MatchWithRule> allMatches = [];
    for (final rule in _rules) {
      for (final match in rule.findMatches(text)) {
        allMatches.add(_MatchWithRule(match: match, rule: rule));
      }
    }

    // Sort by start position, then by priority (higher priority wins for overlaps)
    allMatches.sort((a, b) {
      final posCompare = a.match.start.compareTo(b.match.start);
      if (posCompare != 0) return posCompare;
      return b.rule.priority.compareTo(a.rule.priority);
    });

    // Remove overlapping matches (keep higher priority ones)
    final List<_MatchWithRule> filteredMatches = [];
    int lastEnd = 0;
    for (final m in allMatches) {
      if (m.match.start >= lastEnd) {
        filteredMatches.add(m);
        lastEnd = m.match.end;
      }
    }

    // Build the final segments list
    final List<ParsedTextSegment> segments = [];
    int currentPos = 0;

    for (final m in filteredMatches) {
      // Add plain text before this match
      if (m.match.start > currentPos) {
        final plainText = text.substring(currentPos, m.match.start);
        segments.add(ParsedTextSegment(
          text: plainText,
          type: 'text',
        ));
      }

      // Handle nested parsing if the rule supports it
      if (m.rule.allowNested && m.match.innerContent != null) {
        final nestedSegments = parse(m.match.innerContent!);
        // Wrap nested segments in a container segment
        segments.add(ParsedTextSegment(
          text: m.match.segment.text,
          type: m.match.segment.type,
          metadata: {
            ...m.match.segment.metadata,
            'nested': nestedSegments,
          },
        ));
      } else {
        segments.add(m.match.segment);
      }

      currentPos = m.match.end;
    }

    // Add remaining plain text
    if (currentPos < text.length) {
      segments.add(ParsedTextSegment(
        text: text.substring(currentPos),
        type: 'text',
      ));
    }

    return segments;
  }
}

class _MatchWithRule {
  const _MatchWithRule({required this.match, required this.rule});
  final TextParseMatch match;
  final TextParseRule rule;
}

/// Registry for segment builders that handles rendering of parsed segments
class SegmentBuilderRegistry {
  SegmentBuilderRegistry({
    Map<String, SegmentBuilderFn>? builders,
  }) : _builders = {...?builders};

  final Map<String, SegmentBuilderFn> _builders;

  /// Register a builder for a specific segment type
  void register(String type, SegmentBuilderFn builder) {
    _builders[type] = builder;
  }

  /// Remove a builder for a specific segment type
  void unregister(String type) {
    _builders.remove(type);
  }

  /// Get the builder for a segment type, or the default builder
  SegmentBuilderFn getBuilder(String type) {
    return _builders[type] ?? defaultSegmentBuilder;
  }

  /// Build an InlineSpan for a segment
  InlineSpan build(
    BuildContext context,
    ParsedTextSegment segment,
    TextStyle? style,
  ) {
    final builder = getBuilder(segment.type);
    return builder(context, segment, style, this);
  }

  /// Build spans for a list of segments
  List<InlineSpan> buildAll(
    BuildContext context,
    List<ParsedTextSegment> segments,
    TextStyle? style,
  ) {
    return segments.map((s) => build(context, s, style)).toList();
  }
}

/// Builder function type for rendering parsed segments
typedef SegmentBuilderFn = InlineSpan Function(
  BuildContext context,
  ParsedTextSegment segment,
  TextStyle? style,
  SegmentBuilderRegistry registry,
);

/// Default builder that just returns a TextSpan
InlineSpan defaultSegmentBuilder(
  BuildContext context,
  ParsedTextSegment segment,
  TextStyle? style,
  SegmentBuilderRegistry registry,
) {
  return TextSpan(text: segment.text, style: style);
}
