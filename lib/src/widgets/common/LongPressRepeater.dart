import 'dart:async';

import 'package:LoliSnatcher/src/handlers/service_handler.dart';
import 'package:flutter/material.dart';

class LongPressRepeater extends StatefulWidget {
  const LongPressRepeater({
    Key? key,
    required this.onStart,
    this.onStop,
    this.onTap,
    this.tick = 200,
    this.fastTick = 100,
    this.fasterAfter = -1,
    this.behavior,
    required this.child,
  }) : super(key: key);

  // * onStart is called on every tick of long press
  final VoidCallback onStart;
  final VoidCallback? onStop;
  final VoidCallback? onTap;
  final int tick;
  final int fastTick;
  final int fasterAfter;
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
        if (longPressTimer != null) return;
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
