// ignore_for_file: prefer_asserts_with_message

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// A messy workaround to allow showing/hiding the header programatically
// Basically a copy of flutter's SliverPersistentHeader code, with small changes to pass through the header key and add show/hide functions to to CustomFloatingHeader

class CustomSliverPersistentHeader extends StatelessWidget {
  const CustomSliverPersistentHeader({
    required this.delegate,
    super.key,
    this.pinned = false,
    this.floating = false,
    this.headerKey,
    this.onHeaderVisiblityChanged,
  });

  final SliverPersistentHeaderDelegate delegate;
  final bool pinned;
  final bool floating;
  final Key? headerKey;
  final ValueChanged<bool>? onHeaderVisiblityChanged;

  @override
  Widget build(BuildContext context) {
    if (floating && pinned) {
      return _SliverFloatingPinnedPersistentHeader(
        delegate: delegate,
        headerKey: headerKey,
        onHeaderVisiblityChanged: onHeaderVisiblityChanged,
      );
    }
    if (pinned) {
      return _SliverPinnedPersistentHeader(
        delegate: delegate,
        headerKey: headerKey,
        onHeaderVisiblityChanged: onHeaderVisiblityChanged,
      );
    }
    if (floating) {
      return _SliverFloatingPersistentHeader(
        delegate: delegate,
        headerKey: headerKey,
        onHeaderVisiblityChanged: onHeaderVisiblityChanged,
      );
    }
    return _SliverScrollingPersistentHeader(
      delegate: delegate,
      headerKey: headerKey,
      onHeaderVisiblityChanged: onHeaderVisiblityChanged,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<SliverPersistentHeaderDelegate>(
        'delegate',
        delegate,
      ),
    );
    final List<String> flags = <String>[
      if (pinned) 'pinned',
      if (floating) 'floating',
    ];
    if (flags.isEmpty) {
      flags.add('normal');
    }
    properties.add(IterableProperty<String>('mode', flags));
  }
}

class CustomFloatingHeader extends StatefulWidget {
  const CustomFloatingHeader({
    required this.child,
    required this.shrinkOffset,
    required this.overlapsContent,
    this.onVisibilityChanged,
    super.key,
  });

  final Widget child;
  final double shrinkOffset;
  final bool overlapsContent;
  final ValueChanged<bool>? onVisibilityChanged;

  @override
  // ignore: library_private_types_in_public_api
  CustomFloatingHeaderState createState() => CustomFloatingHeaderState();
}

class CustomFloatingHeaderState extends State<CustomFloatingHeader> {
  ScrollPosition? _position;

  int lastToggleTime = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_position != null) {
      _position!.isScrollingNotifier.removeListener(_isScrollingListener);
    }
    _position = Scrollable.maybeOf(context)?.position;
    if (_position != null) {
      _position!.isScrollingNotifier.addListener(_isScrollingListener);
    }
  }

  @override
  void didUpdateWidget(CustomFloatingHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    // print('didUpdateWidget: ${widget.overlapsContent} ${widget.shrinkOffset}');
    if (widget.overlapsContent != oldWidget.overlapsContent || widget.shrinkOffset != oldWidget.shrinkOffset) {
      widget.onVisibilityChanged?.call(widget.overlapsContent || widget.shrinkOffset == 0);
    }
  }

  @override
  void dispose() {
    if (_position != null) {
      _position!.isScrollingNotifier.removeListener(_isScrollingListener);
    }
    super.dispose();
  }

  RenderSliverFloatingPersistentHeader? _headerRenderer() {
    return context.findAncestorRenderObjectOfType<RenderSliverFloatingPersistentHeader>();
  }

  void show() {
    assert(_position != null);

    final RenderSliverFloatingPersistentHeader? header = _headerRenderer();
    if (widget.shrinkOffset != 0) {
      lastToggleTime = DateTime.now().millisecondsSinceEpoch;
      header?.maybeStartSnapAnimation(ScrollDirection.forward);
      widget.onVisibilityChanged?.call(true);
    }
  }

  void hide() {
    assert(_position != null);

    final RenderSliverFloatingPersistentHeader? header = _headerRenderer();
    if (widget.shrinkOffset == 0) {
      lastToggleTime = DateTime.now().millisecondsSinceEpoch;
      header?.updateScrollStartDirection(ScrollDirection.reverse);
      header?.maybeStopSnapAnimation(ScrollDirection.reverse);
      widget.onVisibilityChanged?.call(false);
    }
  }

  void _isScrollingListener() {
    assert(_position != null);

    final RenderSliverFloatingPersistentHeader? header = _headerRenderer();
    if ((lastToggleTime + 500) < DateTime.now().millisecondsSinceEpoch) {
      return;
    }
    if (_position!.isScrollingNotifier.value) {
      header?.updateScrollStartDirection(_position!.userScrollDirection);
      header?.maybeStopSnapAnimation(_position!.userScrollDirection);
      // widget.onVisibilityChanged?.call(_position!.userScrollDirection == ScrollDirection.forward);
    } else {
      header?.maybeStartSnapAnimation(_position!.userScrollDirection);
      // widget.onVisibilityChanged?.call(_position!.userScrollDirection == ScrollDirection.forward);
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class _SliverPersistentHeaderElement extends RenderObjectElement {
  _SliverPersistentHeaderElement(
    _SliverPersistentHeaderRenderObjectWidget super.widget, {
    this.floating = false,
    this.headerKey,
    this.onHeaderVisiblityChanged,
  });

  final bool floating;
  final Key? headerKey;
  final ValueChanged<bool>? onHeaderVisiblityChanged;

  @override
  _RenderSliverPersistentHeaderForWidgetsMixin get renderObject =>
      super.renderObject as _RenderSliverPersistentHeaderForWidgetsMixin;

  @override
  void mount(Element? parent, Object? newSlot) {
    super.mount(parent, newSlot);
    renderObject._element = this;
  }

  @override
  void unmount() {
    renderObject._element = null;
    super.unmount();
  }

  @override
  void update(_SliverPersistentHeaderRenderObjectWidget newWidget) {
    final _SliverPersistentHeaderRenderObjectWidget oldWidget = widget as _SliverPersistentHeaderRenderObjectWidget;
    super.update(newWidget);
    final SliverPersistentHeaderDelegate newDelegate = newWidget.delegate;
    final SliverPersistentHeaderDelegate oldDelegate = oldWidget.delegate;
    if (newDelegate != oldDelegate &&
        (newDelegate.runtimeType != oldDelegate.runtimeType || newDelegate.shouldRebuild(oldDelegate))) {
      renderObject.triggerRebuild();
    }
  }

  @override
  void performRebuild() {
    super.performRebuild();
    renderObject.triggerRebuild();
  }

  Element? child;

  void _build(double shrinkOffset, bool overlapsContent) {
    owner!.buildScope(this, () {
      final _SliverPersistentHeaderRenderObjectWidget sliverPersistentHeaderRenderObjectWidget =
          widget as _SliverPersistentHeaderRenderObjectWidget;
      child = updateChild(
        child,
        floating
            ? CustomFloatingHeader(
                key: headerKey,
                onVisibilityChanged: onHeaderVisiblityChanged,
                shrinkOffset: shrinkOffset,
                overlapsContent: overlapsContent,
                child: sliverPersistentHeaderRenderObjectWidget.delegate.build(
                  this,
                  shrinkOffset,
                  overlapsContent,
                ),
              )
            : sliverPersistentHeaderRenderObjectWidget.delegate.build(this, shrinkOffset, overlapsContent),
        null,
      );
    });
  }

  @override
  void forgetChild(Element child) {
    assert(child == this.child);
    this.child = null;
    super.forgetChild(child);
  }

  @override
  void insertRenderObjectChild(covariant RenderBox child, Object? slot) {
    assert(renderObject.debugValidateChild(child));
    renderObject.child = child;
  }

  @override
  void moveRenderObjectChild(covariant RenderObject child, Object? oldSlot, Object? newSlot) {
    assert(false);
  }

  @override
  void removeRenderObjectChild(covariant RenderObject child, Object? slot) {
    renderObject.child = null;
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    if (child != null) {
      visitor(child!);
    }
  }
}

abstract class _SliverPersistentHeaderRenderObjectWidget extends RenderObjectWidget {
  const _SliverPersistentHeaderRenderObjectWidget({
    required this.delegate,
    this.floating = false,
    this.headerKey,
    this.onHeaderVisiblityChanged,
  });

  final SliverPersistentHeaderDelegate delegate;
  final bool floating;
  final Key? headerKey;
  final ValueChanged<bool>? onHeaderVisiblityChanged;

  @override
  _SliverPersistentHeaderElement createElement() => _SliverPersistentHeaderElement(
    this,
    floating: floating,
    headerKey: headerKey,
    onHeaderVisiblityChanged: onHeaderVisiblityChanged,
  );

  @override
  _RenderSliverPersistentHeaderForWidgetsMixin createRenderObject(BuildContext context);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(
      DiagnosticsProperty<SliverPersistentHeaderDelegate>(
        'delegate',
        delegate,
      ),
    );
  }
}

mixin _RenderSliverPersistentHeaderForWidgetsMixin on RenderSliverPersistentHeader {
  _SliverPersistentHeaderElement? _element;

  @override
  double get minExtent => (_element!.widget as _SliverPersistentHeaderRenderObjectWidget).delegate.minExtent;

  @override
  double get maxExtent => (_element!.widget as _SliverPersistentHeaderRenderObjectWidget).delegate.maxExtent;

  @override
  void updateChild(double shrinkOffset, bool overlapsContent) {
    assert(_element != null);
    _element!._build(shrinkOffset, overlapsContent);
  }

  @protected
  void triggerRebuild() {
    markNeedsLayout();
  }
}

class _SliverScrollingPersistentHeader extends _SliverPersistentHeaderRenderObjectWidget {
  const _SliverScrollingPersistentHeader({
    required super.delegate,
    super.headerKey,
    super.onHeaderVisiblityChanged,
  });

  @override
  _RenderSliverPersistentHeaderForWidgetsMixin createRenderObject(BuildContext context) {
    return _RenderSliverScrollingPersistentHeaderForWidgets(
      stretchConfiguration: delegate.stretchConfiguration,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant _RenderSliverScrollingPersistentHeaderForWidgets renderObject,
  ) {
    renderObject.stretchConfiguration = delegate.stretchConfiguration;
  }
}

class _RenderSliverScrollingPersistentHeaderForWidgets extends RenderSliverScrollingPersistentHeader
    with _RenderSliverPersistentHeaderForWidgetsMixin {
  _RenderSliverScrollingPersistentHeaderForWidgets({
    super.stretchConfiguration,
  });
}

class _SliverPinnedPersistentHeader extends _SliverPersistentHeaderRenderObjectWidget {
  const _SliverPinnedPersistentHeader({
    required super.delegate,
    super.headerKey,
    super.onHeaderVisiblityChanged,
  });

  @override
  _RenderSliverPersistentHeaderForWidgetsMixin createRenderObject(BuildContext context) {
    return _RenderSliverPinnedPersistentHeaderForWidgets(
      stretchConfiguration: delegate.stretchConfiguration,
      showOnScreenConfiguration: delegate.showOnScreenConfiguration,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant _RenderSliverPinnedPersistentHeaderForWidgets renderObject) {
    renderObject
      ..stretchConfiguration = delegate.stretchConfiguration
      ..showOnScreenConfiguration = delegate.showOnScreenConfiguration;
  }
}

class _RenderSliverPinnedPersistentHeaderForWidgets extends RenderSliverPinnedPersistentHeader
    with _RenderSliverPersistentHeaderForWidgetsMixin {
  _RenderSliverPinnedPersistentHeaderForWidgets({
    super.stretchConfiguration,
    super.showOnScreenConfiguration,
  });
}

class _SliverFloatingPersistentHeader extends _SliverPersistentHeaderRenderObjectWidget {
  const _SliverFloatingPersistentHeader({
    required super.delegate,
    super.headerKey,
    super.onHeaderVisiblityChanged,
  }) : super(
         floating: true,
       );

  @override
  _RenderSliverPersistentHeaderForWidgetsMixin createRenderObject(BuildContext context) {
    return _RenderSliverFloatingPersistentHeaderForWidgets(
      vsync: delegate.vsync,
      snapConfiguration: delegate.snapConfiguration,
      stretchConfiguration: delegate.stretchConfiguration,
      showOnScreenConfiguration: delegate.showOnScreenConfiguration,
    );
  }

  @override
  void updateRenderObject(BuildContext context, _RenderSliverFloatingPersistentHeaderForWidgets renderObject) {
    renderObject.vsync = delegate.vsync;
    renderObject.snapConfiguration = delegate.snapConfiguration;
    renderObject.stretchConfiguration = delegate.stretchConfiguration;
    renderObject.showOnScreenConfiguration = delegate.showOnScreenConfiguration;
  }
}

class _RenderSliverFloatingPinnedPersistentHeaderForWidgets extends RenderSliverFloatingPinnedPersistentHeader
    with _RenderSliverPersistentHeaderForWidgetsMixin {
  _RenderSliverFloatingPinnedPersistentHeaderForWidgets({
    required super.vsync,
    super.snapConfiguration,
    super.stretchConfiguration,
    super.showOnScreenConfiguration,
  });
}

class _SliverFloatingPinnedPersistentHeader extends _SliverPersistentHeaderRenderObjectWidget {
  const _SliverFloatingPinnedPersistentHeader({
    required super.delegate,
    super.headerKey,
    super.onHeaderVisiblityChanged,
  }) : super(
         floating: true,
       );

  @override
  _RenderSliverPersistentHeaderForWidgetsMixin createRenderObject(BuildContext context) {
    return _RenderSliverFloatingPinnedPersistentHeaderForWidgets(
      vsync: delegate.vsync,
      snapConfiguration: delegate.snapConfiguration,
      stretchConfiguration: delegate.stretchConfiguration,
      showOnScreenConfiguration: delegate.showOnScreenConfiguration,
    );
  }

  @override
  void updateRenderObject(BuildContext context, _RenderSliverFloatingPinnedPersistentHeaderForWidgets renderObject) {
    renderObject.vsync = delegate.vsync;
    renderObject.snapConfiguration = delegate.snapConfiguration;
    renderObject.stretchConfiguration = delegate.stretchConfiguration;
    renderObject.showOnScreenConfiguration = delegate.showOnScreenConfiguration;
  }
}

class _RenderSliverFloatingPersistentHeaderForWidgets extends RenderSliverFloatingPersistentHeader
    with _RenderSliverPersistentHeaderForWidgetsMixin {
  _RenderSliverFloatingPersistentHeaderForWidgets({
    required super.vsync,
    super.snapConfiguration,
    super.stretchConfiguration,
    super.showOnScreenConfiguration,
  });
}
