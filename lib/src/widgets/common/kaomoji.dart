import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final usedStyle = (style ?? Theme.of(context).textTheme.bodyLarge)?.copyWith(
      // fixed font style due to different fonts having different character sizes and therefore breaking layout of kaomojis
      fontFamily: GoogleFonts.notoSans().fontFamily,
    );

    if (richText) {
      return RichText(
        text: TextSpan(
          style: usedStyle,
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
        style: usedStyle,
      );
    }
  }
}

enum KaomojiType {
  shrug,
  angryHandsUp
  ;

  String get kaomoji {
    switch (this) {
      case KaomojiType.shrug:
        return r'¯\_(ツ)_/¯';
      case KaomojiType.angryHandsUp:
        return '(」°ロ°)」';
    }
  }
}
