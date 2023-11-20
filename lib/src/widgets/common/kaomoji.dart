import 'package:flutter/material.dart';

// TODO add more, maybe make themed lists (happy, angry...) and randomly pick one on first build?

class Kaomoji extends StatelessWidget {
  const Kaomoji({
    required this.type,
    this.style,
    this.richText = false,
    super.key,
  });

  final KaomojiType type;
  final TextStyle? style;
  final bool richText;

  @override
  Widget build(BuildContext context) {
    if (richText) {
      return RichText(
        text: TextSpan(
          style: style,
          children: [
            TextSpan(
              text: ' ${type.kaomoji} ',
            ),
          ],
        ),
      );
    } else {
      return Text(
        ' ${type.kaomoji} ',
        style: style,
      );
    }
  }
}

enum KaomojiType {
  shrug,
  angryHandsUp;

  String get kaomoji {
    switch (this) {
      case KaomojiType.shrug:
        return r'¯\_(ツ)_/¯';
      case KaomojiType.angryHandsUp:
        return '(」°ロ°)」';
    }
  }
}
