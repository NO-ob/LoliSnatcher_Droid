import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/utils/text_parser/comment_parser.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';

/// Callback types for parsed text interactions
typedef OnUrlTap = void Function(String url);
typedef OnTagTap = void Function(String tag);
typedef OnMentionTap = void Function(String username);
typedef OnPostReferenceTap = void Function(String postId);

/// Widget that displays text with parsed and styled segments
/// Supports URLs, tags, mentions, quotes, spoilers, and BBCode formatting
class ParsedText extends StatefulWidget {
  const ParsedText({
    required this.text,
    this.parser,
    this.style,
    this.urlStyle,
    this.tagStyle,
    this.mentionStyle,
    this.quoteStyle,
    this.spoilerStyle,
    this.codeStyle,
    this.postReferenceStyle,
    this.onUrlTap,
    this.onTagTap,
    this.onMentionTap,
    this.onPostReferenceTap,
    this.selectable = true,
    this.maxLines,
    this.overflow,
    this.textAlign,
    super.key,
  });

  /// The text to parse and display
  final String text;

  /// Custom parser instance (uses default CommentParser if not provided)
  final TextParser? parser;

  /// Base text style
  final TextStyle? style;

  /// Style for URL segments
  final TextStyle? urlStyle;

  /// Style for tag segments
  final TextStyle? tagStyle;

  /// Style for mention segments
  final TextStyle? mentionStyle;

  /// Style for quote segments
  final TextStyle? quoteStyle;

  /// Style for spoiler segments (when revealed)
  final TextStyle? spoilerStyle;

  /// Style for code segments
  final TextStyle? codeStyle;

  /// Style for post reference segments
  final TextStyle? postReferenceStyle;

  /// Callback when a URL is tapped
  final OnUrlTap? onUrlTap;

  /// Callback when a tag is tapped
  final OnTagTap? onTagTap;

  /// Callback when a mention is tapped
  final OnMentionTap? onMentionTap;

  /// Callback when a post reference is tapped
  final OnPostReferenceTap? onPostReferenceTap;

  /// Whether the text is selectable
  final bool selectable;

  /// Maximum number of lines
  final int? maxLines;

  /// Text overflow behavior
  final TextOverflow? overflow;

  /// Text alignment
  final TextAlign? textAlign;

  @override
  State<ParsedText> createState() => _ParsedTextState();
}

class _ParsedTextState extends State<ParsedText> {
  late List<ParsedTextSegment> _segments;
  final Set<int> _revealedSpoilers = {};

  @override
  void initState() {
    super.initState();
    _parseText();
  }

  @override
  void didUpdateWidget(ParsedText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text || oldWidget.parser != widget.parser) {
      _parseText();
      _revealedSpoilers.clear();
    }
  }

  void _parseText() {
    final parser = widget.parser ?? CommentParser.instance;
    _segments = parser.parse(widget.text);
  }

  void _onUrlTap(String url) {
    if (widget.onUrlTap != null) {
      widget.onUrlTap!(url);
    } else {
      _defaultUrlHandler(url);
    }
  }

  Future<void> _defaultUrlHandler(String url) async {
    final res = await launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    );
    if (!res && mounted) {
      FlashElements.showSnackbar(
        title: const Text('Error'),
        content: const Text('Failed to open link'),
      );
    }
  }

  void _toggleSpoiler(int index) {
    setState(() {
      if (_revealedSpoilers.contains(index)) {
        _revealedSpoilers.remove(index);
      } else {
        _revealedSpoilers.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultStyle = widget.style ?? theme.textTheme.bodyMedium;

    final spans = _buildSpans(context, _segments, defaultStyle, 0);

    final textSpan = TextSpan(
      style: defaultStyle,
      children: spans,
    );

    if (widget.selectable) {
      return SelectableText.rich(
        textSpan,
        maxLines: widget.maxLines,
        textAlign: widget.textAlign,
      );
    }

    return RichText(
      text: textSpan,
      maxLines: widget.maxLines,
      overflow: widget.overflow ?? TextOverflow.clip,
      textAlign: widget.textAlign ?? TextAlign.start,
    );
  }

  List<InlineSpan> _buildSpans(
    BuildContext context,
    List<ParsedTextSegment> segments,
    TextStyle? baseStyle,
    int depthOffset,
  ) {
    final theme = Theme.of(context);
    final List<InlineSpan> spans = [];

    for (int i = 0; i < segments.length; i++) {
      final segment = segments[i];
      final globalIndex = depthOffset + i;

      switch (segment.type) {
        case 'text':
          spans.add(TextSpan(text: segment.text, style: baseStyle));

        case 'url':
          final url = segment.metadata['url'] as String? ?? segment.text;
          spans.add(
            TextSpan(
              text: segment.text,
              style:
                  widget.urlStyle ??
                  baseStyle?.copyWith(
                    color: Colors.blue.shade300,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue.shade300,
                  ),
              recognizer: TapGestureRecognizer()..onTap = () => _onUrlTap(url),
            ),
          );

        case 'tag':
        case 'hashtag':
          final tag = segment.metadata['tag'] as String? ?? segment.text;
          spans.add(
            TextSpan(
              text: segment.text,
              style:
                  widget.tagStyle ??
                  baseStyle?.copyWith(
                    color: theme.colorScheme.secondary,
                  ),
              recognizer: widget.onTagTap != null
                  ? (TapGestureRecognizer()..onTap = () => widget.onTagTap!(tag))
                  : null,
            ),
          );

        case 'mention':
          final username = segment.metadata['username'] as String? ?? segment.text;
          spans.add(
            TextSpan(
              text: segment.text,
              style:
                  widget.mentionStyle ??
                  baseStyle?.copyWith(
                    color: theme.colorScheme.tertiary,
                    fontWeight: FontWeight.bold,
                  ),
              recognizer: widget.onMentionTap != null
                  ? (TapGestureRecognizer()..onTap = () => widget.onMentionTap!(username))
                  : null,
            ),
          );

        case 'said':
          final username = segment.metadata['username'] as String? ?? '';
          spans.add(
            TextSpan(
              text: segment.text,
              style:
                  widget.mentionStyle ??
                  baseStyle?.copyWith(
                    color: theme.colorScheme.tertiary,
                    fontWeight: FontWeight.bold,
                  ),
              recognizer: widget.onMentionTap != null
                  ? (TapGestureRecognizer()..onTap = () => widget.onMentionTap!(username))
                  : null,
            ),
          );

        case 'post_reference':
          final postId = segment.metadata['postId'] as String? ?? '';
          spans.add(
            TextSpan(
              text: segment.text,
              style:
                  widget.postReferenceStyle ??
                  baseStyle?.copyWith(
                    color: Colors.orange.shade300,
                    fontWeight: FontWeight.bold,
                  ),
              recognizer: widget.onPostReferenceTap != null
                  ? (TapGestureRecognizer()..onTap = () => widget.onPostReferenceTap!(postId))
                  : null,
            ),
          );

        case 'quote':
          final nested = segment.metadata['nested'] as List<ParsedTextSegment>?;
          final author = segment.metadata['author'] as String?;
          final content = segment.metadata['content'] as String? ?? '';

          final quoteStyle =
              widget.quoteStyle ??
              baseStyle?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                fontStyle: FontStyle.italic,
              );
          final bracketStyle = quoteStyle?.copyWith(fontStyle: FontStyle.normal);

          if (author != null) {
            spans.add(
              TextSpan(
                text: '$author said:\n',
                style: quoteStyle?.copyWith(fontWeight: FontWeight.bold),
              ),
            );
          }

          spans.add(TextSpan(text: '「', style: bracketStyle));

          if (nested != null && nested.isNotEmpty) {
            spans.addAll(_buildSpans(context, nested, quoteStyle, globalIndex * 1000));
          } else {
            spans.add(TextSpan(text: content, style: quoteStyle));
          }

          spans.add(TextSpan(text: '」\n', style: bracketStyle));

        case 'line_quote':
          // Greentext style (>text)
          final content = segment.metadata['content'] as String? ?? '';
          final greentextStyle = baseStyle?.copyWith(
            color: const Color(0xFF789922), // Classic greentext color
          );
          spans.add(TextSpan(text: '>$content', style: greentextStyle));

        case 'spoiler':
        case 'discord_spoiler':
          final isRevealed = _revealedSpoilers.contains(globalIndex);
          final nested = segment.metadata['nested'] as List<ParsedTextSegment>?;
          final content = segment.metadata['content'] as String? ?? '';

          if (isRevealed) {
            final spoilerStyle = widget.spoilerStyle ?? baseStyle;
            // Revealed spoiler with subtle background
            spans.add(
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: GestureDetector(
                  onTap: () => _toggleSpoiler(globalIndex),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: theme.colorScheme.primary.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: nested != null && nested.isNotEmpty
                        ? Text.rich(
                            TextSpan(children: _buildSpans(context, nested, spoilerStyle, globalIndex * 1000)),
                          )
                        : Text(content, style: spoilerStyle),
                  ),
                ),
              ),
            );
          } else {
            // Hidden spoiler with fancy appearance
            spans.add(
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: GestureDetector(
                  onTap: () => _toggleSpoiler(globalIndex),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.surfaceContainerHighest,
                          theme.colorScheme.surfaceContainerHigh,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: theme.colorScheme.outline.withValues(alpha: 0.5),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.shadow.withValues(alpha: 0.1),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.visibility_off_rounded,
                          size: (baseStyle?.fontSize ?? 14) * 0.9,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Spoiler',
                          style: baseStyle?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                            fontSize: (baseStyle.fontSize ?? 14) * 0.85,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

        case 'bold':
          final nested = segment.metadata['nested'] as List<ParsedTextSegment>?;
          final content = segment.metadata['content'] as String? ?? '';
          final boldStyle = baseStyle?.copyWith(fontWeight: FontWeight.bold);

          if (nested != null && nested.isNotEmpty) {
            spans.addAll(_buildSpans(context, nested, boldStyle, globalIndex * 1000));
          } else {
            spans.add(TextSpan(text: content, style: boldStyle));
          }

        case 'italic':
          final nested = segment.metadata['nested'] as List<ParsedTextSegment>?;
          final content = segment.metadata['content'] as String? ?? '';
          final italicStyle = baseStyle?.copyWith(fontStyle: FontStyle.italic);

          if (nested != null && nested.isNotEmpty) {
            spans.addAll(_buildSpans(context, nested, italicStyle, globalIndex * 1000));
          } else {
            spans.add(TextSpan(text: content, style: italicStyle));
          }

        case 'underline':
          final nested = segment.metadata['nested'] as List<ParsedTextSegment>?;
          final content = segment.metadata['content'] as String? ?? '';
          final underlineStyle = baseStyle?.copyWith(decoration: TextDecoration.underline);

          if (nested != null && nested.isNotEmpty) {
            spans.addAll(_buildSpans(context, nested, underlineStyle, globalIndex * 1000));
          } else {
            spans.add(TextSpan(text: content, style: underlineStyle));
          }

        case 'strikethrough':
          final nested = segment.metadata['nested'] as List<ParsedTextSegment>?;
          final content = segment.metadata['content'] as String? ?? '';
          final strikeStyle = baseStyle?.copyWith(decoration: TextDecoration.lineThrough);

          if (nested != null && nested.isNotEmpty) {
            spans.addAll(_buildSpans(context, nested, strikeStyle, globalIndex * 1000));
          } else {
            spans.add(TextSpan(text: content, style: strikeStyle));
          }

        case 'code':
          final content = segment.metadata['content'] as String? ?? '';
          spans.add(
            TextSpan(
              text: content,
              style:
                  widget.codeStyle ??
                  baseStyle?.copyWith(
                    fontFamily: 'monospace',
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  ),
            ),
          );

        default:
          spans.add(TextSpan(text: segment.text, style: baseStyle));
      }
    }

    return spans;
  }
}
