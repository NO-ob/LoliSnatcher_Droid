import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lolisnatcher/src/data/settings/image_quality.dart';
import 'package:lolisnatcher/src/data/settings/preview_quality.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/confirm_button.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class PerformancePage extends StatefulWidget {
  const PerformancePage({super.key});

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  bool shitDevice = false;
  bool autoPlayEnabled = true;
  bool disableVideo = false;

  PreviewQuality previewMode = .sample;
  ImageQuality galleryMode = .fullRes;

  final TextEditingController columnsLandscapeController = TextEditingController();
  final TextEditingController columnsPortraitController = TextEditingController();
  final TextEditingController preloadAmountController = TextEditingController();
  final TextEditingController preloadSizeController = TextEditingController();
  final TextEditingController preloadHeightController = TextEditingController();

  @override
  void initState() {
    super.initState();

    shitDevice = settingsHandler.shitDevice;
    previewMode = settingsHandler.previewMode;
    galleryMode = settingsHandler.galleryMode;
    columnsPortraitController.text = settingsHandler.portraitColumns.toString();
    columnsLandscapeController.text = settingsHandler.landscapeColumns.toString();
    preloadAmountController.text = settingsHandler.preloadCount.toString();
    preloadSizeController.text = settingsHandler.preloadSizeLimit.toString();
    preloadHeightController.text = settingsHandler.preloadHeight.toString();
    autoPlayEnabled = settingsHandler.autoPlayEnabled;
    disableVideo = settingsHandler.disableVideo;
  }

  //called when page is clsoed, sets settingshandler variables and then writes settings to disk
  Future<void> _onPopInvoked(bool didPop, _) async {
    if (didPop) {
      return;
    }

    settingsHandler.shitDevice = shitDevice;
    settingsHandler.previewMode = previewMode;
    settingsHandler.galleryMode = galleryMode;
    settingsHandler.portraitColumns = (int.tryParse(columnsPortraitController.text) ?? 3).clamp(1, 100);
    settingsHandler.landscapeColumns = (int.tryParse(columnsLandscapeController.text) ?? 6).clamp(1, 100);
    settingsHandler.preloadCount = (int.tryParse(preloadAmountController.text) ?? 1).clamp(0, 4);
    settingsHandler.preloadSizeLimit = (double.tryParse(preloadSizeController.text) ?? 0.2).clamp(0, double.infinity);
    settingsHandler.preloadHeight = (int.tryParse(preloadHeightController.text) ?? (4096 * 4)).clamp(0, 2_000_000_000);
    settingsHandler.autoPlayEnabled = autoPlayEnabled;
    settingsHandler.disableVideo = disableVideo;

    await settingsHandler.saveSettings(restate: false);
  }

  Future<bool> showLowPerfConfirmDialog(bool withConfirmation) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            return SettingsDialog(
              title: Text(context.loc.settings.performance.lowPerformanceModeDialogTitle),
              contentItems: [
                Text(context.loc.settings.performance.lowPerformanceModeDialogDisablesDetailed),
                Text(
                  context.loc.settings.performance.lowPerformanceModeDialogDisablesResourceIntensive,
                ),
                const Text(''),
                Text(context.loc.settings.performance.lowPerformanceModeDialogSetsOptimal),
                Text('- ${context.loc.settings.interface.previewQuality}'),
                Text('- ${context.loc.settings.viewer.imageQuality}'),
                Text('- ${context.loc.settings.interface.previewColumnsPortrait}'),
                Text('- ${context.loc.settings.interface.previewColumnsLandscape}'),
                Text('- ${context.loc.settings.viewer.preloadAmount}'),
                Text('- ${context.loc.settings.viewer.preloadSizeLimit}'),
                Text('- ${context.loc.settings.viewer.preloadHeightLimit}'),
                Text('- ${context.loc.settings.interface.dontScaleImages}'),
                Text('- ${context.loc.settings.performance.autoplayVideos}'),
              ],
              actionButtons: withConfirmation
                  ? [
                      TextButton.icon(
                        style: TextButton.styleFrom(foregroundColor: context.colorScheme.onSurface),
                        onPressed: () => Navigator.of(context).pop(false),
                        icon: const Icon(Icons.cancel_outlined),
                        label: Text(context.loc.cancel),
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(foregroundColor: context.colorScheme.onSurface),
                        onPressed: () => Navigator.of(context).pop(true),
                        icon: const Icon(Icons.check_circle_outline),
                        label: Text(context.loc['confirm']),
                      ),
                    ]
                  : [],
            );
          },
        ) ??
        false;
  }

  @override
  void dispose() {
    columnsPortraitController.dispose();
    columnsLandscapeController.dispose();
    preloadAmountController.dispose();
    preloadSizeController.dispose();
    preloadHeightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SettingsAppBar(
          title: context.loc.settings.performance.title,
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsToggle(
                value: shitDevice,
                onChanged: (newValue) async {
                  if (!newValue || await showLowPerfConfirmDialog(true)) {
                    setState(() {
                      shitDevice = newValue;
                      if (shitDevice) {
                        previewMode = .thumbnail;
                        galleryMode = .sample;
                        columnsPortraitController.text = '2';
                        columnsLandscapeController.text = '4';
                        preloadAmountController.text = '0';
                        preloadSizeController.text = '0.2';
                        preloadHeightController.text = '8192';
                        autoPlayEnabled = false;
                        settingsHandler.disableImageScaling = false;
                      }
                    });
                  }
                },
                title: context.loc.settings.performance.lowPerformanceMode,
                subtitle: Text(context.loc.settings.performance.lowPerformanceModeSubtitle),
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () => showLowPerfConfirmDialog(false),
                ),
              ),
              SettingsOptionsList<PreviewQuality>(
                value: previewMode,
                items: PreviewQuality.values,
                onChanged: (PreviewQuality? newValue) {
                  setState(() {
                    previewMode = newValue ?? PreviewQuality.defaultValue;
                  });
                },
                title: context.loc.settings.interface.previewQuality,
                itemTitleBuilder: (e) => e?.locName ?? '',
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
                itemTitleBuilder: (e) => e?.locName ?? '',
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
              SettingsTextInput(
                controller: preloadHeightController,
                title: context.loc.settings.viewer.preloadHeightLimit,
                subtitle: Text(context.loc.settings.viewer.preloadHeightLimitSubtitle),
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                resetText: () => settingsHandler.map['preloadHeight']!['default']!.toString(),
                numberButtons: true,
                numberStep: settingsHandler.map['preloadHeight']!['step']!.toDouble(),
                numberMin: settingsHandler.map['preloadHeight']!['lowerLimit']!.toDouble(),
                numberMax: settingsHandler.map['preloadHeight']!['upperLimit']!.toDouble(),
                validator: (String? value) {
                  final int? parse = int.tryParse(value ?? '');
                  if (value == null || value.isEmpty) {
                    return context.loc.validationErrors.required;
                  } else if (parse == null) {
                    return context.loc.validationErrors.invalidNumericValue;
                  } else if (parse < settingsHandler.map['preloadHeight']!['lowerLimit']!.toDouble() ||
                      parse > settingsHandler.map['preloadHeight']!['upperLimit']!.toDouble()) {
                    return context.loc.validationErrors.rangeError(
                      min: settingsHandler.map['preloadHeight']!['lowerLimit']!.toDouble(),
                      max: settingsHandler.map['preloadHeight']!['upperLimit']!.toDouble(),
                    );
                  } else {
                    return null;
                  }
                },
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
              SettingsToggle(
                value: autoPlayEnabled,
                onChanged: (newValue) {
                  setState(() {
                    autoPlayEnabled = newValue;
                  });
                },
                title: context.loc.settings.performance.autoplayVideos,
              ),
              SettingsToggle(
                value: disableVideo,
                onChanged: (newValue) {
                  setState(() {
                    disableVideo = newValue;
                  });
                },
                title: context.loc.settings.performance.disableVideos,
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SettingsDialog(
                          title: Text(context.loc.settings.performance.disableVideos),
                          contentItems: [
                            Text(
                              context.loc.settings.performance.disableVideosHelp,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
