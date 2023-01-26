import 'dart:async';

//  based on https://github.com/magnuswikhog/easy_debounce

class Debounce {
  // ignore: prefer_final_fields
  static Map<String, DebounceOperation> _debounceMap = {};
  Debounce();

  /// Debounce a [callback] function by [duration]
  static void debounce({
    required String tag,
    required void Function() callback,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    if (duration == Duration.zero) {
      // if duration is zero, just call the callback
      cancel(tag);
      callback();
      return;
    } else {
      _debounceMap[tag]?.timer.cancel();

      _debounceMap[tag] = DebounceOperation(
        callback: callback,
        timer: Timer(duration, () {
          cancel(tag);
          // print('debounce: $tag');
          callback();
        }),
      );
    }
  }

  /// Debounce a [callback] function by [duration], but call it immediately if the [duration] has passed after the call that created the debounce entry
  static void delay({
    required String tag,
    required void Function() callback,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    if (duration == Duration.zero) {
      cancel(tag);
      callback();
      return;
    } else {
      if (_debounceMap[tag]?.startedAt != null) {
        final int startedAt = _debounceMap[tag]?.startedAt ?? 0;
        final int now = DateTime.now().millisecondsSinceEpoch;
        final int diff = now - startedAt;
        if (diff < duration.inMilliseconds) {
          cancel(tag);
          callback();
          return;
        }
      }

      _debounceMap[tag] = DebounceOperation(
        callback: callback,
        timer: Timer(duration, () {
          cancel(tag);
          // print('delay: $tag');
          callback();
        }),
        startedAt: DateTime.now().millisecondsSinceEpoch,
      );
    }
  }

  static void fire(String tag, {bool withCancel = false}) {
    // call the callback immediately, ignoring the debounce
    _debounceMap[tag]?.callback();

    if (withCancel) {
      cancel(tag);
    }
  }

  static void cancel(String tag) {
    _debounceMap[tag]?.timer.cancel();
    _debounceMap.remove(tag);
  }

  static void cancelAllStartingWith(String substring) {
    // cancel all debounce operations that have tag, starting with the given substring
    // i.e. loading_element_progress_[fileUrl] where [fileUrl] is not included in the substring
    _debounceMap.keys.where((key) => key.startsWith(substring)).forEach((key) => cancel(key));
  }

  static void cancelAll() {
    for (final operation in _debounceMap.values) {
      operation.timer.cancel();
    }
    _debounceMap.clear();
  }
}

class DebounceOperation {
  final void Function() callback;
  final Timer timer;
  final int? startedAt;

  DebounceOperation({required this.callback, required this.timer, this.startedAt});
}
