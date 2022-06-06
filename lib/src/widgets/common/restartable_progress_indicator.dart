import 'dart:async';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/utils/timed_progress_controller.dart';

// code from https://stackoverflow.com/questions/56853554/show-timer-progress-on-a-circularprogressindicator-in-flutter

class RestartableProgressIndicator extends StatefulWidget {
  const RestartableProgressIndicator({
    Key? key,
    required this.controller,
    this.onTimeout,
  }) : super(key: key);

  final TimedProgressController controller;
  final VoidCallback? onTimeout;

  @override
  State<RestartableProgressIndicator> createState() => _RestartableProgressIndicatorState();
}

class _RestartableProgressIndicatorState extends State<RestartableProgressIndicator> {
  TimedProgressController get controller => widget.controller;

  StreamSubscription? progressStream;

  @override
  void initState() {
    super.initState();
    progressStream = controller.progressStream.listen((_) => updateState());
  }

  @override
  void dispose() {
    progressStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: controller.progress,
    );
  }

  void updateState() {
    if(mounted) {
      setState(() {});
    }
  }
}