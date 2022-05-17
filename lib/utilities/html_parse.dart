import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

import 'package:LoliSnatcher/utilities/html_color.dart' as htmlColor;

// Original code: https://gist.github.com/seven332/9dc76255d959c8c5194cbd92068b0f60

// TODO Add tag handler
// TODO Add GestureRecognizer for a tag
InlineSpan parse(String html, TextStyle style, bool isBordered) {
  final document = parser.parse(html);
  final span = _parseRecursive(document.body, style, true, isBordered);
  return span;
}

InlineSpan _parseRecursive(dynamic node, TextStyle style, bool styleChanged, bool isBordered) {
  if (node is dom.Text) {
    return _parseText(node, style, styleChanged, isBordered);
  } else if (node is dom.Element) {
    return _parseElement(node, style, styleChanged, isBordered);
  } else {
    return _parseOtherNode(node as dom.Node, style, styleChanged, isBordered);
  }
}

// TODO the method always remove whitespace at leading,
//  but it should check the tail of the previous span
String _fixWhitespaceInText(String text) {
  final sb = new StringBuffer();
  int pre = ' '.codeUnitAt(0);
  for (int c in text.codeUnits) {
    if (c == ' '.codeUnitAt(0) || c == '\n'.codeUnitAt(0)) {
      if (pre != ' '.codeUnitAt(0) && pre != '\n'.codeUnitAt(0)) {
        sb.writeCharCode(' '.codeUnitAt(0));
        pre = c;
      }
    } else {
      sb.writeCharCode(c);
      pre = c;
    }
  }
  return sb.toString();
}

InlineSpan _parseText(dom.Text text, TextStyle style, bool styleChanged, bool isBordered) {
  var t = text.data;
  if (t == null || t.isEmpty) return TextSpan(text: '');
  // t = _fixWhitespaceInText(t);
  return TextSpan(text: t, style: styleChanged ? style : null);
}

TextDecoration _combine(TextDecoration? nullable, TextDecoration nonnull) {
  if (nullable == null) return nonnull;
  else return TextDecoration.combine([nullable, nonnull]);
}

InlineSpan _parseElement(dom.Element element, TextStyle style, bool styleChanged, bool isBordered) {
  final tag = element.localName?.toLowerCase();

  GestureRecognizer? recognizer;

  switch (tag) {
    case "body":
    case "span": //?
    case "div": //?
      // Ignore
      break;
    case "br":
      return TextSpan(text: "\n", style: styleChanged ? style : null);
    case "strong":
    case "b":
      style = style.copyWith(fontWeight: FontWeight.bold);
      styleChanged = true;
      break;
    case "em":
    case "cite":
    case "dfn":
    case "i":
      style = style.copyWith(fontStyle: FontStyle.italic);
      styleChanged = true;
      break;
    case "u":
    case "ins":
      style = style.copyWith(decoration: _combine(style.decoration, TextDecoration.underline));
      styleChanged = true;
      break;
    case "del":
    case "s":
    case "strike":
      style = style.copyWith(decoration: _combine(style.decoration, TextDecoration.lineThrough));
      styleChanged = true;
      break;
    case "small":
      style = style.copyWith(fontSize: (style.fontSize ?? 14) - 2);
      styleChanged = true;
      break;
    case "big":
      style = style.copyWith(fontSize: (style.fontSize ?? 14) + 2);
      styleChanged = true;
      break;
    case "tn":
      element.text = 'Translator note: ' + element.text;
      style = style.copyWith(fontSize: (style.fontSize ?? 14) - 2);
      styleChanged = true;
      break;
    case "font":
      Color? color = htmlColor.tryParse(element.attributes['color'] ?? '');
      if (color != null) {
        style = style.copyWith(color: color);
        styleChanged = true;
      }
      break;
    default:
      print("Unhandled tag: $tag");
      break;
  }

  if(isBordered) {
    Paint paint = Paint()
      ..color = Colors.black.withOpacity(0.75)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    style = style.copyWith(
      background: paint
    );
    styleChanged = true;
  }

  return _parseParent(element, style, styleChanged, recognizer, isBordered);
}

InlineSpan _parseOtherNode(dom.Node node, TextStyle style, bool styleChanged, bool isBordered) {
  return _parseParent(node, style, styleChanged, null, isBordered);
}

InlineSpan _parseParent(
  dom.Node node,
  TextStyle style,
  bool styleChanged,
  GestureRecognizer? recognizer,
  bool isBordered,
) {
  final List<InlineSpan> children = [];
  for (var item in node.nodes) {
    // The change of style is applied below
    var span = _parseRecursive(item, style, false, isBordered);
    children.add(span);
  }

  // Avoid TextSpan with no child
  if (children.length == 0) return TextSpan(text: '');

  // Avoid TextSpan with only one child
  if (children.length == 1) {
    final span = children.single;
    if (span is TextSpan) {
      // Keep origin style/recognizer, or use parent style/recognizer
      if ((span.style != null || !styleChanged) &&
        (span.recognizer != null || recognizer == null))
        return span;
      else return TextSpan(
        text: span.text,
        style: span.style != null ? span.style : style,
        recognizer: span.recognizer != null ? span.recognizer : recognizer,
      );
    }
    // TODO what if it's not TextSpan
  }

  return TextSpan(
    children: children,
    style: styleChanged ? style : null,
    recognizer: recognizer,
  );
}