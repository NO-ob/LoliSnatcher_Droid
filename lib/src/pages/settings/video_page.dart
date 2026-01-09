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

  bool autoPlay = true;
  bool startVideosMuted = false;
  bool disableVideo = false;
  bool longTapFastForwardVideo = false;
  bool altVideoPlayerHwAccel = true;
  VideoBackendMode videoBackendMode = SettingsHandler.isDesktopPlatform
      ? VideoBackendMode.mpv
      : VideoBackendMode.normal;
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
      fvp.registerWith();
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
          title: Text(context.loc.settings.video.title),
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
                title: context.loc.settings.video.disableVideos,
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SettingsDialog(
                          title: Text(context.loc.settings.video.disableVideos),
                          contentItems: [
                            Text(
                              context.loc.settings.video.disableVideosHelp,
                            ),
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
                title: context.loc.settings.video.autoplayVideos,
              ),
              SettingsToggle(
                value: startVideosMuted,
                onChanged: (newValue) {
                  setState(() {
                    startVideosMuted = newValue;
                  });
                },
                title: context.loc.settings.video.startVideosMuted,
              ),
              //
              const SettingsButton(name: '', enabled: false),
              SettingsButton(
                name: context.loc.settings.video.experimental,
                icon: const Icon(Icons.science),
              ),
              SettingsToggle(
                value: longTapFastForwardVideo,
                onChanged: (newValue) {
                  setState(() {
                    longTapFastForwardVideo = newValue;
                  });
                },
                title: context.loc.settings.video.longTapToFastForwardVideo,
                subtitle: Text(
                  context.loc.settings.video.longTapToFastForwardVideoHelp,
                ),
              ),
              if (!SettingsHandler.isDesktopPlatform)
                SettingsDropdown(
                  value: videoBackendMode,
                  items: VideoBackendMode.values,
                  itemTitleBuilder: (item) => switch (item) {
                    VideoBackendMode.normal => context.loc.settings.video.backendDefault,
                    VideoBackendMode.mpv => context.loc.settings.video.backendMPV,
                    VideoBackendMode.mdk => context.loc.settings.video.backendMDK,
                    _ => '',
                  },
                  itemSubtitleBuilder: (item) => switch (item) {
                    VideoBackendMode.normal => context.loc.settings.video.backendDefaultHelp,
                    VideoBackendMode.mpv => context.loc.settings.video.backendMPVHelp,
                    VideoBackendMode.mdk => context.loc.settings.video.backendMDKHelp,
                    _ => '',
                  },
                  onChanged: (newValue) {
                    setState(() {
                      videoBackendMode = newValue ?? VideoBackendMode.normal;
                    });
                  },
                  title: context.loc.settings.video.videoPlayerBackend,
                ),

              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: (!videoBackendMode.isNormal || SettingsHandler.isDesktopPlatform)
                    ? Column(
                        children: [
                          if (videoBackendMode.isMpv) ...[
                            Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                              child: Text(
                                context.loc.settings.video.mpvSettingsHelp,
                              ),
                            ),
                            SettingsToggle(
                              value: altVideoPlayerHwAccel,
                              onChanged: (newValue) {
                                setState(() {
                                  altVideoPlayerHwAccel = newValue;
                                });
                              },
                              title: context.loc.settings.video.mpvUseHardwareAcceleration,
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
                              title: context.loc.settings.video.mpvVO,
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
                                  altVideoPlayerHWDEC =
                                      newValue ?? settingsHandler.map['altVideoPlayerHWDEC']!['default'];
                                });
                              },
                              title: context.loc.settings.video.mpvHWDEC,
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
                            title: context.loc.settings.video.videoCacheMode,
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
                                      title: Text(context.loc.settings.video.cacheModes.title),
                                      contentItems: [
                                        Text(context.loc.settings.video.cacheModes.streamMode),
                                        Text(context.loc.settings.video.cacheModes.cacheMode),
                                        Text(context.loc.settings.video.cacheModes.streamCacheMode),
                                        const Text(''),
                                        Text(context.loc.settings.video.cacheModes.cacheNote),
                                        const Text(''),
                                        if (SettingsHandler.isDesktopPlatform)
                                          Text(context.loc.settings.video.cacheModes.desktopWarning),
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
