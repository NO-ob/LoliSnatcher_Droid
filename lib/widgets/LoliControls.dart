import 'dart:async';
import 'dart:math';

import 'package:chewie/src/chewie_player.dart';
import 'package:chewie/src/chewie_progress_colors.dart';
import 'package:chewie/src/material_progress_bar.dart';
import 'package:chewie/src/utils.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LoliControls extends StatefulWidget {
  const LoliControls({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoliControlsState();
  }
}

class _LoliControlsState extends State<LoliControls>
    with SingleTickerProviderStateMixin {
  VideoPlayerValue _latestValue;
  double _latestVolume;
  bool _hideStuff = true;
  Timer _hideTimer;
  Timer _initTimer;
  Timer _showAfterExpandCollapseTimer;
  bool _dragging = false;
  bool _displayTapped = false;

  final barHeight = 48.0;
  final marginSize = 5.0;

  VideoPlayerController controller;
  ChewieController chewieController;
  AnimationController playPauseIconAnimationController;

  bool _doubleTapped = false;
  Timer _doubleTapHideTimer;
  TapDownDetails _doubleTapInfo;
  int _lastDoubleTapAmount = 0;
  int _lastDoubleTapSide = 0;
  String _doubleTapExtraMessage;
  ValueNotifier durationNotifier = new ValueNotifier(Duration.zero);
  @override
  Widget build(BuildContext context) {
    if (_latestValue != null){
      if (_latestValue.hasError) {
        return chewieController.errorBuilder != null
            ? chewieController.errorBuilder(
          context,
          chewieController.videoPlayerController.value.errorDescription,
        )
            : const Center(
          child: Icon(
            Icons.error,
            color: Colors.white,
            size: 42,
          ),
        );
      }
    }


    return MouseRegion(
      onHover: (_) {
        _cancelAndRestartTimer();
      },
      child: GestureDetector(
        onDoubleTapDown: _doubleTapInfoWrite,
        onDoubleTap: _doubleTapAction,
        onTap: () => _cancelAndRestartTimer(),
        child: AbsorbPointer(
          absorbing: _hideStuff,
          child: Column(
            children: <Widget>[
              _buildDoubleTapMessage(),
              if (_latestValue != null &&
                      !_latestValue.isPlaying &&
                      _latestValue.duration == null ||
                  _latestValue.isBuffering)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else
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
    final _oldController = chewieController;
    chewieController = ChewieController.of(context);
    controller = chewieController.videoPlayerController;

    playPauseIconAnimationController ??= AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 400),
    );

    if (_oldController != chewieController) {
      _dispose();
      _initialize();
    }

    super.didChangeDependencies();
  }

  AnimatedOpacity _buildBottomBar(
    BuildContext context,
  ) {
    final iconColor = Theme.of(context).textTheme.button.color;

    return AnimatedOpacity(
      opacity: _hideStuff ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: Column(
        children: <Widget>[
          Container(
            height: barHeight / 1.5,
            color: Theme.of(context).dialogBackgroundColor.withOpacity(0.5),
            child: Row(
              children: <Widget>[
                if (chewieController.isLive)
                  const SizedBox()
                else
                  ...[
                    const SizedBox(width: 20),
                    _buildProgressBar(),
                    const SizedBox(width: 20),
                  ]
              ],
            ),
          ),
          Container(
            height: barHeight,
            color: Theme.of(context).dialogBackgroundColor.withOpacity(0.5),
            // Split into two parts: play + position | other buttons in 3:2 split
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _buildPlayPause(controller),
                      Container(
                        width: 130,
                        alignment: Alignment.center,
                        child: chewieController.isLive
                          ? Expanded(child: const Text('LIVE'))
                          : durationDisplay(controller.value.position,controller.value.duration, durationNotifier),//_buildPosition(iconColor),
                      ),
                    ]
                  )
                ),
                 Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      if (chewieController.allowPlaybackSpeedChanging)
                        _buildSpeedButton(controller),
                      if (chewieController.allowMuting)
                        _buildMuteButton(controller),
                      if (chewieController.allowFullScreen)
                        _buildExpandButton(),
                    ]
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AnimatedOpacity _buildBottomProgress() {
    // Don't draw if shorter than 2 seconds, moves too fast on short durations
    bool isTooShort = controller.value.duration.inSeconds <= 2;

    return AnimatedOpacity(
      opacity: (_hideStuff && !isTooShort) ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: AbsorbPointer(
        absorbing: false,
        child: Container(
          height: 5,
          // child: Transform( //TODO ScaleX to make it wider, probably need to copy and modify default MaterialVideoProgressBar
          //   transform: Matrix4.diagonal3Values(1.0, 2.0, 1.0),
          //   origin: Offset(0, 30),
          child: Row(
            children: [
              if (chewieController.isLive)
                const SizedBox()
              else
                _buildProgressBar(),
            ],
          )
          // )
        )
      )
    );
  }

  AnimatedOpacity _buildDoubleTapMessage() {
    String tapSideSymbol = _lastDoubleTapSide > 0 ? '>>' : '<<';
    bool isOneSecond = _lastDoubleTapAmount == 1;
    String msgText = _doubleTapExtraMessage != null
    ? "${_doubleTapExtraMessage != null ? "Reached Video $_doubleTapExtraMessage" : ""}"
    : "$tapSideSymbol $_lastDoubleTapAmount second${isOneSecond ? "" : "s"}";
    return AnimatedOpacity(
      opacity: _doubleTapped ? 1.0 : 0.0,
      onEnd: () {
        if (!_doubleTapped) {
          setState(() {
            _lastDoubleTapAmount = 0;
            _lastDoubleTapSide = 0;
            _doubleTapExtraMessage = null;
          });
        }
      },
      duration: const Duration(milliseconds: 333),
      child: Container(
          height: barHeight,
          margin: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
          ),
          child: Row(
            children: <Widget>[
              if (_lastDoubleTapSide < 0)
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          top: 8,
                          right: 8,
                          left: 8,
                          bottom: 8,
                        ),
                        color: Theme.of(context)
                            .dialogBackgroundColor
                            .withOpacity(0.5),
                        child: Text(msgText, style: TextStyle(fontSize: 20))))
              else
                Container(),
              const Spacer(),
              if (_lastDoubleTapSide > 0)
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          top: 8,
                          right: 8,
                          left: 8,
                          bottom: 8,
                        ),
                        color: Theme.of(context)
                            .dialogBackgroundColor
                            .withOpacity(0.5),
                        child: Text(msgText, style: TextStyle(fontSize: 20))))
              else
                Container(),
            ],
          )),
    );
  }

  GestureDetector _buildExpandButton() {
    return GestureDetector(
      onTap: _onExpandCollapse,
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: Container(
          height: barHeight,
          margin: const EdgeInsets.only(right: 12.0),
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
          ),
          child: Center(
            child: Icon(
              chewieController.isFullScreen
                  ? Icons.fullscreen_exit
                  : Icons.fullscreen,
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
          if (_latestValue != null && _latestValue.isPlaying) {
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
        },
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: AnimatedOpacity(
              opacity:
                  _latestValue != null && !_latestValue.isPlaying && !_dragging
                      ? 1.0
                      : 0.0,
              duration: const Duration(milliseconds: 300),
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).dialogBackgroundColor.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(48.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: IconButton(
                        icon: isFinished
                            ? const Icon(Icons.replay, size: 32.0)
                            : AnimatedIcon(
                                icon: AnimatedIcons.play_pause,
                                progress: playPauseIconAnimationController,
                                size: 32.0,
                              ),
                        onPressed: () {
                          _playPause();
                        }),
                  ),
                ),
              ),
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
          ),
        );

        if (chosenSpeed != null) {
          controller.setPlaybackSpeed(chosenSpeed);
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
              left: 8.0,
              right: 8.0,
            ),
            child: Icon(Icons.speed,
                color: _latestValue.playbackSpeed == 1.0
                    ? Colors.white
                    : Theme.of(context).accentColor),
          ),
        ),
      ),
    );
  }

  GestureDetector _buildMuteButton(
    VideoPlayerController controller,
  ) {
    return GestureDetector(
      onTap: () {
        _cancelAndRestartTimer();

        if (_latestValue.volume == 0) {
          controller.setVolume(_latestVolume ?? 0.5);
        } else {
          _latestVolume = controller.value.volume;
          controller.setVolume(0.0);
        }
      },
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: ClipRect(
          child: Container(
            height: barHeight,
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: Icon(
              (_latestValue != null && _latestValue.volume > 0)
                  ? Icons.volume_up
                  : Icons.volume_off,
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
        margin: const EdgeInsets.only(left: 8.0, right: 4.0),
        padding: const EdgeInsets.only(
          left: 12.0,
          right: 12.0,
        ),
        child: Icon(
          controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
  /*Widget _buildPosition(Color iconColor) {
    final position = _latestValue != null && _latestValue.position != null
        ? _latestValue.position
        : Duration.zero;
    final duration = _latestValue != null && _latestValue.duration != null
        ? _latestValue.duration
        : Duration.zero;

    return Text('${formatDuration(position)} / ${formatDuration(duration)}',
      //Text('${formatDurationShorter(position)} / ${formatDurationShorter(duration)}',
      style: const TextStyle(
        fontSize: 14.0,
      ),
    );
  }*/

  String formatDurationShorter(Duration position) {
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

    final formattedTime =
        '${hoursString == '00' ? '' : '$hoursString:'}${minutesString == '00' ? '' : '$minutesString'}:$secondsString';

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

  Future<void> _initialize() async {
    controller.addListener(_updateState);
    _latestValue = controller.value;
    //_updateState();

    if ((controller.value != null && controller.value.isPlaying) ||
        chewieController.autoPlay) {
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
      _showAfterExpandCollapseTimer =
          Timer(const Duration(milliseconds: 300), () {
        setState(() {
          _cancelAndRestartTimer();
        });
      });
    });
  }

  void _playPause() {
    bool isFinished;
    if (_latestValue.duration != null) {
      isFinished = _latestValue.position >= _latestValue.duration;
    } else {
      isFinished = false;
    }

    setState(() {
      if (controller.value.isPlaying) {
        playPauseIconAnimationController.reverse();
        _hideStuff = false;
        _hideTimer?.cancel();
        controller.pause();
      } else {
        _cancelAndRestartTimer();

        if (!controller.value.initialized) {
          controller.initialize().then((_) {
            controller.play();
            playPauseIconAnimationController.forward();
          });
        } else {
          if (isFinished) {
            controller.seekTo(const Duration());
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
      _latestValue = controller.value;
      durationNotifier.value = controller.value.position;
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
    if (_doubleTapInfo == null ||
        chewieController == null ||
        !chewieController.videoPlayerController.value.initialized) return;

    // Detect on which side we tapped
    double screenWidth = MediaQuery.of(context).size.width;
    double screenMiddle = screenWidth / 2;
    double sidesLimit = screenWidth / 6;
    double tapPositionWidth = _doubleTapInfo.localPosition.dx;
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
    int videoDuration = controller.value.duration.inSeconds;
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
      skipSeconds = 15;
    }

    if (tapSide != 0 && skipSeconds != 0) {
      int videoPositionMillisecs = controller.value.position.inMilliseconds;
      int videoDurationMillisecs = controller.value.duration.inMilliseconds;
      // Calculate new time with skip and limit it to range (0 to duration of video) (in milliseconds for accuracy)
      int newTime = min(
          max(0, videoPositionMillisecs + (skipSeconds * 1000 * tapSide)),
          videoDurationMillisecs);
      // print(newTime);
      // Skip set amount of seconds if we tapped on left/right third of the screen or play/pause if in the middle
      controller.seekTo(new Duration(milliseconds: newTime));

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
          _doubleTapExtraMessage = null;
        }

        // Add to last skip amount if it's still visible
        _lastDoubleTapAmount = (tapSide == _lastDoubleTapSide && !isAtVideoEdge)
            ? (_lastDoubleTapAmount + skipSeconds)
            : skipSeconds;
        _lastDoubleTapSide = tapSide;
      });
      _startDoubleTapTimer();
      _cancelAndRestartTimer();
    } else {
      if (controller.value.isPlaying) {
        playPauseIconAnimationController.reverse();
        _hideStuff = false;
        _hideTimer?.cancel();
        controller.pause();
      } else {
        _cancelAndRestartTimer();
        playPauseIconAnimationController.forward();
        controller.play();
      }
    }
  }

  Widget _buildProgressBar() {
    return Expanded(
      child: MaterialVideoProgressBar(
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
        colors: chewieController.materialProgressColors ??
            ChewieProgressColors(
                playedColor: Theme.of(context).accentColor,
                handleColor: Theme.of(context).accentColor,
                bufferedColor: Theme.of(context).backgroundColor,
                backgroundColor: Theme.of(context).disabledColor),
      )
    );
  }
}

class _PlaybackSpeedDialog extends StatelessWidget {
  const _PlaybackSpeedDialog({
    Key key,
    @required List<double> speeds,
    @required double selected,
  })  : _speeds = speeds,
        _selected = selected,
        super(key: key);

  final List<double> _speeds;
  final double _selected;

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 58,
          child: Row(
            children: [
              const SizedBox(width: 16.0),
              Text('Select Video Speed:'),
            ]
          )
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) {
            final _speed = _speeds[index];
            return ListTile(
              dense: true,
              title: Row(
                children: [
                  if (_speed == _selected)
                    Icon(
                      Icons.check,
                      size: 20.0,
                      color: selectedColor,
                    )
                  else
                    Container(width: 20.0),
                  const SizedBox(width: 16.0),
                  Text(_speed.toString()),
                ],
              ),
              selected: _speed == _selected,
              onTap: () {
                Navigator.of(context).pop(_speed);
              },
            );
          },
          itemCount: _speeds.length,
        )
      ],
    );
  }
}
class durationDisplay extends StatefulWidget {
  ValueNotifier durationNotifier;
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  @override
  _durationDisplayState createState() => _durationDisplayState();
  durationDisplay(this.position,this.duration,this.durationNotifier);
}

class _durationDisplayState extends State<durationDisplay> {
  Function durationListener;
  @override
  void initState() {
    durationListener = (() {
        setState(() {
          widget.position = widget.durationNotifier.value;
        });
    });
    widget.durationNotifier.addListener(durationListener);
    super.initState();
  }
  @override
  void dispose(){
    widget.durationNotifier.removeListener(durationListener);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Text('${formatDuration(widget.position)} / ${formatDuration(widget.duration)}',
      //Text('${formatDurationShorter(position)} / ${formatDurationShorter(duration)}',
      style: const TextStyle(
        fontSize: 14.0,
      ),
    );
  }
}
