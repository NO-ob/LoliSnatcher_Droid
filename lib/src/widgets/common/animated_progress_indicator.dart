import 'dart:math';

import 'package:flutter/material.dart';

enum IndicatorStyle {
  circular,
  linear;
}

const double _kMinCircularProgressIndicatorSize = 36.0;

class AnimatedProgressIndicator extends StatefulWidget {
  const AnimatedProgressIndicator({
    Key? key,
    required this.value,
    this.animationDuration,
    this.backgroundColor,
    this.valueColor,
    this.minHeight,
    this.strokeWidth = 4,
    this.indicatorStyle = IndicatorStyle.circular,
  }) : super(key: key);

  final double value;
  final Duration? animationDuration;
  final Color? backgroundColor;
  final Color? valueColor;
  final double? minHeight;
  final double strokeWidth;
  final IndicatorStyle indicatorStyle;

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
      double beginValue = valueTween.evaluate(curve);

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
            (widget.indicatorStyle == IndicatorStyle.circular ? indicatorTheme.circularTrackColor : indicatorTheme.linearTrackColor) ??
            Theme.of(context).colorScheme.background;
        final Color valueColor =
            valueColorTween?.evaluate(curve) ?? widget.valueColor ?? indicatorTheme.color ?? Theme.of(context).colorScheme.background;
        final double minHeight = widget.minHeight ?? indicatorTheme.linearMinHeight ?? 4.0;

        if (widget.indicatorStyle == IndicatorStyle.circular) {
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
        } else {
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
    required this.backgroundColor,
    required this.valueColor,
    required this.value,
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

    final double radius = (shortestSide / 2);

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
    final oldPainter = (oldDelegate as CircularProgressIndicatorPainter);
    return oldPainter.value != value ||
        oldPainter.backgroundColor != backgroundColor ||
        oldPainter.valueColor != valueColor ||
        oldPainter.strokeWidth != strokeWidth;
  }
}

class LinearProgressIndicatorPainter extends CustomPainter {
  LinearProgressIndicatorPainter({
    required this.backgroundColor,
    required this.valueColor,
    required this.value,
    this.strokeWidth = 4,
  });

  final double value;
  final double strokeWidth;
  final Color backgroundColor;
  final Color valueColor;

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
    linePath.addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width * clampedValue, size.height), Radius.circular(strokeWidth)));
    canvas.drawPath(linePath, trackPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final oldPainter = (oldDelegate as LinearProgressIndicatorPainter);
    return oldPainter.value != value ||
        oldPainter.backgroundColor != backgroundColor ||
        oldPainter.valueColor != valueColor ||
        oldPainter.strokeWidth != strokeWidth;
  }
}
