import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});
  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  bool autoHideImageBar = false,
      autoPlay = true,
      allowRotation = false,
      loadingGif = false,
      useVolumeButtonsForScroll = false,
      shitDevice = false,
      disableVideo = false,
      wakeLockEnabled = true;
  late String galleryMode, galleryBarPosition, galleryScrollDirection, shareAction, zoomButtonPosition, changePageButtonsPosition;

  List<List<String>>? buttonOrder;

  TextEditingController preloadController = TextEditingController();
  TextEditingController scrollSpeedController = TextEditingController();
  TextEditingController galleryAutoScrollController = TextEditingController();

  @override
  void initState() {
    super.initState();

    autoHideImageBar = settingsHandler.autoHideImageBar;
    galleryMode = settingsHandler.galleryMode;
    galleryBarPosition = settingsHandler.galleryBarPosition;
    buttonOrder = settingsHandler.buttonOrder;
    galleryScrollDirection = settingsHandler.galleryScrollDirection;

    shareAction = settingsHandler.shareAction;
    if (!settingsHandler.hasHydrus && settingsHandler.shareAction == 'Hydrus') {
      shareAction = 'Ask';
    }

    zoomButtonPosition = settingsHandler.zoomButtonPosition;
    changePageButtonsPosition = settingsHandler.changePageButtonsPosition;
    autoPlay = settingsHandler.autoPlayEnabled;
    allowRotation = settingsHandler.allowRotation;
    useVolumeButtonsForScroll = settingsHandler.useVolumeButtonsForScroll;
    scrollSpeedController.text = settingsHandler.volumeButtonsScrollSpeed.toString();
    galleryAutoScrollController.text = settingsHandler.galleryAutoScrollTime.toString();
    preloadController.text = settingsHandler.preloadCount.toString();
    shitDevice = settingsHandler.shitDevice;
    disableVideo = settingsHandler.disableVideo;
    loadingGif = settingsHandler.loadingGif;
    wakeLockEnabled = settingsHandler.wakeLockEnabled;
  }

  //called when page is clsoed, sets settingshandler variables and then writes settings to disk
  Future<void> _onPopInvoked(bool didPop) async {
    if (didPop) {
      return;
    }

    settingsHandler.autoHideImageBar = autoHideImageBar;
    settingsHandler.galleryMode = galleryMode;
    settingsHandler.galleryBarPosition = galleryBarPosition;
    settingsHandler.buttonOrder = buttonOrder!;
    settingsHandler.galleryScrollDirection = galleryScrollDirection;
    settingsHandler.shareAction = shareAction;
    settingsHandler.zoomButtonPosition = zoomButtonPosition;
    settingsHandler.changePageButtonsPosition = changePageButtonsPosition;
    settingsHandler.autoPlayEnabled = autoPlay;
    settingsHandler.allowRotation = allowRotation;
    settingsHandler.loadingGif = loadingGif;
    settingsHandler.shitDevice = shitDevice;
    settingsHandler.disableVideo = disableVideo;
    settingsHandler.useVolumeButtonsForScroll = useVolumeButtonsForScroll;
    settingsHandler.wakeLockEnabled = wakeLockEnabled;
    if (int.parse(scrollSpeedController.text) < 100) {
      scrollSpeedController.text = '100';
    }
    if (int.parse(galleryAutoScrollController.text) < 800) {
      galleryAutoScrollController.text = '800';
    }
    settingsHandler.volumeButtonsScrollSpeed = int.parse(scrollSpeedController.text);
    settingsHandler.galleryAutoScrollTime = int.parse(galleryAutoScrollController.text);
    if (int.parse(preloadController.text) < 0) {
      preloadController.text = 0.toString();
    }
    settingsHandler.preloadCount = int.parse(preloadController.text);
    // Set settingshandler values here
    final bool result = await settingsHandler.saveSettings(restate: false);
    if (result) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color baseColor = Theme.of(context).colorScheme.secondary;
    final Color oddItemColor = baseColor.withOpacity(0.25);
    final Color evenItemColor = baseColor.withOpacity(0.15);

    final bool hasHydrus = settingsHandler.hasHydrus;

    return PopScope(
      canPop: false,
      onPopInvoked: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Gallery'),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsTextInput(
                controller: preloadController,
                title: 'Gallery View Preload',
                hintText: 'Images to preload',
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                resetText: () => settingsHandler.map['preloadCount']!['default']!.toString(),
                numberButtons: true,
                numberStep: 1,
                numberMin: 0,
                numberMax: 5,
                validator: (String? value) {
                  final int? parse = int.tryParse(value ?? '');
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  } else if (parse == null) {
                    return 'Please enter a valid numeric value';
                  } else if (parse > 4) {
                    return 'Please enter a value less than 5';
                  } else {
                    return null;
                  }
                },
              ),
              SettingsDropdown(
                value: galleryMode,
                items: settingsHandler.map['galleryMode']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    galleryMode = newValue ?? settingsHandler.map['galleryMode']!['default'];
                  });
                },
                title: 'Gallery Quality',
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const SettingsDialog(
                          title: Text('Gallery Quality'),
                          contentItems: <Widget>[
                            Text('The gallery quality changes the resolution of images in the gallery viewer.'),
                            Text(''),
                            Text(' - Sample - Medium resolution'),
                            Text(' - Full Res - Full resolution'),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              SettingsDropdown(
                value: galleryScrollDirection,
                items: settingsHandler.map['galleryScrollDirection']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    galleryScrollDirection = newValue ?? settingsHandler.map['galleryScrollDirection']!['default'];
                  });
                },
                title: 'Gallery Scroll Direction',
              ),
              SettingsDropdown(
                value: shareAction,
                items: (settingsHandler.map['shareAction']!['options'] as List<String>).where((element) => hasHydrus || element != 'Hydrus').toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    shareAction = newValue ?? settingsHandler.map['shareAction']!['default'];
                  });
                },
                title: 'Default Share Action',
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SettingsDialog(
                          title: const Text('Share Actions'),
                          contentItems: <Widget>[
                            const Text('- Ask - always ask what to share'),
                            const Text('- Post URL'),
                            const Text('- File URL - shares direct link to the original file (may not work with some sites, e.g. Sankaku)'),
                            const Text('- File - shares viewed file itself'),
                            if (hasHydrus) const Text('- Hydrus - sends the post url to Hydrus for import'),
                            const Text(''),
                            const Text(
                              '[Note]: If File is saved in cache, it will be loaded from there. Otherwise it will be loaded again from network which can take some time.',
                            ),
                            const Text(''),
                            const Text('[Tip]: You can open Share Actions Menu by long pressing Share button.'),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              SettingsDropdown(
                value: galleryBarPosition,
                items: settingsHandler.map['galleryBarPosition']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    galleryBarPosition = newValue ?? settingsHandler.map['galleryBarPosition']!['default'];
                  });
                },
                title: 'Gallery Bar Position',
              ),
              SettingsDropdown(
                value: zoomButtonPosition,
                items: settingsHandler.map['zoomButtonPosition']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    zoomButtonPosition = newValue ?? settingsHandler.map['zoomButtonPosition']!['default'];
                  });
                },
                title: 'Zoom Button Position',
              ),
              SettingsDropdown(
                value: changePageButtonsPosition,
                items: settingsHandler.map['changePageButtonsPosition']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    changePageButtonsPosition = newValue ?? settingsHandler.map['changePageButtonsPosition']!['default'];
                  });
                },
                title: 'Change Page Buttons Position',
              ),
              SettingsToggle(
                value: autoHideImageBar,
                onChanged: (newValue) {
                  setState(() {
                    autoHideImageBar = newValue;
                  });
                },
                title: 'Auto Hide Gallery Bar',
              ),
              SettingsToggle(
                value: allowRotation,
                onChanged: (newValue) {
                  setState(() {
                    allowRotation = newValue;
                  });
                },
                title: 'Enable rotation',
                subtitle: const Text('Double tap to reset (only works on images)'),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  children: [
                    SettingsButton(
                      name: 'Toolbar Buttons Order',
                      drawBottomBorder: false,
                      trailingIcon: IconButton(
                        icon: const Icon(Icons.help_outline),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const SettingsDialog(
                                title: Text('Buttons Order'),
                                contentItems: <Widget>[
                                  Text('Long press to change item order.'),
                                  Text('First 4 buttons from this list will be always visible on Toolbar.'),
                                  Text('Other buttons will be in overflow (three dots) menu.'),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                    ReorderableListView(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        for (int index = 0; index < buttonOrder!.length; index++)
                          ListTile(
                            onTap: () {
                              FlashElements.showSnackbar(
                                context: context,
                                title: const Text(
                                  'Long Press to move items',
                                  style: TextStyle(fontSize: 20),
                                ),
                                leadingIcon: Icons.warning_amber,
                                leadingIconColor: Colors.yellow,
                                sideColor: Colors.yellow,
                              );
                            },
                            key: Key('$index'),
                            tileColor: index.isOdd ? oddItemColor : evenItemColor,
                            title: Text(buttonOrder![index][1]),
                            trailing: const Icon(Icons.menu),
                          ),
                      ],
                      onReorder: (int oldIndex, int newIndex) {
                        setState(() {
                          if (oldIndex < newIndex) {
                            newIndex -= 1;
                          }
                          final List<String> item = buttonOrder!.removeAt(oldIndex);
                          buttonOrder!.insert(newIndex, item);
                        });
                      },
                    ),
                  ],
                ),
              ),

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
                          contentItems: <Widget>[
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
                title: 'Video Auto Play',
              ),

              // TODO rework into loading element variant (small, verbose, gif...)
              // TODO ...or remove completely, this gif is like 20% of the app's size
              SettingsToggle(
                value: loadingGif,
                onChanged: (newValue) {
                  setState(() {
                    loadingGif = newValue;
                  });
                },
                title: 'Kanna loading Gif',
              ),
              SettingsToggle(
                value: shitDevice,
                onChanged: (newValue) {
                  setState(() {
                    shitDevice = newValue;
                    if (shitDevice) {
                      preloadController.text = '0';
                      galleryMode = 'Sample';
                      autoPlay = false;
                      // TODO set thumbnails quality to low?
                    }
                  });
                },
                title: 'Low Performance Mode',
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const SettingsDialog(
                          title: Text('Low Performance Mode'),
                          contentItems: <Widget>[
                            Text('Recommended for old devices and devices with RAM < 2GB.'),
                            Text(''),
                            Text('- Disables loading progress information'),
                            Text('- Sets optimal settings for:'),
                            Text('   - Gallery Quality'),
                            Text('   - Gallery Preload'),
                            Text('   - Video Auto Play'),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              //////////////////////////////////////////

              SettingsToggle(
                value: useVolumeButtonsForScroll,
                onChanged: (newValue) {
                  setState(() {
                    useVolumeButtonsForScroll = newValue;
                  });
                },
                title: 'Use Volume Buttons for Scrolling',
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const SettingsDialog(
                          title: Text('Volume Buttons Scrolling'),
                          contentItems: <Widget>[
                            Text('Allows to scroll through previews grid and gallery items using volume buttons'),
                            Text(''),
                            Text(' - Volume Down - next item'),
                            Text(' - Volume Up - previous item'),
                            Text(''),
                            Text('On videos:'),
                            Text(' - App Bar visible - controls volume'),
                            Text(' - App Bar hidden - controls scrolling'),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              SettingsTextInput(
                controller: scrollSpeedController,
                title: 'Buttons Scroll Speed',
                hintText: 'Scroll Speed',
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                resetText: () => settingsHandler.map['volumeButtonsScrollSpeed']!['default']!.toString(),
                numberButtons: true,
                numberStep: 100,
                numberMin: 100,
                numberMax: double.infinity,
                validator: (String? value) {
                  final int? parse = int.tryParse(value ?? '');
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  } else if (parse == null) {
                    return 'Please enter a valid numeric value';
                  } else if (parse < 100) {
                    return 'Please enter a value bigger than 100';
                  } else {
                    return null;
                  }
                },
              ),

              SettingsTextInput(
                controller: galleryAutoScrollController,
                title: 'AutoScroll Timeout (in ms)',
                hintText: 'AutoScroll Timeout (in ms)',
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                resetText: () => settingsHandler.map['galleryAutoScrollTime']!['default']!.toString(),
                numberButtons: true,
                numberStep: 100,
                numberMin: 100,
                numberMax: double.infinity,
                validator: (String? value) {
                  final int? parse = int.tryParse(value ?? '');
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  } else if (parse == null) {
                    return 'Please enter a valid numeric value';
                  } else {
                    return null;
                  }
                },
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const SettingsDialog(
                          title: Text('AutoScroll / Slideshow'),
                          contentItems: <Widget>[
                            Text('[WIP] Videos and gifs must be scrolled manually for now.'),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              SettingsToggle(
                value: wakeLockEnabled,
                onChanged: (newValue) {
                  setState(() {
                    wakeLockEnabled = newValue;
                  });
                },
                title: 'Prevent Device From Sleeping',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
