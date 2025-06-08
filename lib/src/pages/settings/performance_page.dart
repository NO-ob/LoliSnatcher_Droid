import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class PerformancePage extends StatefulWidget {
  const PerformancePage({super.key});

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  bool shitDevice = false;
  bool disableImageScaling = false;
  bool autoPlayEnabled = true;
  bool disableVideo = false;

  String galleryMode = 'Full Res';
  String previewMode = 'Sample';

  final TextEditingController preloadAmountController = TextEditingController();
  final TextEditingController preloadSizeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    shitDevice = settingsHandler.shitDevice;
    galleryMode = settingsHandler.galleryMode;
    previewMode = settingsHandler.previewMode;
    disableImageScaling = settingsHandler.disableImageScaling;
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
    settingsHandler.galleryMode = galleryMode;
    settingsHandler.previewMode = previewMode;
    settingsHandler.disableImageScaling = disableImageScaling;
    settingsHandler.preloadCount = (int.tryParse(preloadAmountController.text) ?? 0).clamp(0, 4);
    settingsHandler.preloadSizeLimit = (double.tryParse(preloadSizeController.text) ?? 0.2).clamp(0, double.maxFinite);
    settingsHandler.autoPlayEnabled = autoPlayEnabled;
    settingsHandler.disableVideo = disableVideo;

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
          title: const Text('Performance'),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsToggle(
                value: shitDevice,
                onChanged: (newValue) {
                  setState(() {
                    shitDevice = newValue;
                    if (shitDevice) {
                      galleryMode = 'Sample';
                      previewMode = 'Thumbnail';
                      preloadAmountController.text = '0';
                      preloadSizeController.text = '0.2';
                      autoPlayEnabled = false;
                      disableImageScaling = false;
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
                            Text('Recommended for old devices and devices with low RAM.'),
                            Text(''),
                            Text('- Disables detailed loading progress information'),
                            Text('- Disables most heavy to render elements (blurs, animated opacity...)'),
                            Text(
                              '- Sets optimal settings for these options (you can still change them after applying changes here):',
                            ),
                            Text('   - Image quality'),
                            Text('   - Preview quality'),
                            Text('   - Preload amount and size'),
                            Text('   - Video autoplay'),
                            Text("   - Don't scale images"),
                          ],
                        );
                      },
                    );
                  },
                ),
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
                value: previewMode,
                items: settingsHandler.map['previewMode']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    previewMode = newValue ?? settingsHandler.map['previewMode']!['default'];
                  });
                },
                title: 'Preview quality',
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
