import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/debouncer.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/animated_progress_indicator.dart';
import 'package:lolisnatcher/src/widgets/common/bordered_text.dart';

class MediaLoading extends StatefulWidget {
  const MediaLoading({
    Key? key,
    required this.item,

    required this.hasProgress,
    required this.isFromCache,
    required this.isDone,

    this.isTooBig = false,
    required this.isStopped,
    this.stopReasons = const [],
    required this.isViewed,

    required this.total,
    required this.received,
    required this.startedAt,

    required this.startAction,
    required this.stopAction,
  }) : super(key: key);

  final BooruItem item;

  final bool hasProgress;
  final bool isFromCache;
  final bool isDone;

  final bool isTooBig;
  final bool isStopped;
  final List<String> stopReasons;
  final bool isViewed;

  final RxInt total;
  final RxInt received;
  final RxInt startedAt;

  final void Function()? startAction;
  final void Function()? stopAction;

  @override
  State<MediaLoading> createState() => _MediaLoadingState();
}

class _MediaLoadingState extends State<MediaLoading> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  bool isVisible = false;
  int _total = 0, _received = 0, _startedAt = 0;
  Timer? _checkInterval;
  StreamSubscription? _totalListener, _receivedListener, _startedAtListener;

  int _prevReceivedAmount = 0, _lastReceivedAmount = 0, _prevReceivedTime = 0, _lastReceivedTime = 0;

  @override
  void initState() {
    super.initState();
    start();
  }

  void start() {
    _total = widget.total.value;
    _received = widget.received.value;
    _startedAt = widget.startedAt.value;

    _totalListener = widget.total.listen((int value) {
      _onBytesAdded(null, value);
    });

    _receivedListener = widget.received.listen((int value) {
      _onBytesAdded(value, null);
    });

    _startedAtListener = widget.startedAt.listen((int value) {
      _total = 0;
      _received = 0;
      _startedAt = value;
    });

    _checkInterval?.cancel();
    _checkInterval = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      // force restate every second to refresh all timers/indicators, even when loading has stopped/stalled/etc.
      if (!widget.isDone) {
        updateState();
      }
    });

    _prevReceivedTime = DateTime.now().millisecondsSinceEpoch - 1;
    _lastReceivedTime = _prevReceivedTime + 1;
  }

  void _onBytesAdded(int? received, int? total) {
    // always save incoming bytes, but restate only after a small delay

    _received = received ?? _received;
    _total = total ?? _total;

    final bool isDone = _total > 0 && _received >= _total;
    Debounce.delay(
      tag: 'loading_media_progress_${widget.item.fileURL}',
      callback: () {
        updateState();
      },
      // triiger restate only after a small delay, so we don't spam restate on every single byte
      // if done - send immediately (but still with a delay to let flutter build the parent)
      duration: Duration(milliseconds: isDone ? 1 : 100),
    );
  }

  void updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  void disposables() {
    _total = 0;
    _received = 0;
    _startedAt = 0;

    _prevReceivedAmount = 0;
    _lastReceivedAmount = 0;
    _prevReceivedTime = 0;
    _lastReceivedTime = 0;

    _totalListener?.cancel();
    _receivedListener?.cancel();
    _startedAtListener?.cancel();
    _checkInterval?.cancel();
    Debounce.cancel('loading_media_progress_${widget.item.fileURL}');
  }

  @override
  void dispose() {
    disposables();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int nowMils = DateTime.now().millisecondsSinceEpoch;
    int sinceStart = _startedAt == 0 ? 0 : nowMils - _startedAt;
    bool showLoading = !widget.isDone && (widget.isStopped || (widget.isViewed && sinceStart > 999));
    // delay showing loading info a bit, so we don't clutter interface for fast loading files

    // return buildElement(context);

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
      opacity: showLoading ? 1 : 0,
      onEnd: () {
        isVisible = showLoading;
        updateState();
      },
      child: buildElement(context, nowMils, sinceStart),
    );
  }

  Widget buildElement(BuildContext context, int nowMils, int sinceStart) {
    if (widget.isDone && !isVisible) {
      //  Don't do or render anything after file is loaded and widget faded out
      return const SizedBox();
    }

    if (settingsHandler.shitDevice) {
      if (settingsHandler.loadingGif) {
        return const Center(child: Image(image: AssetImage('assets/images/loading.gif')));
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    }

    bool hasProgressData = widget.hasProgress && (_total > 0);
    int expectedBytes = hasProgressData ? _received : 0;
    int totalBytes = hasProgressData ? _total : 0;

    double speedCheckInterval = 1000 / 4;
    if (hasProgressData && (nowMils - _lastReceivedTime) > speedCheckInterval) {
      _prevReceivedAmount = _lastReceivedAmount;
      _lastReceivedAmount = expectedBytes;

      _prevReceivedTime = _lastReceivedTime;
      _lastReceivedTime = nowMils;
    }

    double percentDone = hasProgressData ? (expectedBytes / totalBytes) : 0;
    String loadedSize = hasProgressData ? Tools.formatBytes(expectedBytes, 1) : '';
    String expectedSize = hasProgressData ? Tools.formatBytes(totalBytes, 1) : '';

    bool isVideo = widget.item.isVideo;

    String percentDoneText = '';
    if (hasProgressData) {
      if (isVideo) {
        percentDoneText = (percentDone == 1) ? 'Rendering...' : '${(percentDone * 100).toStringAsFixed(2)}%';
      } else {
        percentDoneText = (percentDone == 1)
            ? '${widget.isFromCache ? 'Loading and rendering from cache' : 'Rendering'}...'
            : '${(percentDone * 100).toStringAsFixed(2)}%';
      }
    } else {
      if (isVideo) {
        percentDoneText = '${widget.isFromCache ? 'Loading from cache' : 'Buffering'}...';
      } else {
        percentDoneText = widget.isDone ? 'Rendering...' : 'Loading${widget.isFromCache ? ' from cache' : ''}...';
      }
    }

    String filesizeText = (hasProgressData && percentDone < 1) ? ('$loadedSize / $expectedSize') : '';

    int expectedSpeed = 0;
    if (hasProgressData && _prevReceivedAmount > 0 && _lastReceivedAmount > 0) {
      expectedSpeed = ((_lastReceivedAmount - _prevReceivedAmount) * (1000 / (nowMils - _prevReceivedTime))).round();
      // expectedSpeed = ((_lastReceivedAmount - _prevReceivedAmount) * (1000 / speedCheckInterval)).round();
    }
    String expectedSpeedText = (hasProgressData && percentDone < 1) ? ('${Tools.formatBytes(expectedSpeed, 1)}/s') : '';

    double expectedTime = hasProgressData ? (expectedSpeed == 0 ? double.infinity : ((totalBytes - expectedBytes) / expectedSpeed)) : 0;
    String expectedTimeText = (hasProgressData && expectedTime > 0 && percentDone < 1) ? ("~${expectedTime.toStringAsFixed(1)} s") : '';

    int sinceStartSeconds = (sinceStart / 1000).floor();
    String sinceStartText = (!widget.isDone && percentDone < 1) ? 'Started ${sinceStartSeconds.toString()}s ago' : '';

    bool isMovedBelow = settingsHandler.previewMode == 'Sample' && !widget.item.isHated.value;

    // print('$percentDone | $percentDoneText');

    if (!widget.isViewed) {
      // Do the calculations, but don't render anything if not viewed
      return const SizedBox();
    }

    List<Widget> children = [];
    if (widget.isStopped) {
      children = [
        ...widget.stopReasons.map((String reason) {
          return LoadingText(
            text: reason,
            fontSize: 18,
          );
        }),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          icon: const Icon(Icons.play_arrow, size: 44, color: Colors.blue),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black54),
          ),
          label: LoadingText(
            text: (widget.isTooBig || widget.item.isHated.value) ? 'Load Anyway' : 'Restart Loading',
            fontSize: 16,
            color: Colors.blue,
          ),
          onPressed: () {
            widget.startAction?.call();
          },
        ),
        if (isMovedBelow) const SizedBox(height: 60),
      ];
    } else {
      if (settingsHandler.loadingGif) {
        children = [
          const Center(child: Image(image: AssetImage('assets/images/loading.gif'))),
          const SizedBox(height: 30),
          LoadingText(
            text: percentDoneText,
            fontSize: 18,
          ),
        ];
      } else {
        children = [
          LoadingText(
            text: percentDoneText,
            fontSize: 18,
          ),
          LoadingText(
            text: filesizeText,
            fontSize: 16,
          ),
          LoadingText(
            text: expectedSpeedText,
            fontSize: 14,
          ),
          LoadingText(
            text: expectedTimeText,
            fontSize: 14,
          ),
          LoadingText(
            text: sinceStartText,
            fontSize: 14,
          ),
          const SizedBox(height: 10),
          if (percentDone < 1)
            ElevatedButton.icon(
              icon: Icon(
                Icons.stop,
                size: 44,
                color: Theme.of(context).colorScheme.error,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black54),
              ),
              label: LoadingText(
                text: 'Stop Loading',
                fontSize: 18,
                color: Theme.of(context).colorScheme.error,
              ),
              onPressed: () {
                widget.stopAction?.call();
              },
            ),
          if (isMovedBelow) const SizedBox(height: 60),
        ];
      }
    }

    return buildIndicator(
      context,
      percentDone,
      Column(
        // move loading info lower if preview is of sample quality (except when item is hated)
        mainAxisAlignment: isMovedBelow ? MainAxisAlignment.end : MainAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget buildIndicator(BuildContext context, double percentDone, Widget child) {
    final Widget progressIndicator = percentDone == 0
        ? const LinearProgressIndicator()
        : AnimatedProgressIndicator(
            value: percentDone,
            animationDuration: const Duration(milliseconds: 150),
            indicatorStyle: IndicatorStyle.linear,
            valueColor: Theme.of(context).progressIndicatorTheme.color?.withOpacity(0.66),
            minHeight: 6,
          );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: progressIndicator,
        ),
        //
        //
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
            child: child,
          ),
        ),
        //
        //
        RotatedBox(
          quarterTurns: percentDone != 0 ? -1 : 1,
          child: progressIndicator,
        ),
      ],
    );
  }
}

class LoadingText extends StatelessWidget {
  const LoadingText({
    Key? key,
    required this.text,
    required this.fontSize,
    this.color = Colors.white,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return const SizedBox();
    }

    return BorderedText(
      key: ValueKey<String>(text),
      strokeWidth: 3,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
        ),
      ),
    );

    // TODO animate text value changes?
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 50),
      child: BorderedText(
        key: ValueKey<String>(text),
        strokeWidth: 3,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
          ),
        ),
      ),
    );
  }
}
