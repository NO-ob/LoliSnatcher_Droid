import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/widgets/root/routing.dart';

class LoliHtml extends StatelessWidget {
  const LoliHtml(
    this.content, {
    this.style,
    super.key,
  });

  final String content;
  final Map<String, Style>? style;

  static Map<String, Style> defaultHtmlStyle(BuildContext context) {
    final Map<String, Style> htmlStyle = Style.fromThemeData(Theme.of(context));
    return {
      ...htmlStyle,
      'body':
          htmlStyle['body']?.copyWith(margin: Margins.zero, padding: HtmlPaddings.zero) ??
          Style(margin: Margins.zero, padding: HtmlPaddings.zero),
      'html':
          htmlStyle['html']?.copyWith(margin: Margins.zero, padding: HtmlPaddings.zero) ??
          Style(margin: Margins.zero, padding: HtmlPaddings.zero),
      'p':
          htmlStyle['p']?.copyWith(margin: Margins.zero, padding: HtmlPaddings.zero) ??
          Style(margin: Margins.zero, padding: HtmlPaddings.zero),
      'a': Style(
        color: Colors.blue,
        textDecoration: TextDecoration.underline,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Style> htmlStyle = defaultHtmlStyle(context);
    htmlStyle = {
      ...htmlStyle,
      ...?style?.map((k, v) {
        final defaultStyle = htmlStyle[k] ?? Style();
        final mergedStyle = defaultStyle.merge(v);

        return MapEntry(k, mergedStyle);
      }),
    };

    return Html(
      data: content,
      onLinkTap: (link, attr, el) async {
        if (link == null) return;

        if (await canLaunchUrlString(link)) {
          await launchUrlString(
            link,
            mode: LaunchMode.externalApplication,
          );
        } else {
          await internalRouting(context, link);
        }
      },
      extensions: const [],
      style: htmlStyle,
    );
  }
}
