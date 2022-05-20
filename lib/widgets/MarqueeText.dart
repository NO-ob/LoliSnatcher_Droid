import 'package:flutter/material.dart';
import 'package:fast_marquee/fast_marquee.dart';
import 'package:auto_size_text/auto_size_text.dart';

// Based on code from: https://github.com/nt4f04uNd/nt4f04unds_widgets/blob/f14e448d23d347f17c05549972e638d61cf300b4/lib/src/widgets/marquee.dart

class MarqueeText extends StatelessWidget {
  const MarqueeText({
    Key? key,
    required this.text,
    required this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.addedHeight = 6,
    this.color,
    this.velocity = 45.0,
    this.curve = Curves.linear,
    this.blankSpace = 50.0,
    this.startPadding = 0.0,
    this.startAfter = const Duration(milliseconds: 1000),
    this.pauseAfterRound = const Duration(milliseconds: 1500),
    this.isExpanded = true,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final double addedHeight;
  final Color? color;
  final double velocity;
  final Curve curve;
  final double blankSpace;
  final double startPadding;
  final Duration startAfter;
  final Duration pauseAfterRound;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return isExpanded
      ? Expanded(child: innerBox(context))
      : innerBox(context);
  }

  Widget marquee(BuildContext context) {
    // This one can detect when text overflows by itself, but I'll leave AutoSize to resize text a bit when nearing overflow
    return Marquee(
      text: text,
      blankSpace: blankSpace,
      curve: curve,
      velocity: velocity,
      startPadding: startPadding,
      fadingEdgeStartFraction: 0.0,
      fadingEdgeEndFraction: 0.15,
      showFadingOnlyWhenScrolling: false,
      startAfter: startAfter,
      pauseAfterRound: pauseAfterRound,
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? Theme.of(context).colorScheme.onBackground,
        fontWeight: fontWeight,
      ),
    );
  }

  Widget innerBox(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: (fontSize + addedHeight) * MediaQuery.of(context).textScaleFactor, // +X to not trigger overflow on short strings
      child: AutoSizeText(
        text,
        minFontSize: (fontSize * 0.8).ceilToDouble(), // allow text to shrink a bit, so that strings can exceed a few symbols in length before starting to scroll
        maxFontSize: fontSize,
        maxLines: 2,
        style: TextStyle(
          fontSize: fontSize,
          color: color ?? Theme.of(context).colorScheme.onBackground,
          fontWeight: fontWeight,
        ),
        overflowReplacement: marquee(context),
      ),
    );
  }
}
