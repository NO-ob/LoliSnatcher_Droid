import 'package:flutter/material.dart';

class PulseWidget extends StatefulWidget {
  const PulseWidget({
    required this.child,
    this.duration,
    this.enabled = true,
    super.key,
  });

  final Widget child;
  final Duration? duration;
  final bool enabled;

  @override
  State<PulseWidget> createState() => _PulseWidgetState();
}

class _PulseWidgetState extends State<PulseWidget> with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  final double _initialOpacity = 1;
  final double _finalOpacity = 0.4;

  @override
  void initState() {
    super.initState();

    _configurePulseAnimation();
    _fadeController.forward();
  }

  void _configurePulseAnimation() {
    _fadeController = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(seconds: 1),
    );

    _fadeAnimation = Tween(begin: _initialOpacity, end: _finalOpacity).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Curves.linear,
      ),
    );

    _fadeController.addStatusListener(_statusListener);

    _fadeController.forward();
  }

  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _fadeController.reverse();
    }
    if (status == AnimationStatus.dismissed) {
      _fadeController.forward();
    }
  }

  @override
  void dispose() {
    _fadeController.removeStatusListener(_statusListener);
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return widget.child;
    }

    return FadeTransition(
      opacity: _fadeAnimation,
      child: widget.child,
    );
  }
}
