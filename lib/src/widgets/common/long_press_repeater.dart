import 'dart:async';

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
    this.behavior,
    super.key,
  });

  /// called on every tick of long press
  final VoidCallback onStart;

  /// called afrter user stops long press
  final VoidCallback? onStop;

  /// called when user just taps on widget
  final VoidCallback? onTap;

  /// delay in ms between each callback during long press
  final int tick;

  /// delay in ms between each callback after [fasterAfter] amount of ticks
  final int fastTick;

  /// after how many ticks action gets called faster
  final int fasterAfter;

  /// see [GestureDetector.behavior]
  final HitTestBehavior? behavior;
  final Widget child;

  @override
  State<LongPressRepeater> createState() => _LongPressRepeaterState();
}

class _LongPressRepeaterState extends State<LongPressRepeater> {
  Timer? longPressTimer;
  int repeatCount = 0;

  @override
  void dispose() {
    longPressTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        // repeat every 100ms if the user holds down the button
        if (longPressTimer != null) {
          return;
        }
        longPressTimer = Timer.periodic(Duration(milliseconds: widget.tick), (timer) {
          widget.onStart();
          if (repeatCount > 0) {
            ServiceHandler.vibrate(duration: 2);
          }
          repeatCount++;

          // repeat faster after a certain amount of times
          if (widget.fasterAfter > 0 && repeatCount > widget.fasterAfter) {
            longPressTimer?.cancel();
            longPressTimer = Timer.periodic(Duration(milliseconds: widget.fastTick), (timer) {
              widget.onStart();
              if (repeatCount > 0) {
                ServiceHandler.vibrate(duration: 2);
              }
              repeatCount++;
            });
          }
        });
      },
      onLongPressEnd: (details) {
        // stop repeating if the user releases the button
        widget.onStop?.call();
        longPressTimer?.cancel();
        longPressTimer = null;
        repeatCount = 0;
      },
      onLongPressCancel: () {
        // stop repeating if the user moves the finger/mouse away
        // TODO doesn't work?
        widget.onStop?.call();
        longPressTimer?.cancel();
        longPressTimer = null;
        repeatCount = 0;
      },
      onTap: widget.onTap,
      behavior: widget.behavior ?? HitTestBehavior.deferToChild,
      child: widget.child,
    );
  }
}
