import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/widgets/CachedFavicon.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';
import 'package:LoliSnatcher/widgets/LongPressRepeater.dart';

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
        SettingsPageOpen(context: context, page: page!).open();
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
          icon: icon ?? const Icon(null),
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
        top: drawTopBorder ? BorderSide(color: Theme.of(context).dividerColor, width: borderWidth) : BorderSide.none,
        // draw bottom border when item is among other listtiles, but not when it's the last one
        bottom: drawBottomBorder ? BorderSide(color: Theme.of(context).dividerColor, width: borderWidth) : BorderSide.none,
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
    this.barrierDismissible = true,
  });

  final Widget Function() page;
  final BuildContext context;
  final bool condition;
  final bool barrierDismissible;

  Future<bool> open() async {
    if(!condition) return true;

    SettingsHandler settingsHandler = SettingsHandler.instance;

    bool isTooNarrow = MediaQuery.of(context).size.width < 550;
    bool isDesktop = settingsHandler.appMode.value == AppMode.DESKTOP || Platform.isWindows || Platform.isLinux || Platform.isMacOS;
    bool useDesktopMode = !isTooNarrow && isDesktop;

    bool result = false;
    if(useDesktopMode) {
      result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: SizedBox(
              width: 500,
              child: page(),
            ),
          );
        },
        barrierDismissible: barrierDismissible,
      ) ?? false;
    } else {
      result = await Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (BuildContext context) => page())) ?? false;
    }
    return result;
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
      activeColor: activeColor ?? Theme.of(context).colorScheme.secondary,
      shape: Border(
        // draw top border when item is in the middle of other items, but they are not listtile
        top: drawTopBorder ? BorderSide(color: Theme.of(context).dividerColor, width: borderWidth) : BorderSide.none,
        // draw bottom border when item is among other listtiles, but not when it's the last one
        bottom: drawBottomBorder ? BorderSide(color: Theme.of(context).dividerColor, width: borderWidth) : BorderSide.none,
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
      title: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: DropdownButtonFormField<String>(
          value: selected,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: onChanged,
          menuMaxHeight: MediaQuery.of(context).size.height * 0.66,
          isExpanded: true,
          decoration: InputDecoration(
            hintText: title,
            labelText: title,
            contentPadding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
          ),
          dropdownColor: Theme.of(context).colorScheme.surface,
          selectedItemBuilder: (BuildContext context) {
            return values.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: <Widget>[
                    childBuilder?.call(value) ?? Text(value)
                  ],
                ),
              );
            }).toList();
          },
          items: values.map<DropdownMenuItem<String>>((String value) {
            bool isCurrent = value == selected;

            return DropdownMenuItem<String>(
              value: value,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: isCurrent
                  ? BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.secondary, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    )
                  : null,
                child: Row(
                  children: [
                    childBuilder?.call(value) ?? Text(value, style: TextStyle(color: Theme.of(context).colorScheme.onSurface))
                  ]
                ),
              ),
            );
          }).toList(),
        ),
      ),
      trailing: trailingIcon,
      dense: false,
      shape: Border(
        // draw top border when item is in the middle of other items, but they are not listtile
        top: drawTopBorder ? BorderSide(color: Theme.of(context).dividerColor, width: borderWidth) : BorderSide.none,
        // draw bottom border when item is among other listtiles, but not when it's the last one
        bottom: drawBottomBorder ? BorderSide(color: Theme.of(context).dividerColor, width: borderWidth) : BorderSide.none,
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
      title: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Obx(() {
          List<Booru> boorus = SettingsHandler.instance.booruList;
          Booru? newSelected = boorus.contains(selected) ? selected : boorus.first;

          return DropdownButtonFormField<Booru>(
            value: newSelected,
            icon: const Icon(Icons.arrow_drop_down),
            onChanged: onChanged,
            menuMaxHeight: MediaQuery.of(context).size.height * 0.66,
            isExpanded: true,
            decoration: InputDecoration(
              labelText: title,
              hintText: title,
              contentPadding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            ),
            dropdownColor: Theme.of(context).colorScheme.surface,
            selectedItemBuilder: (BuildContext context) {
                return boorus.map<DropdownMenuItem<Booru>>((Booru value) {
                  return DropdownMenuItem<Booru>(
                    value: value,
                    child: Row(
                      children: <Widget>[
                        (value.type == "Favourites"
                            ? const Icon(Icons.favorite, color: Colors.red, size: 18)
                            : CachedFavicon(value.faviconURL!)
                        ),
                        Text(" ${value.name!}"),
                      ],
                    ),
                  );
                }).toList();
              },
            items: boorus.map<DropdownMenuItem<Booru>>((Booru value){
              bool isCurrent = value == newSelected;

              return DropdownMenuItem<Booru>(
                value: value,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: isCurrent
                  ? BoxDecoration(
                    border: Border.all(color: Theme.of(context).colorScheme.secondary, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  )
                  : null,
                  child: Row(
                    children: <Widget>[
                      (value.type == "Favourites"
                          ? const Icon(Icons.favorite, color: Colors.red, size: 18)
                          : CachedFavicon(value.faviconURL!)
                      ),
                      Text(" ${value.name!}", style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        })
      ),
      trailing: trailingIcon,
      dense: false,
      shape: Border(
        // draw top border when item is in the middle of other items, but they are not listtile
        top: drawTopBorder ? BorderSide(color: Theme.of(context).dividerColor, width: borderWidth) : BorderSide.none,
        // draw bottom border when item is among other listtiles, but not when it's the last one
        bottom: drawBottomBorder ? BorderSide(color: Theme.of(context).dividerColor, width: borderWidth) : BorderSide.none,
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
    this.margin = const EdgeInsets.symmetric(vertical: 8),
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
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool drawTopBorder;
  final bool drawBottomBorder;
  final EdgeInsets margin;
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
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(focusListener);
  }

  void focusListener() {
    isFocused = _focusNode.hasFocus;
    setState(() { });
  }

  @override
  void dispose() {
    _focusNode.removeListener(focusListener);
    _focusNode.dispose();
    super.dispose();
  }

  void onChangedCallback(String value) {
      widget.onChanged?.call(value);
  }

  void stepNumberDown() {
    if (widget.numberButtons) {
      double valueWithStep = (double.tryParse(widget.controller.text) ?? 0) - widget.numberStep;
      double newValue = valueWithStep >= widget.numberMin ? valueWithStep : widget.numberMin;
      widget.controller.text = newValue.toStringAsFixed(newValue.truncateToDouble() == newValue ? 0 : 1);
      onChangedCallback(widget.controller.text);
    }
  }

  void stepNumberUp() {
    if(widget.numberButtons) {
      double valueWithStep = (double.tryParse(widget.controller.text) ?? 0) + widget.numberStep;
      double newValue = valueWithStep <= widget.numberMax ? valueWithStep : widget.numberMax;
      widget.controller.text = newValue.toStringAsFixed(newValue.truncateToDouble() == newValue ? 0 : 1);
      onChangedCallback(widget.controller.text);
    }
  }

  Widget buildNumberButton(void Function() stepFunc, IconData icon) {
    return LongPressRepeater(
      onStart: () {
        stepFunc();
      },
      tick: 100,
      fastTick: 50,
      fasterAfter: 20,
      child: IconButton(
        icon: Icon(icon, color: Theme.of(context).colorScheme.onSurface),
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
            icon: Icon(Icons.clear, color: Theme.of(context).colorScheme.onSurface),
            onPressed: () {
              widget.controller.clear();
              onChangedCallback(widget.controller.text);
            },
          ),

        if(widget.resetText != null)
          IconButton(
            icon: Icon(Icons.refresh, color: Theme.of(context).colorScheme.onSurface),
            onPressed: () {
              widget.controller.text = widget.resetText!();
              onChangedCallback(widget.controller.text);
            },
          ),

        isFocused
          ? IconButton(
              icon: Icon(widget.onSubmitted != null ? Icons.send : Icons.done, color: Theme.of(context).colorScheme.onSurface),
              onPressed: () {
                if(widget.onSubmitted != null) widget.onSubmitted!(widget.controller.text);
                _focusNode.unfocus();
              },
            )
          : IconButton(
              icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.onSurface),
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
      margin: widget.margin,
      child: TextFormField(
        focusNode: _focusNode,
        controller: widget.controller,
        autofocus: widget.autofocus,
        keyboardType: widget.inputType,
        enableInteractiveSelection: true,
        inputFormatters: widget.inputFormatters,
        onChanged: onChangedCallback,
        onFieldSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.surface,
          filled: true,
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontSize: 18),
          labelText: widget.title,
          hintText: widget.hintText,
          errorText: widget.validator?.call(widget.controller.text),
          contentPadding: const EdgeInsets.fromLTRB(25, 0, 15, 0),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 2, right: 10),
            child: buildSuffixIcons(),
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
        top: widget.drawTopBorder ? BorderSide(color: Theme.of(context).dividerColor, width: borderWidth) : BorderSide.none,
        // draw bottom border when item is among other listtiles, but not when it's the last one
        bottom: widget.drawBottomBorder ? BorderSide(color: Theme.of(context).dividerColor, width: borderWidth) : BorderSide.none,
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
      backgroundColor: Theme.of(context).colorScheme.surface,
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



class SettingsPageDialog extends StatelessWidget {
  const SettingsPageDialog({
    Key? key,
    this.title,
    this.content,
    this.actions,
  }) : super(key: key);

  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // extendBody: true,
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor!.withOpacity(0.5),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: title,
        actions: [
          if((actions?.length ?? 0) > 0)
            Row(
              children: actions ?? [],
            ),
        ],
      ),
      body: SafeArea(
        child: content ?? Container(),
      ),
    );
  }
}