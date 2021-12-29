import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/widgets/CachedFavicon.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';

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
    this.onLongPress,

    this.trailingIcon, // icon at the end (i.e. if action is a link which will open a browser)
    this.drawTopBorder = false,
    this.drawBottomBorder = true,
    this.enabled = true, // disable button interaction (will also change text color to grey)
    this.iconOnly = false,
    this.dense = false,
  }) : super(key: key);

  final String name;
  final Widget? icon;
  final Widget? subtitle;
  final Widget Function()? page;
  final void Function()? action;
  final void Function()? onLongPress;
  final Widget? trailingIcon;
  final bool drawTopBorder;
  final bool drawBottomBorder;
  final bool enabled;
  final bool iconOnly;
  final bool dense;

  void onTapAction(BuildContext context) {
    if(action != null) {
      action?.call();
    } else {
      if(page != null) {
        SettingsPageOpen(context: context, page: page!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if(iconOnly) {
      return GestureDetector(
        onLongPress: () => {
          onLongPress?.call()
        },
        child: IconButton(
          icon: icon ?? Icon(null),
          onPressed: (){
            onTapAction(context);
          },
        ),
      );
    }

    return ListTile(
      leading: icon,
      title: Text(name),
      subtitle: subtitle,
      trailing: trailingIcon,
      enabled: enabled,
      dense: dense,
      onTap: () {
        onTapAction(context);
      },
      onLongPress: () {
        onLongPress?.call();
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

// class used to unify the opening of settings pages logic
class SettingsPageOpen {
  SettingsPageOpen({
    required this.page,
    required this.context,
    this.condition = true,
  }) {
    if(!condition) return;

    SettingsHandler settingsHandler = Get.find<SettingsHandler>();
    bool isTooNarrow = MediaQuery.of(context).size.width < 550;
    if(!isTooNarrow && (settingsHandler.appMode == "Desktop" || Platform.isWindows || Platform.isLinux)) {
      Get.dialog(Dialog(
        child: Container(
          width: 500,
          child: page(),
        ),
      ));
    } else {
      Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (BuildContext context) => page()));
    }
  }

  final Widget Function() page;
  final BuildContext context;
  final bool condition;
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

class SettingsTextInput extends StatefulWidget {
  const SettingsTextInput({
    Key? key,
    required this.controller,
    this.inputType = TextInputType.text,
    this.inputFormatters,
    this.validator,
    required this.title,
    this.hintText = '',
    this.autofocus = false,
    this.onChanged,
    this.onSubmitted,
    this.drawTopBorder = false,
    this.drawBottomBorder = true,
    this.clearable = false,
    this.resetText,
    this.numberButtons = false,
    this.numberStep = 1,
    this.numberMin = 0,
    this.numberMax = 100,
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
  final void Function(String?)? onChanged;
  final void Function(String)? onSubmitted;
  final bool drawTopBorder;
  final bool drawBottomBorder;
  final bool clearable;
  final String Function()? resetText;
  final bool numberButtons;
  final double numberStep;
  final double numberMin;
  final double numberMax;
  final Widget trailingIcon;
  final bool onlyInput; 
  @override
  State<SettingsTextInput> createState() => _SettingsTextInputState();
}

class _SettingsTextInputState extends State<SettingsTextInput> {
  bool isFocused = false;
  FocusNode _focusNode = FocusNode();

  Timer? _longPressRepeatTimer;
  int repeatCount = 0;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      isFocused = _focusNode.hasFocus;
      setState(() { });
    });
  }

  void stepNumberDown() {
    if (widget.numberButtons) {
      if(repeatCount > 0) {
        ServiceHandler.vibrate(duration: 2);
      }
      double valueWithStep = (double.tryParse(widget.controller.text) ?? 0) - widget.numberStep;
      double newValue = valueWithStep >= widget.numberMin ? valueWithStep : widget.numberMin;
      widget.controller.text = newValue.toStringAsFixed(newValue.truncateToDouble() == newValue ? 0 : 1);
      widget.onChanged?.call(widget.controller.text);
    }
  }

  void stepNumberUp() {
    if(widget.numberButtons) {
      if(repeatCount > 0) {
        ServiceHandler.vibrate(duration: 2);
      }
      double valueWithStep = (double.tryParse(widget.controller.text) ?? 0) + widget.numberStep;
      double newValue = valueWithStep <= widget.numberMax ? valueWithStep : widget.numberMax;
      widget.controller.text = newValue.toStringAsFixed(newValue.truncateToDouble() == newValue ? 0 : 1);
      widget.onChanged?.call(widget.controller.text);
    }
  }

  Widget buildNumberButton(void Function() stepFunc, IconData icon) {
    final int fasterAfter = 20;
    return GestureDetector(
      onLongPressStart: (details) {
        // repeat every 100ms if the user holds down the button
        if(_longPressRepeatTimer != null) return; 
        _longPressRepeatTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
          stepFunc();
          repeatCount++;

          // repeat faster after a certain amount of times
          if(repeatCount > fasterAfter) {
            _longPressRepeatTimer?.cancel();
            _longPressRepeatTimer = Timer.periodic(Duration(milliseconds: 50), (timer) {
              stepFunc();
              repeatCount++;
            });
          }

        });
      },
      onLongPressEnd: (details) {
        // stop repeating if the user releases the button
        _longPressRepeatTimer?.cancel();
        _longPressRepeatTimer = null;
        repeatCount = 0;
      },
      onLongPressCancel: () {
        print('cancelled');
        // stop repeating if the user moves the finger/mouse away
        _longPressRepeatTimer?.cancel();
        _longPressRepeatTimer = null;
        repeatCount = 0;
      },
      child: IconButton(
        icon: Icon(icon, color: Get.theme.colorScheme.onSurface),
        onPressed: () {
          stepFunc();
        },
      ),
    );
  }



  Widget buildSuffixIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if(widget.numberButtons && isFocused)
          buildNumberButton(stepNumberDown, Icons.remove),
        if(widget.numberButtons && isFocused)
          buildNumberButton(stepNumberUp, Icons.add),

        if(widget.clearable && isFocused)
          IconButton(
            icon: Icon(Icons.clear, color: Get.theme.colorScheme.onSurface),
            onPressed: () {
              widget.controller.clear();
            },
          ),

        if(widget.resetText != null)
          IconButton(
            icon: Icon(Icons.refresh, color: Get.theme.colorScheme.onSurface),
            onPressed: () {
              widget.controller.text = widget.resetText!();
            },
          ),

        isFocused
          ? IconButton(
              icon: Icon(widget.onSubmitted != null ? Icons.send : Icons.done, color: Get.theme.colorScheme.onSurface),
              onPressed: () {
                if(widget.onSubmitted != null) widget.onSubmitted!(widget.controller.text);
                _focusNode.unfocus();
              },
            )
          : IconButton(
              icon: Icon(Icons.edit, color: Get.theme.colorScheme.onSurface),
              onPressed: () {
                _focusNode.requestFocus();
              },
            ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // return only textfield, without tile wrapper (in this case: no dividers, title, subtitle, icon)
    final Widget field = Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        focusNode: _focusNode,
        controller: widget.controller,
        autofocus: widget.autofocus,
        keyboardType: widget.inputType,
        enableInteractiveSelection: true,
        inputFormatters: widget.inputFormatters,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          fillColor: Get.theme.colorScheme.surface,
          filled: true,
          labelStyle: TextStyle(color: Get.theme.colorScheme.onBackground, fontSize: 18),
          labelText: widget.title,
          hintText: widget.hintText,
          errorText: widget.validator?.call(widget.controller.text),
          contentPadding: EdgeInsets.fromLTRB(25, 0, 15, 0),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 2, right: 10),
            child: buildSuffixIcons(),
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

    if(widget.onlyInput) {
      return field;
    }

    return ListTile(
      title: field,
      // subtitle: field,
      trailing: widget.trailingIcon,
      dense: false,
      shape: Border(
        // draw top border when item is in the middle of other items, but they are not listtile
        top: widget.drawTopBorder ? BorderSide(color: Get.theme.dividerColor, width: borderWidth) : BorderSide.none,
        // draw bottom border when item is among other listtiles, but not when it's the last one
        bottom: widget.drawBottomBorder ? BorderSide(color: Get.theme.dividerColor, width: borderWidth) : BorderSide.none,
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
    this.titlePadding,
    this.contentPadding = const EdgeInsets.fromLTRB(24, 20, 24, 24),
    this.buttonPadding,
    this.insetPadding = const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
    this.borderRadius,
    this.scrollable = true,
  }) : super(key: key);

  final Widget? title;
  final Widget? content;
  final List<Widget>? contentItems;
  final List<Widget>? actionButtons;
  final EdgeInsets? titlePadding;
  final EdgeInsets contentPadding;
  final EdgeInsets? buttonPadding;
  final EdgeInsets insetPadding;
  final BorderRadius? borderRadius;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      
      content: content ?? SingleChildScrollView(
        child: ListBody(
          children: contentItems ?? [],
        )
      ),
      backgroundColor: Get.theme.colorScheme.surface,
      actions: (actionButtons?.length ?? 0) > 0 ? actionButtons : [],

      titlePadding: titlePadding,
      contentPadding: contentPadding,
      buttonPadding: buttonPadding,
      insetPadding: insetPadding,
      shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(4)),
      scrollable: scrollable,
    );
  }
}
