import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  String previewMode = 'Sample';
  String galleryMode = 'Full Res';

  final TextEditingController columnsLandscapeController = TextEditingController();
  final TextEditingController columnsPortraitController = TextEditingController();
  final TextEditingController preloadAmountController = TextEditingController();
  final TextEditingController preloadSizeController = TextEditingController();

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
    settingsHandler.preloadCount = (int.tryParse(preloadAmountController.text) ?? 0).clamp(0, 3);
    settingsHandler.preloadSizeLimit = (double.tryParse(preloadSizeController.text) ?? 0.2).clamp(0, double.maxFinite);
    settingsHandler.autoPlayEnabled = autoPlayEnabled;
    settingsHandler.disableVideo = disableVideo;

    final bool result = await settingsHandler.saveSettings(restate: false);
    if (result) {
      Navigator.of(context).pop();
    }
  }

  Future<bool> showLowPerfConfirmDialog(bool withConfirmation) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            return SettingsDialog(
              title: const Text('Low performance mode'),
              contentItems: const [
                Text('- Disables detailed loading progress information'),
                Text(
                  '- Disables resource-intensive elements (blurs, animated opacity, some animations...)',
                ),
                Text(''),
                Text(
                  '- Sets optimal settings for these options (you can change them separately later):',
                ),
                Text('   - Preview quality [Thumbnail]'),
                Text('   - Image quality [Sample]'),
                Text('   - Preview columns [2 - portrait, 4 - landscape]'),
                Text('   - Preload amount and size [0, 0.2]'),
                Text('   - Video autoplay [false]'),
                Text("   - Don't scale images [false]"),
              ],
              actionButtons: withConfirmation
                  ? [
                      TextButton.icon(
                        style: TextButton.styleFrom(foregroundColor: context.colorScheme.onSurface),
                        onPressed: () => Navigator.of(context).pop(false),
                        icon: const Icon(Icons.cancel_outlined),
                        label: const Text('Cancel'),
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(foregroundColor: context.colorScheme.onSurface),
                        onPressed: () => Navigator.of(context).pop(true),
                        icon: const Icon(Icons.check_circle_outline),
                        label: const Text('Confirm'),
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Performance'),
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
                        previewMode = 'Thumbnail';
                        galleryMode = 'Sample';
                        columnsPortraitController.text = '2';
                        columnsLandscapeController.text = '4';
                        preloadAmountController.text = '0';
                        preloadSizeController.text = '0.2';
                        autoPlayEnabled = false;
                        settingsHandler.disableImageScaling = false;
                      }
                    });
                  }
                },
                title: 'Low performance mode',
                subtitle: const Text('Recommended for old devices and devices with low RAM'),
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () => showLowPerfConfirmDialog(false),
                ),
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
                    return 'Using more than 4 columns can affect performance';
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
                    return 'Using more than 8 columns can affect performance';
                  } else {
                    return null;
                  }
                },
              ),
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
                  } else if (parse < 0) {
                    return 'Please enter a value equal to or greater than 0';
                  } else if (parse > 3) {
                    return 'Please enter a value less than 4';
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
              SettingsToggle(
                value: autoPlayEnabled,
                onChanged: (newValue) {
                  setState(() {
                    autoPlayEnabled = newValue;
                  });
                },
                title: 'Autoplay videos',
              ),
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
                            Text(
                              'Useful on low end devices that crash when trying to load videos. Gives options to view video in external player or browser instead.',
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
