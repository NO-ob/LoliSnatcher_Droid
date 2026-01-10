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

  late String previewMode, previewDisplay, previewDisplayFallback, scrollGridButtonsPosition;
  late bool showBottomSearchbar, useTopSearchbarInput, showSearchbarQuickActions, autofocusSearchbar, disableVibration;
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
    useTopSearchbarInput = settingsHandler.useTopSearchbarInput;
    showSearchbarQuickActions = settingsHandler.showSearchbarQuickActions;
    autofocusSearchbar = settingsHandler.autofocusSearchbar;
    disableVibration = settingsHandler.disableVibration;
    previewDisplay = settingsHandler.previewDisplay;
    previewDisplayFallback = settingsHandler.previewDisplayFallback;
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
    settingsHandler.useTopSearchbarInput = useTopSearchbarInput;
    settingsHandler.showSearchbarQuickActions = showSearchbarQuickActions;
    settingsHandler.autofocusSearchbar = autofocusSearchbar;
    settingsHandler.disableVibration = disableVibration;
    settingsHandler.previewMode = previewMode;
    settingsHandler.previewDisplay = previewDisplay;
    settingsHandler.previewDisplayFallback = previewDisplayFallback;
    settingsHandler.scrollGridButtonsPosition = scrollGridButtonsPosition;
    settingsHandler.landscapeColumns = max(1, int.tryParse(columnsLandscapeController.text) ?? 6);
    settingsHandler.portraitColumns = max(1, int.tryParse(columnsPortraitController.text) ?? 3);
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
          title: Text(context.loc.settings.interface.title),
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
                      confirmation =
                          await showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return SettingsDialog(
                                title: Text(context.loc.settings.interface.appUIModeWarningTitle),
                                contentItems: [
                                  Text(
                                    context.loc.settings.interface.appUIModeWarning,
                                  ),
                                ],
                                actionButtons: const [
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
                  title: context.loc.settings.interface.appUIMode,
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
                          return SettingsDialog(
                            title: Text(context.loc.settings.interface.appUIModeWarningTitle),
                            contentItems: [
                              Text(context.loc.settings.interface.appUIModeHelpMobile),
                              Text(context.loc.settings.interface.appUIModeHelpDesktop),
                              const SizedBox(height: 10),
                              Text(
                                context.loc.settings.interface.appUIModeHelpWarning,
                              ),
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
                title: context.loc.settings.interface.handSide,
                trailingIcon: IconButton(
                  icon: const Icon(Icons.back_hand_outlined),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SettingsDialog(
                          title: Text(context.loc.settings.interface.handSide),
                          contentItems: [
                            Text(context.loc.settings.interface.handSideHelp),
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
                title: context.loc.settings.interface.showSearchBarInPreviewGrid,
              ),
              SettingsToggle(
                value: useTopSearchbarInput,
                onChanged: (newValue) {
                  setState(() {
                    useTopSearchbarInput = newValue;
                  });
                },
                title: context.loc.settings.interface.moveInputToTopInSearchView,
              ),
              SettingsToggle(
                value: showSearchbarQuickActions,
                onChanged: (newValue) {
                  setState(() {
                    showSearchbarQuickActions = newValue;
                  });
                },
                title: context.loc.settings.interface.searchViewQuickActionsPanel,
              ),
              SettingsToggle(
                value: autofocusSearchbar,
                onChanged: (newValue) {
                  setState(() {
                    autofocusSearchbar = newValue;
                  });
                },
                title: context.loc.settings.interface.searchViewInputAutofocus,
              ),
              SettingsToggle(
                value: disableVibration,
                onChanged: (newValue) {
                  setState(() {
                    disableVibration = newValue;
                  });
                },
                title: context.loc.settings.interface.disableVibration,
                subtitle: Text(context.loc.settings.interface.disableVibrationSubtitle),
              ),
              SettingsTextInput(
                controller: columnsPortraitController,
                title: context.loc.settings.interface.previewColumnsPortrait,
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
                    return context.loc.validationErrors.required;
                  } else if (parse == null) {
                    return context.loc.validationErrors.invalidNumericValue;
                  } else if (parse > 4 && (Platform.isAndroid || Platform.isIOS || kDebugMode)) {
                    return context.loc.validationErrors.moreThan4ColumnsWarning;
                  } else {
                    return null;
                  }
                },
              ),
              SettingsTextInput(
                controller: columnsLandscapeController,
                title: context.loc.settings.interface.previewColumnsLandscape,
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
                    return context.loc.validationErrors.required;
                  } else if (parse == null) {
                    return context.loc.validationErrors.invalidNumericValue;
                  } else if (parse > 8 && (Platform.isAndroid || Platform.isIOS || kDebugMode)) {
                    return context.loc.validationErrors.moreThan8ColumnsWarning;
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
                title: context.loc.settings.interface.previewQuality,
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SettingsDialog(
                          title: Text(context.loc.settings.interface.previewQuality),
                          contentItems: [
                            Text(context.loc.settings.interface.previewQualityHelp),
                            Text(
                              context.loc.settings.interface.previewQualityHelpSample,
                            ),
                            Text(context.loc.settings.interface.previewQualityHelpThumbnail),
                            const Text(' '),
                            Text(
                              context.loc.settings.interface.previewQualityHelpNote,
                            ),
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
                title: context.loc.settings.interface.previewDisplay,
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: previewDisplay == 'Staggered'
                    ? SettingsOptionsList(
                        value: previewDisplayFallback,
                        items: settingsHandler.map['previewDisplayFallback']!['options'],
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
                            _ => const Icon(null),
                          };
                        },
                        onChanged: (String? newValue) {
                          setState(() {
                            previewDisplayFallback =
                                newValue ?? settingsHandler.map['previewDisplayFallback']!['default'];
                          });
                        },
                        title: context.loc.settings.interface.previewDisplayFallback,
                        subtitle: Text(context.loc.settings.interface.previewDisplayFallbackHelp),
                      )
                    : const SizedBox(width: double.infinity),
              ),
              SettingsToggle(
                value: settingsHandler.disableImageScaling,
                onChanged: (newValue) async {
                  if (newValue) {
                    final res = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SettingsDialog(
                          title: Text(context.loc.settings.interface.dontScaleImagesWarningTitle),
                          contentItems: [
                            Text(
                              context.loc.settings.interface.dontScaleImagesWarning,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              context.loc.settings.interface.dontScaleImagesWarningMsg,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                          actionButtons: const [
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
                title: context.loc.settings.interface.dontScaleImages,
                leadingIcon: const Icon(Icons.close_fullscreen),
                subtitle: Text(context.loc.settings.interface.dontScaleImagesSubtitle),
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
                    title: context.loc.settings.interface.gifThumbnails,
                    leadingIcon: const Icon(Icons.gif),
                    subtitle: Text(context.loc.settings.interface.gifThumbnailsRequires),
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
                    scrollGridButtonsPosition =
                        newValue ?? settingsHandler.map['scrollGridButtonsPosition']!['default'];
                  });
                },
                title: context.loc.settings.interface.scrollPreviewsButtonsPosition,
              ),
              if (SettingsHandler.isDesktopPlatform)
                SettingsTextInput(
                  controller: mouseSpeedController,
                  title: context.loc.settings.interface.mouseWheelScrollModifier,
                  hintText: context.loc.settings.interface.scrollModifier,
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
                      return context.loc.validationErrors.required;
                    } else if (parse == null) {
                      return context.loc.validationErrors.invalidNumericValue;
                    } else if (parse > 20.0) {
                      return context.loc.validationErrors.rangeError(min: 0.1, max: 20);
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
