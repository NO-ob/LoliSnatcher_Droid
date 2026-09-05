import 'package:flutter/widgets.dart';

import 'package:scroll_to_index/scroll_to_index.dart';

class WaterfallScrollController extends SimpleAutoScrollController {
  WaterfallScrollController({
    required super.viewportBoundaryGetter,
    super.initialScrollOffset,
  }) : super(
         beginGetter: (rect) => rect.top,
         endGetter: (rect) => rect.bottom,
       );

  // Scrollbar track clicks and page buttons use driven scrolling, while
  // scrollToIndex marks its restoration animations with isAutoScrolling.
  bool get isPaging => hasClients && !isAutoScrolling && (position as _WaterfallScrollPosition).isDrivenScrolling;

  @override
  ScrollPosition createScrollPosition(ScrollPhysics physics, ScrollContext context, ScrollPosition? oldPosition) {
    return _WaterfallScrollPosition(
      physics: physics,
      context: context,
      initialPixels: initialScrollOffset,
      keepScrollOffset: keepScrollOffset,
      oldPosition: oldPosition,
      debugLabel: debugLabel,
    );
  }
}

class _WaterfallScrollPosition extends ScrollPositionWithSingleContext {
  _WaterfallScrollPosition({
    required super.physics,
    required super.context,
    super.initialPixels,
    super.keepScrollOffset,
    super.oldPosition,
    super.debugLabel,
  });

  bool get isDrivenScrolling => activity is DrivenScrollActivity;
}
