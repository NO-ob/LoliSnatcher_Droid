import 'dart:io';

import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/widgets/CachedFavicon.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';
import 'package:flutter/cupertino.dart';
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
  final Widget Function()? page;
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
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => page!.call()));
              // Get.to(
              //   page,
              //   // duration: Duration(milliseconds: 500)
              // );
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
      activeColor: activeColor ?? Get.theme.colorScheme.secondary,
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
  SettingsDropdown({
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

  final GlobalKey dropdownKey = GlobalKey();
  GestureDetector? detector;
  // TODO fix this
  // dropdownbutton small clickable zone workaround when using inputdecoration
  // code from: https://github.com/flutter/flutter/issues/53634
  void openItemsList() {
    void search(BuildContext? context) {
      context?.visitChildElements((element) {
        if (detector != null) return;
        if (element.widget != null && element.widget is GestureDetector)
          detector = element.widget as GestureDetector;
        else
          search(element);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: GestureDetector(
          onTap: openItemsList,
          child: DropdownButtonFormField<String>(
            key: dropdownKey,
            value: selected,
            icon: Icon(Icons.arrow_drop_down),
            onChanged: onChanged,
            menuMaxHeight: MediaQuery.of(context).size.height * 0.66,
            isExpanded: true,
            decoration: InputDecoration(
              labelText: title,
              labelStyle: TextStyle(color: Get.theme.colorScheme.onBackground, fontSize: 18),
              contentPadding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Get.theme.colorScheme.secondary),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Get.theme.colorScheme.secondary),
              ),
            ),
            dropdownColor: Get.theme.colorScheme.surface,
            selectedItemBuilder: (BuildContext context) {
              return values.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        childBuilder?.call(value) ?? Text(value)
                      ],
                    )
                  ),
                );
              }).toList();
            },
            items: values.map<DropdownMenuItem<String>>((String value) {
              bool isCurrent = value == selected;

              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: isCurrent
                    ? BoxDecoration(
                        border: Border.all(color: Get.theme.colorScheme.secondary, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      )
                    : null,
                  child: Row(
                    children: [
                      childBuilder?.call(value) ?? Text(value, style: TextStyle(color: Get.theme.colorScheme.onSurface))
                    ]
                  ),
                ),
              );
            }).toList(),
          )
        )
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
  SettingsBooruDropdown({
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

  final GlobalKey dropdownKey = GlobalKey();
  GestureDetector? detector;
  // TODO fix this
  // dropdownbutton small clickable zone workaround when using inputdecoration
  // code from: https://github.com/flutter/flutter/issues/53634
  void openItemsList() {
    void search(BuildContext? context) {
      context?.visitChildElements((element) {
        if (detector != null) return;
        if (element.widget != null && element.widget is GestureDetector)
          detector = element.widget as GestureDetector;
        else
          search(element);
      });
    }

    search(dropdownKey.currentContext);
    if (detector != null) detector!.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    List<Booru> boorus = Get.find<SettingsHandler>().booruList;
    return ListTile(
      title: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Obx(() => GestureDetector(
          onTap: openItemsList,
          child: DropdownButtonFormField<Booru>(
            key: dropdownKey,
            value: selected,
            icon: Icon(Icons.arrow_drop_down),
            onChanged: onChanged,
            menuMaxHeight: MediaQuery.of(context).size.height * 0.66,
            isExpanded: true,
            decoration: InputDecoration(
              labelText: title,
              labelStyle: TextStyle(color: Get.theme.colorScheme.onBackground, fontSize: 18),
              contentPadding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Get.theme.colorScheme.secondary),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Get.theme.colorScheme.secondary),
              ),
            ),
            dropdownColor: Get.theme.colorScheme.surface,
            selectedItemBuilder: (BuildContext context) {
                return boorus.map<DropdownMenuItem<Booru>>((Booru value) {
                  return DropdownMenuItem<Booru>(
                    value: value,
                    child: Container(
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
                }).toList();
              },
            items: boorus.map<DropdownMenuItem<Booru>>((Booru value){
              bool isCurrent = value == selected;

              return DropdownMenuItem<Booru>(
                value: value,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: isCurrent
                  ? BoxDecoration(
                    border: Border.all(color: Get.theme.colorScheme.secondary, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  )
                  : null,
                  child: Row(
                    children: <Widget>[
                      (value.type == "Favourites"
                          ? Icon(Icons.favorite, color: Colors.red, size: 18)
                          : CachedFavicon(value.faviconURL!)
                      ),
                      Text(" ${value.name!}", style: TextStyle(color: Get.theme.colorScheme.onSurface)),
                    ],
                  ),
                ),
              );
            }).toList(),
          )
        ))
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

class SettingsTextInput extends StatelessWidget {
  const SettingsTextInput({
    Key? key,
    required this.controller,
    this.inputType = TextInputType.text,
    this.inputFormatters,
    this.validator,
    required this.title,
    this.hintText = '',
    this.autofocus = false,
    this.onSubmitted,
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
  final bool autofocus;
  final void Function(String)? onSubmitted;
  final bool drawTopBorder;
  final bool drawBottomBorder;
  final Widget trailingIcon;
  final bool onlyInput; // return only textfield, without tile wrapper (in this case: no dividers, title, subtitle, icon)

  @override
  Widget build(BuildContext context) {
    final Widget field = Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        autofocus: autofocus,
        keyboardType: inputType,
        inputFormatters: inputFormatters,
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
          fillColor: Get.theme.colorScheme.surface,
          filled: true,
          labelStyle: TextStyle(color: Get.theme.colorScheme.onBackground, fontSize: 18),
          labelText: title,
          hintText: hintText,
          errorText: validator?.call(controller.text),
          contentPadding: EdgeInsets.fromLTRB(25, 0, 15, 0),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Icon(Icons.edit, color: Get.theme.colorScheme.onSurface)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Get.theme.colorScheme.secondary),
            borderRadius: BorderRadius.circular(50),
            gapPadding: 2,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Get.theme.errorColor),
            borderRadius: BorderRadius.circular(50),
            gapPadding: 2,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Get.theme.colorScheme.secondary),
            borderRadius: BorderRadius.circular(50),
            gapPadding: 2,
          ),
        ),
      )
    );

    if(onlyInput) {
      return field;
    }

    return ListTile(
      title: field,
      // subtitle: field,
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
    this.title,
    this.content,
    this.contentItems,
    this.actionButtons,
    this.contentPadding,
    this.titlePadding
  }) : super(key: key);

  final Widget? title;
  final Widget? content;
  final List<Widget>? contentItems;
  final List<Widget>? actionButtons;
  final EdgeInsets? contentPadding;
  final EdgeInsets? titlePadding;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      titlePadding: titlePadding ?? null,
      content: content ?? SingleChildScrollView(
        child: ListBody(
          children: contentItems ?? [],
        )
      ),
      backgroundColor: Get.theme.colorScheme.surface,
      actions: (actionButtons?.length ?? 0) > 0 ? actionButtons : [],
      contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(24, 20, 24, 24),
      scrollable: true,
    );
  }
}