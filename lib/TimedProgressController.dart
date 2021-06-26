import 'dart:async';

// code from https://stackoverflow.com/questions/56853554/show-timer-progress-on-a-circularprogressindicator-in-flutter

class TimedProgressController {
  static const double smoothnessConstant = 250;

  final Duration duration;
  final Duration tickPeriod;

  Timer? _timer;
  Timer? _periodicTimer;

  Stream<void> get progressStream => _progressController.stream;
  StreamController<void> _progressController = StreamController<void>.broadcast();

  double get progress => _progress;
  double _progress = 0;

  TimedProgressController({required this.duration})
      : assert(duration != null),
        tickPeriod = _calculateTickPeriod(duration);

  void start() {
    _timer = Timer(duration, () {
      _cancelTimers();
      _setProgressAndNotify(0);
    });

    _periodicTimer = Timer.periodic(
      tickPeriod,
      (Timer timer) {
        double progress = _calculateProgress(timer);
        _setProgressAndNotify(progress);
      },
    );
  }

  void stop() {
    _cancelTimers();
    _setProgressAndNotify(0);
  }

  void restart() {
    _cancelTimers();
    start();
  }

  Future<void> dispose() async {
    await _cancelStreams();
    _cancelTimers();
  }

  double _calculateProgress(Timer timer) {
    double progress = timer.tick / smoothnessConstant;

    if (progress > 1) return 1;
    if (progress < 0) return 0;
    return progress;
  }

  void _setProgressAndNotify(double value) {
    _progress = value;
    _progressController.add(null);
  }

  Future<void> _cancelStreams() async {
    if (!_progressController.isClosed) await _progressController.close();
  }

  void _cancelTimers() {
    if (_timer?.isActive == true) _timer?.cancel();
    if (_periodicTimer?.isActive == true) _periodicTimer?.cancel();
  }

  static Duration _calculateTickPeriod(Duration duration) {
    double tickPeriodMs = duration.inMilliseconds / smoothnessConstant;
    return Duration(milliseconds: tickPeriodMs.toInt());
  }
}