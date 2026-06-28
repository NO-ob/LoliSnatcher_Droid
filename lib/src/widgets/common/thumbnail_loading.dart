import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/widgets/common/bordered_text.dart';
import 'package:lolisnatcher/src/widgets/common/loading_progress.dart';

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

  final void Function()? restartAction;
  final String? retryText;
  final Widget? retryIcon;

  final String? errorCode;

  @override
  State<ThumbnailLoading> createState() => _ThumbnailLoadingState();
}

class _ThumbnailLoadingState extends State<ThumbnailLoading> {
  late LoadingProgressTracker _progressTracker;

  @override
  void initState() {
    super.initState();

    _progressTracker = _createProgressTracker();
  }

  LoadingProgressTracker _createProgressTracker() {
    return LoadingProgressTracker(
      total: widget.total,
      received: widget.received,
      startedAt: widget.startedAt,
      debounceTag: 'loading_thumbnail_progress_${widget.item.hashCode}',
      onChanged: updateState,
      progressDebounceDuration: const Duration(milliseconds: 250),
      completedDebounceDuration: Duration.zero,
      periodicRefreshInterval: const Duration(milliseconds: 500),
      shouldRefresh: () => !widget.isDone && !widget.isFailed,
    );
  }

  void updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didUpdateWidget(covariant ThumbnailLoading oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.item, widget.item)) {
      _progressTracker.dispose();
      _progressTracker = _createProgressTracker();
      return;
    }

    _progressTracker.updateSources(
      total: widget.total,
      received: widget.received,
      startedAt: widget.startedAt,
    );
  }

  @override
  void dispose() {
    _progressTracker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int nowMils = DateTime.now().millisecondsSinceEpoch;
    final LoadingProgressSnapshot progress = _progressTracker.snapshot(
      hasProgress: widget.hasProgress,
      nowMillis: nowMils,
    );
    final int sinceStart = progress.sinceStartMillis;
    final bool showLoading = !widget.isDone && (widget.isFailed || (sinceStart > 499));
    // bool showLoading = !widget.isDone || widget.isFailed;
    // delay showing loading info a bit, so we don't clutter interface for fast loading files

    // return buildElement(context);

    return Material(
      color: Colors.transparent,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
        opacity: showLoading ? 1 : 0,
        onEnd: updateState,
        child: buildElement(context, progress),
      ),
    );
  }

  Widget buildElement(BuildContext context, LoadingProgressSnapshot progress) {
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

    final double percentDone = progress.percentDone;
    // String? percentDoneText = hasProgressData
    //     ? ((percentDone ?? 0) == 1 ? null : '${(percentDone! * 100).toStringAsFixed(2)}%')
    //     : (isFromCache == true ? '...' : null);

    if (widget.isFromCache == true) {
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
