import 'dart:async';
import 'dart:io';

import 'package:LoliSnatcher/ImageWriter.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/ThemeItem.dart';

class ThemePage extends StatefulWidget {
  ThemePage();
  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  final SettingsHandler settingsHandler = Get.find();
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
    print('init-----');
    theme = settingsHandler.theme.value;
    themeMode = settingsHandler.themeMode.value;
    isAmoled = settingsHandler.isAmoled.value;
    enableMascot = settingsHandler.enableDrawerMascot;
    mascotPathOverride = settingsHandler.drawerMascotPathOverride;
    primaryPickerColor = settingsHandler.customPrimaryColor.value;
    accentPickerColor = settingsHandler.customAccentColor.value;
  }

  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    settingsHandler.theme.value = theme;
    settingsHandler.themeMode.value = themeMode;
    settingsHandler.isAmoled.value = isAmoled;
    settingsHandler.enableDrawerMascot = enableMascot;

    print('onPrimary: ${ThemeData.estimateBrightnessForColor(primaryPickerColor!) == Brightness.dark}');
    print('onAccent: ${ThemeData.estimateBrightnessForColor(accentPickerColor!) == Brightness.dark}');
    settingsHandler.customPrimaryColor.value = primaryPickerColor;
    settingsHandler.customAccentColor.value = accentPickerColor;
    //This needs to be done here because if its done in the buttons onclick
    //and you back out too fast the image path will not be returned in time to save it to settings
    if (needToWriteMascot){
      if (mascotPathOverride.isNotEmpty) {
        mascotPathOverride = await new ImageWriter().writeMascotImage(mascotPathOverride);
        settingsHandler.drawerMascotPathOverride = mascotPathOverride;
        needToWriteMascot = false;
      }
    }
    Get.find<SearchHandler>().rootRestate();
    bool result = await settingsHandler.saveSettings(restate: true);
    return result;
  }

  void updateTheme() async {
    _onWillPop();
    Timer(Duration(milliseconds: 200), () {
      // trigger second time to force dropdowns to rerender completely
      _onWillPop();
      setState(() { });
    });
    setState(() { });
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
        style: Get.theme.textTheme.subtitle1,
      ),
      subheading: Text(
        'Selected color and its shades',
        style: Get.theme.textTheme.subtitle1,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Get.theme.textTheme.subtitle1,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Get.theme.textTheme.caption,
      colorNameTextStyle: Get.theme.textTheme.caption,
      colorCodeTextStyle: Get.theme.textTheme.bodyText2,
      colorCodePrefixStyle: Get.theme.textTheme.caption,
      selectedPickerTypeColor: Get.theme.colorScheme.primary,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: true,
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
        ColorPickerType.bw: true,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
      actionButtons: ColorPickerActionButtons(
        okIcon: Icons.save,
        closeIcon: Icons.cancel,
        dialogActionIcons: true,
      ),
    ).showPickerDialog(
      context,
      constraints:
          const BoxConstraints(minHeight: 480, minWidth: 300, maxWidth: 320),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Themes"),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsDropdown(
                selected: themeMode.toString(),
                values: ThemeMode.values.map((e) => e.toString()).toList().reversed.toList(),
                onChanged: (String? newValue) {
                  themeMode = ThemeMode.values.where((element) => element.toString() == newValue).toList()[0];
                  updateTheme();
                },
                title: 'Theme Mode',
                childBuilder: (String value) {
                  final String prettyValue = value.toString().split('.')[1].capitalizeFirst!;
                  const double size = 40;
                  switch (prettyValue) {
                    case ("Dark"):
                      return Row(
                        children: [
                          const SizedBox(width: size, child: const Icon(Icons.dark_mode)),
                          Text(prettyValue),
                        ]
                      );
                    case ("Light"):
                      return Row(
                        children: [
                          const SizedBox(width: size, child: const Icon(Icons.light_mode)),
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
                selected: theme.name,
                values: List<String>.from(settingsHandler.map['theme']?['options'].map((e) => e.name).toList()),
                onChanged: (String? newValue) {
                  theme = settingsHandler.map['theme']?['options'].where((e) => e.name == newValue).toList()[0];
                  updateTheme();
                },
                title: 'Theme',
                childBuilder: (String value) {
                  ThemeItem theme = settingsHandler.map['theme']?['options'].firstWhere((e) => e.name == value);
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
                  icon: Icon(Icons.refresh),
                  drawTopBorder: true,
                  action: () {
                    ThemeItem theme = settingsHandler.map['theme']?['default'];
                    primaryPickerColor = theme.primary;
                    accentPickerColor = theme.accent;
                    updateTheme();
                  },
                ),

              SettingsButton(name: '', enabled: false),
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
                icon: Icon(Icons.image_search_outlined),
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
                  icon: Icon(Icons.delete_forever),
                  drawTopBorder: true,
                  action: () async{
                    File file = new File(mascotPathOverride);
                    if (file.existsSync()) {
                      file.deleteSync();
                    }
                    mascotPathOverride = "";
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

