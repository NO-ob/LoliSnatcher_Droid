import 'package:flutter/widgets.dart';

// Taken from: https://github.com/tewshi/bordered-text

/// Adds stroke to text widget
/// We can apply a very thin and subtle stroke to a [Text]
/// ```dart
/// BorderedText(
///   strokeWidth: 1.0,
///   text: Text(
///     'Bordered Text',
///     style: TextStyle(
///       decoration: TextDecoration.none,
///       decorationStyle: TextDecorationStyle.wavy,
///       decorationColor: Colors.red,
///     ),
///   ),
/// )
/// ```
class BorderedText extends StatelessWidget {
  const BorderedText({
    required this.child,
    this.strokeCap = StrokeCap.round,
    this.strokeJoin = StrokeJoin.round,
    this.strokeWidth = 6.0,
    this.strokeColor = const Color.fromRGBO(0, 0, 0, 1),
    super.key,
  });

  /// the stroke cap style
  final StrokeCap strokeCap;

  /// the stroke joint style
  final StrokeJoin strokeJoin;

  /// the stroke width
  final double strokeWidth;

  /// the stroke color
  final Color strokeColor;

  /// the [Text] widget to apply stroke on
  final Text child;

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    if (child.style != null) {
      style = child.style!.copyWith(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = strokeCap
          ..strokeJoin = strokeJoin
          ..strokeWidth = strokeWidth
          ..color = strokeColor,
        color: null,
      );
    } else {
      style = TextStyle(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = strokeCap
          ..strokeJoin = strokeJoin
          ..strokeWidth = strokeWidth
          ..color = strokeColor,
      );
    }

    return Stack(
      alignment: Alignment.center,
      textDirection: child.textDirection,
      children: [
        Text(
          child.data!,
          style: style,
          maxLines: child.maxLines,
          overflow: child.overflow,
          semanticsLabel: child.semanticsLabel,
          softWrap: child.softWrap,
          strutStyle: child.strutStyle,
          textAlign: child.textAlign,
          textDirection: child.textDirection,
          textScaler: child.textScaler,
        ),
        child,
      ],
    );
  }
}
