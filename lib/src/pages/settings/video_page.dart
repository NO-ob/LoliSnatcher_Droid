import 'package:flutter/material.dart';

import 'package:fvp/fvp.dart' as fvp;

import 'package:lolisnatcher/src/data/settings/video_backend_mode.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/video/media_kit_video_player.dart';

class VideoSettingsPage extends StatefulWidget {
  const VideoSettingsPage({super.key});

  @override
  State<VideoSettingsPage> createState() => _VideoSettingsPageState();
}

class _VideoSettingsPageState extends State<VideoSettingsPage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  bool autoPlay = true, startVideosMuted = false, disableVideo = false, longTapFastForwardVideo = false, altVideoPlayerHwAccel = true;
  VideoBackendMode videoBackendMode = SettingsHandler.isDesktopPlatform ? VideoBackendMode.mpv : VideoBackendMode.normal;
  late String altVideoPlayerVO, altVideoPlayerHWDEC, videoCacheMode;

  @override
  void initState() {
    super.initState();

    autoPlay = settingsHandler.autoPlayEnabled;
    startVideosMuted = settingsHandler.startVideosMuted;
    disableVideo = settingsHandler.disableVideo;
    longTapFastForwardVideo = settingsHandler.longTapFastForwardVideo;
    videoBackendMode = settingsHandler.videoBackendMode;
    altVideoPlayerHwAccel = settingsHandler.altVideoPlayerHwAccel;
    altVideoPlayerVO = settingsHandler.altVideoPlayerVO;
    altVideoPlayerHWDEC = settingsHandler.altVideoPlayerHWDEC;
    videoCacheMode = settingsHandler.videoCacheMode;
  }

  Future<void> _onPopInvoked(bool didPop, _) async {
    if (didPop) {
      return;
    }

    settingsHandler.autoPlayEnabled = autoPlay;
    settingsHandler.startVideosMuted = startVideosMuted;
    settingsHandler.disableVideo = disableVideo;
    settingsHandler.longTapFastForwardVideo = longTapFastForwardVideo;
    settingsHandler.videoBackendMode = SettingsHandler.isDesktopPlatform ? VideoBackendMode.mpv : videoBackendMode;
    settingsHandler.altVideoPlayerHwAccel = altVideoPlayerHwAccel;
    settingsHandler.altVideoPlayerVO = altVideoPlayerVO;
    settingsHandler.altVideoPlayerHWDEC = altVideoPlayerHWDEC;
    settingsHandler.videoCacheMode = videoCacheMode;

    if (SettingsHandler.isDesktopPlatform) {
      MediaKitVideoPlayer.registerWith();
    } else {
      switch (videoBackendMode) {
        case VideoBackendMode.normal:
          MediaKitVideoPlayer.registerNative();
          break;
        case VideoBackendMode.mpv:
          MediaKitVideoPlayer.registerWith();
          break;
        case VideoBackendMode.mdk:
          fvp.registerWith();
          break;
      }
    }

    final bool result = await settingsHandler.saveSettings(restate: false);
    if (result) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Video'),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsToggle(
                value: disableVideo,
                onChanged: (newValue) {
                  setState(() {
                    disableVideo = newValue;
                  });
                },
                title: 'Disable videos',
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const SettingsDialog(
                          title: Text('Disable videos'),
                          contentItems: [
                            Text('Useful on low end devices that crash when trying to load videos.'),
                            Text("Replaces video with text that says 'Video disabled'."),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              SettingsToggle(
                value: autoPlay,
                onChanged: (newValue) {
                  setState(() {
                    autoPlay = newValue;
                  });
                },
                title: 'Autoplay videos',
              ),
              SettingsToggle(
                value: startVideosMuted,
                onChanged: (newValue) {
                  setState(() {
                    startVideosMuted = newValue;
                  });
                },
                title: 'Start videos muted',
              ),
              //
              const SettingsButton(name: '', enabled: false),
              const SettingsButton(
                name: '[Experimental]',
                icon: Icon(Icons.science),
              ),
              SettingsToggle(
                value: longTapFastForwardVideo,
                onChanged: (newValue) {
                  setState(() {
                    longTapFastForwardVideo = newValue;
                  });
                },
                title: 'Long tap to fast forward video',
                subtitle: const Text(
                  'When this is enabled toolbar can be hidden with the tap when video controls are visible. [Experimental] May become default behavior in the future.',
                ),
              ),
              if (!SettingsHandler.isDesktopPlatform)
                SettingsDropdown(
                  value: videoBackendMode,
                  items: VideoBackendMode.values,
                  itemTitleBuilder: (item) => switch (item) {
                    VideoBackendMode.normal => 'Default',
                    VideoBackendMode.mpv => 'MPV',
                    VideoBackendMode.mdk => 'MDK',
                    _ => '',
                  },
                  itemSubtitleBuilder: (item) => switch (item) {
                    VideoBackendMode.normal =>
                      'Based on exoplayer. Has best device compatibility, may have issues with 4K videos, some codecs or older devices',
                    VideoBackendMode.mpv => 'Based on libmpv, has advanced settings which may help fix problems with some codecs/devices\n[MAY CAUSE CRASHES]',
                    VideoBackendMode.mdk => 'Based on libmdk, may have better performance for some codecs/devices\n[MAY CAUSE CRASHES]',
                    _ => '',
                  },
                  onChanged: (newValue) {
                    setState(() {
                      videoBackendMode = newValue ?? VideoBackendMode.normal;
                    });
                  },
                  title: 'Video player backend',
                ),

              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: (!videoBackendMode.isNormal || SettingsHandler.isDesktopPlatform)
                    ? Column(
                        children: [
                          if (videoBackendMode.isMpv) ...[
                            const Padding(
                              padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                              child: Text(
                                "Try different values of 'MPV' settings below if videos don't work correctly or give codec errors:",
                              ),
                            ),
                            SettingsToggle(
                              value: altVideoPlayerHwAccel,
                              onChanged: (newValue) {
                                setState(() {
                                  altVideoPlayerHwAccel = newValue;
                                });
                              },
                              title: 'MPV: use hardware acceleration',
                            ),
                            SettingsDropdown(
                              value: altVideoPlayerVO,
                              items: settingsHandler.map['altVideoPlayerVO']!['options'],
                              onReset: () {
                                setState(() {
                                  altVideoPlayerVO = settingsHandler.map['altVideoPlayerVO']!['default'];
                                });
                              },
                              onChanged: (String? newValue) {
                                setState(() {
                                  altVideoPlayerVO = newValue ?? settingsHandler.map['altVideoPlayerVO']!['default'];
                                });
                              },
                              title: 'MPV: VO',
                            ),
                            SettingsDropdown(
                              value: altVideoPlayerHWDEC,
                              items: settingsHandler.map['altVideoPlayerHWDEC']!['options'],
                              onReset: () {
                                setState(() {
                                  altVideoPlayerHWDEC = settingsHandler.map['altVideoPlayerHWDEC']!['default'];
                                });
                              },
                              onChanged: (String? newValue) {
                                setState(() {
                                  altVideoPlayerHWDEC = newValue ?? settingsHandler.map['altVideoPlayerHWDEC']!['default'];
                                });
                              },
                              title: 'MPV: HWDEC',
                            ),
                          ],
                          SettingsOptionsList(
                            value: videoCacheMode,
                            items: settingsHandler.map['videoCacheMode']!['options'],
                            onChanged: (String? newValue) {
                              setState(() {
                                videoCacheMode = newValue ?? settingsHandler.map['videoCacheMode']!['default'];
                              });
                            },
                            title: 'Video cache mode',
                            subtitle: const Text(
                              '''Videos on some Boorus may not work correctly (i.e. endless loading) when using Stream video cache mode. In that case try using Cache mode. Otherwise player will retry with Cache mode automatically if video is in initial buffering state for 10+ seconds and video file size is less than 25mb''',
                            ),
                            trailingIcon: IconButton(
                              icon: const Icon(Icons.help_outline),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SettingsDialog(
                                      title: const Text('Video cache modes'),
                                      contentItems: [
                                        const Text("- Stream - Don't cache, start playing as soon as possible"),
                                        const Text('- Cache - Saves the file to device storage, plays only when download is complete'),
                                        const Text('- Stream+Cache - Mix of both, but currently leads to double download'),
                                        const Text(''),
                                        const Text("[Note]: Videos will cache only if 'Cache Media' is enabled."),
                                        const Text(''),
                                        if (SettingsHandler.isDesktopPlatform)
                                          const Text('[Warning]: On desktop Stream mode can work incorrectly for some Boorus.'),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : LayoutBuilder(
                        // used to avoid animating width change
                        builder: (_, constraints) => SizedBox(width: constraints.maxWidth),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
