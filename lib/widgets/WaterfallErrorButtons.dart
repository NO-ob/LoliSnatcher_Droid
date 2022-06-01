import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/Tools.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';

class WaterfallErrorButtons extends StatefulWidget {
  const WaterfallErrorButtons({Key? key}) : super(key: key);

  @override
  State<WaterfallErrorButtons> createState() => _WaterfallErrorButtonsState();
}

class _WaterfallErrorButtonsState extends State<WaterfallErrorButtons> {
  final SearchHandler searchHandler = SearchHandler.instance;

  int _startedAt = 0;
  Timer? checkInterval;
  bool isVisible = true;
  StreamSubscription<bool>? loadingListener;

  @override
  void initState() {
    super.initState();
    startTimer();
    loadingListener = searchHandler.isLoading.listen((bool isLoading) {
      if (isLoading) {
        startTimer();
      } else {
        stopTimer();
      }
    });
  }

  void updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  void startTimer() {
    if (_startedAt == 0) {
      _startedAt = DateTime.now().millisecondsSinceEpoch;
      checkInterval?.cancel();
      checkInterval = Timer.periodic(const Duration(seconds: 1), (timer) {
        // force restate every second to refresh all timers/indicators, even when loading has stopped/slowed down
        updateState();
      });
    }
  }

  void stopTimer() {
    _startedAt = 0;
    checkInterval?.cancel();
    updateState();
  }

  @override
  void dispose() {
    checkInterval?.cancel();
    loadingListener?.cancel();
    super.dispose();
  }

  Widget wrapButton(Widget child) {
    return Container(color: Theme.of(context).colorScheme.background.withOpacity(0.66), child: child);
  }

  @override
  Widget build(BuildContext context) {
    final String clickName = (Platform.isWindows || Platform.isLinux) ? 'Click' : 'Tap';
    int nowMils = DateTime.now().millisecondsSinceEpoch;
    int sinceStart = _startedAt == 0 ? 0 : Duration(milliseconds: nowMils - _startedAt).inSeconds;
    String sinceStartText = sinceStart > 0 ? 'Started ${sinceStart.toString()} ${Tools.pluralize('second', sinceStart)} ago' : '';

    return SafeArea(
      child: Obx(() {
        if (searchHandler.isLastPage.value) {
          // if last page...
          if (searchHandler.currentFetched.isEmpty) {
            // ... and no items loaded
            return wrapButton(SettingsButton(
              name: 'No Data Loaded',
              subtitle: Text('$clickName Here to Reload'),
              icon: const Icon(Icons.refresh),
              dense: true,
              action: () {
                searchHandler.retrySearch();
              },
              drawBottomBorder: false,
            ));
          } else {
            //if(searchHandler.currentFetched.length > 0) {
            // .. has items loaded
            if (isVisible) {
              final int pageNum = searchHandler.pageNum.value;
              return wrapButton(SettingsButton(
                name: 'You Reached the End ($pageNum ${Tools.pluralize('page', pageNum)})',
                subtitle: Text('$clickName Here to Reload Last Page'),
                icon: const Icon(Icons.refresh),
                dense: true,
                action: () {
                  searchHandler.retrySearch();
                  if (!isVisible) {
                    isVisible = !isVisible;
                    updateState();
                  }
                },
                trailingIcon: IconButton(
                  onPressed: () {
                    isVisible = !isVisible;
                    updateState();
                  },
                  icon: const Icon(Icons.arrow_drop_down),
                ),
                drawBottomBorder: false,
              ));
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background.withOpacity(0.66),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () {
                        searchHandler.retrySearch();
                        if (!isVisible) {
                          isVisible = !isVisible;
                          updateState();
                        }
                      },
                      iconSize: 28,
                      icon: const Icon(Icons.refresh),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background.withOpacity(0.66),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () {
                        isVisible = !isVisible;
                        updateState();
                      },
                      iconSize: 28,
                      icon: const Icon(Icons.arrow_drop_up),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              );
            }
          }
        } else {
          // if not last page...
          if (searchHandler.isLoading.value) {
            // ... and is currently loading
            return wrapButton(SettingsButton(
              name: 'Loading Page #${searchHandler.pageNum}',
              subtitle: AnimatedOpacity(
                opacity: sinceStartText.isNotEmpty ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Text(sinceStartText),
              ),
              icon: const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(),
              ),
              dense: true,
              action: () {
                searchHandler.retrySearch();
              },
              drawBottomBorder: false,
            ));
          } else {
            if (searchHandler.errorString.isNotEmpty) {
              final String errorFormatted = searchHandler.errorString.isNotEmpty ? '\n${searchHandler.errorString}' : '';
              // ... if error happened
              return wrapButton(SettingsButton(
                name: 'Error happened when Loading Page #${searchHandler.pageNum}: $errorFormatted',
                subtitle: Text('$clickName Here to Retry'),
                icon: const Icon(Icons.refresh),
                dense: true,
                action: () {
                  searchHandler.retrySearch();
                },
                drawBottomBorder: false,
              ));
            } else if (searchHandler.currentFetched.isEmpty) {
              // ... no items loaded
              return wrapButton(SettingsButton(
                name: 'Error, no data loaded:',
                subtitle: Text('$clickName Here to Retry'),
                icon: const Icon(Icons.refresh),
                dense: true,
                action: () {
                  searchHandler.retrySearch();
                },
                drawBottomBorder: false,
              ));
            } else {
              // return const SizedBox.shrink();
    
              // add a small container to avoid scrolling when swiping from the bottom of the screen (navigation gestures)
              return Container(height: 10, color: Colors.transparent);
            }
          }
        }
      }),
    );
  }
}
