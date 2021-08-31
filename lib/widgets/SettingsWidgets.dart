import 'dart:io';

import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/widgets/CachedFavicon.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';

const double borderWidth = 1;

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key,
    required this.name,
    this.icon,
    this.subtitle,

    this.page, // which page to open after button was pressed (needs to be wrapped in anonymous function, i.e.: () => Page)
    // OR
    this.action, // function to execute on button press

    this.trailingIcon, // icon at the end (i.e. if action is a link which will open a browser)
    this.drawTopBorder = false,
    this.drawBottomBorder = true,
    this.enabled = true, // disable button interaction (will also change text color to grey)
  }) : super(key: key);

  final String name;
  final Widget? icon;
  final Widget? subtitle;
  final Function? page;
  final void Function()? action;
  final Widget? trailingIcon;
  final bool drawTopBorder;
  final bool drawBottomBorder;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(name),
      subtitle: subtitle,
      trailing: trailingIcon,
      enabled: enabled,
      dense: false,
      onTap: () {
        if(action != null) {
          action?.call();
        } else {
          if(page != null) {
            if(Get.find<SettingsHandler>().appMode == "Desktop" || Platform.isWindows || Platform.isLinux) {
              Get.dialog(Dialog(
                child: Container(
                  width: 500,
                  child: page?.call(),
                ),
              ));
            } else {
              Get.to(
                page,
                // duration: Duration(milliseconds: 500)
              );
            }
          }
        }
      },

      shape: Border(
        // draw top border when item is in the middle of other items, but they are not listtile
        top: drawTopBorder ? BorderSide(color: Get.theme.dividerColor, width: borderWidth) : BorderSide.none,
        // draw bottom border when item is among other listtiles, but not when it's the last one
        bottom: drawBottomBorder ? BorderSide(color: Get.theme.dividerColor, width: borderWidth) : BorderSide.none,
      )
    );
  }
}


class SettingsToggle extends StatelessWidget {
  const SettingsToggle({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.subtitle,
    this.drawTopBorder = false,
    this.drawBottomBorder = true,
    this.trailingIcon = const SizedBox(),
    this.activeColor,
  }) : super(key: key);

  final bool value;
  final void Function(bool) onChanged;
  final String title;
  final Widget? subtitle;
  final bool drawTopBorder;
  final bool drawBottomBorder;
  final Widget trailingIcon;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Row(children: [
        MarqueeText(
          text: title,
          fontSize: 16,
        ),
        trailingIcon
      ]),
      subtitle: subtitle,
      value: value,
      onChanged: onChanged,
      activeColor: activeColor ?? Get.theme.accentColor,
      shape: Border(
        // draw top border when item is in the middle of other items, but they are not listtile
        top: drawTopBorder ? BorderSide(color: Get.theme.dividerColor, width: borderWidth) : BorderSide.none,
        // draw bottom border when item is among other listtiles, but not when it's the last one
        bottom: drawBottomBorder ? BorderSide(color: Get.theme.dividerColor, width: borderWidth) : BorderSide.none,
      )
    );
  }
}

class SettingsDropdown extends StatelessWidget {
  const SettingsDropdown({
    Key? key,
    required this.selected,
    required this.values,
    required this.onChanged,
    required this.title,
    this.drawTopBorder = false,
    this.drawBottomBorder = true,
    this.trailingIcon = const SizedBox(),
    this.childBuilder,
  }) : super(key: key);

  final String selected;
  final List<String> values;
  final void Function(String?)? onChanged;
  final String title;
  final bool drawTopBorder;
  final bool drawBottomBorder;
  final Widget trailingIcon;
  final Widget Function(String)? childBuilder;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: MarqueeText(
        text: title,
        fontSize: 16,
        isExpanded: false,
      ),
      subtitle: DropdownButton<String>(
        value: selected,
        icon: Icon(Icons.arrow_downward),
        onChanged: onChanged,
        menuMaxHeight: MediaQuery.of(context).size.height * 0.66,
        isExpanded: true,
        underline: const SizedBox(),
        items: values.map<DropdownMenuItem<String>>((String value) {
          bool isCurrent = value == selected;

          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: isCurrent
                ? BoxDecoration(
                  border: Border.all(color: Get.theme.accentColor, width: 1),
                  borderRadius: BorderRadius.circular(5),
                )
                : null,
              child: Row(
                children: [
                  childBuilder?.call(value) ?? Text(value)
                ]
              ),
            ),
          );
        }).toList(),
      ),
      trailing: trailingIcon,
      dense: false,
      shape: Border(
        // draw top border when item is in the middle of other items, but they are not listtile
        top: drawTopBorder ? BorderSide(color: Get.theme.dividerColor, width: borderWidth) : BorderSide.none,
        // draw bottom border when item is among other listtiles, but not when it's the last one
        bottom: drawBottomBorder ? BorderSide(color: Get.theme.dividerColor, width: borderWidth) : BorderSide.none,
      )
    );
  }
}

class SettingsBooruDropdown extends StatelessWidget {
  const SettingsBooruDropdown({
    Key? key,
    required this.selected,
    required this.onChanged,
    required this.title,
    this.drawTopBorder = false,
    this.drawBottomBorder = true,
    this.trailingIcon = const SizedBox(),
  }) : super(key: key);

  final Booru? selected;
  final void Function(Booru?)? onChanged;
  final String title;
  final bool drawTopBorder;
  final bool drawBottomBorder;
  final Widget trailingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: MarqueeText(
        text: title,
        fontSize: 16,
        isExpanded: false,
      ),
      subtitle: Obx(() => DropdownButton<Booru>(
        value: selected,
        icon: Icon(Icons.arrow_downward),
        onChanged: onChanged,
        menuMaxHeight: MediaQuery.of(context).size.height * 0.66,
        isExpanded: true,
        underline: const SizedBox(),
        items: Get.find<SettingsHandler>().booruList.map<DropdownMenuItem<Booru>>((Booru value){
          bool isCurrent = value == selected;

          return DropdownMenuItem<Booru>(
            value: value,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: isCurrent
              ? BoxDecoration(
                border: Border.all(color: Get.theme.accentColor, width: 1),
                borderRadius: BorderRadius.circular(5),
              )
              : null,
              child: Row(
                children: <Widget>[
                  (value.type == "Favourites"
                      ? Icon(Icons.favorite, color: Colors.red, size: 18)
                      : CachedFavicon(value.faviconURL!)
                  ),
                  Text(" ${value.name!}"),
                ],
              ),
            ),
          );
        }).toList(),
      )),
      trailing: trailingIcon,
      dense: false,
      shape: Border(
        // draw top border when item is in the middle of other items, but they are not listtile
        top: drawTopBorder ? BorderSide(color: Get.theme.dividerColor, width: borderWidth) : BorderSide.none,
        // draw bottom border when item is among other listtiles, but not when it's the last one
        bottom: drawBottomBorder ? BorderSide(color: Get.theme.dividerColor, width: borderWidth) : BorderSide.none,
      )
    );
  }
}

class SettingsTextInput extends StatelessWidget {
  const SettingsTextInput({
    Key? key,
    required this.controller,
    this.inputType = TextInputType.text,
    this.inputFormatters,
    this.validator,
    required this.title,
    this.hintText = '',
    this.drawTopBorder = false,
    this.drawBottomBorder = true,
    this.trailingIcon = const SizedBox(),
    this.onlyInput = false,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType inputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final String title;
  final String hintText;
  final bool drawTopBorder;
  final bool drawBottomBorder;
  final Widget trailingIcon;
  final bool onlyInput; // return only textfield, without tile wrapper (in this case: no dividers, title, subtitle, icon)

  @override
  Widget build(BuildContext context) {
    final Widget field = Container(
      margin: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          fillColor: Get.theme.colorScheme.surface,
          filled: true,
          hintText: hintText,
          errorText: validator?.call(controller.text),
          contentPadding: EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Get.theme.accentColor),
            borderRadius: BorderRadius.circular(50),
            gapPadding: 0,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Get.theme.errorColor),
            borderRadius: BorderRadius.circular(50),
            gapPadding: 0,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Get.theme.accentColor),
            borderRadius: BorderRadius.circular(50),
            gapPadding: 0,
          ),
        ),
      )
    );

    if(onlyInput) {
      return field;
    }

    return ListTile(
      title: MarqueeText(
        text: title,
        fontSize: 16,
        isExpanded: false,
      ),
      subtitle: field,
      trailing: trailingIcon,
      dense: false,
      shape: Border(
        // draw top border when item is in the middle of other items, but they are not listtile
        top: drawTopBorder ? BorderSide(color: Get.theme.dividerColor, width: borderWidth) : BorderSide.none,
        // draw bottom border when item is among other listtiles, but not when it's the last one
        bottom: drawBottomBorder ? BorderSide(color: Get.theme.dividerColor, width: borderWidth) : BorderSide.none,
      )
    );
  }
}

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({
    Key? key,
    required this.title,
    this.content,
    this.contentItems,
    this.actionButtons
  }) : super(key: key);

  final Widget title;
  final Widget? content;
  final List<Widget>? contentItems;
  final List<Widget>? actionButtons;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content ?? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: contentItems ?? [],
      ),
      actions: (actionButtons?.length ?? 0) > 0 ? actionButtons : null,
      scrollable: true,
    );
  }
}