// ignore_for_file: prefer_asserts_with_message

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef InnerDrawerCallback =
    void Function(
      bool isOpened,
      InnerDrawerDirection direction,
    );

typedef InnerDragUpdateCallback =
    void Function(
      double value,
      InnerDrawerDirection direction,
    );

enum InnerDrawerDirection {
  start,
  end,
  ;

  bool get isStart => this == InnerDrawerDirection.start;
  bool get isEnd => this == InnerDrawerDirection.end;
}

enum InnerDrawerAnimation {
  static,
  linear,
  quadratic,
}

const double _kWidth = 400;
const double _kMinFlingVelocity = 365;
const Duration _kBaseSettleDuration = Duration(milliseconds: 246);

class InnerDrawer extends StatefulWidget {
  const InnerDrawer({
    required this.scaffold,
    this.leftChild,
    this.rightChild,
    this.offset = const IDOffset.horizontal(0.4),
    this.scale = const IDOffset.horizontal(1),
    this.proportionalChildArea = true,
    this.borderRadius = 0,
    this.tapScaffoldEnabled = false,
    this.onTapClose = false,
    this.swipe = true,
    this.swipeChild = false,
    this.duration,
    this.velocity = 1,
    this.boxShadow,
    this.colorTransitionChild,
    this.colorTransitionScaffold,
    this.leftAnimationType = InnerDrawerAnimation.static,
    this.rightAnimationType = InnerDrawerAnimation.static,
    this.backgroundDecoration,
    this.innerDrawerCallback,
    this.onDragUpdate,
    super.key,
  }) : assert(leftChild != null || rightChild != null),
       assert(borderRadius >= 0);

  final Widget scaffold;
  final Widget? leftChild;
  final Widget? rightChild;
  final IDOffset offset;
  final IDOffset scale;
  final bool proportionalChildArea;
  final double borderRadius;
  final bool tapScaffoldEnabled;
  final bool onTapClose;
  final bool swipe;
  final bool swipeChild;
  final Duration? duration;
  final double velocity;
  final List<BoxShadow>? boxShadow;
  final Color? colorTransitionChild;
  final Color? colorTransitionScaffold;
  final InnerDrawerAnimation leftAnimationType;
  final InnerDrawerAnimation rightAnimationType;
  final Decoration? backgroundDecoration;
  final InnerDrawerCallback? innerDrawerCallback;
  final InnerDragUpdateCallback? onDragUpdate;

  @override
  InnerDrawerState createState() => InnerDrawerState();
}

class InnerDrawerState extends State<InnerDrawer> with SingleTickerProviderStateMixin {
  ColorTween _colorTransitionChild = ColorTween(begin: Colors.transparent, end: Colors.black54);
  ColorTween _colorTransitionScaffold = ColorTween(begin: Colors.black54, end: Colors.transparent);

  double _width = _kWidth;
  double _screenWidth = _kWidth;
  Orientation _orientation = Orientation.portrait;
  final ValueNotifier<InnerDrawerDirection> _direction = ValueNotifier(InnerDrawerDirection.start);

  LocalHistoryEntry? _historyEntry;
  final FocusScopeNode _focusScopeNode = FocusScopeNode();

  late AnimationController _controller;

  final GlobalKey _drawerKey = GlobalKey(debugLabel: 'InnerDrawer');
  bool _previouslyOpened = false;

  @override
  void initState() {
    super.initState();

    _direction.value = _leftChild != null ? InnerDrawerDirection.start : InnerDrawerDirection.end;

    _controller =
        AnimationController(
            value: 1,
            duration: widget.duration ?? _kBaseSettleDuration,
            vsync: this,
          )
          ..addListener(_animationChanged)
          ..addStatusListener(_animationStatusChanged);

    _animationChanged();
  }

  @override
  void didUpdateWidget(InnerDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);
    _ensureHistoryEntry();

    bool needUpdate = false;

    if (widget.colorTransitionChild != oldWidget.colorTransitionChild) {
      needUpdate = true;
      _colorTransitionChild = ColorTween(
        begin: widget.colorTransitionChild!.withValues(alpha: 0),
        end: widget.colorTransitionChild,
      );
    }

    if (widget.colorTransitionScaffold != oldWidget.colorTransitionScaffold) {
      needUpdate = true;
      _colorTransitionScaffold = ColorTween(
        begin: widget.colorTransitionScaffold,
        end: widget.colorTransitionScaffold!.withValues(alpha: 0),
      );
    }

    if (needUpdate) {
      setState(() {});
      _animationChanged();
    }
  }

  @override
  void dispose() {
    _historyEntry?.remove();
    _controller.dispose();
    _focusScopeNode.dispose();
    super.dispose();
  }

  void _animationChanged() {
    if (widget.onDragUpdate != null && _controller.value < 1) {
      widget.onDragUpdate!(
        1 - _controller.value,
        _direction.value,
      );
    }
  }

  void _ensureHistoryEntry() {
    if (_historyEntry == null) {
      final ModalRoute<dynamic>? route = ModalRoute.of(context);
      if (route != null) {
        _historyEntry = LocalHistoryEntry(onRemove: _handleHistoryEntryRemoved);
        route.addLocalHistoryEntry(_historyEntry!);
        FocusScope.of(context).setFirstFocus(_focusScopeNode);
      }
    }
  }

  void _animationStatusChanged(AnimationStatus status) {
    final bool opened = _controller.value < 0.5 ? true : false;

    switch (status) {
      case AnimationStatus.reverse:
        break;
      case AnimationStatus.forward:
        break;
      case AnimationStatus.dismissed:
        if (_previouslyOpened != opened) {
          _previouslyOpened = opened;
          widget.innerDrawerCallback?.call(opened, _direction.value);
        }
        _ensureHistoryEntry();
        break;
      case AnimationStatus.completed:
        if (_previouslyOpened != opened) {
          _previouslyOpened = opened;
          widget.innerDrawerCallback?.call(opened, _direction.value);
        }
        _historyEntry?.remove();
        _historyEntry = null;
    }
  }

  void _handleHistoryEntryRemoved() {
    _historyEntry = null;
    close();
  }

  void _handleDragDown(DragDownDetails details) {
    _controller.stop();
    // _ensureHistoryEntry();
  }

  double get _velocity {
    return widget.velocity;
  }

  void _updateWidth(double screenWidth) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? box = _drawerKey.currentContext!.findRenderObject() as RenderBox?;
      if (mounted && box != null && box.hasSize && box.size.width > 300) {
        _width = box.size.width;
        _screenWidth = screenWidth;
        setState(() {});
      }
    });
  }

  void _move(DragUpdateDetails details) {
    double delta = details.primaryDelta! / _width;

    if (delta > 0 && _controller.value == 1 && _leftChild != null) {
      _direction.value = InnerDrawerDirection.start;
    } else if (delta < 0 && _controller.value == 1 && _rightChild != null) {
      _direction.value = InnerDrawerDirection.end;
    }

    double offset = _direction.value.isStart ? widget.offset.left : widget.offset.right;

    double ee = 1;
    if (offset <= 0.2) {
      ee = 1.7;
    } else if (offset <= 0.4) {
      ee = 1.2;
    } else if (offset <= 0.6) {
      ee = 1.05;
    }

    offset = 1 - (pow(offset / ee, 1 / 2) as double); // (num.parse(pow(offset/2,1/3).toStringAsFixed(1)));

    switch (_direction.value) {
      case InnerDrawerDirection.start:
        delta = -delta;
        break;
      default:
        break;
    }
    switch (Directionality.of(context)) {
      case TextDirection.rtl:
        _controller.value -= delta + (delta * offset);
        break;
      case TextDirection.ltr:
        _controller.value += delta + (delta * offset);
        break;
    }

    final bool opened = _controller.value < 0.5 ? true : false;
    if (opened != _previouslyOpened) {
      widget.innerDrawerCallback?.call(opened, _direction.value);
    }
    _previouslyOpened = opened;
  }

  void _settle(DragEndDetails details) {
    if (_controller.isDismissed) return;
    if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
      double visualVelocity = (details.velocity.pixelsPerSecond.dx + _velocity) / _width;

      switch (_direction.value) {
        case InnerDrawerDirection.start:
          visualVelocity = -visualVelocity;
          break;
        default:
          break;
      }
      switch (Directionality.of(context)) {
        case TextDirection.rtl:
          _controller.fling(velocity: -visualVelocity);
          break;
        case TextDirection.ltr:
          _controller.fling(velocity: visualVelocity);
          break;
      }
    } else if (_controller.value < 0.5) {
      open();
    } else {
      close();
    }
  }

  void open({InnerDrawerDirection? direction}) {
    if (direction != null) _direction.value = direction;
    _controller.fling(velocity: -_velocity);
  }

  void close({InnerDrawerDirection? direction}) {
    if (direction != null) _direction.value = direction;
    _controller.fling(velocity: _velocity);
  }

  void toggle({InnerDrawerDirection? direction}) {
    if (_previouslyOpened) {
      close(direction: direction);
    } else {
      open(direction: direction);
    }
  }

  AlignmentDirectional get _drawerOuterAlignment {
    switch (_direction.value) {
      case InnerDrawerDirection.start:
        return AlignmentDirectional.centerEnd;
      case InnerDrawerDirection.end:
        return AlignmentDirectional.centerStart;
    }
  }

  AlignmentDirectional get _drawerInnerAlignment {
    switch (_direction.value) {
      case InnerDrawerDirection.start:
        return AlignmentDirectional.centerStart;
      case InnerDrawerDirection.end:
        return AlignmentDirectional.centerEnd;
    }
  }

  InnerDrawerAnimation get _animationType {
    return _direction.value.isStart ? widget.leftAnimationType : widget.rightAnimationType;
  }

  double get _scaleFactor {
    return _direction.value.isStart ? widget.scale.left : widget.scale.right;
  }

  double get _offset {
    return _direction.value.isStart ? widget.offset.left : widget.offset.right;
  }

  double get _widthWithOffset {
    return (_width / 2) - (_width / 2) * _offset;
  }

  bool get _swipe {
    return widget.swipe;
  }

  bool get _swipeChild {
    return widget.swipeChild;
  }

  Widget? get _leftChild {
    return widget.leftChild;
  }

  Widget? get _rightChild {
    return widget.rightChild;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final orientation = MediaQuery.orientationOf(context);
    if (((_width == 400 || _screenWidth == 400) && size.width != 400) ||
        orientation != _orientation ||
        size.width != _screenWidth) {
      _orientation = orientation;
      _updateWidth(size.width);
    }

    return Container(
      decoration:
          widget.backgroundDecoration ??
          BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
          ),
      child: ValueListenableBuilder(
        valueListenable: _direction,
        builder: (context, _, _) {
          return Stack(
            alignment: _drawerInnerAlignment,
            children: [
              FocusScope(
                node: _focusScopeNode,
                child: ValueListenableBuilder(
                  valueListenable: _direction,
                  builder: (context, position, _) {
                    return AnimatedBuilder(
                      animation: _controller,
                      builder: (context, _) {
                        Widget child = IndexedStack(
                          index: position.isStart ? 0 : 1,
                          children: [
                            _leftChild ?? const SizedBox.shrink(),
                            _rightChild ?? const SizedBox.shrink(),
                          ],
                        );
                        child = SizedBox(
                          width: widget.proportionalChildArea ? _width - _widthWithOffset : _width,
                          height: size.height,
                          child: _swipeChild
                              ? GestureDetector(
                                  onHorizontalDragUpdate: _move,
                                  onHorizontalDragEnd: _settle,
                                  child: child,
                                )
                              : child,
                        );

                        switch (_animationType) {
                          case InnerDrawerAnimation.linear:
                            return Align(
                              alignment: _drawerOuterAlignment,
                              widthFactor: 1 - (_controller.value),
                              child: child,
                            );
                          case InnerDrawerAnimation.quadratic:
                            return Align(
                              alignment: _drawerOuterAlignment,
                              widthFactor: 1 - (_controller.value / 2),
                              child: child,
                            );
                          default:
                            return child;
                        }
                      },
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {},
                onHorizontalDragDown: _swipe ? _handleDragDown : null,
                onHorizontalDragUpdate: _swipe ? _move : null,
                onHorizontalDragEnd: _swipe ? _settle : null,
                excludeFromSemantics: true,
                child: RepaintBoundary(
                  child: Stack(
                    children: [
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, _) {
                          return Container(
                            width: _controller.value == 0 || _animationType == InnerDrawerAnimation.linear ? 0 : null,
                            color: _colorTransitionChild.evaluate(_controller),
                          );
                        },
                      ),
                      ValueListenableBuilder(
                        valueListenable: _direction,
                        builder: (context, _, child) {
                          return AnimatedBuilder(
                            animation: _controller,
                            builder: (context, _) {
                              final double offset = 0.5 - _offset * 0.5;
                              final double wFactor = (_controller.value * (1 - offset)) + offset;

                              return Align(
                                alignment: _drawerOuterAlignment,
                                child: Align(
                                  alignment: _drawerInnerAlignment,
                                  widthFactor: wFactor,
                                  child: child,
                                ),
                              );
                            },
                          );
                        },
                        child: RepaintBoundary(
                          child: ValueListenableBuilder(
                            valueListenable: _direction,
                            builder: (context, _, _) {
                              return AnimatedBuilder(
                                animation: _controller,
                                builder: (context, child) {
                                  final Widget? invisibleCover =
                                      (_controller.value != 1.0 && !widget.tapScaffoldEnabled)
                                      ? BlockSemantics(
                                          child: GestureDetector(
                                            // On Android, the back button is used to dismiss a modal.
                                            excludeFromSemantics: defaultTargetPlatform == TargetPlatform.android,
                                            onTap: widget.onTapClose || !_swipe ? close : null,
                                            child: Semantics(
                                              label: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                                              child: Container(
                                                color: _colorTransitionScaffold.evaluate(_controller),
                                              ),
                                            ),
                                          ),
                                        )
                                      : null;

                                  final Widget scaffoldChild = Stack(
                                    children: [
                                      if (child != null) child,
                                      if (invisibleCover != null) invisibleCover,
                                    ],
                                  );

                                  Widget container = Container(
                                    key: _drawerKey,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        widget.borderRadius * (1 - _controller.value),
                                      ),
                                      boxShadow:
                                          widget.boxShadow ??
                                          [
                                            BoxShadow(
                                              color: Colors.black.withValues(alpha: 0.5),
                                              blurRadius: 5,
                                            ),
                                          ],
                                    ),
                                    child: widget.borderRadius != 0
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              (1 - _controller.value) * widget.borderRadius,
                                            ),
                                            child: scaffoldChild,
                                          )
                                        : scaffoldChild,
                                  );

                                  if (_scaleFactor < 1) {
                                    container = Transform.scale(
                                      alignment: _drawerInnerAlignment,
                                      scale: ((1 - _scaleFactor) * _controller.value) + _scaleFactor,
                                      child: container,
                                    );
                                  }

                                  if (widget.offset.top > 0 || widget.offset.bottom > 0) {
                                    final double translateY =
                                        size.height *
                                        (widget.offset.top > 0 ? -widget.offset.top : widget.offset.bottom);
                                    container = Transform.translate(
                                      offset: Offset(0, translateY * (1 - _controller.value)),
                                      child: container,
                                    );
                                  }

                                  return container;
                                },
                                child: widget.scaffold,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class IDOffset {
  const IDOffset.horizontal(
    double horizontal,
  ) : left = horizontal,
      top = 0.0,
      right = horizontal,
      bottom = 0.0;

  const IDOffset.only({
    this.left = 0.0,
    this.top = 0.0,
    this.right = 0.0,
    this.bottom = 0.0,
  }) : assert(
         top >= 0.0 &&
             top <= 1.0 &&
             left >= 0.0 &&
             left <= 1.0 &&
             right >= 0.0 &&
             right <= 1.0 &&
             bottom >= 0.0 &&
             bottom <= 1.0,
       ),
       assert(
         top >= 0.0 && bottom == 0.0 || top == 0.0 && bottom >= 0.0,
       );

  final double left;
  final double top;
  final double right;
  final double bottom;
}
