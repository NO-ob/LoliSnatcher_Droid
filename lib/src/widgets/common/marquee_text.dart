import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fast_marquee/fast_marquee.dart';

// Based on code from: https://github.com/nt4f04uNd/nt4f04unds_widgets/blob/f14e448d23d347f17c05549972e638d61cf300b4/lib/src/widgets/marquee.dart

class MarqueeText extends StatelessWidget {
  const MarqueeText({
    required this.text,
    this.style,
    this.velocity = 45.0,
    this.curve = Curves.linear,
    this.blankSpace = 50.0,
    this.startPadding = 0.0,
    this.startAfter = const Duration(milliseconds: 1000),
    this.pauseAfterRound = const Duration(milliseconds: 1500),
    this.isExpanded = true,
    this.reverse = false,
    this.allowDownscale = true,
    this.fadingEdgeStartFraction = 0,
    this.fadingEdgeEndFraction = 0.15,
    super.key,
  }) : textSpan = null,
       placeholderDimensions = const [];

  const MarqueeText.rich({
    required this.textSpan,
    this.style,
    this.velocity = 45.0,
    this.curve = Curves.linear,
    this.blankSpace = 50.0,
    this.startPadding = 0.0,
    this.startAfter = const Duration(milliseconds: 1000),
    this.pauseAfterRound = const Duration(milliseconds: 1500),
    this.isExpanded = true,
    this.reverse = false,
    this.allowDownscale = true,
    this.fadingEdgeStartFraction = 0,
    this.fadingEdgeEndFraction = 0.15,
    this.placeholderDimensions = const [
      PlaceholderDimensions(size: Size.square(20), alignment: PlaceholderAlignment.middle),
    ],
    super.key,
  }) : text = null;

  final String? text;
  final TextStyle? style;
  final TextSpan? textSpan;
  final double velocity;
  final Curve curve;
  final double blankSpace;
  final double startPadding;
  final Duration startAfter;
  final Duration pauseAfterRound;
  final bool isExpanded;
  final bool reverse;
  final bool allowDownscale;
  final double fadingEdgeStartFraction;
  final double fadingEdgeEndFraction;
  final List<PlaceholderDimensions> placeholderDimensions;

  @override
  Widget build(BuildContext context) {
    final child = RepaintBoundary(child: innerBox(context));

    if (isExpanded) {
      return Expanded(child: child);
    }

    return child;
  }

  Widget innerBox(BuildContext context) {
    final defaultStyle = DefaultTextStyle.of(context).style;
    final usedStyle = (style ?? defaultStyle).copyWith(
      height: 1,
    );
    final double fontSize = usedStyle.fontSize ?? 16;

    // allow text to shrink a bit, so that strings can exceed a few symbols in length before starting to scroll
    const double stepGranularity = 0.1;
    double minFontSize = double.parse((fontSize * 0.85).toStringAsFixed(1));
    // make sure that minFontSize is dividable by stepGranularity
    minFontSize = (minFontSize / stepGranularity).ceil() * stepGranularity;

    if (textSpan != null) {
      return Container(
        alignment: Alignment.centerLeft,
        child: AutoSizeText.rich(
          textSpan!,
          minFontSize: allowDownscale ? minFontSize : fontSize,
          maxFontSize: fontSize,
          maxLines: 1,
          stepGranularity: stepGranularity,
          style: usedStyle,
          placeholderDimensions: placeholderDimensions,
          overflowReplacement: Marquee.rich(
            textSpan: textSpan,
            blankSpace: blankSpace,
            curve: curve,
            velocity: velocity,
            startPadding: startPadding,
            fadingEdgeStartFraction: fadingEdgeStartFraction,
            fadingEdgeEndFraction: fadingEdgeEndFraction,
            reverse: reverse,
            showFadingOnlyWhenScrolling: false,
            startAfter: startAfter,
            pauseAfterRound: pauseAfterRound,
            placeholderDimensions: placeholderDimensions,
          ),
        ),
      );
    }

    return Container(
      alignment: Alignment.centerLeft,
      child: AutoSizeText(
        text!,
        minFontSize: allowDownscale ? minFontSize : fontSize,
        maxFontSize: fontSize,
        maxLines: 1,
        stepGranularity: stepGranularity,
        style: usedStyle,
        overflowReplacement: Marquee(
          text: text,
          blankSpace: blankSpace,
          curve: curve,
          velocity: velocity,
          startPadding: startPadding,
          fadingEdgeStartFraction: fadingEdgeStartFraction,
          fadingEdgeEndFraction: fadingEdgeEndFraction,
          reverse: reverse,
          showFadingOnlyWhenScrolling: false,
          startAfter: startAfter,
          pauseAfterRound: pauseAfterRound,
          style: usedStyle,
        ),
      ),
    );
  }
}
