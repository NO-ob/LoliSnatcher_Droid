import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/service_handler.dart';

class LongPressRepeater extends StatefulWidget {
  /// This widget detects long press on [child] and repeats given action every [tick] milliseconds.
  ///
  /// After [fasterAfter] amount of ticks, uses faster [tick] interval - [fastTick].
  const LongPressRepeater({
    required this.onStart,
    required this.child,
    this.onStop,
    this.onTap,
    this.tick = 200,
    this.fastTick = 100,
    this.fasterAfter = -1,
    this.startDelay,
    this.behavior,
    super.key,
  });

  /// called on every tick of long press
  final AsyncCallback onStart;

  /// called afrter user stops long press
  final AsyncCallback? onStop;

  /// called when user just taps on widget
  final AsyncCallback? onTap;

  /// delay in ms between each callback during long press
  final int tick;

  /// delay in ms between each callback after [fasterAfter] amount of ticks
  final int fastTick;

  /// after how many ticks action gets called faster
  final int fasterAfter;

  /// delay in ms before first onStart is triggered (aside from long tap detection timer)
  final int? startDelay;

  /// see [GestureDetector.behavior]
  final HitTestBehavior? behavior;
  final Widget child;

  @override
  State<LongPressRepeater> createState() => _LongPressRepeaterState();
}

class _LongPressRepeaterState extends State<LongPressRepeater> {
  bool active = false;
  int repeatCount = 0;

  @override
  void dispose() {
    active = false;
    super.dispose();
  }

  Future<void> runAction() async {
    if (mounted) {
      await Future.delayed(
        Duration(
          // repeat faster after a certain amount of times
          milliseconds: (widget.fasterAfter > 0 && repeatCount > widget.fasterAfter) ? widget.fastTick : widget.tick,
        ),
      );
      await widget.onStart();
      if (repeatCount > 0) {
        await ServiceHandler.vibrate(duration: 2);
      }
      repeatCount++;

      if (active) {
        unawaited(runAction());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) async {
        active = true;
        if (widget.startDelay != null) {
          await Future.delayed(Duration(milliseconds: widget.startDelay!));
        }
        unawaited(runAction());
      },
      onLongPressEnd: (details) async {
        active = false;
        await widget.onStop?.call();
        repeatCount = 0;
      },
      onLongPressCancel: () async {
        active = false;
        await widget.onStop?.call();
        repeatCount = 0;
      },
      onTap: widget.onTap,
      behavior: widget.behavior ?? HitTestBehavior.deferToChild,
      child: widget.child,
    );
  }
}
