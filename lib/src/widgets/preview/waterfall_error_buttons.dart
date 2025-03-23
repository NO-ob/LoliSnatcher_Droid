import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

class WaterfallErrorButtons extends StatefulWidget {
  const WaterfallErrorButtons({
    required this.animation,
    required this.showSearchBar,
    super.key,
  });

  final Animation<double> animation;
  final bool showSearchBar;

  @override
  State<WaterfallErrorButtons> createState() => _WaterfallErrorButtonsState();
}

class _WaterfallErrorButtonsState extends State<WaterfallErrorButtons> {
  final SearchHandler searchHandler = SearchHandler.instance;
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  int _startedAt = 0;
  Timer? checkInterval;
  bool isCollapsed = false;

  double get animValue => widget.showSearchBar ? widget.animation.value : 1;
  double get reverseAnimValue => 1 - animValue;

  @override
  void initState() {
    super.initState();

    startTimer();
    searchHandler.isLoading.addListener(loadingListener);
  }

  void updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  void loadingListener() {
    if (searchHandler.isLoading.value) {
      startTimer();
    } else {
      stopTimer();
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

  void retrySearch() {
    searchHandler.retrySearch();
    if (isCollapsed) {
      toggleCollapsed();
    }
  }

  void restartTimerRetrySearch() {
    stopTimer();
    startTimer();
    retrySearch();
  }

  void toggleCollapsed() {
    isCollapsed = !isCollapsed;
    updateState();
  }

  @override
  void dispose() {
    checkInterval?.cancel();
    searchHandler.isLoading.removeListener(loadingListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isLastPage = searchHandler.isLastPage.value;
      final int pageNum = searchHandler.pageNum.value;
      final bool isEmpty = searchHandler.currentFetched.isEmpty;
      final bool isLoading = searchHandler.isLoading.value;
      final bool hasError = searchHandler.errorString.isNotEmpty;

      String title = '', subtitle = '';
      Widget icon = const Icon(Icons.refresh);
      VoidCallback onTap = retrySearch;
      bool showSubtitle = true;
      if (isLastPage) {
        if (isEmpty) {
          title = 'No results';
          subtitle = 'Try changing your search query or tap here to retry';
        } else {
          title = 'You reached the end';
          subtitle = 'Loaded $pageNum pages\nTap here to reload last page';
        }
      } else {
        if (isLoading) {
          final int nowMils = DateTime.now().millisecondsSinceEpoch;
          final int sinceStart = _startedAt == 0 ? 0 : Duration(milliseconds: nowMils - _startedAt).inSeconds;
          final bool isTakingTooLong = sinceStart > 5;
          final String sinceStartText = sinceStart > 0
              ? 'Started $sinceStart ${Tools.pluralize('second', sinceStart)} ago${isTakingTooLong ? '\nTap here to retry if search is taking too long or seems stuck' : ''}'
              : '';

          title = 'Loading page #$pageNum...';
          subtitle = sinceStartText;
          showSubtitle = sinceStartText.isNotEmpty;
          icon = const RepaintBoundary(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ),
          );
          onTap = restartTimerRetrySearch;
        } else if (hasError) {
          final String errorFormatted = '\n${searchHandler.errorString}\nTap here to retry';
          title = 'Error when loading page #$pageNum';
          subtitle = errorFormatted;
        } else if (isEmpty) {
          title = 'Error, no results loaded';
          subtitle = 'Tap here to retry';
        } else {
          // return const SizedBox.shrink();

          // add a small container to avoid scrolling when swiping from the bottom of the screen (navigation gestures)
          return AnimatedBuilder(
            animation: widget.animation,
            builder: (context, child) {
              return Container(
                height: MediaQuery.systemGestureInsetsOf(context).bottom,
                color: Colors.transparent,
              );
            },
          );
        }
      }

      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
        layoutBuilder: (currentChild, previousChildren) => Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            ...previousChildren,
            if (currentChild != null) currentChild,
            //
            if (kDebugMode)
              Positioned(
                top: 0,
                left: 0,
                child: AnimatedBuilder(
                  animation: widget.animation,
                  builder: (context, _) {
                    return LayoutBuilder(
                      builder: (context, _) {
                        return Text(
                          '${MediaQuery.viewPaddingOf(context).bottom} | $animValue',
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
        child: isCollapsed
            ? AnimatedBuilder(
                key: const ValueKey('collapsed'),
                animation: widget.animation,
                builder: (context, child) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: (animValue * MediaQuery.viewPaddingOf(context).bottom * 2) + 12,
                    ),
                    child: child,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.66),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: BackdropFilter(
                    enabled: !settingsHandler.shitDevice,
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: onTap,
                          iconSize: 28,
                          icon: icon,
                        ),
                        IconButton(
                          onPressed: toggleCollapsed,
                          iconSize: 28,
                          icon: const Icon(Icons.arrow_drop_up),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : AnimatedBuilder(
                key: const ValueKey('detailed'),
                animation: widget.animation,
                builder: (context, child) {
                  const double baseBorderRadius = 12;
                  final double borderRadius = reverseAnimValue * baseBorderRadius;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.only(bottom: reverseAnimValue * 12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.66),
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(baseBorderRadius),
                        topRight: const Radius.circular(baseBorderRadius),
                        bottomLeft: Radius.circular(borderRadius),
                        bottomRight: Radius.circular(borderRadius),
                      ),
                    ),
                    child: BackdropFilter(
                      enabled: !settingsHandler.shitDevice,
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(baseBorderRadius),
                            topRight: const Radius.circular(baseBorderRadius),
                            bottomLeft: Radius.circular(borderRadius),
                            bottomRight: Radius.circular(borderRadius),
                          ),
                          onTap: onTap,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 8,
                              bottom: (animValue * MediaQuery.viewPaddingOf(context).bottom * 2) + 8,
                            ),
                            child: child,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: onTap,
                      iconSize: 24,
                      icon: icon,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Text(title),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: showSubtitle
                                ? Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        subtitle,
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                                            ),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    IconButton(
                      onPressed: toggleCollapsed,
                      iconSize: 24,
                      icon: const Icon(Icons.arrow_drop_down),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
      );
    });
  }
}
