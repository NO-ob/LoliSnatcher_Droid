import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/long_press_repeater.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';
import 'package:lolisnatcher/src/widgets/image/favicon.dart';

const double borderWidth = 1;

class SettingsButton extends StatelessWidget {
  const SettingsButton({
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
    super.key,
  });

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
    if (action != null) {
      action?.call();
    } else {
      if (page != null) {
        SettingsPageOpen(context: context, page: page!).open();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (iconOnly) {
      return GestureDetector(
        onLongPress: onLongPress == null ? null : () => {onLongPress!()},
        child: IconButton(
          icon: icon ?? const Icon(null),
          onPressed: () {
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
      onLongPress: onLongPress == null
          ? null
          : () {
              onLongPress!();
            },
      shape: Border(
        // draw top border when item is in the middle of other items, but they are not listtile
        top: drawTopBorder ? BorderSide(color: Theme.of(context).dividerColor, width: borderWidth) : BorderSide.none,
        // draw bottom border when item is among other listtiles, but not when it's the last one
        bottom: drawBottomBorder ? BorderSide(color: Theme.of(context).dividerColor, width: borderWidth) : BorderSide.none,
      ),
    );
  }
}

/// class used to unify the opening of settings pages logic
/// TODO get rid of this if possible after implementing proper routing
class SettingsPageOpen {
  SettingsPageOpen({
    required this.page,
    required this.context,
    this.condition = true,
    this.barrierDismissible = true,
    this.asDialog = false,
    this.asBottomSheet = false,
  }) : assert(!(asDialog && asBottomSheet), "asDialog and asBottomSheet can't be true at the same time");

  final Widget Function() page;
  final BuildContext context;
  final bool condition;
  final bool barrierDismissible;
  final bool asDialog;
  final bool asBottomSheet;

  Future<dynamic> open() async {
    if (!condition) {
      return null;
    }

    final SettingsHandler settingsHandler = SettingsHandler.instance;

    final bool isTooNarrow = MediaQuery.of(context).size.width < 550;
    final bool isDesktop = settingsHandler.appMode.value.isDesktop || Platform.isWindows || Platform.isLinux || Platform.isMacOS;
    final bool useDesktopMode = !isTooNarrow && isDesktop;

    dynamic result;
    if (useDesktopMode) {
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
      );
    } else {
      if (asDialog) {
        result = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return page();
          },
          barrierDismissible: barrierDismissible,
        );
      } else if (asBottomSheet) {
        result = await showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: page(),
            );
          },
          isScrollControlled: true,
          useSafeArea: true,
          backgroundColor: Colors.transparent,
        );
      } else {
        result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => page(),
          ),
        );
      }
    }
    return result;
  }
}

class SettingsToggle extends StatelessWidget {
  const SettingsToggle({
    required this.value,
    required this.onChanged,
    required this.title,
    this.subtitle,
    this.drawTopBorder = false,
    this.drawBottomBorder = true,
    this.trailingIcon,
    super.key,
  });

  final bool value;
  final void Function(bool) onChanged;
  final String title;
  final Widget? subtitle;
  final bool drawTopBorder;
  final bool drawBottomBorder;
  final Widget? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          MarqueeText(
            text: title,
            fontSize: 16,
          ),
          trailingIcon ?? const SizedBox(width: 8),
        ],
      ),
      subtitle: subtitle,
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
      onTap: () {
        onChanged(!value);
      },
      shape: Border(
        // draw top border when item is in the middle of other items, but they are not listtile
        top: drawTopBorder ? BorderSide(color: Theme.of(context).dividerColor, width: borderWidth) : BorderSide.none,
        // draw bottom border when item is among other listtiles, but not when it's the last one
        bottom: drawBottomBorder ? BorderSide(color: Theme.of(context).dividerColor, width: borderWidth) : BorderSide.none,
      ),
    );
  }
}

class SettingsDropdown<T> extends StatelessWidget {
  const SettingsDropdown({
    required this.value,
    required this.items,
    required this.onChanged,
    required this.title,
    this.subtitle,
    this.drawTopBorder = false,
    this.drawBottomBorder = true,
    this.trailingIcon,
    this.itemBuilder,
    this.itemTitleBuilder,
    super.key,
  });

  final T value;
  final List<T> items;
  final void Function(T?)? onChanged;
  final String title;
  final Widget? subtitle;
  final bool drawTopBorder;
  final bool drawBottomBorder;
  final Widget? trailingIcon;
  final Widget Function(T)? itemBuilder;
  final String Function(T)? itemTitleBuilder;

  String getTitle(T value) {
    return itemTitleBuilder?.call(value) ?? value.toString();
  }

  Widget getItemWidget(T value) {
    return itemBuilder?.call(value) ?? Text(getTitle(value));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: DropdownButtonFormField<T>(
          value: value,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: onChanged,
          menuMaxHeight: MediaQuery.of(context).size.height * 0.66,
          isExpanded: true,
          decoration: InputDecoration(
            hintText: title,
            labelText: title,
            contentPadding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
          ),
          borderRadius: BorderRadius.circular(8),
          dropdownColor: Theme.of(context).colorScheme.surface,
          selectedItemBuilder: (BuildContext context) {
            return items.map<DropdownMenuItem<T>>((T item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Row(
                  children: <Widget>[
                    getItemWidget(item),
                  ],
                ),
              );
            }).toList();
          },
          items: items.map<DropdownMenuItem<T>>((T item) {
            final bool isCurrent = item == value;

            return DropdownMenuItem<T>(
              value: item,
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
                    getItemWidget(item),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
      subtitle: subtitle,
      trailing: trailingIcon,
      dense: false,
      shape: Border(
        // draw top border when item is in the middle of other items, but they are not listtile
        top: drawTopBorder ? BorderSide(color: Theme.of(context).dividerColor, width: borderWidth) : BorderSide.none,
        // draw bottom border when item is among other listtiles, but not when it's the last one
        bottom: drawBottomBorder ? BorderSide(color: Theme.of(context).dividerColor, width: borderWidth) : BorderSide.none,
      ),
    );
  }
}

class SettingsBooruDropdown extends StatelessWidget {
  const SettingsBooruDropdown({
    required this.value,
    required this.onChanged,
    required this.title,
    this.drawTopBorder = false,
    this.drawBottomBorder = true,
    this.trailingIcon,
    super.key,
  });

  final Booru? value;
  final void Function(Booru?)? onChanged;
  final String title;
  final bool drawTopBorder;
  final bool drawBottomBorder;
  final Widget? trailingIcon;

  @override
  Widget build(BuildContext context) {
    final List<Booru> boorus = SettingsHandler.instance.booruList;

    return SettingsDropdown<Booru?>(
      value: value,
      items: boorus,
      onChanged: onChanged,
      title: title,
      drawTopBorder: drawTopBorder,
      drawBottomBorder: drawBottomBorder,
      trailingIcon: trailingIcon,
      itemBuilder: (Booru? booru) {
        return Row(
          children: <Widget>[
            if (booru == null)
              const Icon(null)
            else
              booru.type == BooruType.Favourites ? const Icon(Icons.favorite, color: Colors.red, size: 18) : Favicon(booru),
            Text(" ${booru?.name ?? ''}".trim()),
          ],
        );
      },
    );
  }
}

class SettingsTextInput extends StatefulWidget {
  const SettingsTextInput({
    required this.controller,
    required this.title,
    this.inputType = TextInputType.text,
    this.inputFormatters,
    this.validator,
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
    this.trailingIcon,
    this.onlyInput = false,
    super.key,
  });

  final TextEditingController controller;
  final String title;
  final TextInputType inputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
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
  final Widget? trailingIcon;
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
    setState(() {});
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
      final double valueWithStep = (double.tryParse(widget.controller.text) ?? 0) - widget.numberStep;
      final double newValue = valueWithStep >= widget.numberMin ? valueWithStep : widget.numberMin;
      widget.controller.text = newValue.toStringAsFixed(newValue.truncateToDouble() == newValue ? 0 : 1);
      onChangedCallback(widget.controller.text);
    }
  }

  void stepNumberUp() {
    if (widget.numberButtons) {
      final double valueWithStep = (double.tryParse(widget.controller.text) ?? 0) + widget.numberStep;
      final double newValue = valueWithStep <= widget.numberMax ? valueWithStep : widget.numberMax;
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
        if (widget.numberButtons && isFocused)
          Container(
            key: const Key('number-button-down'),
            child: buildNumberButton(stepNumberDown, Icons.remove),
          ),
        if (widget.numberButtons && isFocused)
          Container(
            key: const Key('number-button-up'),
            child: buildNumberButton(stepNumberUp, Icons.add),
          ),
        if (widget.clearable && isFocused)
          IconButton(
            key: const Key('clear-button'),
            icon: Icon(Icons.clear, color: Theme.of(context).colorScheme.onSurface),
            onPressed: () {
              widget.controller.clear();
              onChangedCallback(widget.controller.text);
            },
          ),
        if (widget.resetText != null)
          IconButton(
            key: const Key('reset-button'),
            icon: Icon(Icons.refresh, color: Theme.of(context).colorScheme.onSurface),
            onPressed: () {
              widget.controller.text = widget.resetText!();
              onChangedCallback(widget.controller.text);
            },
          ),
        if (isFocused)
          IconButton(
            key: const Key('submit-button'),
            icon: Icon(widget.onSubmitted != null ? Icons.send : Icons.done, color: Theme.of(context).colorScheme.onSurface),
            onPressed: () {
              if (widget.onSubmitted != null) {
                widget.onSubmitted?.call(widget.controller.text);
              }
              _focusNode.unfocus();
            },
          )
        else
          IconButton(
            key: const Key('edit-button'),
            icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.onSurface),
            onPressed: _focusNode.requestFocus,
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
          labelText: widget.title,
          hintText: widget.hintText,
          errorText: widget.validator?.call(widget.controller.text),
          contentPadding: const EdgeInsets.fromLTRB(12, 0, 15, 0),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 2, right: 10),
            child: buildSuffixIcons(),
          ),
        ),
      ),
    );

    if (widget.onlyInput) {
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
      ),
    );
  }
}

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({
    this.title,
    this.content,
    this.contentItems,
    this.actionButtons,
    this.titlePadding,
    this.contentPadding = const EdgeInsets.fromLTRB(16, 20, 16, 16),
    this.buttonPadding,
    this.insetPadding = const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
    this.borderRadius,
    this.backgroundColor,
    this.surfaceTintColor,
    this.scrollable = true,
    super.key,
  });

  final Widget? title;
  final Widget? content;
  final List<Widget>? contentItems;
  final List<Widget>? actionButtons;
  final EdgeInsets? titlePadding;
  final EdgeInsets contentPadding;
  final EdgeInsets? buttonPadding;
  final EdgeInsets insetPadding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? surfaceTintColor;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content ??
          SingleChildScrollView(
            child: ListBody(
              children: contentItems ?? [],
            ),
          ),
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
      surfaceTintColor: surfaceTintColor ?? Theme.of(context).colorScheme.surfaceTint,
      actions: actionButtons?.isNotEmpty == true ? actionButtons : null,
      titlePadding: titlePadding,
      contentPadding: contentPadding,
      buttonPadding: buttonPadding,
      insetPadding: insetPadding,
      shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(10)),
      scrollable: scrollable,
    );
  }
}

class SettingsBottomSheet extends StatelessWidget {
  const SettingsBottomSheet({
    this.title,
    this.content,
    this.contentItems,
    this.actionButtons,
    this.titlePadding,
    this.contentPadding = const EdgeInsets.fromLTRB(16, 0, 16, 16),
    this.buttonPadding,
    this.borderRadius,
    this.backgroundColor,
    this.showCloseButton = true,
    super.key,
  });

  final Widget? title;
  final Widget? content;
  final List<Widget>? contentItems;
  final List<Widget>? actionButtons;
  final EdgeInsets? titlePadding;
  final EdgeInsets contentPadding;
  final EdgeInsets? buttonPadding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final bool showCloseButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.surface,
        borderRadius: borderRadius ?? const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (title != null)
                Padding(
                  padding: titlePadding ?? const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: title,
                )
              else
                const SizedBox(height: 12),
              if (showCloseButton)
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 16, 0),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
            ],
          ),
          if (content != null)
            Padding(
              padding: contentPadding,
              child: content,
            ),
          if (contentItems != null)
            Flexible(
              child: Padding(
                padding: contentPadding,
                child: SingleChildScrollView(
                  child: ListBody(
                    children: contentItems ?? [],
                  ),
                ),
              ),
            ),
          if (actionButtons != null)
            Padding(
              padding: buttonPadding ?? const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actionButtons ?? [],
              ),
            ),
        ],
      ),
    );
  }
}

class SettingsPageDialog extends StatelessWidget {
  const SettingsPageDialog({
    this.title,
    this.content,
    this.actions,
    this.fab,
    super.key,
  });

  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final Widget? fab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // extendBody: true,
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: title,
        actions: [
          if ((actions?.length ?? 0) > 0)
            Row(
              // add separators between actions and after the last action
              children: actions
                      ?.map(
                        (e) => [
                          e,
                          const SizedBox(width: 8),
                        ],
                      )
                      .expand((e) => e)
                      .toList() ??
                  [],
            ),
        ],
      ),
      floatingActionButton: fab,
      body: SafeArea(
        child: content ?? Container(),
      ),
    );
  }
}
