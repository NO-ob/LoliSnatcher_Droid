import 'dart:ui' show clampDouble;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPredictiveBackPageTransitionsBuilder extends PageTransitionsBuilder {
  const CustomPredictiveBackPageTransitionsBuilder();

  @override
  Duration get transitionDuration =>
      const Duration(milliseconds: FadeForwardsPageTransitionsBuilder.kTransitionMilliseconds);

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _PredictiveBackGestureDetector(
      route: route,
      builder:
          (
            BuildContext context,
            _PredictiveBackPhase phase,
            PredictiveBackEvent? startBackEvent,
            PredictiveBackEvent? currentBackEvent,
          ) {
            if (route.popGestureInProgress) {
              return _PredictiveBackSharedElementPageTransition(
                isDelegatedTransition: true,
                animation: animation,
                phase: phase,
                secondaryAnimation: secondaryAnimation,
                startBackEvent: startBackEvent,
                currentBackEvent: currentBackEvent,
                child: child,
              );
            }

            return const FadeForwardsPageTransitionsBuilder().buildTransitions(
              route,
              context,
              animation,
              secondaryAnimation,
              child,
            );
          },
    );
  }
}

class CustomPredictiveBackFullscreenPageTransitionsBuilder extends PageTransitionsBuilder {
  const CustomPredictiveBackFullscreenPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _PredictiveBackGestureDetector(
      route: route,
      builder:
          (
            BuildContext context,
            _PredictiveBackPhase phase,
            PredictiveBackEvent? startBackEvent,
            PredictiveBackEvent? currentBackEvent,
          ) {
            if (route.popGestureInProgress) {
              return _PredictiveBackFullscreenPageTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                getIsCurrent: () => route.isCurrent,
                phase: phase,
                child: child,
              );
            }

            return const ZoomPageTransitionsBuilder().buildTransitions(
              route,
              context,
              animation,
              secondaryAnimation,
              child,
            );
          },
    );
  }
}

/// The phases of a predictive back gesture.
enum _PredictiveBackPhase {
  /// There is no active predictive back gesture in progress.
  idle,

  /// The user pointer has contacted the screen.
  start,

  /// The user pointer has moved.
  update,

  /// The user pointer has released in a position in which Android has
  /// determined that the back gesture is successful and the current route
  /// should be popped.
  commit,

  /// The user pointer has released in a position in which Android has
  /// determined that the back gesture should be canceled and the original route
  /// should be shown.
  cancel,
}

class _PredictiveBackGestureDetector extends StatefulWidget {
  const _PredictiveBackGestureDetector({required this.route, required this.builder});

  final Widget Function(BuildContext, _PredictiveBackPhase, PredictiveBackEvent?, PredictiveBackEvent?) builder;
  final PageRoute<dynamic> route;

  @override
  State<_PredictiveBackGestureDetector> createState() => _PredictiveBackGestureDetectorState();
}

class _PredictiveBackGestureDetectorState extends State<_PredictiveBackGestureDetector> with WidgetsBindingObserver {
  bool get _isEnabled {
    return widget.route.isCurrent && widget.route.popGestureEnabled;
  }

  _PredictiveBackPhase get phase => _phase;
  _PredictiveBackPhase _phase = _PredictiveBackPhase.idle;
  set phase(_PredictiveBackPhase phase) {
    if (_phase != phase && mounted) {
      setState(() => _phase = phase);
    }
  }

  PredictiveBackEvent? get startBackEvent => _startBackEvent;
  PredictiveBackEvent? _startBackEvent;
  set startBackEvent(PredictiveBackEvent? startBackEvent) {
    if (_startBackEvent != startBackEvent && mounted) {
      setState(() => _startBackEvent = startBackEvent);
    }
  }

  PredictiveBackEvent? get currentBackEvent => _currentBackEvent;
  PredictiveBackEvent? _currentBackEvent;
  set currentBackEvent(PredictiveBackEvent? currentBackEvent) {
    if (_currentBackEvent != currentBackEvent && mounted) {
      setState(() => _currentBackEvent = currentBackEvent);
    }
  }

  @override
  bool handleStartBackGesture(PredictiveBackEvent backEvent) {
    phase = _PredictiveBackPhase.start;
    final bool gestureInProgress = !backEvent.isButtonEvent && _isEnabled;
    if (!gestureInProgress) {
      return false;
    }

    widget.route.handleStartBackGesture(progress: 1 - backEvent.progress);
    startBackEvent = currentBackEvent = backEvent;
    return true;
  }

  @override
  void handleUpdateBackGestureProgress(PredictiveBackEvent backEvent) {
    phase = _PredictiveBackPhase.update;

    widget.route.handleUpdateBackGestureProgress(progress: 1 - backEvent.progress);
    currentBackEvent = backEvent;
  }

  @override
  void handleCancelBackGesture() {
    phase = _PredictiveBackPhase.cancel;

    widget.route.handleCancelBackGesture();
    startBackEvent = currentBackEvent = null;
  }

  @override
  void handleCommitBackGesture() {
    phase = _PredictiveBackPhase.commit;

    widget.route.handleCommitBackGesture();
    startBackEvent = currentBackEvent = null;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _PredictiveBackPhase effectivePhase = widget.route.popGestureInProgress ? phase : _PredictiveBackPhase.idle;
    return widget.builder(context, effectivePhase, startBackEvent, currentBackEvent);
  }
}

class _PredictiveBackSharedElementPageTransition extends StatefulWidget {
  const _PredictiveBackSharedElementPageTransition({
    required this.isDelegatedTransition,
    required this.animation,
    required this.secondaryAnimation,
    required this.phase,
    required this.startBackEvent,
    required this.currentBackEvent,
    required this.child,
  });

  final bool isDelegatedTransition;
  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final _PredictiveBackPhase phase;
  final PredictiveBackEvent? startBackEvent;
  final PredictiveBackEvent? currentBackEvent;
  final Widget child;

  @override
  State<_PredictiveBackSharedElementPageTransition> createState() => _PredictiveBackSharedElementPageTransitionState();
}

class _PredictiveBackSharedElementPageTransitionState extends State<_PredictiveBackSharedElementPageTransition>
    with SingleTickerProviderStateMixin {
  static const double _kMinScale = 0.5;
  static const double _kDivisionFactor = 20;
  static const double _kMargin = 8;
  static const double _kYPositionFactor = 0.1;

  static const int _kCommitMilliseconds = 400;
  static const Curve _kCurve = Curves.easeInOutCubicEmphasized;
  static const Interval _kCommitInterval = Interval(
    0,
    _kCommitMilliseconds / FadeForwardsPageTransitionsBuilder.kTransitionMilliseconds,
    curve: _kCurve,
  );

  static const double _kDeviceBorderRadius = 32;

  final Tween<double> _borderRadiusTween = Tween<double>(begin: 0, end: _kDeviceBorderRadius);

  final Tween<double> _opacityTween = Tween<double>(begin: 1, end: 0);

  final Tween<double> _scaleTween = Tween<double>(begin: 1, end: _kMinScale);

  final ProxyAnimation _commitAnimation = ProxyAnimation();

  final ProxyAnimation _bounceAnimation = ProxyAnimation();
  double _lastBounceAnimationValue = 0;

  final ProxyAnimation _animation = ProxyAnimation();

  CurvedAnimation? _curvedAnimation;

  CurvedAnimation? _curvedAnimationReversed;

  late Animation<Offset> _positionAnimation;

  Offset _lastDrag = Offset.zero;

  double _getYShiftPosition(double screenHeight) {
    final double startTouchY = widget.startBackEvent?.touchOffset?.dy ?? 0;
    final double currentTouchY = widget.currentBackEvent?.touchOffset?.dy ?? 0;

    final double yShiftMax = (screenHeight / _kDivisionFactor) - _kMargin;

    final double rawYShift = currentTouchY - startTouchY;
    final double easedYShift =
        Curves.easeOut.transform(clampDouble(rawYShift.abs() / screenHeight, 0, 1)) * rawYShift.sign * yShiftMax;

    return clampDouble(easedYShift, -yShiftMax, yShiftMax);
  }

  void _updateAnimations(Size screenSize) {
    _animation.parent = switch (widget.phase) {
      _PredictiveBackPhase.commit => _curvedAnimationReversed,
      _ => widget.animation,
    };

    _bounceAnimation.parent = switch (widget.phase) {
      _PredictiveBackPhase.commit => Tween<double>(
        begin: 0,
        end: _lastBounceAnimationValue,
      ).animate(_curvedAnimation!),
      _ => ReverseAnimation(widget.animation),
    };

    _commitAnimation.parent = switch (widget.phase) {
      _PredictiveBackPhase.commit => _animation,
      _ => kAlwaysDismissedAnimation,
    };

    final double xShift = (screenSize.width / _kDivisionFactor) - _kMargin;
    _positionAnimation = _animation.drive(switch (widget.phase) {
      _PredictiveBackPhase.commit => Tween<Offset>(
        begin: _lastDrag,
        end: Offset(screenSize.height * _kYPositionFactor, 0),
      ),
      _ => Tween<Offset>(
        begin: switch (widget.currentBackEvent?.swipeEdge) {
          SwipeEdge.left => Offset(xShift, _getYShiftPosition(screenSize.height)),
          SwipeEdge.right => Offset(-xShift, _getYShiftPosition(screenSize.height)),
          null => Offset(xShift, _getYShiftPosition(screenSize.height)),
        },
        end: Offset.zero,
      ),
    });
  }

  void _updateCurvedAnimations() {
    _curvedAnimation?.dispose();
    _curvedAnimationReversed?.dispose();
    _curvedAnimation = CurvedAnimation(parent: widget.animation, curve: _kCommitInterval);
    _curvedAnimationReversed = CurvedAnimation(
      parent: ReverseAnimation(widget.animation),
      curve: _kCommitInterval,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(_PredictiveBackSharedElementPageTransition oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.animation != oldWidget.animation) {
      _updateCurvedAnimations();
    }
    if (widget.phase != oldWidget.phase && widget.phase == _PredictiveBackPhase.commit) {
      _updateAnimations(MediaQuery.sizeOf(context));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateCurvedAnimations();
    _updateAnimations(MediaQuery.sizeOf(context));
  }

  @override
  void dispose() {
    _curvedAnimation!.dispose();
    _curvedAnimationReversed!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (BuildContext context, Widget? child) {
        _lastBounceAnimationValue = _bounceAnimation.value;
        return Transform.scale(
          scale: _scaleTween.evaluate(_bounceAnimation),
          child: Transform.translate(
            offset: switch (widget.phase) {
              _PredictiveBackPhase.commit => _positionAnimation.value,
              _ => _lastDrag = Offset(
                _positionAnimation.value.dx * 5, // x5 horizontal movement
                _getYShiftPosition(MediaQuery.heightOf(context)),
              ),
            },
            child: Opacity(
              opacity: _opacityTween.evaluate(_commitAnimation),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(_borderRadiusTween.evaluate(_bounceAnimation)),
                child: child,
              ),
            ),
          ),
        );
      },
      child: widget.child,
    );
  }
}

class _PredictiveBackFullscreenPageTransition extends StatefulWidget {
  const _PredictiveBackFullscreenPageTransition({
    required this.animation,
    required this.secondaryAnimation,
    required this.getIsCurrent,
    required this.phase,
    required this.child,
  });

  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final _PredictiveBackPhase phase;
  final ValueGetter<bool> getIsCurrent;
  final Widget child;

  @override
  State<_PredictiveBackFullscreenPageTransition> createState() => _PredictiveBackFullscreenPageTransitionState();
}

class _PredictiveBackFullscreenPageTransitionState extends State<_PredictiveBackFullscreenPageTransition> {
  static const double _kScaleStart = 1;
  static const double _kScaleCommit = 0.5;
  static const double _kOpacityFullyOpened = 1;
  static const double _kOpacityStartTransition = 0.95;
  static const double _kCommitAt = 0.65;
  static const double _kWeightPreCommit = _kCommitAt;
  static const double _kWeightPostCommit = 1 - _kWeightPreCommit;
  static const double _kScreenWidthDivisionFactor = 20;
  static const double _kXShiftAdjustment = 8;
  static const Duration _kCommitDuration = Duration(milliseconds: 100);

  final Animatable<double> _primaryOpacityTween = Tween<double>(
    begin: _kOpacityStartTransition,
    end: _kOpacityFullyOpened,
  );

  final Animatable<double> _primaryScaleTween = TweenSequence<double>(<TweenSequenceItem<double>>[
    TweenSequenceItem<double>(
      tween: Tween<double>(begin: _kScaleStart, end: _kScaleStart),
      weight: _kWeightPreCommit,
    ),
    TweenSequenceItem<double>(
      tween: Tween<double>(begin: _kScaleCommit, end: _kScaleStart),
      weight: _kWeightPostCommit,
    ),
  ]);

  final ConstantTween<double> _secondaryScaleTweenCurrent = ConstantTween<double>(_kScaleStart);
  final TweenSequence<double> _secondaryTweenScale = TweenSequence<double>(<TweenSequenceItem<double>>[
    TweenSequenceItem<double>(
      tween: Tween<double>(begin: _kScaleCommit, end: _kScaleStart),
      weight: _kWeightPreCommit,
    ),
    TweenSequenceItem<double>(
      tween: Tween<double>(begin: _kScaleStart, end: _kScaleStart),
      weight: _kWeightPostCommit,
    ),
  ]);

  final ConstantTween<double> _secondaryOpacityTweenCurrent = ConstantTween<double>(
    _kOpacityFullyOpened,
  );
  final TweenSequence<double> _secondaryOpacityTween = TweenSequence<double>(<TweenSequenceItem<double>>[
    TweenSequenceItem<double>(
      tween: Tween<double>(begin: _kOpacityFullyOpened, end: _kOpacityStartTransition),
      weight: _kWeightPreCommit,
    ),
    TweenSequenceItem<double>(
      tween: Tween<double>(begin: _kOpacityFullyOpened, end: _kOpacityFullyOpened),
      weight: _kWeightPostCommit,
    ),
  ]);

  late Animatable<Offset> _primaryPositionTween;
  late Animatable<Offset> _secondaryPositionTween;
  late Animatable<Offset> _secondaryCurrentPositionTween;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final double screenWidth = MediaQuery.widthOf(context);
    final double xShift = (screenWidth / _kScreenWidthDivisionFactor) - _kXShiftAdjustment;
    _primaryPositionTween = TweenSequence<Offset>(<TweenSequenceItem<Offset>>[
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(begin: Offset.zero, end: Offset.zero),
        weight: _kWeightPreCommit,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(begin: Offset(xShift, 0), end: Offset.zero),
        weight: _kWeightPostCommit,
      ),
    ]);

    _secondaryCurrentPositionTween = ConstantTween<Offset>(Offset.zero);
    _secondaryPositionTween = Tween<Offset>(begin: Offset(xShift, 0), end: Offset.zero);
  }

  Widget _secondaryAnimatedBuilder(BuildContext context, Widget? child) {
    final bool isCurrent = widget.getIsCurrent();

    return Transform.translate(
      offset: isCurrent
          ? _secondaryCurrentPositionTween.evaluate(widget.secondaryAnimation)
          : _secondaryPositionTween.evaluate(widget.secondaryAnimation),
      child: Transform.scale(
        scale: isCurrent
            ? _secondaryScaleTweenCurrent.evaluate(widget.secondaryAnimation)
            : _secondaryTweenScale.evaluate(widget.secondaryAnimation),
        child: Opacity(
          opacity: isCurrent
              ? _secondaryOpacityTweenCurrent.evaluate(widget.secondaryAnimation)
              : _secondaryOpacityTween.evaluate(widget.secondaryAnimation),
          child: child,
        ),
      ),
    );
  }

  Widget _primaryAnimatedBuilder(BuildContext context, Widget? child) {
    return Transform.translate(
      offset: _primaryPositionTween.evaluate(widget.animation),
      child: Transform.scale(
        scale: _primaryScaleTween.evaluate(widget.animation),
        child: Opacity(
          opacity: _primaryOpacityTween.evaluate(widget.animation),
          child: AnimatedOpacity(
            opacity: switch (widget.phase) {
              _PredictiveBackPhase.commit => 0.0,
              _ => widget.animation.value < _kCommitAt ? 0.0 : 1.0,
            },
            duration: _kCommitDuration,
            child: child,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.secondaryAnimation,
      builder: _secondaryAnimatedBuilder,
      child: AnimatedBuilder(
        animation: widget.animation,
        builder: _primaryAnimatedBuilder,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            _PredictiveBackSharedElementPageTransitionState._kDeviceBorderRadius,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
