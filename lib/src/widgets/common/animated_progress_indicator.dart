import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

enum IndicatorStyle {
  circular,
  square,
  linear;
}

const double _kMinCircularProgressIndicatorSize = 36;

class AnimatedProgressIndicator extends StatefulWidget {
  const AnimatedProgressIndicator({
    required this.value,
    this.animationDuration,
    this.backgroundColor,
    this.valueColor,
    this.minHeight,
    this.strokeWidth = 4,
    this.indicatorStyle = IndicatorStyle.circular,
    this.borderRadius = 0,
    super.key,
  });

  final double value;
  final Duration? animationDuration;
  final Color? backgroundColor;
  final Color? valueColor;
  final double? minHeight;
  final double strokeWidth;
  final IndicatorStyle indicatorStyle;
  final double borderRadius;

  @override
  State<AnimatedProgressIndicator> createState() => AnimatedProgressIndicatorState();
}

class AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> curve;
  late Tween<double> valueTween;
  late Tween<Color>? backgroundColorTween;
  late Tween<Color>? valueColorTween;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: widget.animationDuration ?? const Duration(seconds: 1),
      vsync: this,
    );

    curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );

    // Build the initial required tweens.
    valueTween = Tween<double>(
      begin: 0,
      end: widget.value,
    );

    backgroundColorTween = null;
    valueColorTween = null;

    controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.value != oldWidget.value) {
      // Try to start with the previous tween's end value. This ensures that we
      // have a smooth transition from where the previous animation reached.
      final double beginValue = valueTween.evaluate(curve);

      valueTween = Tween<double>(
        begin: beginValue,
        end: widget.value,
      );

      // Clear cached color tweens when the color hasn't changed.
      if (oldWidget.backgroundColor != widget.backgroundColor) {
        backgroundColorTween = Tween<Color>(
          begin: oldWidget.backgroundColor ?? Colors.transparent,
          end: widget.backgroundColor ?? Colors.transparent,
        );
      } else {
        backgroundColorTween = null;
      }

      if (oldWidget.valueColor != widget.valueColor) {
        valueColorTween = Tween<Color>(
          begin: oldWidget.valueColor ?? Colors.transparent,
          end: widget.valueColor ?? Colors.transparent,
        );
      } else {
        valueColorTween = null;
      }

      controller
        ..value = 0
        ..forward();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: curve,
      builder: (BuildContext context, Widget? child) {
        final ProgressIndicatorThemeData indicatorTheme = ProgressIndicatorTheme.of(context);
        final Color backgroundColor = backgroundColorTween?.evaluate(curve) ??
            widget.backgroundColor ??
            (widget.indicatorStyle == IndicatorStyle.linear ? indicatorTheme.linearTrackColor : indicatorTheme.circularTrackColor) ??
            Theme.of(context).colorScheme.surface;
        final Color valueColor = valueColorTween?.evaluate(curve) ?? widget.valueColor ?? indicatorTheme.color ?? Theme.of(context).colorScheme.surface;
        final double minHeight = widget.minHeight ?? indicatorTheme.linearMinHeight ?? 4.0;

        switch (widget.indicatorStyle) {
          case IndicatorStyle.circular:
            return Container(
              constraints: const BoxConstraints(
                minWidth: _kMinCircularProgressIndicatorSize,
                minHeight: _kMinCircularProgressIndicatorSize,
              ),
              child: CustomPaint(
                foregroundPainter: CircularProgressIndicatorPainter(
                  backgroundColor: backgroundColor,
                  valueColor: valueColor,
                  strokeWidth: widget.strokeWidth,
                  value: valueTween.evaluate(curve),
                ),
                child: child,
              ),
            );
          case IndicatorStyle.square:
            return CustomPaint(
              foregroundPainter: SquareProgressIndicatorPainter(
                backgroundColor: backgroundColor,
                valueColor: valueColor,
                strokeWidth: widget.strokeWidth,
                backgroundStrokeWidth: widget.strokeWidth,
                borderRadius: widget.borderRadius,
                value: valueTween.evaluate(curve),
              ),
              child: child,
            );
          case IndicatorStyle.linear:
            return Container(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: minHeight,
              ),
              child: CustomPaint(
                foregroundPainter: LinearProgressIndicatorPainter(
                  backgroundColor: backgroundColor,
                  valueColor: valueColor,
                  strokeWidth: widget.strokeWidth,
                  borderRadius: widget.borderRadius,
                  value: valueTween.evaluate(curve),
                ),
                child: child,
              ),
            );
        }
      },
    );
  }
}

class CircularProgressIndicatorPainter extends CustomPainter {
  CircularProgressIndicatorPainter({
    required this.value,
    this.valueColor = Colors.blue,
    this.backgroundColor = Colors.transparent,
    this.strokeWidth = 4,
  });

  final double value;
  final double strokeWidth;
  final Color backgroundColor;
  final Color valueColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final double shortestSide = min(size.width - strokeWidth, size.height - strokeWidth);

    final double radius = shortestSide / 2;

    const double startAngle = -(2 * pi * 0.25);
    final double sweepAngle = 2 * pi * value;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, backgroundPaint);

    final foregroundPaint = Paint()
      ..color = valueColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final oldPainter = oldDelegate as CircularProgressIndicatorPainter;
    return oldPainter.value != value ||
        oldPainter.backgroundColor != backgroundColor ||
        oldPainter.valueColor != valueColor ||
        oldPainter.strokeWidth != strokeWidth;
  }
}

class SquareProgressIndicatorPainter extends CustomPainter {
  SquareProgressIndicatorPainter({
    required this.value,
    this.valueColor = Colors.blue,
    this.backgroundColor = Colors.transparent,
    this.strokeWidth = 4,
    this.backgroundStrokeWidth = 4,
    this.clockwise = false,
    this.startPosition = 0,
    this.borderRadius = 10,
    this.strokeCap,
  });

  final double value;
  final Color valueColor;
  final Color backgroundColor;
  final double strokeWidth;
  final double backgroundStrokeWidth;
  final double borderRadius;
  final bool clockwise;
  final double startPosition;
  final StrokeCap? strokeCap;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint strokePaint = Paint()
      ..color = valueColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = strokeCap ?? (borderRadius > 0 ? StrokeCap.round : StrokeCap.square)
      ..strokeJoin = StrokeJoin.miter;

    final Paint emptyStrokePaint = Paint()
      ..color = backgroundStrokeWidth <= 0 ? Colors.white.withOpacity(0) : backgroundColor
      ..strokeWidth = backgroundStrokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = strokeCap ?? (borderRadius > 0 ? StrokeCap.round : StrokeCap.square)
      ..strokeJoin = StrokeJoin.miter;

    final emptyStrokePath = Path();
    final strokePath = Path();

    final strokeOffset = strokeWidth / 2;

    final topLeft = Offset(borderRadius + strokeOffset, borderRadius + strokeOffset);
    final topRight = Offset(size.width - borderRadius - strokeOffset, borderRadius + strokeOffset);
    final bottomRight = Offset(size.width - borderRadius - strokeOffset, size.height - borderRadius - strokeOffset);
    final bottomLeft = Offset(borderRadius + strokeOffset, size.height - borderRadius - strokeOffset);

    if (clockwise) {
      emptyStrokePath.moveTo(size.width - borderRadius - strokeOffset, strokeOffset);
      emptyStrokePath.arcTo(Rect.fromCircle(center: topRight, radius: borderRadius), -pi / 2, pi / 2, false);
      emptyStrokePath.lineTo(size.width - strokeOffset, size.height - borderRadius - strokeOffset);
      emptyStrokePath.arcTo(Rect.fromCircle(center: bottomRight, radius: borderRadius), 0, pi / 2, false);
      emptyStrokePath.lineTo(0 + borderRadius + strokeOffset, size.height - strokeOffset);
      emptyStrokePath.arcTo(Rect.fromCircle(center: bottomLeft, radius: borderRadius), pi / 2, pi / 2, false);
      emptyStrokePath.lineTo(0 + strokeOffset, borderRadius + strokeOffset);
      emptyStrokePath.arcTo(Rect.fromCircle(center: topLeft, radius: borderRadius), pi, pi / 2, false);
      emptyStrokePath.lineTo(size.width - borderRadius - strokeOffset, strokeOffset);
    } else {
      emptyStrokePath.moveTo(borderRadius + strokeOffset, strokeOffset);
      emptyStrokePath.arcTo(Rect.fromCircle(center: topLeft, radius: borderRadius), -pi / 2, -pi / 2, false);
      emptyStrokePath.lineTo(0 + strokeOffset, size.height - borderRadius - strokeOffset);
      emptyStrokePath.arcTo(Rect.fromCircle(center: bottomLeft, radius: borderRadius), -pi, -pi / 2, false);
      emptyStrokePath.lineTo(size.width - borderRadius - strokeOffset, size.height - strokeOffset);
      emptyStrokePath.arcTo(Rect.fromCircle(center: bottomRight, radius: borderRadius), pi / 2, -pi / 2, false);
      emptyStrokePath.lineTo(size.width - strokeOffset, borderRadius + strokeOffset);
      emptyStrokePath.arcTo(Rect.fromCircle(center: topRight, radius: borderRadius), 0, -pi / 2, false);
      emptyStrokePath.lineTo(borderRadius + strokeOffset, strokeOffset);

      // emptyStrokePath.moveTo(size.width / 2 - strokeWidth / 2, strokeOffset);
      // emptyStrokePath.lineTo(0 + strokeOffset + borderRadius, strokeOffset);
      // emptyStrokePath.arcTo(Rect.fromCircle(center: topLeft, radius: borderRadius), -pi / 2, -pi / 2, false);
      // emptyStrokePath.lineTo(0 + strokeOffset, size.height - borderRadius - strokeOffset);
      // emptyStrokePath.arcTo(Rect.fromCircle(center: bottomLeft, radius: borderRadius), -pi, -pi / 2, false);
      // emptyStrokePath.lineTo(size.width - borderRadius - strokeOffset, size.height - strokeOffset);
      // emptyStrokePath.arcTo(Rect.fromCircle(center: bottomRight, radius: borderRadius), pi / 2, -pi / 2, false);
      // emptyStrokePath.lineTo(size.width - strokeOffset, borderRadius + strokeOffset);
      // emptyStrokePath.arcTo(Rect.fromCircle(center: topRight, radius: borderRadius), 0, -pi / 2, false);
      // emptyStrokePath.lineTo(size.width / 2 - strokeWidth / 2, strokeOffset);
    }

    for (final PathMetric pathMetric in emptyStrokePath.computeMetrics()) {
      final startPos = clockwise ? startPosition : (1 - startPosition);
      strokePath.addPath(
        pathMetric.extractPath(
          pathMetric.length * startPos,
          pathMetric.length * value + pathMetric.length * startPos,
        ),
        Offset.zero,
      );
      strokePath.addPath(
        pathMetric.extractPath(
          0,
          pathMetric.length * (value - (1 - startPos)),
        ),
        Offset.zero,
      );
    }

    canvas.drawPath(emptyStrokePath, emptyStrokePaint);
    if (value > 0) canvas.drawPath(strokePath, strokePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final oldPainter = oldDelegate as SquareProgressIndicatorPainter;
    return oldPainter.value != value ||
        oldPainter.strokeWidth != strokeWidth ||
        oldPainter.backgroundColor != backgroundColor ||
        oldPainter.valueColor != valueColor ||
        oldPainter.clockwise != clockwise ||
        oldPainter.strokeCap != strokeCap ||
        oldPainter.backgroundColor != backgroundColor ||
        oldPainter.backgroundStrokeWidth != backgroundStrokeWidth;
  }
}

class LinearProgressIndicatorPainter extends CustomPainter {
  LinearProgressIndicatorPainter({
    required this.backgroundColor,
    required this.valueColor,
    required this.value,
    this.strokeWidth = 4,
    this.borderRadius = 4,
  });

  final double value;
  final double strokeWidth;
  final Color backgroundColor;
  final Color valueColor;
  final double borderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset.zero & size, backgroundPaint);

    final Paint trackPaint = Paint()
      ..color = valueColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    final double clampedValue = value.clamp(0.0, 1.0);
    final Path linePath = Path();
    linePath.addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width * clampedValue, size.height), Radius.circular(borderRadius)));
    canvas.drawPath(linePath, trackPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final oldPainter = oldDelegate as LinearProgressIndicatorPainter;
    return oldPainter.value != value ||
        oldPainter.backgroundColor != backgroundColor ||
        oldPainter.valueColor != valueColor ||
        oldPainter.strokeWidth != strokeWidth ||
        oldPainter.borderRadius != borderRadius;
  }
}
