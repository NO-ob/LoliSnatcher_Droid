import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lolisnatcher/src/data/settings/button_position.dart';
import 'package:lolisnatcher/src/data/settings/gallery_button.dart';
import 'package:lolisnatcher/src/data/settings/image_quality.dart';
import 'package:lolisnatcher/src/data/settings/scroll_direction.dart';
import 'package:lolisnatcher/src/data/settings/share_action.dart';
import 'package:lolisnatcher/src/data/settings/vertical_position.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
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
  late ImageQuality galleryMode;
  late VerticalPosition galleryBarPosition;
  late ScrollDirection galleryScrollDirection;
  late ShareAction shareAction;
  late ButtonPosition zoomButtonPosition;
  late ButtonPosition changePageButtonsPosition;

  late final List<GalleryButton> buttonOrder;
  late final List<GalleryButton> disabledButtons;

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
    buttonOrder = [...settingsHandler.buttonOrder];
    disabledButtons = [...settingsHandler.disabledButtons];
    galleryScrollDirection = settingsHandler.galleryScrollDirection;

    shareAction = settingsHandler.shareAction;
    if (!settingsHandler.hasHydrus && settingsHandler.shareAction.isHydrus) {
      shareAction = .ask;
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
    settingsHandler.buttonOrder = [...buttonOrder];
    settingsHandler.disabledButtons = [...disabledButtons];
    settingsHandler.galleryScrollDirection = galleryScrollDirection;
    settingsHandler.shareAction = shareAction;
    settingsHandler.zoomButtonPosition = zoomButtonPosition;
    settingsHandler.changePageButtonsPosition = changePageButtonsPosition;
    settingsHandler.hideNotes = hideNotes;
    settingsHandler.allowRotation = allowRotation;
    settingsHandler.loadingGif = loadingGif;
    settingsHandler.useVolumeButtonsForScroll = useVolumeButtonsForScroll;
    ServiceHandler.setVolumeButtons(!settingsHandler.useVolumeButtonsForScroll);
    settingsHandler.wakeLockEnabled = wakeLockEnabled;
    settingsHandler.enableHeroTransitions = enableHeroTransitions;
    settingsHandler.disableCustomPageTransitions = disableCustomPageTransitions;
    settingsHandler.disableVibration = disableVibration;

    settingsHandler.volumeButtonsScrollSpeed = (int.tryParse(scrollSpeedController.text) ?? 200).clamp(0, 1_000_000);
    settingsHandler.galleryAutoScrollTime = (int.tryParse(galleryAutoScrollController.text) ?? 4000).clamp(100, 10000);

    settingsHandler.preloadCount = (int.tryParse(preloadAmountController.text) ?? 1).clamp(0, 3);
    settingsHandler.preloadSizeLimit = (double.tryParse(preloadSizeController.text) ?? 0).clamp(0, double.infinity);

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
          title: Text(context.loc.settings.viewer.title),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsTextInput(
                controller: preloadAmountController,
                title: context.loc.settings.viewer.preloadAmount,
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
                    return context.loc.validationErrors.required;
                  } else if (parse == null) {
                    return context.loc.validationErrors.invalidNumericValue;
                  } else if (parse < 0) {
                    return context.loc.validationErrors.greaterThanOrEqualZero;
                  } else if (parse > 3) {
                    return context.loc.validationErrors.lessThan4;
                  } else {
                    return null;
                  }
                },
              ),
              SettingsTextInput(
                controller: preloadSizeController,
                title: context.loc.settings.viewer.preloadSizeLimit,
                subtitle: Text(context.loc.settings.viewer.preloadSizeLimitSubtitle),
                inputType: TextInputType.number,
                resetText: () => settingsHandler.map['preloadSizeLimit']!['default']!.toString(),
                numberButtons: true,
                numberStep: settingsHandler.map['preloadSizeLimit']!['step']!,
                numberMin: settingsHandler.map['preloadSizeLimit']!['lowerLimit']!,
                numberMax: settingsHandler.map['preloadSizeLimit']!['upperLimit']!,
                validator: (String? value) {
                  final double? parse = double.tryParse(value ?? '');
                  if (value == null || value.isEmpty) {
                    return context.loc.validationErrors.required;
                  } else if (parse == null) {
                    return context.loc.validationErrors.invalidNumericValue;
                  } else if (parse < settingsHandler.map['preloadSizeLimit']!['lowerLimit']! ||
                      parse > settingsHandler.map['preloadSizeLimit']!['upperLimit']!) {
                    return context.loc.validationErrors.rangeError(
                      min: settingsHandler.map['preloadSizeLimit']!['lowerLimit']!,
                      max: settingsHandler.map['preloadSizeLimit']!['upperLimit']!,
                    );
                  } else {
                    return null;
                  }
                },
              ),
              SettingsOptionsList<ImageQuality>(
                value: galleryMode,
                items: ImageQuality.values,
                onChanged: (ImageQuality? newValue) {
                  setState(() {
                    galleryMode = newValue ?? ImageQuality.defaultValue;
                  });
                },
                title: context.loc.settings.viewer.imageQuality,
                itemTitleBuilder: (e) => e?.locName(context) ?? '',
              ),
              SettingsOptionsList<ScrollDirection>(
                value: galleryScrollDirection,
                items: ScrollDirection.values,
                onChanged: (ScrollDirection? newValue) {
                  setState(() {
                    galleryScrollDirection = newValue ?? ScrollDirection.defaultValue;
                  });
                },
                title: context.loc.settings.viewer.viewerScrollDirection,
                itemTitleBuilder: (e) => e?.locName(context) ?? '',
              ),
              SettingsOptionsList<VerticalPosition>(
                value: galleryBarPosition,
                items: VerticalPosition.values,
                onChanged: (VerticalPosition? newValue) {
                  setState(() {
                    galleryBarPosition = newValue ?? VerticalPosition.defaultValue;
                  });
                },
                title: context.loc.settings.viewer.viewerToolbarPosition,
                itemTitleBuilder: (e) => e?.locName(context) ?? '',
              ),
              SettingsOptionsList<ButtonPosition>(
                value: zoomButtonPosition,
                items: ButtonPosition.values,
                onChanged: (ButtonPosition? newValue) {
                  setState(() {
                    zoomButtonPosition = newValue ?? ButtonPosition.defaultValue;
                  });
                },
                title: context.loc.settings.viewer.zoomButtonPosition,
                itemTitleBuilder: (e) => e?.locName(context) ?? '',
              ),
              SettingsOptionsList<ButtonPosition>(
                value: changePageButtonsPosition,
                items: ButtonPosition.values,
                onChanged: (ButtonPosition? newValue) {
                  setState(() {
                    changePageButtonsPosition = newValue ?? ButtonPosition.defaultValue;
                  });
                },
                title: context.loc.settings.viewer.changePageButtonsPosition,
                itemTitleBuilder: (e) => e?.locName(context) ?? '',
              ),
              SettingsToggle(
                value: autoHideImageBar,
                onChanged: (newValue) {
                  setState(() {
                    autoHideImageBar = newValue;
                  });
                },
                title: context.loc.settings.viewer.hideToolbarWhenOpeningViewer,
              ),
              SettingsToggle(
                value: settingsHandler.expandDetails,
                onChanged: (newValue) {
                  setState(() {
                    settingsHandler.expandDetails = newValue;
                  });
                },
                title: context.loc.settings.viewer.expandDetailsByDefault,
              ),
              SettingsToggle(
                value: hideNotes,
                onChanged: (newValue) {
                  setState(() {
                    hideNotes = newValue;
                  });
                },
                title: context.loc.settings.viewer.hideTranslationNotesByDefault,
              ),
              SettingsToggle(
                value: allowRotation,
                onChanged: (newValue) {
                  setState(() {
                    allowRotation = newValue;
                  });
                },
                title: context.loc.settings.viewer.enableRotation,
                subtitle: Text(context.loc.settings.viewer.enableRotationSubtitle),
              ),

              Material(
                color: Colors.transparent,
                child: ExpansionTile(
                  title: Row(
                    children: [
                      Expanded(child: Text(context.loc.settings.viewer.toolbarButtonsOrder)),
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
                              return SettingsDialog(
                                title: Text(context.loc.settings.viewer.buttonsOrder),
                                contentItems: [
                                  Text(context.loc.settings.viewer.longPressToChangeItemOrder),
                                  Text(context.loc.settings.viewer.atLeast4ButtonsVisibleOnToolbar),
                                  Text(context.loc.settings.viewer.otherButtonsWillGoIntoOverflow),
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
                                final button = buttonOrder[index];
                                final title = button.locName(context);

                                final bool isInfo = button.isInfo;

                                final bool isActive = !disabledButtons.contains(button) || isInfo;

                                return ListTile(
                                  onTap: () {
                                    if (!isInfo) {
                                      setState(() {
                                        if (isActive) {
                                          disabledButtons.add(button);
                                        } else {
                                          disabledButtons.remove(button);
                                        }
                                      });
                                    }

                                    FlashElements.showSnackbar(
                                      context: context,
                                      title: Text(
                                        context.loc.settings.viewer.longPressToMoveItems,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      key: 'toolbar-button-order',
                                      isKeyUnique: true,
                                      leadingIcon: Icons.warning_amber,
                                      leadingIconColor: Colors.yellow,
                                      sideColor: Colors.yellow,
                                    );
                                  },
                                  key: Key('item-${button.name}'),
                                  minTileHeight: 64,
                                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                                  title: Text(title),
                                  subtitle: switch (button) {
                                    .externalPlayer => Text(context.loc.settings.viewer.onlyForVideos),
                                    _ => null,
                                  },
                                  leading: Opacity(
                                    opacity: isInfo ? 0.5 : 1,
                                    child: Checkbox(
                                      key: Key('checkbox-${button.name}'),
                                      value: isActive,
                                      onChanged: (_) {
                                        if (isInfo) {
                                          FlashElements.showSnackbar(
                                            title: Text(
                                              context.loc.settings.viewer.thisButtonCannotBeDisabled,
                                              style: const TextStyle(fontSize: 20),
                                            ),
                                          );
                                          return;
                                        }

                                        setState(() {
                                          if (isActive) {
                                            disabledButtons.add(button);
                                          } else {
                                            disabledButtons.remove(button);
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        switch (button) {
                                          .snatch => Icons.save,
                                          .favourite => Icons.favorite,
                                          .info => Icons.info,
                                          .share => Icons.share,
                                          .select => Icons.check_box,
                                          .open => Icons.public,
                                          .autoscroll => Icons.play_arrow,
                                          .reloadnoscale => Icons.refresh,
                                          .toggleQuality => Icons.high_quality,
                                          .externalPlayer => Icons.exit_to_app,
                                          .imageSearch => Icons.image_search_rounded,
                                        },
                                      ),
                                      ReorderableDragStartListener(
                                        key: Key('draghandle-#${buttonOrder[index]}'),
                                        index: index,
                                        child: const IconButton(
                                          onPressed: null,
                                          icon: Icon(Icons.drag_handle),
                                        ),
                                      ),
                                    ],
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
                          final item = buttonOrder.removeAt(oldIndex);
                          buttonOrder.insert(newIndex, item);
                        });
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),

              SettingsDropdown<ShareAction>(
                value: shareAction,
                items: ShareAction.values.where((element) => hasHydrus || !element.isHydrus).toList(),
                onChanged: (ShareAction? newValue) {
                  setState(() {
                    shareAction = newValue ?? ShareAction.defaultValue;
                  });
                },
                title: context.loc.settings.viewer.defaultShareAction,
                itemTitleBuilder: (e) => e?.locName(context) ?? '',
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SettingsDialog(
                          title: Text(context.loc.settings.viewer.shareActions),
                          contentItems: [
                            Text(context.loc.settings.viewer.shareActionsAsk),
                            Text(context.loc.settings.viewer.shareActionsPostURL),
                            Text(context.loc.settings.viewer.shareActionsFileURL),
                            Text(context.loc.settings.viewer.shareActionsPostURLFileURLFileWithTags),
                            Text(context.loc.settings.viewer.shareActionsFile),
                            if (hasHydrus) Text(context.loc.settings.viewer.shareActionsHydrus),
                            const Text(''),
                            Text(context.loc.settings.viewer.shareActionsNoteIfFileSavedInCache),
                            const Text(''),
                            Text(context.loc.settings.viewer.shareActionsTip),
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
                title: context.loc.settings.viewer.useVolumeButtonsForScrolling,
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SettingsDialog(
                          title: Text(context.loc.settings.viewer.volumeButtonsScrolling),
                          contentItems: [
                            Text(context.loc.settings.viewer.volumeButtonsScrollingHelp),
                            const Text(''),
                            Text(context.loc.settings.viewer.volumeButtonsVolumeDown),
                            Text(context.loc.settings.viewer.volumeButtonsVolumeUp),
                            const Text(''),
                            Text(context.loc.settings.viewer.volumeButtonsInViewer),
                            Text(context.loc.settings.viewer.volumeButtonsToolbarVisible),
                            Text(context.loc.settings.viewer.volumeButtonsToolbarHidden),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              SettingsTextInput(
                controller: scrollSpeedController,
                title: context.loc.settings.viewer.volumeButtonsScrollSpeed,
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
                    return context.loc.validationErrors.required;
                  } else if (parse == null) {
                    return context.loc.validationErrors.invalidNumericValue;
                  } else if (parse < 100) {
                    return context.loc.validationErrors.biggerThan100;
                  } else {
                    return null;
                  }
                },
              ),

              SettingsTextInput(
                controller: galleryAutoScrollController,
                title: context.loc.settings.viewer.slideshowDurationInMs,
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
                    return context.loc.validationErrors.required;
                  } else if (parse == null) {
                    return context.loc.validationErrors.invalidNumericValue;
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
                        return SettingsDialog(
                          title: Text(context.loc.settings.viewer.slideshow),
                          contentItems: [
                            Text(context.loc.settings.viewer.slideshowWIPNote),
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
                title: context.loc.settings.viewer.preventDeviceFromSleeping,
              ),
              SettingsToggle(
                value: enableHeroTransitions,
                onChanged: (newValue) {
                  setState(() {
                    enableHeroTransitions = newValue;
                  });
                },
                title: context.loc.settings.viewer.viewerOpenCloseAnimation,
              ),
              SettingsToggle(
                value: disableCustomPageTransitions,
                onChanged: (newValue) {
                  setState(() {
                    disableCustomPageTransitions = newValue;
                  });
                },
                title: context.loc.settings.viewer.viewerPageChangeAnimation,
                subtitle: Text(
                  disableCustomPageTransitions
                      ? context.loc.settings.viewer.usingDefaultAnimation
                      : context.loc.settings.viewer.usingCustomAnimation,
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
                title: context.loc.settings.viewer.kannaLoadingGif,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
