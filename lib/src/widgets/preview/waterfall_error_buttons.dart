import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class WaterfallErrorButtons extends StatefulWidget {
  const WaterfallErrorButtons({super.key});

  @override
  State<WaterfallErrorButtons> createState() => _WaterfallErrorButtonsState();
}

class _WaterfallErrorButtonsState extends State<WaterfallErrorButtons> {
  final SearchHandler searchHandler = SearchHandler.instance;

  int _startedAt = 0;
  Timer? checkInterval;
  bool isCollapsed = false;
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

  @override
  Widget build(BuildContext context) {
    final String clickName = SettingsHandler.isDesktopPlatform ? 'Click' : 'Tap';
    final int nowMils = DateTime.now().millisecondsSinceEpoch;
    final int sinceStart = _startedAt == 0 ? 0 : Duration(milliseconds: nowMils - _startedAt).inSeconds;
    final bool isTakingTooLong = sinceStart > 5;
    final String sinceStartText = sinceStart > 0
        ? 'Started $sinceStart ${Tools.pluralize('second', sinceStart)} ago${isTakingTooLong ? '\n$clickName here to restart if search is taking too long or seems stuck' : ''}'
        : '';

    return Obx(() {
      if (searchHandler.isLastPage.value) {
        // if last page...
        if (searchHandler.currentFetched.isEmpty) {
          // ... and no items loaded
          return _ButtonWrapper(
            child: SettingsButton(
              name: 'No Data Loaded',
              subtitle: Text('$clickName Here to Reload'),
              icon: const Icon(Icons.refresh),
              dense: true,
              action: searchHandler.retrySearch,
              drawBottomBorder: false,
            ),
          );
        } else {
          // .. has items loaded
          if (!isCollapsed) {
            final int pageNum = searchHandler.pageNum.value;
            return _ButtonWrapper(
              child: SettingsButton(
                name: 'You Reached the End ($pageNum ${Tools.pluralize('page', pageNum)})',
                subtitle: Text('$clickName Here to Reload Last Page'),
                icon: const Icon(Icons.refresh),
                dense: true,
                action: () {
                  searchHandler.retrySearch();
                  if (isCollapsed) {
                    isCollapsed = !isCollapsed;
                    updateState();
                  }
                },
                trailingIcon: IconButton(
                  onPressed: () {
                    isCollapsed = !isCollapsed;
                    updateState();
                  },
                  icon: const Icon(Icons.arrow_drop_down),
                ),
                drawBottomBorder: false,
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.66),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () {
                        searchHandler.retrySearch();
                        if (isCollapsed) {
                          isCollapsed = !isCollapsed;
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
                      color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.66),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () {
                        isCollapsed = !isCollapsed;
                        updateState();
                      },
                      iconSize: 28,
                      icon: const Icon(Icons.arrow_drop_up),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            );
          }
        }
      } else {
        // if not last page...
        if (searchHandler.isLoading.value) {
          // ... and is currently loading
          return _ButtonWrapper(
            child: SettingsButton(
              name: 'Loading Page #${searchHandler.pageNum}',
              subtitle: AnimatedOpacity(
                opacity: sinceStartText.isNotEmpty ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: Text(sinceStartText),
              ),
              icon: const RepaintBoundary(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
              ),
              trailingIcon: isTakingTooLong ? const Icon(Icons.refresh) : null,
              dense: true,
              action: () {
                stopTimer();
                startTimer();
                searchHandler.retrySearch();
              },
              drawBottomBorder: false,
            ),
          );
        } else {
          if (searchHandler.errorString.isNotEmpty) {
            final String errorFormatted = searchHandler.errorString.isNotEmpty ? '\n${searchHandler.errorString}' : '';
            // ... if error happened
            if (!isCollapsed) {
              return _ButtonWrapper(
                child: SettingsButton(
                  name: 'Error happened when Loading Page #${searchHandler.pageNum}: $errorFormatted',
                  subtitle: Text('$clickName Here to Retry'),
                  icon: const Icon(Icons.refresh),
                  dense: true,
                  action: () {
                    searchHandler.retrySearch();
                    if (isCollapsed) {
                      isCollapsed = !isCollapsed;
                      updateState();
                    }
                  },
                  trailingIcon: IconButton(
                    onPressed: () {
                      isCollapsed = !isCollapsed;
                      updateState();
                    },
                    icon: const Icon(Icons.arrow_drop_down),
                  ),
                  drawBottomBorder: false,
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.66),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () {
                          searchHandler.retrySearch();
                          if (isCollapsed) {
                            isCollapsed = !isCollapsed;
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
                        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.66),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () {
                          isCollapsed = !isCollapsed;
                          updateState();
                        },
                        iconSize: 28,
                        icon: const Icon(Icons.arrow_drop_up),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              );
            }
          } else if (searchHandler.currentFetched.isEmpty) {
            // ... no items loaded
            return _ButtonWrapper(
              child: SettingsButton(
                name: 'Error, no data loaded:',
                subtitle: Text('$clickName Here to Retry'),
                icon: const Icon(Icons.refresh),
                dense: true,
                action: searchHandler.retrySearch,
                drawBottomBorder: false,
              ),
            );
          } else {
            // return const SizedBox.shrink();

            // add a small container to avoid scrolling when swiping from the bottom of the screen (navigation gestures)
            return Container(
              height: MediaQuery.systemGestureInsetsOf(context).bottom,
              color: Colors.transparent,
            );
          }
        }
      }
    });
  }
}

class _ButtonWrapper extends StatelessWidget {
  const _ButtonWrapper({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.66),
      padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
      child: child,
    );
  }
}
