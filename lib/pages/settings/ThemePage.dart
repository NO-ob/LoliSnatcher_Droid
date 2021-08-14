import 'dart:async';

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
  late ThemeItem currentTheme;
  late ThemeMode themeMode;
  late bool isAmoled;

  late Color? primaryPickerColor; // Color for picker shown in Card on the screen.
  late Color? accentPickerColor; // Color for picker in dialog using onChanged

  @override
  void initState() {
    super.initState();
    print('init-----');
    currentTheme = settingsHandler.currentTheme.value;
    themeMode = settingsHandler.themeMode.value;
    isAmoled = settingsHandler.isAmoled.value;

    primaryPickerColor = settingsHandler.currentTheme.value.primary;
    accentPickerColor = settingsHandler.currentTheme.value.accent;
  }

  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    settingsHandler.currentTheme.value = ThemeItem(name: 'Custom', primary: primaryPickerColor, accent: accentPickerColor);
    print('onPrimary: ${ThemeData.estimateBrightnessForColor(primaryPickerColor!) == Brightness.dark}');
    print('onAccent: ${ThemeData.estimateBrightnessForColor(accentPickerColor!) == Brightness.dark}');
    // settingsHandler.currentTheme.value = currentTheme;
    settingsHandler.themeMode.value = themeMode;
    settingsHandler.isAmoled.value = isAmoled;
    Get.find<SearchHandler>().rootRestate();
    bool result = await settingsHandler.saveSettings();
    return result;
  }

  void updateTheme() {
    _onWillPop();
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Themes"),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsDropdown(
                selected: themeMode.toString(),
                values: ThemeMode.values.map((e) => e.toString()).toList(),
                onChanged: (String? newValue){
                  setState((){
                    themeMode = ThemeMode.values.where((element) => element.toString() == newValue).toList()[0];
                  });
                  updateTheme();
                },
                title: 'Mode'
              ),
              // Container(
              //   width: double.infinity,
              //   margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     children: <Widget>[
              //       Text("Mode:     "),
              //       DropdownButton<ThemeMode>(
              //         value: themeMode,
              //         icon: Icon(Icons.arrow_downward),
              //         onChanged: (ThemeMode? newValue){
              //           setState((){
              //             themeMode = newValue!;
              //           });
              //           updateTheme();
              //         },
              //         items: ThemeMode.values.map<DropdownMenuItem<ThemeMode>>((ThemeMode value){
              //           // get mode name from ThemeMode.values, then uppercase first letter
              //           String modeName = value.toString().split('.')[1].capitalizeFirst!;

              //           return DropdownMenuItem<ThemeMode>(
              //             value: value,
              //             child: Text(modeName),
              //           );
              //         }).toList(),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   width: double.infinity,
              //   margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     children: <Widget>[
              //       Text("Theme:     "),
              //       DropdownButton<String>(
              //         value: currentTheme.name,
              //         icon: Icon(Icons.arrow_downward),
              //         onChanged: (String? newValue){
              //           setState((){
              //             currentTheme = settingsHandler.themes.firstWhere((e) => e.name == newValue);
              //           });
              //           updateTheme();
              //         },
              //         items: List<String>.from(settingsHandler.themes.map((e) => e.name)).map<DropdownMenuItem<String>>((String value){
              //           ThemeItem theme = settingsHandler.themes.firstWhere((e) => e.name == value);
              //           Color? primary = theme.primary;
              //           Color? accent = theme.accent;
              //           return DropdownMenuItem<String>(
              //             value: value,
              //             child: Row(children: [
              //               Text(value),
              //               Column(children: [
              //                 Container(height: 10, width: 50, color: primary),
              //                 Container(height: 10, width: 50, color: accent),
              //               ]),
              //             ])
              //           );
              //         }).toList(),
              //       ),
              //     ],
              //   ),
              // ),

              SettingsToggle(
                value: isAmoled,
                onChanged: (bool newValue) {
                  setState(() {
                    isAmoled = newValue;
                  });
                  updateTheme();
                },
                title: 'AMOLED',
              ),

              ListTile(
                title: const Text('Primary Dialog'),
                subtitle: Text(
                  '${ColorTools.materialNameAndCode(primaryPickerColor!)} '
                  'aka ${ColorTools.nameThatColor(primaryPickerColor!)}',
                ),
                trailing: ColorIndicator(
                  width: 44,
                  height: 44,
                  borderRadius: 4,
                  color: primaryPickerColor!,
                  onSelectFocus: false,
                  onSelect: () async {
                    // Store current color before we open the dialog.
                    final Color colorBeforeDialog = primaryPickerColor!;
                    // Wait for the picker to close, if dialog was dismissed,
                    // then restore the color we had before it was opened.

                    if (!(await colorPickerDialog(
                      primaryPickerColor!,
                      (Color newColor) {
                        primaryPickerColor = newColor;
                        setState(() { });
                        updateTheme();
                       }
                    ))) {
                        primaryPickerColor = colorBeforeDialog;
                        setState(() { });
                        updateTheme();
                    }
                  },
                ),
              ),
              ListTile(
                title: const Text('Accent Dialog'),
                subtitle: Text(
                  '${ColorTools.materialNameAndCode(accentPickerColor!)} '
                  'aka ${ColorTools.nameThatColor(accentPickerColor!)}',
                ),
                trailing: ColorIndicator(
                  width: 44,
                  height: 44,
                  borderRadius: 4,
                  color: accentPickerColor!,
                  onSelectFocus: false,
                  onSelect: () async {
                    // Store current color before we open the dialog.
                    final Color colorBeforeDialog = accentPickerColor!;
                    // Wait for the picker to close, if dialog was dismissed,
                    // then restore the color we had before it was opened.

                    if (!(await colorPickerDialog(
                      accentPickerColor!,
                      (Color newColor) {
                        accentPickerColor = newColor;
                        setState(() { });
                        updateTheme();
                       }
                    ))) {
                        accentPickerColor = colorBeforeDialog;
                        setState(() { });
                        updateTheme();
                    }
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

