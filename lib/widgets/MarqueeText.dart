import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:fast_marquee/fast_marquee.dart' as FM;
import 'package:auto_size_text/auto_size_text.dart';

// Based on code from: https://github.com/nt4f04uNd/nt4f04unds_widgets/blob/f14e448d23d347f17c05549972e638d61cf300b4/lib/src/widgets/marquee.dart

class MarqueeText extends StatelessWidget {
  MarqueeText({
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
  }) : super(key: key) {
    this.color = this.color == null ? Get.theme.colorScheme.onBackground : this.color;
  }

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final double addedHeight;
  Color? color;
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

  Widget oldMarquee() {
    return Marquee(
      text: text,
      blankSpace: blankSpace,
      accelerationCurve: curve,
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
    );
  }

  Widget newMarquee() {
    // This one can detect when text overflows by itself, but I'll leave AutoSize to resize text a bit when nearing overflow
    return FM.Marquee(
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
        color: color,
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
          color: color,
          fontWeight: fontWeight,
        ),
        overflowReplacement: newMarquee(),
      ),
    );
  }
}
