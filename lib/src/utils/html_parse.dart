import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

import 'package:lolisnatcher/src/utils/html_color.dart' as html_color;
import 'package:url_launcher/url_launcher_string.dart';

// Original code: https://gist.github.com/seven332/9dc76255d959c8c5194cbd92068b0f60

/// Parses [html] into a Flutter [InlineSpan] tree.
///
/// [style] is the base text style applied to unstyled content.
/// [isBordered] adds a black background paint to every text run (used for
/// image-note overlays so text remains readable over varied backgrounds).
/// [onLinkTap] is called when an `<a href>` link is tapped; if omitted,
/// links are rendered with underline styling but are not tappable.
InlineSpan parse(
  String html, {
  TextStyle? style,
  bool isBordered = false,
  void Function(String url)? onLinkTap = _defaultUrlHandler,
}) {
  final document = parser.parse(html);
  return _parseRecursive(document.body, style, isBordered: isBordered, onLinkTap: onLinkTap);
}

void _defaultUrlHandler(String url) {
  launchUrlString(
    url,
    mode: LaunchMode.externalApplication,
  );
}

InlineSpan _parseRecursive(
  dynamic node,
  TextStyle? style, {
  bool isBordered = false,
  int prevChar = 0x20,
  void Function(String url)? onLinkTap,
}) {
  if (node is dom.Text) {
    return _parseText(node, style, prevChar);
  } else if (node is dom.Element) {
    return _parseElement(node, style, isBordered: isBordered, onLinkTap: onLinkTap);
  } else {
    return _parseParent(node as dom.Node, style, null, isBordered: isBordered, onLinkTap: onLinkTap);
  }
}

/// Collapses runs of whitespace in [text] to a single space, respecting the
/// character that preceded this text node ([prevChar]) so that a leading space
/// is only kept when the previous output did not already end with whitespace.
/// Returns the normalised string and the last character written (for chaining).
({String text, int lastChar}) _fixWhitespaceInText(String text, int prevChar) {
  final sb = StringBuffer();
  int pre = prevChar;
  const sp = 0x20; // ' '
  const nl = 0x0A; // '\n'
  for (final int c in text.codeUnits) {
    if (c == sp || c == nl) {
      if (pre != sp && pre != nl) {
        sb.writeCharCode(sp);
        pre = sp;
      }
    } else {
      sb.writeCharCode(c);
      pre = c;
    }
  }
  return (text: sb.toString(), lastChar: pre);
}

InlineSpan _parseText(dom.Text text, TextStyle? style, int prevChar) {
  final t = text.data;
  if (t.isEmpty) return const TextSpan(text: '');
  final fixed = _fixWhitespaceInText(t, prevChar).text;
  if (fixed.isEmpty) return const TextSpan(text: '');
  return TextSpan(text: fixed, style: style);
}

final _fontSizePropertyRegex = RegExp(r'font-size\s*:\s*([^;]+)', caseSensitive: false);
final _fontSizeValueRegex = RegExp(r'^([+-]?[0-9]*\.?[0-9]+)(px|%|em|pt|rem)?$');
final _colorPropertyRegex = RegExp(r'(?:^|;)\s*color\s*:\s*([^;]+)', caseSensitive: false);

/// Parses a CSS `font-size` value from an inline [style] attribute string.
/// Returns the resolved size in logical pixels given the [currentSize] for
/// relative units, or `null` if no `font-size` is present or the value is
/// unrecognised.
///
/// Supported units:
///   `px`   — used directly.
///   `%`    — percentage of [currentSize].
///   `em`   — multiple of [currentSize].
///   `pt`   — converted via 1 pt = 96/72 px.
///   Named  — `xx-small`=10, `x-small`=12, `small`=13.333, `medium`=16,
///             `large`=18, `x-large`=24, `xx-large`=32.
double? _parseFontSize(String style, double currentSize) {
  // Extract the font-size value from the style string.
  final match = _fontSizePropertyRegex.firstMatch(style);
  if (match == null) return null;
  final raw = match.group(1)!.trim().toLowerCase();

  // Named keyword sizes (matches browser defaults at 96 dpi).
  const named = <String, double>{
    'xx-small': 10,
    'x-small': 12,
    'small': 13.333,
    'medium': 16,
    'large': 18,
    'x-large': 24,
    'xx-large': 32,
  };
  if (named.containsKey(raw)) return named[raw];

  // Numeric units.
  final numMatch = _fontSizeValueRegex.firstMatch(raw);
  if (numMatch == null) return null;
  final value = double.tryParse(numMatch.group(1)!);
  if (value == null || value <= 0) return null;
  final unit = numMatch.group(2) ?? 'px';
  return switch (unit) {
    '%' => currentSize * value / 100,
    'em' || 'rem' => currentSize * value,
    'pt' => value * 96 / 72,
    _ => value, // px or bare number
  };
}

/// Applies any `font-size` and `color` found in [element]'s `style` attribute to [style].
/// Returns the (possibly updated) style, or the original if nothing matched.
TextStyle? _applyInlineStyle(dom.Element element, TextStyle? style) {
  final inlineStyle = element.attributes['style'] ?? '';
  if (inlineStyle.isEmpty) return style;
  var s = style;
  final size = _parseFontSize(inlineStyle, s?.fontSize ?? 14);
  if (size != null) s = (s ?? const TextStyle()).copyWith(fontSize: size);
  final colorMatch = _colorPropertyRegex.firstMatch(inlineStyle);
  if (colorMatch != null) {
    final color = html_color.tryParse(colorMatch.group(1)!.trim());
    if (color != null) s = (s ?? const TextStyle()).copyWith(color: color);
  }
  return s;
}

TextDecoration _combine(TextDecoration? nullable, TextDecoration nonnull) {
  if (nullable == null) {
    return nonnull;
  } else {
    return TextDecoration.combine([nullable, nonnull]);
  }
}

InlineSpan _parseElement(
  dom.Element element,
  TextStyle? style, {
  bool isBordered = false,
  void Function(String url)? onLinkTap,
}) {
  final tag = element.localName?.toLowerCase();

  GestureRecognizer? recognizer;

  // Apply inline font-size and color from style="" before any tag-specific logic.
  style = _applyInlineStyle(element, style);
  // Use a non-null working copy so all copyWith calls below are safe.
  var s = style ?? const TextStyle();
  // Tracks whether s was modified from the incoming style.
  // When true, s is passed explicitly to children; when false, children inherit.
  bool styleChanged = style != null;

  switch (tag) {
    case 'br':
      return TextSpan(text: '\n', style: style);
    case 'strong':
    case 'b':
      s = s.copyWith(fontWeight: FontWeight.bold);
      styleChanged = true;
      break;
    case 'em':
    case 'cite':
    case 'dfn':
    case 'i':
      s = s.copyWith(fontStyle: FontStyle.italic);
      styleChanged = true;
      break;
    case 'u':
    case 'ins':
      s = s.copyWith(decoration: _combine(s.decoration, TextDecoration.underline));
      styleChanged = true;
      break;
    case 'del':
    case 's':
    case 'strike':
      s = s.copyWith(decoration: _combine(s.decoration, TextDecoration.lineThrough));
      styleChanged = true;
      break;
    case 'small':
      s = s.copyWith(fontSize: (s.fontSize ?? 14) - 2);
      styleChanged = true;
      break;
    case 'big':
      s = s.copyWith(fontSize: (s.fontSize ?? 14) + 2);
      styleChanged = true;
      break;
    case 'a':
      final href = element.attributes['href'] ?? '';
      s = s.copyWith(
        decoration: _combine(s.decoration, TextDecoration.underline),
        color: Colors.blue.shade300,
        decorationColor: Colors.blue.shade300,
      );
      styleChanged = true;
      if (href.isNotEmpty && onLinkTap != null) {
        recognizer = TapGestureRecognizer()..onTap = () => onLinkTap(href);
      }
      break;
    case 'ruby':
      // Always pass the accumulated style s (never null) because _parseRuby
      // creates a new Text.rich widget outside the span tree and cannot rely
      // on Flutter span-style inheritance.
      return _parseRuby(element, s, isBordered: isBordered, onLinkTap: onLinkTap);
    case 'rb':
    case 'rt':
      // Handled inside _parseRuby; if encountered standalone, treat as plain span
      break;
    case 'tn':
      element.text = 'Translator note: ${element.text}';
      s = s.copyWith(fontSize: (s.fontSize ?? 14) - 2);
      styleChanged = true;
      break;
    case 'font':
      final Color? color = html_color.tryParse(element.attributes['color'] ?? '');
      if (color != null) {
        s = s.copyWith(color: color);
        styleChanged = true;
      }
      break;
    default:
      break;
  }

  if (isBordered) {
    final Paint paint = Paint()
      ..color = Colors.black.withValues(alpha: 0.75)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    s = s.copyWith(background: paint);
    styleChanged = true;
  }

  return _parseParent(
    element,
    styleChanged ? s : null,
    recognizer,
    isBordered: isBordered,
    onLinkTap: onLinkTap,
  );
}

/// Collects base and ruby spans from a `<ruby>` element's children, using [baseStyle]
/// and [rubyStyle] so that text nodes carry an explicit style (required because
/// `Text.rich` inside a `WidgetSpan` is outside the outer `RichText` tree and cannot
/// rely on style inheritance from the surrounding span tree).
/// Collects `<rb>` (or bare text) as base and `<rt>` as annotation, recursing into each
/// so that nested formatting tags (bold, italic, etc.) inside them still work.
({List<InlineSpan> base, List<InlineSpan> ruby}) _collectRubySpans(
  dom.Element element,
  TextStyle baseStyle,
  TextStyle rubyStyle, {
  bool isBordered = false,
  void Function(String url)? onLinkTap,
}) {
  final List<InlineSpan> baseSpans = [];
  final List<InlineSpan> rubySpans = [];

  for (final child in element.nodes) {
    if (child is dom.Element) {
      final tag = child.localName?.toLowerCase();
      if (tag == 'rt') {
        rubySpans.addAll(_collectSpans(child, rubyStyle, isBordered: isBordered, onLinkTap: onLinkTap));
        continue;
      } else if (tag == 'rb') {
        baseSpans.addAll(_collectSpans(child, baseStyle, isBordered: isBordered, onLinkTap: onLinkTap));
        continue;
      }
    }
    // Bare text nodes (or other elements) inside <ruby> are base content.
    final span = _parseRecursive(
      child,
      baseStyle,
      isBordered: isBordered,
      prevChar: _lastCharOf(baseSpans.lastOrNull ?? const TextSpan(text: ' '), 0x20),
      onLinkTap: onLinkTap,
    );
    baseSpans.add(span);
  }

  return (base: baseSpans, ruby: rubySpans);
}

InlineSpan _parseRuby(
  dom.Element element,
  TextStyle? style, {
  bool isBordered = false,
  void Function(String url)? onLinkTap,
}) {
  final double baseFontSize = style?.fontSize ?? 14;
  final TextStyle baseStyle = style ?? const TextStyle();
  final TextStyle rubyStyle = baseStyle.copyWith(fontSize: baseFontSize * 0.6);

  // Text.rich inside a WidgetSpan is outside the RichText tree, so it does
  // not inherit DefaultTextStyle — an explicit style is always required.
  return WidgetSpan(
    alignment: PlaceholderAlignment.middle,
    child: Builder(
      builder: (context) {
        final inherited = DefaultTextStyle.of(context).style;
        // Merge inherited theme style so color/font are always resolved.
        final resolvedBase = inherited.merge(baseStyle);
        final resolvedRuby = inherited.merge(rubyStyle);
        final collected = _collectRubySpans(
          element,
          resolvedBase,
          resolvedRuby,
          isBordered: isBordered,
          onLinkTap: onLinkTap,
        );
        if (collected.base.isEmpty && collected.ruby.isEmpty) {
          return const SizedBox.shrink();
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (collected.ruby.isNotEmpty) Text.rich(TextSpan(children: collected.ruby, style: resolvedRuby)),
            if (collected.base.isNotEmpty) Text.rich(TextSpan(children: collected.base, style: resolvedBase)),
          ],
        );
      },
    ),
  );
}

/// Collects the child spans of a node by recursing into each of its children,
/// propagating trailing-whitespace context across siblings.
List<InlineSpan> _collectSpans(
  dom.Node node,
  TextStyle? style, {
  bool isBordered = false,
  void Function(String url)? onLinkTap,
}) {
  final List<InlineSpan> spans = [];
  int prevChar = 0x20;
  for (final child in node.nodes) {
    final span = _parseRecursive(child, style, isBordered: isBordered, prevChar: prevChar, onLinkTap: onLinkTap);
    spans.add(span);
    prevChar = _lastCharOf(span, 0x41);
  }
  return spans;
}

/// Returns the last code unit written by [span], or [fallback] if unknown.
/// Used to propagate trailing-whitespace context across siblings.
int _lastCharOf(InlineSpan span, int fallback) {
  if (span is TextSpan) {
    // Check own text first, then recurse into last child
    final t = span.text;
    if (t != null && t.isNotEmpty) return t.codeUnitAt(t.length - 1);
    final children = span.children;
    if (children != null && children.isNotEmpty) {
      return _lastCharOf(children.last, fallback);
    }
  }
  // WidgetSpan or empty span: treat as non-whitespace so next sibling's
  // leading space is preserved.
  return fallback;
}

InlineSpan _parseParent(
  dom.Node node,
  TextStyle? style,
  GestureRecognizer? recognizer, {
  bool isBordered = false,
  void Function(String url)? onLinkTap,
}) {
  final List<InlineSpan> children = [];
  // Start as if preceded by a space so leading whitespace of the first text
  // node is collapsed (matches browser behaviour for block-level containers).
  int prevChar = 0x20;
  for (final item in node.nodes) {
    final span = _parseRecursive(item, style, isBordered: isBordered, prevChar: prevChar, onLinkTap: onLinkTap);
    children.add(span);
    prevChar = _lastCharOf(span, 0x41 /* non-space fallback for WidgetSpan */);
  }

  // Avoid TextSpan with no child
  if (children.isEmpty) {
    return const TextSpan(text: '');
  }

  // Avoid TextSpan with only one child
  if (children.length == 1) {
    final span = children.single;
    if (span is TextSpan) {
      // Keep origin style/recognizer, or use parent style/recognizer
      if ((span.style != null || style == null) && (span.recognizer != null || recognizer == null)) {
        return span;
      } else {
        return TextSpan(
          text: span.text,
          style: span.style ?? style,
          recognizer: span.recognizer ?? recognizer,
        );
      }
    }

    // Non-TextSpan (e.g. WidgetSpan): the parent has no text/recognizer to contribute, return as-is
    return span;
  }

  return TextSpan(
    children: children,
    style: style,
    recognizer: recognizer,
  );
}
