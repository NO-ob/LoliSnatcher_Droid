import 'dart:io';

import 'package:flutter/material.dart';

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

  bool autoPlay = true, startVideosMuted = false, disableVideo = false, useAltVideoPlayer = false, altVideoPlayerHwAccel = true;
  late String altVideoPlayerVO, altVideoPlayerHWDEC, videoCacheMode;

  @override
  void initState() {
    super.initState();

    autoPlay = settingsHandler.autoPlayEnabled;
    startVideosMuted = settingsHandler.startVideosMuted;
    disableVideo = settingsHandler.disableVideo;
    useAltVideoPlayer = settingsHandler.useAltVideoPlayer;
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
    settingsHandler.useAltVideoPlayer = useAltVideoPlayer;
    settingsHandler.altVideoPlayerHwAccel = altVideoPlayerHwAccel;
    settingsHandler.altVideoPlayerVO = altVideoPlayerVO;
    settingsHandler.altVideoPlayerHWDEC = altVideoPlayerHWDEC;
    settingsHandler.videoCacheMode = videoCacheMode;

    if (settingsHandler.useAltVideoPlayer || (Platform.isWindows || Platform.isLinux)) {
      MediaKitVideoPlayer.registerWith();
    } else {
      MediaKitVideoPlayer.registerNative();
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
              if (Platform.isAndroid || Platform.isIOS) ...[
                SettingsToggle(
                  value: useAltVideoPlayer,
                  onChanged: (newValue) {
                    setState(() {
                      useAltVideoPlayer = newValue;
                    });
                  },
                  title: 'Use alternative video player backend',
                  subtitle: const Text('Has better performance in some cases, but certain videos may not work on your device'),
                ),
              ],
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: (useAltVideoPlayer || SettingsHandler.isDesktopPlatform)
                    ? Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                            child: Text(
                              "Try different values of 'Alt player' settings below if videos don't work correctly or give codec errors:",
                            ),
                          ),
                          SettingsToggle(
                            value: altVideoPlayerHwAccel,
                            onChanged: (newValue) {
                              setState(() {
                                altVideoPlayerHwAccel = newValue;
                              });
                            },
                            title: 'Alt player: use hardware acceleration',
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
                            title: 'Alt player: VO',
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
                            title: 'Alt player: HWDEC',
                          ),
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
                              '''Videos on some Boorus may not work correctly (i.e. endless loading) on alt player with Stream video cache mode. In that case try using Cache mode. Otherwise player will retry with Cache mode automatically if video is in initial buffering state for 10+ seconds and video file size is <25mb''',
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
