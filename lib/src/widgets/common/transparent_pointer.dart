import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// Code from: https://github.com/spkersten/flutter_transparent_pointer/blob/null-safety

/// This widget is invisible for its parent to hit testing, but still
/// allows its subtree to receive pointer events.
///
/// {@tool snippet}
///
/// In this example, a drag can be started anywhere in the widget, including on
/// top of the text button, even though the button is visually in front of the
/// background gesture detector. At the same time, the button is tappable.
///
/// ```dart
/// class MyWidget extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return Stack(
///       children: [
///         GestureDetector(
///           behavior: HitTestBehavior.opaque,
///           onVerticalDragStart: (_) => print("Background drag started"),
///         ),
///         Positioned(
///           top: 60,
///           left: 60,
///           height: 60,
///           width: 60,
///           child: TransparentPointer(
///             child: TextButton(
///               child: Text("Tap me"),
///               onPressed: () => print("You tapped me"),
///             ),
///           ),
///         ),
///       ],
///     );
///   }
/// }
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [IgnorePointer], which is also invisible for its parent during hit testing, but
///    does not allow its subtree to receive pointer events.
///  * [AbsorbPointer], which is visible during hit testing, but prevents its subtree
///    from receiving pointer event. The opposite of this widget.
class TransparentPointer extends SingleChildRenderObjectWidget {
  /// Creates a widget that is invisible for its parent to hit testing, but still
  /// allows its subtree to receive pointer events.
  const TransparentPointer({
    required super.child,
    this.transparent = true,
    super.key,
  });

  /// Whether this widget is invisible to its parent during hit testing.
  final bool transparent;

  @override
  RenderTransparentPointer createRenderObject(BuildContext context) {
    return RenderTransparentPointer(
      transparent: transparent,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderTransparentPointer renderObject) {
    renderObject.transparent = transparent;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('transparent', transparent));
  }
}

class RenderTransparentPointer extends RenderProxyBox {
  RenderTransparentPointer({
    RenderBox? child,
    bool transparent = true,
  })  : _transparent = transparent,
        super(child);

  bool get transparent => _transparent;
  bool _transparent;

  set transparent(bool value) {
    if (value == _transparent) {
      return;
    }
    _transparent = value;
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    final hit = super.hitTest(result, position: position);
    return !transparent && hit;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('transparent', transparent));
  }
}
