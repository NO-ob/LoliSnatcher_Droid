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
  late String altVideoPlayerVO, altVideoPlayerHWDEC;

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
  }

  Future<void> _onPopInvoked(bool didPop) async {
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
      onPopInvoked: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Title'),
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
                title: 'Disable Video',
                drawTopBorder: true, // instead of border in reorder list
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const SettingsDialog(
                          title: Text('Disable Video'),
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
              if (Platform.isAndroid || Platform.isIOS) ...[
                SettingsToggle(
                  value: useAltVideoPlayer,
                  onChanged: (newValue) {
                    setState(() {
                      useAltVideoPlayer = newValue;
                    });
                  },
                  title: 'Use alternative video player backend',
                  subtitle: const Text('Has better performance in some cases, but certain videos may not work on your device due to codecs'),
                ),
              ],
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: (useAltVideoPlayer || (Platform.isWindows || Platform.isLinux))
                    ? Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                            child: Text("Play around with 'Alt player' settings below if videos don't work correctly or give codec errors:"),
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
                        ],
                      )
                    : LayoutBuilder(
                        builder: (_, constraints) => SizedBox(width: constraints.maxWidth),
                      ),
              ),
              SettingsToggle(
                value: autoPlay,
                onChanged: (newValue) {
                  setState(() {
                    autoPlay = newValue;
                  });
                },
                title: 'Auto play videos',
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
            ],
          ),
        ),
      ),
    );
  }
}
