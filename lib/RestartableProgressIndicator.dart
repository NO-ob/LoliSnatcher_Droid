import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:LoliSnatcher/TimedProgressController.dart';

// code from https://stackoverflow.com/questions/56853554/show-timer-progress-on-a-circularprogressindicator-in-flutter

class RestartableProgressIndicator extends StatefulWidget {
  final TimedProgressController controller;
  VoidCallback? onTimeout;

  RestartableProgressIndicator({
    Key? key,
    required this.controller,
  }) : assert(controller != null),
        super(key: key);

  @override
  _RestartableProgressIndicatorState createState() => _RestartableProgressIndicatorState();
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
    if(this.mounted) {
      setState(() {});
    }
  }
}