import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lolisnatcher/gen/strings.g.dart';
import 'package:lolisnatcher/src/widgets/common/bordered_text.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/confirm_button.dart';

Future<bool> showTimedLeaveDialog(
  BuildContext context, {
  String? title,
  String? message,
  Duration duration = const Duration(seconds: 3),
  Widget? icon,
}) async {
  final res = await showDialog<bool>(
    context: context,
    builder: (context) => _TimedLeaveDialogContent(
      title: title ?? context.loc.leaveThisPageQuestion,
      message: message ?? context.loc.pageWillCloseAutomatically,
      duration: duration,
      icon: icon,
    ),
  );
  return res ?? false;
}

class _TimedLeaveDialogContent extends StatefulWidget {
  const _TimedLeaveDialogContent({
    required this.title,
    required this.message,
    required this.duration,
    this.icon,
  });

  final String title;
  final String message;
  final Duration duration;
  final Widget? icon;

  @override
  State<_TimedLeaveDialogContent> createState() => _TimedLeaveDialogContentState();
}

class _TimedLeaveDialogContentState extends State<_TimedLeaveDialogContent> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  ValueNotifier<int> secondsRemaining = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    secondsRemaining.value = widget.duration.inSeconds;

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: 1,
    );

    _controller.addListener(_updateSecondsRemaining);
    _controller.addStatusListener(_onAnimationStatus);

    _controller.reverse();
  }

  void _updateSecondsRemaining() {
    final newSeconds = (_controller.value * widget.duration.inSeconds).ceil();
    if (newSeconds != secondsRemaining.value) {
      secondsRemaining.value = max(0, newSeconds);
    }
  }

  void _onAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.dismissed) {
      Navigator.of(context).pop(true);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_updateSecondsRemaining);
    _controller.removeStatusListener(_onAnimationStatus);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.icon ??
                const Icon(
                  Icons.warning_amber_rounded,
                  size: 40,
                ),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              widget.message,
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final progressValue = _controller.value;
                final seconds = secondsRemaining.value;
                final time = '$seconds ${context.loc.secondsShort}';

                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 28,
                    child: Stack(
                      children: [
                        LinearProgressIndicator(
                          value: progressValue,
                          minHeight: 28,
                        ),
                        Center(
                          child: BorderedText(
                            strokeWidth: 2,
                            child: Text(
                              time,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: .end,
              children: [
                CancelButton(
                  withIcon: true,
                  action: () => Navigator.of(context).pop(false),
                  label: context.loc.stay,
                ),
                const SizedBox(width: 12),
                ConfirmButton(
                  withIcon: true,
                  action: () => Navigator.of(context).pop(true),
                  label: context.loc.leave,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
