import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lolisnatcher/src/data/settings/app_mode.dart';
import 'package:lolisnatcher/src/data/settings/hand_side.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/confirm_button.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class UserInterfacePage extends StatefulWidget {
  const UserInterfacePage({super.key});

  @override
  State<UserInterfacePage> createState() => _UserInterfacePageState();
}

class _UserInterfacePageState extends State<UserInterfacePage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  final TextEditingController columnsLandscapeController = TextEditingController();
  final TextEditingController columnsPortraitController = TextEditingController();
  final TextEditingController mouseSpeedController = TextEditingController();

  late String previewMode, previewDisplay, scrollGridButtonsPosition;
  late bool showBottomSearchbar, showSearchbarQuickActions, autofocusSearchbar, disableVibration;
  late AppMode appMode;
  late HandSide handSide;

  @override
  void initState() {
    super.initState();
    columnsPortraitController.text = settingsHandler.portraitColumns.toString();
    columnsLandscapeController.text = settingsHandler.landscapeColumns.toString();
    appMode = settingsHandler.appMode.value;
    handSide = settingsHandler.handSide.value;
    showBottomSearchbar = settingsHandler.showBottomSearchbar;
    showSearchbarQuickActions = settingsHandler.showSearchbarQuickActions;
    autofocusSearchbar = settingsHandler.autofocusSearchbar;
    disableVibration = settingsHandler.disableVibration;
    previewDisplay = settingsHandler.previewDisplay;
    previewMode = settingsHandler.previewMode;
    scrollGridButtonsPosition = settingsHandler.scrollGridButtonsPosition;
    mouseSpeedController.text = settingsHandler.mousewheelScrollSpeed.toString();
  }

  @override
  void dispose() {
    columnsLandscapeController.dispose();
    columnsPortraitController.dispose();
    mouseSpeedController.dispose();
    super.dispose();
  }

  //called when page is clsoed, sets settingshandler variables and then writes settings to disk
  Future<void> _onPopInvoked(bool didPop, _) async {
    if (didPop) {
      return;
    }

    settingsHandler.appMode.value = appMode;
    settingsHandler.handSide.value = handSide;
    settingsHandler.showBottomSearchbar = showBottomSearchbar;
    settingsHandler.showSearchbarQuickActions = showSearchbarQuickActions;
    settingsHandler.autofocusSearchbar = autofocusSearchbar;
    settingsHandler.disableVibration = disableVibration;
    settingsHandler.previewMode = previewMode;
    settingsHandler.previewDisplay = previewDisplay;
    settingsHandler.scrollGridButtonsPosition = scrollGridButtonsPosition;
    if (int.parse(columnsLandscapeController.text) < 1) {
      columnsLandscapeController.text = 1.toString();
    }
    if (int.parse(columnsPortraitController.text) < 1) {
      columnsPortraitController.text = 1.toString();
    }
    settingsHandler.landscapeColumns = int.parse(columnsLandscapeController.text);
    settingsHandler.portraitColumns = int.parse(columnsPortraitController.text);
    settingsHandler.mousewheelScrollSpeed = double.parse(mouseSpeedController.text);
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
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Interface'),
        ),
        body: Center(
          child: ListView(
            children: [
              // TODO disabled for now, until we rework desktop ui
              // mobile mode only for now (force enabled on settings init)
              if (false)
                // ignore: dead_code
                SettingsOptionsList(
                  value: appMode,
                  items: AppMode.values,
                  onChanged: (AppMode? newValue) async {
                    bool confirmation = false;
                    if ((Platform.isAndroid || Platform.isIOS) && newValue?.isDesktop == true) {
                      confirmation = await showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return const SettingsDialog(
                                title: Text('App UI mode'),
                                contentItems: [
                                  Text('Are you sure you want to use Desktop mode? It may cause problems on Mobile devices and is considered DEPRECATED.'),
                                ],
                                actionButtons: [
                                  CancelButton(),
                                  ConfirmButton(),
                                ],
                              );
                            },
                          ) ??
                          false;
                    } else {
                      confirmation = true;
                    }

                    if (!confirmation) {
                      return;
                    }

                    setState(() {
                      appMode = newValue!;
                    });
                  },
                  title: 'App UI mode',
                  itemLeadingBuilder: (item) {
                    return switch (item) {
                      AppMode.Mobile => const Icon(Icons.phone_android_sharp),
                      AppMode.Desktop => const Icon(Icons.desktop_windows_sharp),
                      _ => const Icon(null),
                    };
                  },
                  trailingIcon: IconButton(
                    icon: const Icon(Icons.help_outline),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const SettingsDialog(
                            title: Text('App UI mode'),
                            contentItems: [
                              Text('- Mobile - Normal Mobile UI'),
                              Text('- Desktop - Ahoviewer Style UI [DEPRECATED, NEEDS REWORK]'),
                              SizedBox(height: 10),
                              Text(
                                '[Warning]: Do not set UI Mode to Desktop on a phone you might break the app and might have to wipe your settings including booru configs.',
                              ),
                              Text('If you are on android versions below 11 you can remove the appMode line from /LoliSnatcher/config/settings.json'),
                              Text('If you are on android 11 or higher you will have to wipe app data via system settings'),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              SettingsOptionsList(
                value: handSide,
                items: HandSide.values,
                onChanged: (HandSide? newValue) {
                  setState(() {
                    handSide = newValue!;
                  });
                },
                title: 'Hand side',
                trailingIcon: IconButton(
                  icon: const Icon(Icons.back_hand_outlined),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const SettingsDialog(
                          title: Text('Hand side'),
                          contentItems: [
                            Text('Changes position of some UI elements according to selected side'),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              SettingsToggle(
                value: showBottomSearchbar,
                onChanged: (newValue) {
                  setState(() {
                    showBottomSearchbar = newValue;
                  });
                },
                title: 'Show search bar in preview grid',
              ),
              SettingsToggle(
                value: showSearchbarQuickActions,
                onChanged: (newValue) {
                  setState(() {
                    showSearchbarQuickActions = newValue;
                  });
                },
                title: 'Search view quick actions panel',
              ),
              SettingsToggle(
                value: autofocusSearchbar,
                onChanged: (newValue) {
                  setState(() {
                    autofocusSearchbar = newValue;
                  });
                },
                title: 'Search view input autofocus',
              ),
              SettingsToggle(
                value: disableVibration,
                onChanged: (newValue) {
                  setState(() {
                    disableVibration = newValue;
                  });
                },
                title: 'Disable vibration',
                subtitle: const Text('May still happen on some actions even when disabled'),
              ),
              SettingsTextInput(
                controller: columnsPortraitController,
                title: 'Preview columns (portrait)',
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                onChanged: (String? text) {
                  setState(() {});
                },
                resetText: () => settingsHandler.map['portraitColumns']!['default']!.toString(),
                numberButtons: true,
                numberStep: 1,
                numberMin: 1,
                numberMax: double.infinity,
                validator: (String? value) {
                  final int? parse = int.tryParse(value ?? '');
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  } else if (parse == null) {
                    return 'Please enter a valid numeric value';
                  } else if (parse > 4 && (Platform.isAndroid || Platform.isIOS || kDebugMode)) {
                    return 'Using more than 4 columns could affect performance';
                  } else {
                    return null;
                  }
                },
              ),
              SettingsTextInput(
                controller: columnsLandscapeController,
                title: 'Preview columns (landscape)',
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                resetText: () => settingsHandler.map['landscapeColumns']!['default']!.toString(),
                numberButtons: true,
                numberStep: 1,
                numberMin: 1,
                numberMax: double.infinity,
                validator: (String? value) {
                  final int? parse = int.tryParse(value ?? '');
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  } else if (parse == null) {
                    return 'Please enter a valid numeric value';
                  } else if (parse > 8 && (Platform.isAndroid || Platform.isIOS || kDebugMode)) {
                    return 'Using more than 8 columns could affect performance';
                  } else {
                    return null;
                  }
                },
              ),
              SettingsOptionsList(
                value: previewMode,
                items: settingsHandler.map['previewMode']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    previewMode = newValue ?? settingsHandler.map['previewMode']!['default'];
                  });
                },
                title: 'Preview quality',
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const SettingsDialog(
                          title: Text('Preview quality'),
                          contentItems: [
                            Text('This setting changes the resolution of images in the preview grid'),
                            Text(' - Sample - Medium resolution, app will also load a Thumbnail quality as a placeholder while higher quality loads'),
                            Text(' - Thumbnail - Low resolution'),
                            Text(' '),
                            Text('[Note]: Sample quality can noticeably degrade performance, especially if you have too many columns in preview grid'),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              SettingsOptionsList(
                value: previewDisplay,
                items: settingsHandler.map['previewDisplay']!['options'],
                itemTitleBuilder: (item) => switch (item) {
                  'Square' => '${item!} (1:1)',
                  'Rectangle' => '${item!} (9:16)',
                  _ => item ?? '?',
                },
                itemLeadingBuilder: (item) {
                  return switch (item) {
                    'Square' => const Icon(Icons.crop_square_outlined),
                    'Rectangle' => Transform.rotate(
                        angle: pi / 2,
                        child: const Icon(Icons.crop_16_9),
                      ),
                    'Staggered' => const Icon(Icons.dashboard_outlined),
                    _ => const Icon(null),
                  };
                },
                onChanged: (String? newValue) {
                  setState(() {
                    previewDisplay = newValue ?? settingsHandler.map['previewDisplay']!['default'];
                  });
                },
                title: 'Preview display',
              ),
              SettingsToggle(
                value: settingsHandler.disableImageScaling,
                onChanged: (newValue) async {
                  if (newValue) {
                    final res = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const SettingsDialog(
                          title: Text('Warning'),
                          contentItems: [
                            Text(
                              'Are you sure you want to disable image scaling?',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'This can negatively impact the performance, especially on older devices',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                          actionButtons: [
                            CancelButton(withIcon: true),
                            ConfirmButton(withIcon: true),
                          ],
                        );
                      },
                    );

                    if (res != true) {
                      return;
                    }
                  }

                  setState(() {
                    settingsHandler.disableImageScaling = newValue;
                  });
                },
                title: "Don't scale images",
                leadingIcon: const Icon(Icons.close_fullscreen),
                subtitle: const Text('Disables image scaling which is used to improve performance'),
              ),
              Stack(
                children: [
                  SettingsToggle(
                    value: !settingsHandler.disableImageScaling ? false : settingsHandler.gifsAsThumbnails,
                    onChanged: (newValue) {
                      setState(() {
                        settingsHandler.gifsAsThumbnails = newValue;
                      });
                    },
                    title: 'GIF thumbnails',
                    leadingIcon: const Icon(Icons.gif),
                    subtitle: const Text('Requires "Don\'t scale images"'),
                  ),
                  if (!settingsHandler.disableImageScaling)
                    Positioned.fill(
                      child: ColoredBox(
                        color: Colors.black.withValues(alpha: 0.4),
                      ),
                    ),
                ],
              ),
              SettingsOptionsList(
                value: scrollGridButtonsPosition,
                items: settingsHandler.map['scrollGridButtonsPosition']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    scrollGridButtonsPosition = newValue ?? settingsHandler.map['scrollGridButtonsPosition']!['default'];
                  });
                },
                title: 'Scroll previews buttons position',
              ),
              if (SettingsHandler.isDesktopPlatform)
                SettingsTextInput(
                  controller: mouseSpeedController,
                  title: 'Mouse Wheel Scroll Modifer',
                  hintText: 'Scroll modifier',
                  inputType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  resetText: () => settingsHandler.map['mousewheelScrollSpeed']!['default']!.toString(),
                  numberButtons: true,
                  numberStep: 0.5,
                  numberMin: 0.1,
                  numberMax: 20,
                  validator: (String? value) {
                    final double? parse = double.tryParse(value ?? '');
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    } else if (parse == null) {
                      return 'Please enter a valid numeric value';
                    } else if (parse > 20.0) {
                      return 'Please enter a value between 0.1 and 20.0';
                    } else {
                      return null;
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
