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
      hideNotes = false,
      allowRotation = false,
      loadingGif = false,
      useVolumeButtonsForScroll = false,
      shitDevice = false,
      wakeLockEnabled = true,
      enableHeroTransitions = true,
      disableCustomPageTransitions = false,
      disableVibration = false;
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
    hideNotes = settingsHandler.hideNotes;
    allowRotation = settingsHandler.allowRotation;
    useVolumeButtonsForScroll = settingsHandler.useVolumeButtonsForScroll;
    scrollSpeedController.text = settingsHandler.volumeButtonsScrollSpeed.toString();
    galleryAutoScrollController.text = settingsHandler.galleryAutoScrollTime.toString();
    preloadController.text = settingsHandler.preloadCount.toString();
    shitDevice = settingsHandler.shitDevice;
    loadingGif = settingsHandler.loadingGif;
    wakeLockEnabled = settingsHandler.wakeLockEnabled;
    enableHeroTransitions = settingsHandler.enableHeroTransitions;
    disableCustomPageTransitions = settingsHandler.disableCustomPageTransitions;
    disableVibration = settingsHandler.disableVibration;
  }

  //called when page is clsoed, sets settingshandler variables and then writes settings to disk
  Future<void> _onPopInvoked(bool didPop, _) async {
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
    settingsHandler.hideNotes = hideNotes;
    settingsHandler.allowRotation = allowRotation;
    settingsHandler.loadingGif = loadingGif;
    settingsHandler.shitDevice = shitDevice;
    settingsHandler.useVolumeButtonsForScroll = useVolumeButtonsForScroll;
    settingsHandler.wakeLockEnabled = wakeLockEnabled;
    settingsHandler.enableHeroTransitions = enableHeroTransitions;
    settingsHandler.disableCustomPageTransitions = disableCustomPageTransitions;
    settingsHandler.disableVibration = disableVibration;

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
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Viewer'),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsTextInput(
                controller: preloadController,
                title: 'Preload amount',
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
                title: 'Image quality',
              ),
              SettingsDropdown(
                value: galleryScrollDirection,
                items: settingsHandler.map['galleryScrollDirection']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    galleryScrollDirection = newValue ?? settingsHandler.map['galleryScrollDirection']!['default'];
                  });
                },
                title: 'Viewer scroll direction',
              ),
              SettingsDropdown(
                value: shareAction,
                items: (settingsHandler.map['shareAction']!['options'] as List<String>).where((element) => hasHydrus || element != 'Hydrus').toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    shareAction = newValue ?? settingsHandler.map['shareAction']!['default'];
                  });
                },
                title: 'Default share action',
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SettingsDialog(
                          title: const Text('Share actions'),
                          contentItems: [
                            const Text('- Ask - always ask what to share'),
                            const Text('- Post URL'),
                            const Text('- File URL - shares direct link to the original file (may not work with some sites)'),
                            const Text('- File - shares the file itself, may take some time to load, progress will be shown on the Share button'),
                            if (hasHydrus) const Text('- Hydrus - sends the post url to Hydrus for import'),
                            const Text(''),
                            const Text(
                              '[Note]: If File is saved in cache, it will be loaded from there. Otherwise it will be loaded again from network.',
                            ),
                            const Text(''),
                            const Text('[Tip]: You can open Share actions menu by long pressing Share button.'),
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
                title: 'Viewer toolbar position',
              ),
              SettingsDropdown(
                value: zoomButtonPosition,
                items: settingsHandler.map['zoomButtonPosition']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    zoomButtonPosition = newValue ?? settingsHandler.map['zoomButtonPosition']!['default'];
                  });
                },
                title: 'Zoom button position',
              ),
              SettingsDropdown(
                value: changePageButtonsPosition,
                items: settingsHandler.map['changePageButtonsPosition']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    changePageButtonsPosition = newValue ?? settingsHandler.map['changePageButtonsPosition']!['default'];
                  });
                },
                title: 'Change page buttons position',
              ),
              SettingsToggle(
                value: autoHideImageBar,
                onChanged: (newValue) {
                  setState(() {
                    autoHideImageBar = newValue;
                  });
                },
                title: 'Hide toolbar when opening viewer',
              ),
              SettingsToggle(
                value: hideNotes,
                onChanged: (newValue) {
                  setState(() {
                    hideNotes = newValue;
                  });
                },
                title: 'Hide translation notes by default',
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

              Material(
                color: Colors.transparent,
                child: ExpansionTile(
                  title: Row(
                    children: [
                      const Expanded(child: Text('Toolbar buttons order')),
                      IconButton(
                        icon: Icon(
                          Icons.help_outline,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const SettingsDialog(
                                title: Text('Buttons order'),
                                contentItems: [
                                  Text('Long press to change item order.'),
                                  Text('At least 4 buttons from this list will be always visible on Toolbar.'),
                                  Text('Other buttons will go into overflow (three dots) menu.'),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  shape: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: borderWidth,
                    ),
                  ),
                  collapsedShape: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: borderWidth,
                    ),
                  ),
                  iconColor: Theme.of(context).colorScheme.onSurface,
                  children: [
                    ReorderableListView(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      buildDefaultDragHandles: false,
                      children: [
                        for (int index = 0; index < buttonOrder!.length; index++)
                          ReorderableDelayedDragStartListener(
                            key: ValueKey('item-#$index'),
                            index: index,
                            child: ListTile(
                              onTap: () {
                                FlashElements.showSnackbar(
                                  context: context,
                                  title: const Text(
                                    'Long press to move items',
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
                              trailing: ReorderableDragStartListener(
                                key: Key('draghandle-#$index'),
                                index: index,
                                child: const IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.drag_handle),
                                ),
                              ),
                            ),
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
                    const SizedBox(height: 40),
                  ],
                ),
              ),

              // TODO rework into loading element variant (small, verbose, gif...) or remove completely, this gif is like 20% of the app's size
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
                      settingsHandler.autoPlayEnabled = false;
                      settingsHandler.disableImageScaling = false;
                      settingsHandler.previewMode = 'Thumbnail';
                    }
                  });
                },
                title: 'Low performance mode',
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const SettingsDialog(
                          title: Text('Low performance mode'),
                          contentItems: [
                            Text('Recommended for old devices and devices with RAM ~2GB.'),
                            Text(''),
                            Text('- Disables loading progress information'),
                            Text('- Sets optimal settings for:'),
                            Text('   - Image quality'),
                            Text('   - Preview quality'),
                            Text('   - Preload amount'),
                            Text('   - Video autoplay'),
                            Text("   - Don't scale images"),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              //////////////////////////////////////////

              SettingsToggle(
                value: disableVibration,
                onChanged: (newValue) {
                  setState(() {
                    disableVibration = newValue;
                  });
                },
                title: 'Disable vibration',
                subtitle: const Text('(may still happen on some actions even when disabled)'),
              ),
              SettingsToggle(
                value: useVolumeButtonsForScroll,
                onChanged: (newValue) {
                  setState(() {
                    useVolumeButtonsForScroll = newValue;
                  });
                },
                title: 'Use volume buttons for scrolling',
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const SettingsDialog(
                          title: Text('Volume buttons scrolling'),
                          contentItems: [
                            Text('Allows to scroll through previews grid and viewer items using volume buttons'),
                            Text(''),
                            Text(' - Volume Down - next item'),
                            Text(' - Volume Up - previous item'),
                            Text(''),
                            Text('On videos:'),
                            Text(' - Toolbar visible - controls volume'),
                            Text(' - Toolbar hidden - controls scrolling'),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              SettingsTextInput(
                controller: scrollSpeedController,
                title: 'Buttons scroll speed',
                hintText: 'Scroll speed',
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
                title: 'Slideshow duration (in ms)',
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
                          title: Text('Slideshow'),
                          contentItems: [
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
                title: 'Prevent device from sleeping',
              ),
              SettingsToggle(
                value: enableHeroTransitions,
                onChanged: (newValue) {
                  setState(() {
                    enableHeroTransitions = newValue;
                  });
                },
                title: 'Viewer open/close animation',
              ),
              SettingsToggle(
                value: disableCustomPageTransitions,
                onChanged: (newValue) {
                  setState(() {
                    disableCustomPageTransitions = newValue;
                  });
                },
                title: 'Viewer page change animation',
                subtitle: Text(
                  disableCustomPageTransitions ? 'Using default animation' : 'Using custom animation',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
