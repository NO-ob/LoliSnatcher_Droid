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
      wakeLockEnabled = true,
      enableHeroTransitions = true,
      disableCustomPageTransitions = false,
      disableVibration = false;
  late String galleryMode,
      galleryBarPosition,
      galleryScrollDirection,
      shareAction,
      zoomButtonPosition,
      changePageButtonsPosition;

  late final List<String> buttonOrder;
  late final List<String> disabledButtons;

  final TextEditingController preloadAmountController = TextEditingController();
  final TextEditingController preloadSizeController = TextEditingController();
  final TextEditingController scrollSpeedController = TextEditingController();
  final TextEditingController galleryAutoScrollController = TextEditingController();

  @override
  void initState() {
    super.initState();

    autoHideImageBar = settingsHandler.autoHideImageBar;
    galleryMode = settingsHandler.galleryMode;
    galleryBarPosition = settingsHandler.galleryBarPosition;
    buttonOrder = settingsHandler.buttonOrder;
    disabledButtons = [
      ...settingsHandler.disabledButtons,
    ];
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
    preloadAmountController.text = settingsHandler.preloadCount.toString();
    preloadSizeController.text = settingsHandler.preloadSizeLimit.toString();
    loadingGif = settingsHandler.loadingGif;
    wakeLockEnabled = settingsHandler.wakeLockEnabled;
    enableHeroTransitions = settingsHandler.enableHeroTransitions;
    disableCustomPageTransitions = settingsHandler.disableCustomPageTransitions;
    disableVibration = settingsHandler.disableVibration;
  }

  @override
  void dispose() {
    preloadAmountController.dispose();
    preloadSizeController.dispose();
    scrollSpeedController.dispose();
    galleryAutoScrollController.dispose();
    super.dispose();
  }

  Future<void> _onPopInvoked(bool didPop, _) async {
    if (didPop) {
      return;
    }

    settingsHandler.autoHideImageBar = autoHideImageBar;
    settingsHandler.galleryMode = galleryMode;
    settingsHandler.galleryBarPosition = galleryBarPosition;
    settingsHandler.buttonOrder = buttonOrder;
    settingsHandler.disabledButtons = disabledButtons;
    settingsHandler.galleryScrollDirection = galleryScrollDirection;
    settingsHandler.shareAction = shareAction;
    settingsHandler.zoomButtonPosition = zoomButtonPosition;
    settingsHandler.changePageButtonsPosition = changePageButtonsPosition;
    settingsHandler.hideNotes = hideNotes;
    settingsHandler.allowRotation = allowRotation;
    settingsHandler.loadingGif = loadingGif;
    settingsHandler.useVolumeButtonsForScroll = useVolumeButtonsForScroll;
    settingsHandler.wakeLockEnabled = wakeLockEnabled;
    settingsHandler.enableHeroTransitions = enableHeroTransitions;
    settingsHandler.disableCustomPageTransitions = disableCustomPageTransitions;
    settingsHandler.disableVibration = disableVibration;

    if (int.parse(scrollSpeedController.text) < 100) {
      scrollSpeedController.text = 100.toString();
    }
    if (int.parse(galleryAutoScrollController.text) < 800) {
      galleryAutoScrollController.text = 800.toString();
    }
    settingsHandler.volumeButtonsScrollSpeed = int.parse(scrollSpeedController.text);
    settingsHandler.galleryAutoScrollTime = int.parse(galleryAutoScrollController.text);

    if ((int.tryParse(preloadAmountController.text) ?? 0) < 0) {
      preloadAmountController.text = 0.toString();
    }
    settingsHandler.preloadCount = int.parse(preloadAmountController.text);

    if ((double.tryParse(preloadSizeController.text) ?? 0) < 0) {
      preloadSizeController.text = 0.toString();
    }
    settingsHandler.preloadSizeLimit = double.parse(preloadSizeController.text);

    final bool result = await settingsHandler.saveSettings(restate: false);
    if (result) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color baseColor = Theme.of(context).colorScheme.secondary;
    final Color oddItemColor = baseColor.withValues(alpha: 0.25);
    final Color evenItemColor = baseColor.withValues(alpha: 0.15);

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
                controller: preloadAmountController,
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
              SettingsTextInput(
                controller: preloadSizeController,
                title: 'Preload size limit',
                subtitle: const Text('in GB, 0 for no limit'),
                inputType: TextInputType.number,
                resetText: () => settingsHandler.map['preloadSizeLimit']!['default']!.toString(),
                numberButtons: true,
                numberStep: settingsHandler.map['preloadSizeLimit']!['step']!,
                numberMin: settingsHandler.map['preloadSizeLimit']!['lowerLimit']!,
                numberMax: settingsHandler.map['preloadSizeLimit']!['upperLimit']!,
                validator: (String? value) {
                  final double? parse = double.tryParse(value ?? '');
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  } else if (parse == null) {
                    return 'Please enter a valid numeric value';
                  } else if (parse < settingsHandler.map['preloadSizeLimit']!['lowerLimit']! ||
                      parse > settingsHandler.map['preloadSizeLimit']!['upperLimit']!) {
                    return 'Please enter a value between ${settingsHandler.map['preloadSizeLimit']!['lowerLimit']!} and ${settingsHandler.map['preloadSizeLimit']!['upperLimit']!}';
                  } else {
                    return null;
                  }
                },
              ),
              SettingsOptionsList(
                value: galleryMode,
                items: settingsHandler.map['galleryMode']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    galleryMode = newValue ?? settingsHandler.map['galleryMode']!['default'];
                  });
                },
                title: 'Image quality',
              ),
              SettingsOptionsList(
                value: galleryScrollDirection,
                items: settingsHandler.map['galleryScrollDirection']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    galleryScrollDirection = newValue ?? settingsHandler.map['galleryScrollDirection']!['default'];
                  });
                },
                title: 'Viewer scroll direction',
              ),
              SettingsOptionsList(
                value: galleryBarPosition,
                items: settingsHandler.map['galleryBarPosition']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    galleryBarPosition = newValue ?? settingsHandler.map['galleryBarPosition']!['default'];
                  });
                },
                title: 'Viewer toolbar position',
              ),
              SettingsOptionsList(
                value: zoomButtonPosition,
                items: settingsHandler.map['zoomButtonPosition']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    zoomButtonPosition = newValue ?? settingsHandler.map['zoomButtonPosition']!['default'];
                  });
                },
                title: 'Zoom button position',
              ),
              SettingsOptionsList(
                value: changePageButtonsPosition,
                items: settingsHandler.map['changePageButtonsPosition']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    changePageButtonsPosition =
                        newValue ?? settingsHandler.map['changePageButtonsPosition']!['default'];
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
                          Icons.refresh,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        onPressed: () {
                          setState(() {
                            buttonOrder.clear();
                            buttonOrder.addAll(settingsHandler.map['buttonOrder']!['default']);
                            disabledButtons.clear();
                            disabledButtons.addAll(settingsHandler.map['disabledButtons']!['default']);
                          });
                        },
                      ),
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
                        for (int index = 0; index < buttonOrder.length; index++)
                          ReorderableDelayedDragStartListener(
                            key: ValueKey('item-${buttonOrder[index]}'),
                            index: index,
                            child: Builder(
                              builder: (context) {
                                final name = buttonOrder[index];
                                final title = SettingsHandler.buttonNames[name] ?? '';

                                final bool isInfo = name == 'info';

                                final bool isActive = !disabledButtons.contains(name) || isInfo;

                                return ListTile(
                                  onTap: () {
                                    if (!isInfo) {
                                      setState(() {
                                        if (isActive) {
                                          disabledButtons.add(name);
                                        } else {
                                          disabledButtons.remove(name);
                                        }
                                      });
                                    }

                                    FlashElements.showSnackbar(
                                      context: context,
                                      title: const Text(
                                        'Long press to move items',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      key: 'toolbar-button-order',
                                      isKeyUnique: true,
                                      leadingIcon: Icons.warning_amber,
                                      leadingIconColor: Colors.yellow,
                                      sideColor: Colors.yellow,
                                    );
                                  },
                                  key: Key('item-$name'),
                                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                                  title: Text(title),
                                  leading: Opacity(
                                    opacity: isInfo ? 0.5 : 1,
                                    child: Checkbox(
                                      key: Key('checkbox-$name'),
                                      value: isActive,
                                      onChanged: (_) {
                                        if (isInfo) {
                                          FlashElements.showSnackbar(
                                            title: const Text(
                                              'This button cannot be disabled',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          );
                                          return;
                                        }

                                        setState(() {
                                          if (isActive) {
                                            disabledButtons.add(name);
                                          } else {
                                            disabledButtons.remove(name);
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  trailing: ReorderableDragStartListener(
                                    key: Key('draghandle-#${buttonOrder[index]}'),
                                    index: index,
                                    child: const IconButton(
                                      onPressed: null,
                                      icon: Icon(Icons.drag_handle),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                      ],
                      onReorder: (int oldIndex, int newIndex) {
                        setState(() {
                          if (oldIndex < newIndex) {
                            newIndex -= 1;
                          }
                          final String item = buttonOrder.removeAt(oldIndex);
                          buttonOrder.insert(newIndex, item);
                        });
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),

              SettingsDropdown(
                value: shareAction,
                items: (settingsHandler.map['shareAction']!['options'] as List<String>)
                    .where((element) => hasHydrus || element != 'Hydrus')
                    .toList(),
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
                            const Text(
                              '- File URL - shares direct link to the original file (may not work with some sites)',
                            ),
                            const Text(
                              '- File - shares the file itself, may take some time to load, progress will be shown on the Share button',
                            ),
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
                            Text('In viewer:'),
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
                title: 'Volume buttons scroll speed',
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
            ],
          ),
        ),
      ),
    );
  }
}
