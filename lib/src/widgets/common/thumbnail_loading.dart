import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/debouncer.dart';
import 'package:lolisnatcher/src/widgets/common/bordered_text.dart';

class ThumbnailLoading extends StatefulWidget {
  const ThumbnailLoading({
    required this.item,
    required this.hasProgress,
    required this.isFromCache,
    required this.isDone,
    required this.isFailed,
    required this.total,
    required this.received,
    required this.startedAt,
    required this.restartAction,
    this.retryText,
    this.retryIcon,
    this.errorCode,
    super.key,
  });

  final BooruItem item;

  final bool hasProgress;
  final bool? isFromCache;
  final bool isDone;
  final bool isFailed;

  final ValueNotifier<int> total;
  final ValueNotifier<int> received;
  final ValueNotifier<int> startedAt;

  final String? retryText;
  final Widget? retryIcon;
  final String? errorCode;

  final void Function()? restartAction;

  @override
  State<ThumbnailLoading> createState() => _ThumbnailLoadingState();
}

class _ThumbnailLoadingState extends State<ThumbnailLoading> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  bool isVisible = false;
  int _total = 0, _received = 0, _startedAt = 0;

  @override
  void initState() {
    super.initState();

    _total = widget.total.value;
    _received = widget.received.value;
    _startedAt = widget.startedAt.value;

    widget.total.addListener(onTotalChanged);
    widget.received.addListener(onReceivedChanged);
    widget.startedAt.addListener(onStartedAtChanged);
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
      tag: 'loading_thumbnail_progress_${widget.item.hashCode}',
      callback: updateState,
      duration: Duration(milliseconds: isDone ? 0 : 250),
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

    widget.total.removeListener(onTotalChanged);
    widget.received.removeListener(onReceivedChanged);
    widget.startedAt.removeListener(onStartedAtChanged);
    Debounce.cancel('loading_thumbnail_progress_${widget.item.hashCode}');
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
    final bool showLoading = !widget.isDone && (widget.isFailed || (sinceStart > 499));
    // bool showLoading = !widget.isDone || widget.isFailed;
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
      child: buildElement(context),
    );
  }

  Widget buildElement(BuildContext context) {
    if (widget.isDone) {
      return const SizedBox.shrink();
    }

    if (widget.isFailed) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: InkWell(
            onTap: widget.restartAction,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.retryIcon ?? const Icon(Icons.broken_image),
                  const BorderedText(
                    strokeWidth: 2,
                    child: Text(
                      'ERROR',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  BorderedText(
                    strokeWidth: 2,
                    child: Text(
                      widget.retryText ?? 'Tap to retry',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (widget.errorCode?.isNotEmpty == true)
                    BorderedText(
                      strokeWidth: 2,
                      child: Text(
                        widget.errorCode!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    final bool hasProgressData = widget.hasProgress && (_total > 0);
    final int expectedBytes = hasProgressData ? _received : 0;
    final int totalBytes = hasProgressData ? _total : 0;

    final double percentDone = hasProgressData ? (expectedBytes / totalBytes) : 0;
    // String? percentDoneText = hasProgressData
    //     ? ((percentDone ?? 0) == 1 ? null : '${(percentDone! * 100).toStringAsFixed(2)}%')
    //     : (isFromCache == true ? '...' : null);

    if (widget.isFromCache != false) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 1,
          child: RotatedBox(
            quarterTurns: -1,
            child: Opacity(
              opacity: 0.66,
              child: LinearProgressIndicator(
                value: percentDone == 0 ? null : percentDone,
              ),
            ),
          ),
        ),
        //
        SizedBox(
          width: 1,
          child: RotatedBox(
            quarterTurns: percentDone != 0 ? -1 : 1,
            child: Opacity(
              opacity: 0.66,
              child: LinearProgressIndicator(
                value: percentDone == 0 ? null : percentDone,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
