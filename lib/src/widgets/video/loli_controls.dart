// ignore_for_file: implementation_imports

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:chewie/src/chewie_player.dart' show ChewieController;
import 'package:chewie/src/chewie_progress_colors.dart';
import 'package:chewie/src/helpers/utils.dart';
import 'package:chewie/src/progress_bar.dart';
import 'package:video_player/video_player.dart';

import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';

class LoliControls extends StatefulWidget {
  const LoliControls({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoliControlsState();
  }
}

class _LoliControlsState extends State<LoliControls> with SingleTickerProviderStateMixin {
  final ViewerHandler viewerHandler = ViewerHandler.instance;

  late VideoPlayerValue _latestValue;
  bool _hideStuff = true;
  Timer? _hideTimer;
  Timer? _initTimer;
  Timer? _showAfterExpandCollapseTimer;
  bool _dragging = false;
  bool _displayTapped = false;

  final barHeight = 48.0;
  final marginSize = 5.0;

  late VideoPlayerController controller;
  ChewieController? _chewieController;
  // We know that _chewieController is set in didChangeDependencies
  ChewieController get chewieController => _chewieController!;
  late AnimationController playPauseIconAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 400),
    reverseDuration: const Duration(milliseconds: 400),
  );

  bool _doubleTapped = false;
  Timer? _doubleTapHideTimer;
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
        onDoubleTapDown: _doubleTapInfoWrite,
        onDoubleTap: _doubleTapAction,
        onTap: () {
          _cancelAndRestartTimer();
          toggleToolbar();
        },
        child: AbsorbPointer(
          // children elements won't receive gestures until they are visible
          absorbing: _hideStuff,
          child: Column(
            children: [
              _buildDoubleTapMessage(),
              _buildHitArea(),
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
    );
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _dispose() {
    controller.removeListener(_updateState);
    _doubleTapHideTimer?.cancel();
    _hideTimer?.cancel();
    _initTimer?.cancel();
    _showAfterExpandCollapseTimer?.cancel();
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

  AnimatedOpacity _buildBottomBar(
    BuildContext context,
  ) {
    final iconColor = Theme.of(context).textTheme.labelLarge?.color;

    // Don't draw progress bar if shorter than 2 seconds, moves too fast on short durations
    final bool isTooShort = controller.value.duration.inSeconds <= 2;
    final bool drawProgressBar = !(chewieController.isLive || isTooShort);

    return AnimatedOpacity(
      opacity: _hideStuff ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: Column(
        children: [
          if (drawProgressBar)
            Container(
              height: barHeight / 1.5,
              color: Colors.black38, //Theme.of(context).backgroundColor.withOpacity(0.33),
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
            color: Colors.black38, //Theme.of(context).backgroundColor.withOpacity(0.33),
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
                      // Container(child: _buildSpeedButton(controller), decoration: BoxDecoration(color: Colors.red)),
                      if (chewieController.allowMuting) _buildMuteButton(controller),
                      // Container(child: _buildMuteButton(controller), decoration: BoxDecoration(color: Colors.yellow)),
                      if (chewieController.allowFullScreen) _buildExpandButton(),
                      // Container(child: _buildExpandButton(), decoration: BoxDecoration(color: Colors.green)),
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
      opacity: (_hideStuff && !isTooShort) ? 1.0 : 0.0,
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
      opacity: _doubleTapped ? 1.0 : 0.0,
      onEnd: () {
        if (!_doubleTapped) {
          setState(() {
            _lastDoubleTapAmount = 0;
            _lastDoubleTapSide = 0;
            _doubleTapExtraMessage = '';
          });
        }
      },
      duration: const Duration(milliseconds: 333),
      child: GestureDetector(
        onTap: () {
          _cancelAndRestartTimer();
          toggleToolbar();
        },
        child: Container(
          height: barHeight,
          margin: EdgeInsets.only(
            // when not in fullscreen - move lower to avoid conflict with appbar
            top: chewieController.isFullScreen ? 10 : 60,
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
          opacity: _hideStuff ? 0.0 : 1.0,
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

  Expanded _buildHitArea() {
    final bool isFinished = _latestValue.position >= _latestValue.duration;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (_latestValue.isPlaying) {
            if (_displayTapped) {
              setState(() {
                _hideStuff = true;
              });
            } else {
              _cancelAndRestartTimer();
            }
          } else {
            _playPause();

            setState(() {
              _hideStuff = true;
            });
          }

          toggleToolbar();
        },
        child: ColoredBox(
          // color: Colors.yellow.withOpacity(0.66),
          color: Colors.transparent,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedOpacity(
                  opacity: (!_latestValue.isPlaying && !_dragging) ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black87, //Theme.of(context).dialogBackgroundColor.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(48),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: IconButton(
                          icon: isFinished
                              ? const Icon(
                                  Icons.replay,
                                  size: 32,
                                  color: Colors.white,
                                )
                              : AnimatedIcon(
                                  icon: AnimatedIcons.play_pause,
                                  progress: playPauseIconAnimationController,
                                  color: Colors.white,
                                  size: 32,
                                ),
                          onPressed: _playPause,
                        ),
                      ),
                    ),
                  ),
                ),
                if (_latestValue.isBuffering)
                  const Center(
                    widthFactor: 3,
                    heightFactor: 3,
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpeedButton(
    VideoPlayerController controller,
  ) {
    return GestureDetector(
      onTap: () async {
        _hideTimer?.cancel();

        final chosenSpeed = await showModalBottomSheet<double>(
          context: context,
          isScrollControlled: true,
          useRootNavigator: true,
          builder: (context) => _PlaybackSpeedDialog(
            speeds: chewieController.playbackSpeeds,
            selected: _latestValue.playbackSpeed,
            key: const Key('playbackSpeedKey'),
          ),
        );

        if (chosenSpeed != null) {
          await controller.setPlaybackSpeed(chosenSpeed);
        }

        if (_latestValue.isPlaying) {
          _startHideTimer();
        }
      },
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
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
              color: _latestValue.playbackSpeed == 1.0 ? Colors.white : Theme.of(context).colorScheme.secondary,
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
        opacity: _hideStuff ? 0.0 : 1.0,
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
              color: Colors.white,
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

    setState(() {
      _hideStuff = false;
      _displayTapped = true;
    });
  }

  void toggleToolbar() {
    // TODO better way to toggle toolbar on videos?
    // toggle toolbar and system ui only when controls are visible and not in fullscreen
    // if the controls are visible buildHitArea and buildDoubleTapMessage listen to taps, otherwise - gestureDetector in the main build
    // print('toggleToolbar $_hideStuff ${chewieController.isFullScreen}');
    // if(_hideStuff && !chewieController.isFullScreen) {
    //   viewerHandler.displayAppbar.toggle();
    // }
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
  }

  void _onExpandCollapse() {
    setState(() {
      _hideStuff = true;
      chewieController.toggleFullScreen();
      _showAfterExpandCollapseTimer = Timer(const Duration(milliseconds: 300), () {
        setState(_cancelAndRestartTimer);
      });
    });
  }

  void _playPause() {
    final bool isFinished = _latestValue.position >= _latestValue.duration;

    setState(() {
      if (controller.value.isPlaying) {
        playPauseIconAnimationController.reverse();
        _hideStuff = false;
        _hideTimer?.cancel();
        controller.pause();
      } else {
        _cancelAndRestartTimer();

        if (!controller.value.isInitialized) {
          controller.initialize().then((_) {
            controller.play();
            playPauseIconAnimationController.forward();
          });
        } else {
          if (isFinished) {
            controller.seekTo(Duration.zero);
          }
          playPauseIconAnimationController.forward();
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

  void _updateState() {
    setState(() {
      _latestValue = controller.value;
    });
  }

  void _startDoubleTapTimer() {
    _doubleTapHideTimer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _doubleTapped = false;
      });
    });
  }

  void _doubleTapInfoWrite(TapDownDetails event) {
    setState(() {
      _doubleTapInfo = event;
    });
  }

  void _doubleTapAction() {
    if (_doubleTapInfo == null || !controller.value.isInitialized) return;

    // Detect on which side we tapped
    final double screenWidth = MediaQuery.of(context).size.width;
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
        _doubleTapped = true;
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

  Widget _buildProgressBar() {
    return Expanded(
      child: VideoProgressBar(
        controller,
        onDragStart: () {
          setState(() {
            _dragging = true;
          });

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
              bufferedColor: Theme.of(context).colorScheme.surface,
              backgroundColor: Theme.of(context).disabledColor,
            ),
      ),
    );
  }
}

class _PlaybackSpeedDialog extends StatelessWidget {
  const _PlaybackSpeedDialog({
    required Key key,
    required List<double> speeds,
    required double selected,
  })  : _speeds = speeds,
        _selected = selected,
        super(key: key);

  final List<double> _speeds;
  final double _selected;

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = Theme.of(context).colorScheme.secondary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 58,
          child: Row(
            children: [
              SizedBox(width: 16),
              Text('Select Video Speed:', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) {
            final double speed = _speeds[index];
            return ListTile(
              dense: true,
              title: Row(
                children: [
                  if (speed == _selected)
                    Icon(
                      Icons.check,
                      size: 20,
                      color: selectedColor,
                    )
                  else
                    Container(width: 20),
                  const SizedBox(width: 16),
                  Text(
                    speed.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              selected: speed == _selected,
              onTap: () {
                Navigator.of(context).pop(speed);
              },
            );
          },
          itemCount: _speeds.length,
        ),
      ],
    );
  }
}
