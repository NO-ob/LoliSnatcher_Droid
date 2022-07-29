import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/utils/tools.dart';

class ImageStats extends StatefulWidget {
  const ImageStats({
      Key? key,
      required this.child,
      this.width = 120,
      this.height = 40,
      this.isEnabled = true,
      this.align
  }) : super(key: key);

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
  double _ticks = 0;
  final RxInt _totalLive = 0.obs;
  final RxInt _totalPending = 0.obs;
  final RxInt _totalAll = 0.obs;
  final RxInt _cacheSize = 0.obs;
  final RxInt _cacheMax = 0.obs;
  final bool _shouldRepaint = false;
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
    _cacheSize.value = PaintingBinding.instance.imageCache.currentSizeBytes ;
    _cacheMax.value = PaintingBinding.instance.imageCache.maximumSizeBytes;
  }

  void _handleTick(Duration d) {
    if (!widget.isEnabled) {
      _lastCalcTime = nowMs;
      return;
    }
    // Tick
    _ticks++;
    // Calculate
    if (nowMs - _lastCalcTime > sampleTimeMs) {
      int remainder = (nowMs - _lastCalcTime - sampleTimeMs).round();
      _lastCalcTime = nowMs - remainder;
      _ticks = 0;
      updateValues();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: <Widget>[
            widget.child,
            if (widget.isEnabled)
              IgnorePointer(
                child: Align(
                  alignment: widget.align ?? Alignment.topLeft,
                  child: Container(
                    width: widget.width,
                    height: widget.height,
                    color: Colors.white.withOpacity(0.8),
                    child: RepaintBoundary(
                      child: Obx(() => Column(
                        children: [
                          Text('Live: ${_totalLive.value}'),
                          Text('Pending: ${_totalPending.value}'),
                          Text('Total: ${_totalAll.value}'),
                          Text('Size: ${Tools.formatBytes(_cacheSize.value, 0)}'),
                          Text('Max: ${Tools.formatBytes(_cacheMax.value, 0)}'),
                        ]
                      )),
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
