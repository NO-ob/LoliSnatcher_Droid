import 'dart:async';

//  based on https://github.com/magnuswikhog/easy_debounce

class Debounce {
  // ignore: prefer_final_fields
  static Map<String, DebounceOperation> _debounceMap = {};
  Debounce();

  static void debounce({required String tag, required void Function() callback, Duration duration = const Duration(milliseconds: 500)}) {
    if(duration == Duration.zero) {
      // if duration is zero, just call the callback
      callback();
      return;
    } else {
      _debounceMap[tag]?.timer.cancel();

      _debounceMap[tag] = DebounceOperation(
        callback: callback,
        timer: Timer(duration, () {
          _debounceMap[tag]?.timer.cancel();
          _debounceMap.remove(tag);
          // print('debounce: $tag');

          callback();
        }),
      );
    }
  }

  static void fire(String tag, {bool withCancel = false}) {
    // call the callback immediately, ignoring the debounce
    _debounceMap[tag]?.callback();

    if(withCancel) {
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

  DebounceOperation({required this.callback, required this.timer});
}
