import 'package:flutter/material.dart';

import 'package:auto_size_text_plus/auto_size_text_plus.dart';
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
  }) : textSpan = null;

  const MarqueeText.rich({
    required this.textSpan,
    required this.style,
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

  @override
  Widget build(BuildContext context) {
    final child = RepaintBoundary(child: innerBox(context));

    if (isExpanded) {
      return Expanded(child: child);
    }

    return child;
  }

  TextStyle get defaultStyle {
    return const TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }

  double get fontSize => style?.fontSize ?? defaultStyle.fontSize!;
  double get lineHeight => fontSize * 1.2;

  Widget innerBox(BuildContext context) {
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
          style: style?.copyWith(
                color: style?.color ?? Theme.of(context).colorScheme.onSurface,
              ) ??
              defaultStyle.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
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
        style: style?.copyWith(
              color: style?.color ?? Theme.of(context).colorScheme.onSurface,
            ) ??
            defaultStyle.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
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
          style: style?.copyWith(
                color: style?.color ?? Theme.of(context).colorScheme.onSurface,
              ) ??
              defaultStyle.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
