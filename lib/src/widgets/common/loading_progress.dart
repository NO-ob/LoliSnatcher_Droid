import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:lolisnatcher/src/utils/debouncer.dart';

class LoadingProgressTracker {
  LoadingProgressTracker({
    required ValueNotifier<int> total,
    required ValueNotifier<int> received,
    required ValueNotifier<int> startedAt,
    required this.debounceTag,
    required this.onChanged,
    required this.progressDebounceDuration,
    required this.completedDebounceDuration,
    this.periodicRefreshInterval,
    this.shouldRefresh,
    this.initialSpeedSampleInterval = const Duration(milliseconds: 500),
    this.speedSampleInterval = const Duration(milliseconds: 1000),
    this.speedSmoothingFactor = 0.35,
  }) : assert(
         speedSmoothingFactor > 0 && speedSmoothingFactor <= 1,
         'speedSmoothingFactor must be greater than 0 and no more than 1',
       ),
       _totalNotifier = total,
       _receivedNotifier = received,
       _startedAtNotifier = startedAt {
    _readCurrentValues();
    _listen();
    _resetSpeedSamples();
    _startPeriodicRefresh();
  }

  ValueNotifier<int> _totalNotifier;
  ValueNotifier<int> _receivedNotifier;
  ValueNotifier<int> _startedAtNotifier;

  final String debounceTag;
  final VoidCallback onChanged;
  final Duration progressDebounceDuration;
  final Duration completedDebounceDuration;
  final Duration? periodicRefreshInterval;
  final bool Function()? shouldRefresh;
  final Duration initialSpeedSampleInterval;
  final Duration speedSampleInterval;
  final double speedSmoothingFactor;

  int _total = 0;
  int _received = 0;
  int _startedAt = 0;

  int _previousAmount = 0;
  int _lastAmount = 0;
  int _previousTime = 0;
  int _lastTime = 0;
  int _smoothedSpeedBytesPerSecond = 0;

  Timer? _periodicRefresh;
  bool _isDisposed = false;

  LoadingProgressSnapshot snapshot({
    required bool hasProgress,
    int? nowMillis,
  }) {
    final int now = nowMillis ?? DateTime.now().millisecondsSinceEpoch;
    final bool hasProgressData = hasProgress && _total > 0;
    final int receivedBytes = hasProgressData ? _received : 0;
    final int totalBytes = hasProgressData ? _total : 0;
    final double percentDone = hasProgressData ? (receivedBytes / totalBytes).clamp(0, 1).toDouble() : 0;

    _sampleSpeed(
      hasProgressData: hasProgressData,
      receivedBytes: receivedBytes,
      nowMillis: now,
    );

    final int speedBytesPerSecond = _speedBytesPerSecond();
    final double estimatedSecondsRemaining = hasProgressData && speedBytesPerSecond > 0
        ? (totalBytes - receivedBytes) / speedBytesPerSecond
        : double.infinity;

    return LoadingProgressSnapshot(
      totalBytes: totalBytes,
      receivedBytes: receivedBytes,
      startedAtMillis: _startedAt,
      nowMillis: now,
      hasProgressData: hasProgressData,
      percentDone: percentDone,
      speedBytesPerSecond: speedBytesPerSecond,
      estimatedSecondsRemaining: estimatedSecondsRemaining,
    );
  }

  void updateSources({
    required ValueNotifier<int> total,
    required ValueNotifier<int> received,
    required ValueNotifier<int> startedAt,
  }) {
    if (identical(_totalNotifier, total) &&
        identical(_receivedNotifier, received) &&
        identical(_startedAtNotifier, startedAt)) {
      return;
    }

    _unlisten();

    _totalNotifier = total;
    _receivedNotifier = received;
    _startedAtNotifier = startedAt;

    _readCurrentValues();
    _resetSpeedSamples();
    _listen();
    _scheduleChanged(Duration.zero);
  }

  void dispose() {
    _isDisposed = true;
    _total = 0;
    _received = 0;
    _startedAt = 0;
    _resetSpeedSamples();
    _unlisten();
    _periodicRefresh?.cancel();
    Debounce.cancel(debounceTag);
  }

  void _listen() {
    _totalNotifier.addListener(_onTotalChanged);
    _receivedNotifier.addListener(_onReceivedChanged);
    _startedAtNotifier.addListener(_onStartedAtChanged);
  }

  void _unlisten() {
    _totalNotifier.removeListener(_onTotalChanged);
    _receivedNotifier.removeListener(_onReceivedChanged);
    _startedAtNotifier.removeListener(_onStartedAtChanged);
  }

  void _readCurrentValues() {
    _total = _totalNotifier.value;
    _received = _receivedNotifier.value;
    _startedAt = _startedAtNotifier.value;
  }

  void _onTotalChanged() => _onBytesChanged(total: _totalNotifier.value);

  void _onReceivedChanged() => _onBytesChanged(received: _receivedNotifier.value);

  void _onStartedAtChanged() {
    _total = 0;
    _received = 0;
    _startedAt = _startedAtNotifier.value;
    _resetSpeedSamples();
    _scheduleChanged(Duration.zero);
  }

  void _onBytesChanged({
    int? received,
    int? total,
  }) {
    _received = received ?? _received;
    _total = total ?? _total;

    final bool isDone = _total > 0 && _received >= _total;
    _scheduleChanged(isDone ? completedDebounceDuration : progressDebounceDuration);
  }

  void _scheduleChanged(Duration duration) {
    Debounce.delay(
      tag: debounceTag,
      callback: () {
        if (_isDisposed) return;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!_isDisposed) {
            onChanged();
          }
        });
      },
      duration: duration,
    );
  }

  void _startPeriodicRefresh() {
    final Duration? interval = periodicRefreshInterval;
    if (interval == null) return;

    _periodicRefresh = Timer.periodic(interval, (_) {
      if (shouldRefresh?.call() ?? true) {
        onChanged();
      }
    });
  }

  void _resetSpeedSamples() {
    _previousAmount = 0;
    _lastAmount = 0;
    _smoothedSpeedBytesPerSecond = 0;

    _previousTime = DateTime.now().millisecondsSinceEpoch - 1;
    _lastTime = _previousTime + 1;
  }

  void _sampleSpeed({
    required bool hasProgressData,
    required int receivedBytes,
    required int nowMillis,
  }) {
    final Duration sampleInterval = _smoothedSpeedBytesPerSecond == 0
        ? initialSpeedSampleInterval
        : speedSampleInterval;
    if (!hasProgressData || (nowMillis - _lastTime) <= sampleInterval.inMilliseconds) {
      return;
    }

    _previousAmount = _lastAmount;
    _lastAmount = receivedBytes;

    _previousTime = _lastTime;
    _lastTime = nowMillis;
    _smoothedSpeedBytesPerSecond = _smoothedSpeed(_instantSpeedBytesPerSecond());
  }

  int _speedBytesPerSecond() {
    return _smoothedSpeedBytesPerSecond;
  }

  int _instantSpeedBytesPerSecond() {
    if (_previousAmount < 0 || _lastAmount <= 0 || _lastTime <= _previousTime) {
      return 0;
    }

    final int deltaBytes = _lastAmount - _previousAmount;
    if (deltaBytes <= 0) {
      return 0;
    }

    return (deltaBytes * (1000 / (_lastTime - _previousTime))).round();
  }

  int _smoothedSpeed(int instantSpeed) {
    if (instantSpeed <= 0) {
      return 0;
    }

    if (_smoothedSpeedBytesPerSecond <= 0) {
      return instantSpeed;
    }

    return (_smoothedSpeedBytesPerSecond * (1 - speedSmoothingFactor) + instantSpeed * speedSmoothingFactor).round();
  }
}

class LoadingProgressSnapshot {
  const LoadingProgressSnapshot({
    required this.totalBytes,
    required this.receivedBytes,
    required this.startedAtMillis,
    required this.nowMillis,
    required this.hasProgressData,
    required this.percentDone,
    required this.speedBytesPerSecond,
    required this.estimatedSecondsRemaining,
  });

  final int totalBytes;
  final int receivedBytes;
  final int startedAtMillis;
  final int nowMillis;
  final bool hasProgressData;
  final double percentDone;
  final int speedBytesPerSecond;
  final double estimatedSecondsRemaining;

  int get sinceStartMillis {
    if (startedAtMillis == 0) return 0;

    return (nowMillis - startedAtMillis).clamp(0, double.infinity).toInt();
  }
}
