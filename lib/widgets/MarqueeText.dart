import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:auto_size_text/auto_size_text.dart';

// Based on code from: https://github.com/nt4f04uNd/nt4f04unds_widgets/blob/f14e448d23d347f17c05549972e638d61cf300b4/lib/src/widgets/marquee.dart

class MarqueeText extends StatelessWidget {
  const MarqueeText({
    required this.text,
    required this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.addedHeight = 6,
    this.color = Colors.white,
    this.velocity = 75.0,
    this.blankSpace = 75.0,
    this.startPadding = 2.0,
    this.startAfter = const Duration(milliseconds: 1000),
    this.pauseAfterRound = const Duration(milliseconds: 1500),
    this.isExpanded = true,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final double addedHeight;
  final Color color;
  final double velocity;
  final double blankSpace;
  final double startPadding;
  final Duration startAfter;
  final Duration pauseAfterRound;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return isExpanded
        ? Expanded(child: innerBox(context))
        : Container(child: innerBox(context));
  }

  Widget innerBox(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: (fontSize + addedHeight) * MediaQuery.of(context).textScaleFactor, // +X to not trigger overflow on short strings
      child: AutoSizeText(
        text,
        minFontSize: (fontSize * 0.8).ceilToDouble(), // allow text to shrink a bit, so that strings can exceed a few symbols in length before starting to scroll
        maxFontSize: fontSize,
        maxLines: 1,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        ),
        overflowReplacement: Marquee(
          text: text,
          blankSpace: blankSpace,
          accelerationCurve: Curves.easeOutCubic,
          velocity: velocity,
          startPadding: startPadding,
          fadingEdgeStartFraction: 0,
          fadingEdgeEndFraction: 0.3,
          showFadingOnlyWhenScrolling: false,
          startAfter: startAfter,
          pauseAfterRound: pauseAfterRound,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
