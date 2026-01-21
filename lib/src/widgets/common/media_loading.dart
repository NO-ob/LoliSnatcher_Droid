import 'dart:async';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/debouncer.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/animated_progress_indicator.dart';
import 'package:lolisnatcher/src/widgets/common/bordered_text.dart';
import 'package:lolisnatcher/src/widgets/image/image_viewer.dart';

// TODO redesign

class MediaLoading extends StatefulWidget {
  const MediaLoading({
    required this.item,
    required this.hasProgress,
    required this.isFromCache,
    required this.isDone,
    required this.isStopped,
    required this.isViewed,
    required this.total,
    required this.received,
    required this.startedAt,
    required this.onRestart,
    required this.onStop,
    this.isTooBig = false,
    this.stopReason,
    this.stopDetails,
    super.key,
  });

  final BooruItem item;

  final bool hasProgress;
  final bool isFromCache;
  final bool isDone;

  final bool isTooBig;
  final bool isStopped;
  final ViewerStopReason? stopReason;
  final String? stopDetails;
  final bool isViewed;

  final ValueNotifier<int> total;
  final ValueNotifier<int> received;
  final ValueNotifier<int> startedAt;

  final void Function()? onRestart;
  final void Function()? onStop;

  @override
  State<MediaLoading> createState() => _MediaLoadingState();
}

class _MediaLoadingState extends State<MediaLoading> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  bool isVisible = false;
  int _total = 0, _received = 0, _startedAt = 0;
  Timer? _checkInterval;

  int _prevAmount = 0, _lastAmount = 0, _prevTime = 0, _lastTime = 0;

  @override
  void initState() {
    super.initState();
    start();
  }

  void start() {
    _total = widget.total.value;
    _received = widget.received.value;
    _startedAt = widget.startedAt.value;

    widget.total.addListener(onTotalChanged);
    widget.received.addListener(onReceivedChanged);
    widget.startedAt.addListener(onStartedAtChanged);

    _checkInterval?.cancel();
    _checkInterval = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      // force restate every second to refresh all timers/indicators, even when loading has stopped/stalled/etc.
      if (!widget.isDone) {
        updateState();
      }
    });

    _prevTime = DateTime.now().millisecondsSinceEpoch - 1;
    _lastTime = _prevTime + 1;
  }

  void onTotalChanged() => _onBytesAdded(null, widget.total.value);
  void onReceivedChanged() => _onBytesAdded(widget.received.value, null);
  void onStartedAtChanged() {
    _total = 0;
    _received = 0;
    _startedAt = widget.startedAt.value;
  }

  void _onBytesAdded(int? received, int? total) {
    // always save incoming bytes, but restate only after a small delay

    _received = received ?? _received;
    _total = total ?? _total;

    final bool isDone = _total > 0 && _received >= _total;
    Debounce.delay(
      tag: 'loading_media_progress_${widget.item.hashCode}',
      callback: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          updateState();
        });
      },
      // triiger restate only after a small delay, so we don't spam restate on every single byte
      // if done - send immediately (but still with a delay to let flutter build the parent)
      duration: Duration(milliseconds: isDone ? 0 : 200),
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

    _prevAmount = 0;
    _lastAmount = 0;
    _prevTime = 0;
    _lastTime = 0;

    widget.total.removeListener(onTotalChanged);
    widget.received.removeListener(onReceivedChanged);
    widget.startedAt.removeListener(onStartedAtChanged);
    _checkInterval?.cancel();
    Debounce.cancel('loading_media_progress_${widget.item.hashCode}');
  }

  @override
  void dispose() {
    disposables();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int nowMils = DateTime.now().millisecondsSinceEpoch;
    final int sinceStart = _startedAt == 0 ? 0 : nowMils - _startedAt;
    final bool showLoading = !widget.isDone && (widget.isStopped || (widget.isViewed && sinceStart > 999));
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
      return const SizedBox.shrink();
    }

    final bool hasProgressData = widget.hasProgress && (_total > 0);
    final int expectedBytes = hasProgressData ? _received : 0;
    final int totalBytes = hasProgressData ? _total : 0;
    final double percentDone = hasProgressData ? (expectedBytes / totalBytes) : 0;

    if (settingsHandler.shitDevice) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.isStopped
              ? [
                  if (widget.stopReason != null)
                    LoadingText(
                      text: widget.stopReason?.description ?? '',
                      fontSize: 20,
                    ),
                  if (widget.stopDetails != null)
                    LoadingText(
                      text: widget.stopDetails ?? '',
                      fontSize: 18,
                    ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.play_arrow,
                      size: 40,
                      color: Colors.blue,
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.black54),
                      fixedSize: const WidgetStatePropertyAll(Size(double.infinity, 54)),
                    ),
                    label: LoadingText(
                      text: (widget.isTooBig || widget.item.isHated)
                          ? context.loc.media.loading.loadAnyway
                          : context.loc.media.loading.restartLoading,
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      widget.onRestart?.call();
                    },
                  ),
                ]
              : [
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.all(16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.8),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: CircularProgressIndicator(
                            value: percentDone == 0 ? null : percentDone,
                          ),
                        ),
                        Text(
                          '${(percentDone * 100).toStringAsFixed(0)}%',
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (percentDone < 1)
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.stop,
                        size: 40,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.black54),
                        fixedSize: const WidgetStatePropertyAll(Size(double.infinity, 54)),
                      ),
                      label: LoadingText(
                        text: context.loc.media.loading.stopLoading,
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      onPressed: () {
                        widget.onStop?.call();
                      },
                    ),
                ],
        ),
      );
    }

    const double speedCheckInterval = 1000 / 4;
    if (hasProgressData && (nowMils - _lastTime) > speedCheckInterval) {
      _prevAmount = _lastAmount;
      _lastAmount = expectedBytes;

      _prevTime = _lastTime;
      _lastTime = nowMils;
    }

    final String loadedSize = hasProgressData ? Tools.formatBytes(expectedBytes, 1) : '';
    final String expectedSize = hasProgressData ? Tools.formatBytes(totalBytes, 1) : '';

    final bool isVideo = widget.item.mediaType.value.isVideo;

    String percentDoneText = '';
    if (hasProgressData) {
      if (isVideo) {
        percentDoneText = (percentDone == 1)
            ? context.loc.media.loading.rendering
            : '${(percentDone * 100).toStringAsFixed(2)}%';
      } else {
        percentDoneText = (percentDone == 1)
            ? (widget.isFromCache
                  ? context.loc.media.loading.loadingAndRenderingFromCache
                  : context.loc.media.loading.rendering)
            : '${(percentDone * 100).toStringAsFixed(2)}%';
      }
    } else {
      if (isVideo) {
        percentDoneText = widget.isFromCache
            ? context.loc.media.loading.loadingFromCache
            : context.loc.media.loading.buffering;
      } else {
        percentDoneText = widget.isDone
            ? context.loc.media.loading.rendering
            : (widget.isFromCache ? context.loc.media.loading.loadingFromCache : context.loc.media.loading.loading);
      }
    }

    final String filesizeText = (hasProgressData && percentDone < 1) ? '$loadedSize / $expectedSize' : '';

    int expectedSpeed = 0;
    if (hasProgressData && _prevAmount > 0 && _lastAmount > 0) {
      expectedSpeed = ((_lastAmount - _prevAmount) * (1000 / (nowMils - _prevTime))).round();
      // expectedSpeed = ((_lastAmount - _prevAmount) * (1000 / speedCheckInterval)).round();
    }
    final String expectedSpeedText = (hasProgressData && percentDone < 1)
        ? '${Tools.formatBytes(expectedSpeed, 1)}/s'
        : '';

    final double expectedTime = hasProgressData
        ? (expectedSpeed == 0 ? double.infinity : ((totalBytes - expectedBytes) / expectedSpeed))
        : 0;
    final String expectedTimeText = (hasProgressData && expectedTime > 0 && percentDone < 1)
        ? '~${expectedTime.toStringAsFixed(1)} s'
        : '';

    final int sinceStartSeconds = (sinceStart / 1000).floor();
    final String sinceStartText = (!widget.isDone && percentDone < 1)
        ? context.loc.media.loading.startedSecondsAgo(seconds: sinceStartSeconds)
        : '';

    final bool isMovedBelow = settingsHandler.previewMode == 'Sample' && !widget.item.isHated;

    // print('$percentDone | $percentDoneText');

    if (!widget.isViewed) {
      // Do the calculations, but don't render anything if not viewed
      return const SizedBox.shrink();
    }

    List<Widget> children = [];
    if (widget.isStopped) {
      children = [
        if (widget.stopReason != null)
          LoadingText(
            text: widget.stopReason?.description ?? '',
            fontSize: 20,
          ),
        if (widget.stopDetails != null)
          LoadingText(
            text: widget.stopDetails ?? '',
            fontSize: 18,
          ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          icon: const Icon(
            Icons.play_arrow,
            size: 40,
            color: Colors.blue,
          ),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.black54),
            fixedSize: const WidgetStatePropertyAll(Size(double.infinity, 54)),
          ),
          label: LoadingText(
            text: (widget.isTooBig || widget.item.isHated)
                ? context.loc.media.loading.loadAnyway
                : context.loc.media.loading.restartLoading,
            fontSize: 16,
            color: Colors.blue,
          ),
          onPressed: () {
            widget.onRestart?.call();
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
                size: 40,
                color: Theme.of(context).colorScheme.error,
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black54),
                fixedSize: const WidgetStatePropertyAll(Size(double.infinity, 54)),
              ),
              label: LoadingText(
                text: context.loc.media.loading.stopLoading,
                fontSize: 18,
                color: Theme.of(context).colorScheme.error,
              ),
              onPressed: () {
                widget.onStop?.call();
              },
            ),
          if (isMovedBelow) const SizedBox(height: 60),
        ];
      }
    }

    final Widget progressIndicator = percentDone == 0
        ? const LinearProgressIndicator()
        : AnimatedProgressIndicator(
            value: percentDone,
            animationDuration: const Duration(milliseconds: 100),
            indicatorStyle: IndicatorStyle.linear,
            valueColor: Theme.of(context).progressIndicatorTheme.color?.withValues(alpha: 0.66),
            minHeight: 6,
          );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RepaintBoundary(
          child: RotatedBox(
            quarterTurns: -1,
            child: progressIndicator,
          ),
        ),
        //
        //
        Expanded(
          child: RepaintBoundary(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: Column(
                // move loading info lower if preview is of sample quality (except when item is hated)
                mainAxisAlignment: isMovedBelow ? MainAxisAlignment.end : MainAxisAlignment.center,
                children: children,
              ),
            ),
          ),
        ),
        //
        //
        RepaintBoundary(
          child: RotatedBox(
            quarterTurns: percentDone != 0 ? -1 : 1,
            child: progressIndicator,
          ),
        ),
      ],
    );
  }
}

class LoadingText extends StatelessWidget {
  const LoadingText({
    required this.text,
    required this.fontSize,
    this.color = Colors.white,
    super.key,
  });

  final String text;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return const SizedBox.shrink();
    }

    return BorderedText(
      key: ValueKey<String>(text),
      strokeWidth: 3,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
        ),
      ),
    );

    // TODO animate text value changes?
    // return AnimatedSwitcher(
    //   duration: const Duration(milliseconds: 50),
    //   child: BorderedText(
    //     key: ValueKey<String>(text),
    //     strokeWidth: 3,
    //     child: Text(
    //       text,
    //       style: TextStyle(
    //         fontSize: fontSize,
    //         color: color,
    //       ),
    //     ),
    //   ),
    // );
  }
}
