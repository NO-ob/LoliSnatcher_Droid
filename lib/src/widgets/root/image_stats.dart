import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:lolisnatcher/src/utils/tools.dart';

class ImageStats extends StatefulWidget {
  const ImageStats({
    required this.child,
    this.width = 120,
    this.height = 100,
    this.isEnabled = true,
    this.align,
    super.key,
  });

  /// Toggle the stats on/off, there should be no performance cost when the widget is off.
  final bool isEnabled;

  /// Width of widget in px
  final double width;

  /// Height of widget in px
  final double height;

  /// A child to be displayed under the Stats
  final Widget child;

  /// Where to align the stats relative to the child
  final Alignment? align;

  @override
  State<ImageStats> createState() => _ImageStatsState();
}

class _ImageStatsState extends State<ImageStats> {
  int _lastCalcTime = 0;
  late Ticker _ticker;
  // double _ticks = 0;
  final ValueNotifier<int> _totalLive = ValueNotifier(0);
  final ValueNotifier<int> _totalPending = ValueNotifier(0);
  final ValueNotifier<int> _totalAll = ValueNotifier(0);
  final ValueNotifier<int> _cacheSize = ValueNotifier(0);
  final ValueNotifier<int> _cacheMax = ValueNotifier(0);
  // final bool _shouldRepaint = false;
  int sampleTimeMs = 500;

  int get nowMs => DateTime.now().millisecondsSinceEpoch;

  @override
  void initState() {
    super.initState();
    _ticker = Ticker(_handleTick);
    updateValues();
    if (widget.isEnabled) _ticker.start();
    _lastCalcTime = nowMs;
  }

  @override
  void didUpdateWidget(ImageStats oldWidget) {
    final isEnabled = widget.isEnabled;

    if (oldWidget.isEnabled != isEnabled) {
      isEnabled ? _ticker.start() : _ticker.stop();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void updateValues() {
    _totalLive.value = PaintingBinding.instance.imageCache.liveImageCount;
    _totalPending.value = PaintingBinding.instance.imageCache.pendingImageCount;
    _totalAll.value = PaintingBinding.instance.imageCache.currentSize;
    _cacheSize.value = PaintingBinding.instance.imageCache.currentSizeBytes;
    _cacheMax.value = PaintingBinding.instance.imageCache.maximumSizeBytes;
  }

  void _handleTick(Duration d) {
    if (!widget.isEnabled) {
      _lastCalcTime = nowMs;
      return;
    }
    // Tick
    // _ticks++;
    // Calculate
    if (nowMs - _lastCalcTime > sampleTimeMs) {
      final int remainder = nowMs - _lastCalcTime - sampleTimeMs;
      _lastCalcTime = nowMs - remainder;
      // _ticks = 0;
      updateValues();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            widget.child,
            if (widget.isEnabled)
              IgnorePointer(
                child: Align(
                  alignment: widget.align ?? Alignment.topLeft,
                  child: Container(
                    width: widget.width,
                    height: widget.height,
                    color: Colors.white.withValues(alpha: 0.8),
                    child: RepaintBoundary(
                      child: ListenableBuilder(
                        listenable: Listenable.merge(
                          [
                            _totalLive,
                            _totalPending,
                            _totalAll,
                            _cacheSize,
                            _cacheMax,
                          ],
                        ),
                        builder: (context, child) => Column(
                          children: [
                            Text('Live: ${_totalLive.value}'),
                            Text('Pending: ${_totalPending.value}'),
                            Text('Total: ${_totalAll.value}'),
                            Text('Size: ${Tools.formatBytes(_cacheSize.value, 0)}'),
                            Text('Max: ${Tools.formatBytes(_cacheMax.value, 0)}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
