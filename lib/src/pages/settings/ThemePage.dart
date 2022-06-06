import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/src/data/ThemeItem.dart';
import 'package:LoliSnatcher/src/services/ImageWriter.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/src/utils/debouncer.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  ServiceHandler serviceHandler = ServiceHandler();

  late ThemeItem theme;
  late ThemeMode themeMode;
  late bool isAmoled;
  late bool enableMascot;
  late String mascotPathOverride;
  late Color? primaryPickerColor; // Color for picker shown in Card on the screen.
  late Color? accentPickerColor; // Color for picker in dialog using onChanged

  bool needToWriteMascot = false;

  @override
  void initState() {
    super.initState();
    theme = settingsHandler.theme.value;
    themeMode = settingsHandler.themeMode.value;
    isAmoled = settingsHandler.isAmoled.value;
    enableMascot = settingsHandler.enableDrawerMascot;
    mascotPathOverride = settingsHandler.drawerMascotPathOverride;
    primaryPickerColor = settingsHandler.customPrimaryColor.value;
    accentPickerColor = settingsHandler.customAccentColor.value;
  }

  @override
  void dispose() {
    Debounce.cancel('theme_change');
    super.dispose();
  }

  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    settingsHandler.theme.value = theme;
    settingsHandler.themeMode.value = themeMode;
    settingsHandler.isAmoled.value = isAmoled;
    settingsHandler.enableDrawerMascot = enableMascot;

    // print('onPrimary: ${ThemeData.estimateBrightnessForColor(primaryPickerColor!) == Brightness.dark}');
    // print('onAccent: ${ThemeData.estimateBrightnessForColor(accentPickerColor!) == Brightness.dark}');
    settingsHandler.customPrimaryColor.value = primaryPickerColor;
    settingsHandler.customAccentColor.value = accentPickerColor;
    //This needs to be done here because if its done in the buttons onclick
    //and you back out too fast the image path will not be returned in time to save it to settings
    if (needToWriteMascot) {
      if (mascotPathOverride.isNotEmpty) {
        mascotPathOverride = await ImageWriter().writeMascotImage(mascotPathOverride);
        settingsHandler.drawerMascotPathOverride = mascotPathOverride;
        needToWriteMascot = false;
      }
    } else {
      settingsHandler.drawerMascotPathOverride = mascotPathOverride;
    }
    bool result = await settingsHandler.saveSettings(restate: false);
    return result;
  }

  void updateTheme() async {
    // instantly do local restate
    setState(() { });

    // TODO fix theme not updating update on desktop pages, there settings pages use dialogs, which don't change with the global state

    // set global restate to happen only after X ms after last update happens
    Debounce.debounce(
      tag: 'theme_change',
      callback: () async {
        _onWillPop();
        setState(() { });
      },
      duration: const Duration(milliseconds: 500),
    );
  }

  Future<bool> colorPickerDialog(Color startColor, void Function(Color) onChange) async {
    return ColorPicker(
      color: startColor,
      onColorChanged: onChange,
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 300,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      subheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.caption,
      colorNameTextStyle: Theme.of(context).textTheme.caption,
      colorCodeTextStyle: Theme.of(context).textTheme.bodyText2,
      colorCodePrefixStyle: Theme.of(context).textTheme.caption,
      selectedPickerTypeColor: Theme.of(context).colorScheme.primary,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: true,
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
        ColorPickerType.bw: true,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
      actionButtons: const ColorPickerActionButtons(
        // okButton: true,
        okIcon: Icons.save,
        dialogOkButtonType: ColorPickerActionButtonType.elevated,
        // closeButton: true,
        closeIcon: Icons.cancel,
        dialogCancelButtonType: ColorPickerActionButtonType.elevated,
        dialogActionIcons: true,
        dialogActionButtons: true,
      ),
    ).showPickerDialog(
      context,
      constraints: BoxConstraints(
        minHeight: 480,
        minWidth: 300,
        maxWidth: min(MediaQuery.of(context).size.width * 0.9, 400)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text("Themes"),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsDropdown(
                value: themeMode,
                items: ThemeMode.values,
                onChanged: (ThemeMode? newValue) {
                  themeMode = newValue!;
                  updateTheme();
                },
                title: 'Theme Mode',
                itemBuilder: (ThemeMode item) {
                  final String prettyValue = item.name.capitalizeFirst!;
                  const double size = 40;

                  switch (prettyValue) {
                    case ("Dark"):
                      return Row(
                        children: [
                          const SizedBox(width: size, child: Icon(Icons.dark_mode)),
                          Text(prettyValue),
                        ]
                      );
                    case ("Light"):
                      return Row(
                        children: [
                          const SizedBox(width: size, child: Icon(Icons.light_mode)),
                          Text(prettyValue),
                        ]
                      );
                    case ("System"):
                      return Row(
                        children: [
                          SizedBox(
                            width: size,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipPath(
                                  clipper: SunClipper(),
                                  child: const Padding(padding: EdgeInsets.only(right: 8), child: Icon(Icons.light_mode)),
                                ),
                                ClipPath(
                                  clipper: MoonClipper(),
                                  child: const Padding(padding: EdgeInsets.only(left: 5), child: Icon(Icons.dark_mode)),
                                ),
                              ]
                            )
                          ),
                          Text(prettyValue),
                        ]
                      );
                    default:
                      return Text(prettyValue);
                  }
                },
              ),

              SettingsToggle(
                value: isAmoled,
                onChanged: (bool newValue) {
                  isAmoled = newValue;
                  updateTheme();
                },
                title: 'AMOLED',
              ),

              SettingsDropdown(
                value: theme.name,
                items: List<String>.from(settingsHandler.map['theme']!['options'].map((e) => e.name).toList()),
                onChanged: (String? newValue) {
                  theme = settingsHandler.map['theme']!['options'].where((e) => e.name == newValue).toList()[0];
                  updateTheme();
                },
                title: 'Theme',
                itemBuilder: (String value) {
                  ThemeItem theme = settingsHandler.map['theme']!['options'].firstWhere((e) => e.name == value);
                  Color? primary = theme.name == 'Custom' ? primaryPickerColor : theme.primary;
                  Color? accent = theme.name == 'Custom' ? accentPickerColor : theme.accent;

                  return Row(
                      children: [
                        Column(children: [
                          Container(height: 10, width: 50, color: primary),
                          Container(height: 10, width: 50, color: accent),
                        ]),
                        const SizedBox(width: 10, height: 0),
                        Text(value),
                      ]
                    );
                },
              ),

              if(theme.name == 'Custom')
                SettingsButton(
                  name: 'Primary Color',
                  subtitle: Text(
                    '${ColorTools.materialNameAndCode(primaryPickerColor!)} '
                    'aka ${ColorTools.nameThatColor(primaryPickerColor!)}',
                  ),
                  action: () async {
                    // Store current color before we open the dialog.
                    final Color colorBeforeDialog = primaryPickerColor!;
                    // Wait for the picker to close, if dialog was dismissed,
                    // then restore the color we had before it was opened.

                    if (!(await colorPickerDialog(
                      primaryPickerColor!,
                      (Color newColor) {
                        primaryPickerColor = newColor;
                        updateTheme();
                      }
                    ))) {
                        primaryPickerColor = colorBeforeDialog;
                        updateTheme();
                    }
                  },
                  trailingIcon: ColorIndicator(
                    width: 44,
                    height: 44,
                    hasBorder: true,
                    borderRadius: 4,
                    borderColor: Colors.grey,
                    color: primaryPickerColor!,
                  ),
                ),

              if(theme.name == 'Custom')
                SettingsButton(
                  name: 'Secondary Color',
                  subtitle: Text(
                    '${ColorTools.materialNameAndCode(accentPickerColor!)} '
                    'aka ${ColorTools.nameThatColor(accentPickerColor!)}',
                  ),
                  action: () async {
                    // Store current color before we open the dialog.
                    final Color colorBeforeDialog = accentPickerColor!;
                    // Wait for the picker to close, if dialog was dismissed,
                    // then restore the color we had before it was opened.

                    if (!(await colorPickerDialog(
                      accentPickerColor!,
                      (Color newColor) {
                        accentPickerColor = newColor;
                        updateTheme();
                      }
                    ))) {
                        accentPickerColor = colorBeforeDialog;
                        updateTheme();
                    }
                  },
                  trailingIcon: ColorIndicator(
                    width: 44,
                    height: 44,
                    hasBorder: true,
                    borderRadius: 4,
                    borderColor: Colors.grey,
                    color: accentPickerColor!,
                  ),
                ),

              if(theme.name == 'Custom')
                SettingsButton(
                  name: 'Reset Custom Colors',
                  icon: const Icon(Icons.refresh),
                  drawTopBorder: true,
                  action: () {
                    ThemeItem theme = settingsHandler.map['theme']!['default'];
                    primaryPickerColor = theme.primary;
                    accentPickerColor = theme.accent;
                    updateTheme();
                  },
                ),

              const SettingsButton(name: '', enabled: false),
              SettingsToggle(
                value: enableMascot,
                onChanged: (bool newValue) {
                  enableMascot = newValue;
                  updateTheme();
                },
                title: 'Enable Drawer Mascot',
              ),
              SettingsButton(
                name: 'Set Custom Mascot',
                subtitle: Text(mascotPathOverride.isEmpty ? '...' : 'Current: $mascotPathOverride'),
                icon: const Icon(Icons.image_search_outlined),
                drawTopBorder: true,
                action: () async{
                    mascotPathOverride = await ServiceHandler.getImageSAFUri();
                    needToWriteMascot = true;
                    setState(() { });
                },
              ),
              if(mascotPathOverride.isNotEmpty)
                SettingsButton(
                  name: 'Remove Custom Mascot',
                  icon: const Icon(Icons.delete_forever),
                  drawTopBorder: true,
                  action: () async {
                    File file = File(mascotPathOverride);
                    if (await file.exists()) {
                      await file.delete();
                    }
                    mascotPathOverride = "";
                    setState(() { });
                  },
                ),

            ],
          ),
        ),
      ),
    );
  }
}

class SunClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.37, size.height);
    path.lineTo(size.width * 0.37, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MoonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.45, size.height);
    path.lineTo(size.width * 0.45, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

