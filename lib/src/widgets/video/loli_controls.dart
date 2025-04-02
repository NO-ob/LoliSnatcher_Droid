// ignore_for_file: implementation_imports

import 'dart:async';
import 'dart:math' hide e;

import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
import 'package:chewie/src/center_play_button.dart';
import 'package:chewie/src/helpers/utils.dart';
import 'package:chewie/src/progress_bar.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:video_player/video_player.dart';

import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';

class LoliControls extends StatefulWidget {
  const LoliControls({
    this.useLongTapFastForward = true,
    super.key,
  });

  final bool useLongTapFastForward;

  @override
  State<StatefulWidget> createState() {
    return _LoliControlsState();
  }
}

class _LoliControlsState extends State<LoliControls> {
  final ViewerHandler viewerHandler = ViewerHandler.instance;

  VideoPlayerValue _latestValue = const VideoPlayerValue(duration: Duration.zero);
  bool _hideStuff = false;
  Timer? _hideTimer;
  Timer? _initTimer;
  Timer? _showAfterExpandCollapseTimer;
  bool _dragging = false;
  bool _displayTapped = false;
  Timer? bufferingDisplayTimer;
  bool displayBufferingIndicator = false;

  final double barHeight = 48;
  final double marginSize = 5;

  late VideoPlayerController controller;
  ChewieController? _chewieController;
  // We know that _chewieController is set in didChangeDependencies
  ChewieController get chewieController => _chewieController!;

  bool doubleTapped = false, holdingDown = false;
  Timer? _doubleTapHideTimer, longTapSpeedChangeDelayTimer, pointerCountCheckTimer;
  double longTapFastForwardSpeed = 2;
  int pointerCount = 0;
  bool speedSetManually = false;
  TapDownDetails? _doubleTapInfo;
  int _lastDoubleTapAmount = 0;
  int _lastDoubleTapSide = 0;
  String _doubleTapExtraMessage = '';

  @override
  Widget build(BuildContext context) {
    if (_latestValue.hasError) {
      return chewieController.errorBuilder?.call(
            context,
            chewieController.videoPlayerController.value.errorDescription!,
          ) ??
          const Center(
            child: Icon(
              Icons.error,
              color: Colors.white,
              size: 42,
            ),
          );
    }

    return MouseRegion(
      onHover: (_) {
        _cancelAndRestartTimer();
      },
      child: GestureDetector(
        onLongPress: widget.useLongTapFastForward ? onHitAreaLongPress : null,
        onLongPressMoveUpdate: widget.useLongTapFastForward ? onHitAreaLongPressMove : null,
        onLongPressCancel: widget.useLongTapFastForward ? onHitAreaLongPressUp : null,
        onLongPressEnd: widget.useLongTapFastForward ? (_) => onHitAreaLongPressUp() : null,
        onDoubleTapDown: _doubleTapInfoWrite,
        onDoubleTap: _doubleTapAction,
        behavior: HitTestBehavior.opaque,
        onTap: _cancelAndRestartTimer,
        child: Listener(
          onPointerDown: (_) {
            pointerCount += 1;
          },
          onPointerCancel: (_) {
            pointerCount -= 1;
          },
          onPointerUp: (_) {
            pointerCount -= 1;
          },
          child: AbsorbPointer(
            // children elements won't receive gestures until they are visible
            absorbing: _hideStuff,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      _buildDoubleTapMessage(),
                      _buildHitArea(),
                      _buildDebugInfo(),
                    ],
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    _buildBottomBar(context),
                    _buildBottomProgress(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _dispose() {
    controller.removeListener(_updateState);

    if (_latestValue.playbackSpeed != 1) {
      controller.setPlaybackSpeed(1);
    }
    doubleTapped = false;
    holdingDown = false;
    speedSetManually = false;
    _doubleTapExtraMessage = '';
    longTapFastForwardSpeed = 2;

    _doubleTapHideTimer?.cancel();
    longTapSpeedChangeDelayTimer?.cancel();
    _hideTimer?.cancel();
    _initTimer?.cancel();
    _showAfterExpandCollapseTimer?.cancel();
    bufferingDisplayTimer?.cancel();
    pointerCountCheckTimer?.cancel();
  }

  @override
  void didChangeDependencies() {
    final ChewieController? oldController = _chewieController;
    _chewieController = ChewieController.of(context);
    controller = chewieController.videoPlayerController;

    if (oldController != chewieController) {
      _dispose();
      _initialize();
    }

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(LoliControls oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.useLongTapFastForward != widget.useLongTapFastForward) {
      _dispose();
      _initialize();
    }
  }

  AnimatedOpacity _buildBottomBar(
    BuildContext context,
  ) {
    final iconColor = Theme.of(context).textTheme.labelLarge?.color;

    // Don't draw progress bar if shorter than 2 seconds, moves too fast on short durations
    final bool isTooShort = controller.value.duration.inSeconds <= 2;
    final bool drawProgressBar = !(chewieController.isLive || isTooShort);

    return AnimatedOpacity(
      opacity: _hideStuff ? 0 : 1,
      duration: const Duration(milliseconds: 300),
      child: Column(
        children: [
          if (drawProgressBar)
            Container(
              height: barHeight / 1.5,
              color: Colors.black38, //Theme.of(context).backgroundColor.withValues(alpha: 0.33),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  _buildProgressBar(),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          Container(
            height: barHeight,
            color: Colors.black38, //Theme.of(context).backgroundColor.withValues(alpha: 0.33),
            // Split into two parts: play + position | other buttons in 3:2 split
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPlayPause(controller),
                      Container(
                        width: 130,
                        alignment: Alignment.center,
                        child: chewieController.isLive ? const Expanded(child: Text('LIVE', style: TextStyle(color: Colors.white))) : _buildPosition(iconColor),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (chewieController.allowPlaybackSpeedChanging) _buildSpeedButton(controller),
                      if (chewieController.allowMuting) _buildMuteButton(controller),
                      if (chewieController.allowFullScreen) _buildExpandButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AnimatedOpacity _buildBottomProgress() {
    // Don't draw if shorter than 2 seconds, moves too fast on short durations
    final bool isTooShort = controller.value.duration.inSeconds <= 2;

    return AnimatedOpacity(
      opacity: (_hideStuff && !isTooShort) ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      child: AbsorbPointer(
        absorbing: false,
        child: SizedBox(
          height: 5,
          child: Row(
            children: [
              if (chewieController.isLive == false) _buildProgressBar(),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedOpacity _buildDoubleTapMessage() {
    final String msgText = _doubleTapExtraMessage != '' ? _doubleTapExtraMessage : '${_lastDoubleTapAmount}s';

    final IconData iconData = _lastDoubleTapSide > 0 ? Icons.fast_forward : Icons.fast_rewind;
    final Widget msgIcon = Icon(
      iconData,
      color: Colors.white,
      size: 32,
    );

    final Widget msgWidget = ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        color: Colors.black38,
        child: Row(
          children: [
            if (_lastDoubleTapSide < 0) ...[
              msgIcon,
              const SizedBox(width: 8),
            ],
            Text(msgText, style: const TextStyle(fontSize: 24, color: Colors.white)),
            if (_lastDoubleTapSide > 0) ...[
              const SizedBox(width: 8),
              msgIcon,
            ],
          ],
        ),
      ),
    );

    return AnimatedOpacity(
      opacity: (doubleTapped || holdingDown) ? 1 : 0,
      onEnd: () {
        if (!doubleTapped && !holdingDown) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              _lastDoubleTapAmount = 0;
              _lastDoubleTapSide = 0;
              _doubleTapExtraMessage = '';
            });
          });
        }
      },
      duration: const Duration(milliseconds: 333),
      child: GestureDetector(
        onTap: _cancelAndRestartTimer,
        child: Container(
          height: barHeight,
          margin: EdgeInsets.only(
            top: MediaQuery.paddingOf(context).top + 32,
            right: 10,
            left: 10,
            bottom: 10,
          ),
          child: Row(
            children: [
              if (_lastDoubleTapSide < 0) msgWidget,
              //
              const Spacer(),
              //
              if (_lastDoubleTapSide > 0) msgWidget,
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildExpandButton() {
    return GestureDetector(
      onTap: _onExpandCollapse,
      child: Container(
        // extra container with decoration to force more clickable width, otherwise there is ~40px of empty space on the right
        decoration: const BoxDecoration(color: Colors.transparent),
        child: AnimatedOpacity(
          opacity: _hideStuff ? 0 : 1,
          duration: const Duration(milliseconds: 300),
          child: Container(
            height: barHeight,
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            child: Center(
              child: Icon(
                chewieController.isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHitArea() {
    final bool isFinished = (_latestValue.position >= _latestValue.duration) && _latestValue.duration.inSeconds > 0;
    final bool showPlayButton = !_dragging && !_hideStuff;

    return GestureDetector(
      onTap: () {
        if (_latestValue.isPlaying) {
          if (_displayTapped) {
            setState(() {
              if (widget.useLongTapFastForward) {
                viewerHandler.toggleToolbar(false, forcedNewValue: false);
              }
              _hideStuff = true;
            });
          } else {
            _cancelAndRestartTimer();
            if (widget.useLongTapFastForward) {
              viewerHandler.toggleToolbar(false, forcedNewValue: false);
            }
          }
        } else {
          _playPause();

          setState(() {
            if (widget.useLongTapFastForward) {
              viewerHandler.toggleToolbar(false, forcedNewValue: false);
            }
            _hideStuff = true;
          });
        }
      },
      child: ValueListenableBuilder(
        valueListenable: viewerHandler.displayAppbar,
        builder: (context, displayAppbar, child) {
          final bool isFullScreen = chewieController.isFullScreen || !displayAppbar;
          final bool isTopAppbar = SettingsHandler.instance.galleryBarPosition == 'Top';

          return Container(
            // color: Colors.yellow.withValues(alpha: 0.66),
            color: Colors.transparent,
            padding: EdgeInsets.only(
              top: MediaQuery.paddingOf(context).top + (isFullScreen ? 0 : (isTopAppbar ? 0 : kToolbarHeight)) + barHeight + 16,
              bottom: MediaQuery.paddingOf(context).bottom + (isFullScreen ? 0 : (isTopAppbar ? kToolbarHeight : 0)),
            ),
            child: child,
          );
        },
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                opacity: (!_latestValue.isPlaying && !_dragging) ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: CenterPlayButton(
                      backgroundColor: Colors.black54,
                      iconColor: Colors.white,
                      isFinished: isFinished,
                      isPlaying: controller.value.isPlaying,
                      show: showPlayButton,
                      onPressed: _playPause,
                    ),
                  ),
                ),
              ),
              //
              Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  child: displayBufferingIndicator ? const CircularProgressIndicator(strokeWidth: 5) : const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDebugInfo() {
    if (SettingsHandler.instance.showVideoStats.value) {
      return Positioned(
        left: 8,
        top: MediaQuery.paddingOf(context).top + 32,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.66),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              {'isInit': _latestValue.isInitialized},
              {'isPlaying': _latestValue.isPlaying},
              {'isBuffering': _latestValue.isBuffering},
              {'position': _latestValue.position.toString().replaceAll(RegExp(r'000$'), '')},
              {'duration': _latestValue.duration.toString().replaceAll(RegExp(r'000$'), '')},
              {'isCompleted': _latestValue.isCompleted},
              {'volume': _latestValue.volume},
              {'playbackSpeed': _latestValue.playbackSpeed},
              {'isFullScreen': chewieController.isFullScreen},
              {'aspectRatio': _latestValue.aspectRatio.toStringAsFixed(2)},
              // ignore: prefer_interpolation_to_compose_strings
              {'size': _latestValue.size.width.truncateTrailingZeroes(2) + 'x' + _latestValue.size.height.truncateTrailingZeroes(2)},
              {'pointerCount': pointerCount},
            ]
                .map(
                  (e) => Row(
                    children: [
                      Text(
                        '${e.keys.first}: ',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        e.values.first.toString(),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildSpeedButton(
    VideoPlayerController controller,
  ) {
    return GestureDetector(
      onTap: () async {
        _hideTimer?.cancel();

        final chosenSpeed = await showModalBottomSheet<double>(
          context: context,
          backgroundColor: Colors.transparent,
          elevation: 0,
          isScrollControlled: true,
          isDismissible: true,
          useRootNavigator: true,
          useSafeArea: true,
          builder: (_) => _PlaybackSpeedDialog(
            speeds: chewieController.playbackSpeeds,
            selected: _latestValue.playbackSpeed,
          ),
        );

        if (chosenSpeed != null) {
          await controller.setPlaybackSpeed(chosenSpeed);
          setState(() {
            speedSetManually = true;
          });
        }

        if (_latestValue.isPlaying) {
          _startHideTimer();
        }
      },
      onLongPress: () async {
        if (_latestValue.playbackSpeed == 1) {
          return;
        }

        await controller.setPlaybackSpeed(1);

        if (_latestValue.isPlaying) {
          _startHideTimer();
        }
      },
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0 : 1,
        duration: const Duration(milliseconds: 300),
        child: ClipRect(
          child: Container(
            height: barHeight,
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            child: Icon(
              Icons.speed,
              color: _latestValue.playbackSpeed == 1 ? Colors.white : Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _buildMuteButton(VideoPlayerController controller) {
    final bool isGlobalMute = viewerHandler.videoAutoMute;

    return GestureDetector(
      onTap: () {
        _cancelAndRestartTimer();
        if (_latestValue.volume == 0) {
          controller.setVolume(1);
        } else {
          controller.setVolume(0);
        }
      },
      onLongPress: () {
        ServiceHandler.vibrate();

        viewerHandler.videoAutoMute = !viewerHandler.videoAutoMute;
        if (viewerHandler.videoAutoMute && _latestValue.volume != 0) {
          controller.setVolume(0);
        } else if (!viewerHandler.videoAutoMute && _latestValue.volume == 0) {
          controller.setVolume(1);
        }
      },
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0 : 1,
        duration: const Duration(milliseconds: 300),
        child: ClipRect(
          child: Container(
            height: barHeight,
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            child: Icon(
              _latestValue.volume > 0 ? Icons.volume_up : (isGlobalMute ? Icons.volume_off : Icons.volume_mute),
              color: isGlobalMute ? Theme.of(context).colorScheme.secondary : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _buildPlayPause(VideoPlayerController controller) {
    return GestureDetector(
      onTap: _playPause,
      child: Container(
        height: barHeight,
        color: Colors.transparent,
        margin: const EdgeInsets.only(left: 8, right: 4),
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
        ),
        child: Icon(
          controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildPosition(Color? iconColor) {
    final position = _latestValue.position;
    final duration = _latestValue.duration;

    return Text(
      '${formatDuration(position)} / ${formatDuration(duration)}',
      //Text('${formatDurationShorter(position)} / ${formatDurationShorter(duration)}',
      style: const TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
    );
  }

  String formatDurationShorter(Duration position) {
    //unused
    final ms = position.inMilliseconds;

    int seconds = ms ~/ 1000;
    final int hours = seconds ~/ 3600;
    seconds = seconds % 3600;
    final minutes = seconds ~/ 60;
    seconds = seconds % 60;

    final hoursString = hours >= 10
        ? '$hours'
        : hours == 0
            ? '00'
            : '0$hours';

    final minutesString = minutes >= 10
        ? '$minutes'
        : minutes == 0
            ? '00'
            : '0$minutes';

    final secondsString = seconds >= 10
        ? '$seconds'
        : seconds == 0
            ? '00'
            : '0$seconds';

    final formattedTime = '${hoursString == '00' ? '' : '$hoursString:'}${minutesString == '00' ? '' : minutesString}:$secondsString';

    return formattedTime;
  }

  void _cancelAndRestartTimer() {
    _hideTimer?.cancel();
    _startHideTimer();

    if (widget.useLongTapFastForward) {
      viewerHandler.toggleToolbar(false, forcedNewValue: true);
    }

    setState(() {
      _hideStuff = false;
      _displayTapped = true;
    });
  }

  Future<void> _initialize() async {
    controller.addListener(_updateState);

    _updateState();

    if (controller.value.isPlaying || chewieController.autoPlay) {
      _startHideTimer();
    }

    if (chewieController.showControlsOnInitialize) {
      _initTimer = Timer(const Duration(milliseconds: 200), () {
        setState(() {
          _hideStuff = false;
        });
      });
    }

    pointerCountCheckTimer?.cancel();
    pointerCountCheckTimer = Timer.periodic(
      const Duration(milliseconds: 500),
      (Timer t) {
        if (holdingDown && pointerCount != 1) {
          onHitAreaLongPressUp();
        }
      },
    );
  }

  void _onExpandCollapse() {
    setState(() {
      _hideStuff = true;
      chewieController.toggleFullScreen();
      _showAfterExpandCollapseTimer = Timer(
        const Duration(milliseconds: 300),
        () => setState(_cancelAndRestartTimer),
      );
    });
  }

  void _playPause() {
    final bool isFinished = (_latestValue.position >= _latestValue.duration) && _latestValue.duration.inSeconds > 0;

    setState(() {
      if (controller.value.isPlaying) {
        _hideStuff = false;
        _hideTimer?.cancel();
        controller.pause();
        if (widget.useLongTapFastForward) {
          viewerHandler.toggleToolbar(false, forcedNewValue: true);
        }
      } else {
        _cancelAndRestartTimer();

        if (!controller.value.isInitialized) {
          controller.initialize().then((_) {
            controller.play();
          });
        } else {
          if (isFinished) {
            controller.seekTo(Duration.zero);
          }
          controller.play();
        }
      }
    });
  }

  void _startHideTimer() {
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _hideStuff = true;
      });
    });
  }

  void bufferingTimerTimeout() {
    displayBufferingIndicator = true;
    if (mounted) {
      setState(() {});
    }
  }

  void _updateState() {
    if (!mounted) return;

    if (chewieController.progressIndicatorDelay != null) {
      if (controller.value.isBuffering && !controller.value.isPlaying) {
        bufferingDisplayTimer ??= Timer(
          chewieController.progressIndicatorDelay!,
          bufferingTimerTimeout,
        );
      } else {
        bufferingDisplayTimer?.cancel();
        bufferingDisplayTimer = null;
        displayBufferingIndicator = false;
      }
    } else {
      displayBufferingIndicator = controller.value.isBuffering && !controller.value.isPlaying;
    }

    setState(() {
      _latestValue = controller.value;
    });
  }

  void _startDoubleTapTimer() {
    _doubleTapHideTimer?.cancel();
    _doubleTapHideTimer = Timer(const Duration(seconds: 2), () {
      setState(() {
        doubleTapped = false;
      });
    });
  }

  void _doubleTapInfoWrite(TapDownDetails event) {
    setState(() {
      _doubleTapInfo = event;
    });
  }

  void _doubleTapAction() {
    if (_doubleTapInfo == null || !controller.value.isInitialized || holdingDown) return;

    // Detect on which side we tapped
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenMiddle = screenWidth / 2;
    final double sidesLimit = screenWidth / 6;
    final double tapPositionWidth = _doubleTapInfo!.localPosition.dx;
    int tapSide;
    bool isAtVideoEdge = false;
    if (tapPositionWidth > (screenMiddle + sidesLimit)) {
      tapSide = 1;
    } else if (tapPositionWidth < (screenMiddle - sidesLimit)) {
      tapSide = -1;
    } else {
      tapSide = 0;
    }

    // Decide how much we will skip depending on video length
    final int videoDuration = controller.value.duration.inSeconds;
    int skipSeconds;
    if (videoDuration <= 5) {
      skipSeconds = 0;
    } else if (videoDuration <= 10) {
      skipSeconds = 1;
    } else if (videoDuration <= 60) {
      skipSeconds = 5;
    } else if (videoDuration <= 120) {
      skipSeconds = 10;
    } else {
      skipSeconds = 10;
    }

    longTapSpeedChangeDelayTimer?.cancel();

    if (tapSide != 0 && skipSeconds != 0) {
      final int videoPositionMillisecs = controller.value.position.inMilliseconds;
      final int videoDurationMillisecs = controller.value.duration.inMilliseconds;
      // Calculate new time with skip and limit it to range (0 to duration of video) (in milliseconds for accuracy)
      final int newTime = min(
        max(0, videoPositionMillisecs + (skipSeconds * 1000 * tapSide)),
        videoDurationMillisecs,
      );
      // print(newTime);
      // Skip set amount of seconds if we tapped on left/right third of the screen or play/pause if in the middle
      controller.seekTo(Duration(milliseconds: newTime));

      setState(() {
        _doubleTapHideTimer?.cancel();
        doubleTapped = true;
        if (videoDurationMillisecs == newTime) {
          isAtVideoEdge = true;
          _doubleTapExtraMessage = 'End';
        } else if (newTime == 0) {
          isAtVideoEdge = true;
          _doubleTapExtraMessage = 'Start';
        } else {
          _doubleTapExtraMessage = '';
        }

        // Add to last skip amount if it's still visible
        _lastDoubleTapAmount = (tapSide == _lastDoubleTapSide && !isAtVideoEdge) ? (_lastDoubleTapAmount + skipSeconds) : skipSeconds;
        _lastDoubleTapSide = tapSide;
      });
      _startDoubleTapTimer();
      _cancelAndRestartTimer();
    } else {
      _playPause();
    }
  }

  void onHitAreaLongPress() {
    // TODO seek backwards when going below 2x
    setState(() {
      if (!_latestValue.isPlaying) {
        // force play if video is paused
        _playPause();
      }
      // force show controls and keep them visible while holding down
      _hideTimer?.cancel();
      _hideStuff = false;
      _displayTapped = true;

      // keep top message block visible while holding down
      _doubleTapHideTimer?.cancel();
      doubleTapped = false;
      holdingDown = true;
      speedSetManually = false;
      _doubleTapExtraMessage = '${longTapFastForwardSpeed.toStringAsFixed(1)}x';
      controller.setPlaybackSpeed(longTapFastForwardSpeed);
      _lastDoubleTapSide = 1;
    });
  }

  void onHitAreaLongPressMove(LongPressMoveUpdateDetails details) {
    setState(() {
      longTapFastForwardSpeed = 2 +
          (double.tryParse(
                (details.offsetFromOrigin.dx / (MediaQuery.sizeOf(context).width / 6)).toStringAsFixed(1),
              ) ??
              0);
      // limit between 2 and 4
      longTapFastForwardSpeed = longTapFastForwardSpeed.clamp(2, 4);
      // update ui value immediately, real speed change will happen in a timer below
      doubleTapped = false;
      holdingDown = true;
      speedSetManually = false;
      _doubleTapExtraMessage = '${longTapFastForwardSpeed.toStringAsFixed(1)}x';

      longTapSpeedChangeDelayTimer?.cancel();
      longTapSpeedChangeDelayTimer = Timer(
        // delay to avoid changing speed too fast
        const Duration(milliseconds: 300),
        () {
          try {
            controller.setPlaybackSpeed(longTapFastForwardSpeed);
          } catch (_) {
            // future proofing - setPlaybackSpeed may throw an exception on ios
            setState(() {
              longTapFastForwardSpeed = 2;
              controller.setPlaybackSpeed(2);
            });
          }
        },
      );
    });
  }

  void onHitAreaLongPressUp() {
    setState(() {
      // reset speed and start all hide timers
      longTapSpeedChangeDelayTimer?.cancel();
      holdingDown = false;
      longTapFastForwardSpeed = 2;
      if (!speedSetManually) {
        controller.setPlaybackSpeed(1);
        _cancelAndRestartTimer();
      }
    });
  }

  Widget _buildProgressBar() {
    return Expanded(
      // TODO redesign to be taller and easier to hit (something like sound sliders on miui?)
      child: VideoProgressBar(
        controller,
        onDragStart: () {
          setState(() {
            _dragging = true;
          });

          _hideTimer?.cancel();
        },
        onDragUpdate: () {
          _hideTimer?.cancel();
        },
        onDragEnd: () {
          setState(() {
            _dragging = false;
          });

          _startHideTimer();
        },
        barHeight: 5,
        handleHeight: _hideStuff ? 3 : 6,
        drawShadow: true,
        colors: chewieController.materialProgressColors ??
            ChewieProgressColors(
              playedColor: Theme.of(context).colorScheme.secondary,
              handleColor: Theme.of(context).colorScheme.secondary,
              bufferedColor: Theme.of(context).colorScheme.surface.withValues(alpha: 0.5),
              backgroundColor: Theme.of(context).disabledColor.withValues(alpha: 0.5),
            ),
      ),
    );
  }
}

class _PlaybackSpeedDialog extends StatefulWidget {
  const _PlaybackSpeedDialog({
    required this.speeds,
    required this.selected,
  });

  final List<double> speeds;
  final double selected;

  @override
  State<_PlaybackSpeedDialog> createState() => _PlaybackSpeedDialogState();
}

class _PlaybackSpeedDialogState extends State<_PlaybackSpeedDialog> {
  final ValueNotifier<int> selectedIndex = ValueNotifier(0);
  late final PageAutoScrollController controller;

  @override
  void initState() {
    super.initState();

    int initialIndex = widget.speeds.indexOf(widget.selected);
    if (initialIndex == -1) {
      initialIndex = widget.speeds.indexOf(1);
    }
    selectedIndex.value = initialIndex;
    controller = PageAutoScrollController(
      initialPage: initialIndex,
      viewportFraction: 0.33,
    );
  }

  void changeValue(int change) {
    int newIndex = selectedIndex.value + change;
    if (newIndex < 0) {
      newIndex = widget.speeds.length - 1;
    } else if (newIndex >= widget.speeds.length) {
      newIndex = 0;
    }

    selectedIndex.value = newIndex;
    controller.animateToPage(
      newIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  Future<void> resetValue() async {
    selectedIndex.value = widget.speeds.indexOf(1);
    await controller.animateToPage(
      selectedIndex.value,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    confirmValue();
  }

  void confirmValue() {
    Navigator.of(context).pop(widget.speeds[selectedIndex.value]);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          return;
        }

        confirmValue();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 58,
              child: Row(
                children: [
                  const SizedBox(width: 32),
                  Expanded(
                    child: Text(
                      'Video speed',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: confirmValue,
                    icon: const Icon(Icons.close),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 6,
              children: [
                IconButton(
                  onPressed: () => changeValue(-1),
                  icon: const Icon(
                    Icons.keyboard_double_arrow_left_sharp,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: resetValue,
                  icon: const Icon(
                    Icons.refresh,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: confirmValue,
                  icon: const Icon(
                    Icons.check_rounded,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => changeValue(1),
                  icon: const Icon(
                    Icons.keyboard_double_arrow_right_sharp,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ValueListenableBuilder(
              valueListenable: selectedIndex,
              builder: (context, _, __) {
                return SizedBox(
                  height: 50,
                  child: PageView.builder(
                    itemCount: widget.speeds.length,
                    scrollDirection: Axis.horizontal,
                    controller: controller,
                    onPageChanged: (value) {
                      selectedIndex.value = value;
                    },
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          if (i != selectedIndex.value) {
                            changeValue(i - selectedIndex.value);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              '${widget.speeds[i].truncateTrailingZeroes(2)}x',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: i == selectedIndex.value ? Theme.of(context).colorScheme.secondary : null,
                                  ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }
}
