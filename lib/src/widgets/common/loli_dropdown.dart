import 'dart:math';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/clear_button.dart';
import 'package:lolisnatcher/src/widgets/common/confirm_button.dart';

class LoliDropdown<T> extends StatelessWidget {
  const LoliDropdown({
    required this.value,
    required this.onChanged,
    required this.items,
    required this.itemBuilder,
    required this.selectedItemBuilder,
    required this.labelText,
    this.labelColor,
    this.labelStyle,
    this.labelBuilder,
    this.itemExtent,
    this.withBorder = true,
    this.clearable = false,
    this.expandableByScroll = false,
    super.key,
  });

  final T? value;
  final void Function(T?) onChanged;
  final List<T> items;
  final Widget Function(T?) itemBuilder;

  final Widget Function(T?) selectedItemBuilder;
  final String labelText;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final Widget Function()? labelBuilder;
  final double? itemExtent;
  final bool withBorder;
  final bool clearable;
  final bool expandableByScroll;

  Future<bool> showDialog(BuildContext context) async {
    final dynamic res = await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      isScrollControlled: true,
      isDismissible: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        if (expandableByScroll) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: ColoredBox(
              color: Colors.transparent,
              child: DraggableScrollableSheet(
                minChildSize: 0.3,
                initialChildSize: 0.7,
                maxChildSize: 1,
                shouldCloseOnMinExtent: true,
                builder: (context, controller) {
                  return LoliDropdownBottomSheet<T>(
                    controller: controller,
                    value: value,
                    onChanged: onChanged,
                    items: items,
                    itemBuilder: itemBuilder,
                    labelText: labelText,
                    itemExtent: itemExtent,
                    clearable: clearable,
                  );
                },
              ),
            ),
          );
        } else {
          return LoliDropdownBottomSheet<T>(
            value: value,
            onChanged: onChanged,
            items: items,
            itemBuilder: itemBuilder,
            labelText: labelText,
            itemExtent: itemExtent,
            clearable: clearable,
          );
        }
      },
    );

    if (res is bool) {
      return res;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    final theme = Theme.of(context);
    final inputDecoration = theme.inputDecorationTheme;

    final bool isDesktop = settingsHandler.appMode.value.isDesktop;
    final EdgeInsetsGeometry contentPadding = EdgeInsets.symmetric(horizontal: 12, vertical: isDesktop ? 2 : 12);

    const double radius = 10;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: withBorder ? const BorderRadius.all(Radius.circular(radius)) : null,
        onTap: () async {
          await showDialog(context);
        },
        child: InputDecorator(
          decoration: InputDecoration(
            label: labelBuilder?.call() ??
                RichText(
                  text: TextSpan(
                    style: labelStyle ??
                        inputDecoration.labelStyle?.copyWith(
                          color: labelColor ?? inputDecoration.labelStyle?.color,
                        ),
                    children: [
                      TextSpan(
                        text: labelText,
                      ),
                    ],
                  ),
                ),
            labelStyle: labelStyle ??
                inputDecoration.labelStyle?.copyWith(
                  color: labelColor ?? inputDecoration.labelStyle?.color,
                ),
            contentPadding: contentPadding,
            border: inputDecoration.border?.copyWith(
              borderSide: BorderSide(
                color: withBorder ? (inputDecoration.border?.borderSide.color ?? Colors.transparent) : Colors.transparent,
                width: 1,
              ),
            ),
            enabledBorder: inputDecoration.enabledBorder?.copyWith(
              borderSide: BorderSide(
                color: withBorder ? (inputDecoration.enabledBorder?.borderSide.color ?? Colors.transparent) : Colors.transparent,
                width: 1,
              ),
            ),
            focusedBorder: inputDecoration.focusedBorder?.copyWith(
              borderSide: BorderSide(
                color: withBorder ? (inputDecoration.focusedBorder?.borderSide.color ?? Colors.transparent) : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(child: selectedItemBuilder.call(value)),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_drop_down,
                color: theme.iconTheme.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoliDropdownBottomSheet<T> extends StatefulWidget {
  const LoliDropdownBottomSheet({
    required this.value,
    required this.onChanged,
    required this.items,
    required this.itemBuilder,
    required this.labelText,
    this.itemExtent,
    this.clearable = false,
    this.controller,
    super.key,
  });

  final T? value;
  final void Function(T?) onChanged;
  final List<T> items;
  final Widget Function(T) itemBuilder;
  final String labelText;
  final double? itemExtent;
  final bool clearable;
  final ScrollController? controller;

  @override
  State<LoliDropdownBottomSheet<T>> createState() => _LoliDropdownBottomSheet();
}

class _LoliDropdownBottomSheet<T> extends State<LoliDropdownBottomSheet<T>> {
  late final ScrollController scrollController;

  final List<GlobalKey> _keys = [];

  @override
  void initState() {
    super.initState();

    scrollController = widget.controller ?? ScrollController();

    _keys.addAll(List.generate(widget.items.length, (_) => GlobalKey()));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.value != null) {
        final index = widget.items.indexOf(widget.value as T);
        if (_keys[index].currentContext != null) {
          Scrollable.ensureVisible(
            _keys[index].currentContext!,
            alignment: 0.5,
          );
        } else if (widget.itemExtent != null) {
          scrollController.jumpTo(
            min(
              scrollController.position.maxScrollExtent,
              widget.itemExtent! * index,
            ),
          );
        }
      }
    });
  }

  void onItemSelect(T item) {
    if (widget.clearable && item == widget.value) {
      widget.onChanged(null);
    } else {
      widget.onChanged(item);
    }
    Navigator.of(context).pop(true);
  }

  Widget itemBuilder(BuildContext context, int index) {
    final item = widget.items[index];

    return Material(
      key: _keys[index],
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onItemSelect(item),
        child: Row(
          children: [
            Expanded(
              child: widget.itemBuilder(item),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final body = Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      // use more performant buidler when there are a lot of items,
      // but we lose ability to scroll to the selected item on first render
      child: widget.items.length > 500
          ? ListView.builder(
              controller: scrollController,
              shrinkWrap: widget.controller == null,
              itemCount: widget.items.length,
              itemExtent: widget.itemExtent,
              itemBuilder: itemBuilder,
            )
          : ListView(
              controller: scrollController,
              shrinkWrap: widget.controller == null,
              itemExtent: widget.itemExtent,
              children: List.generate(widget.items.length, (i) => itemBuilder(context, i)),
            ),
    );

    final bool isLeftHanded = SettingsHandler.instance.handSide.value.isLeft;

    List<Widget> actions = [
      const CancelButton(
        text: 'Return',
        withIcon: true,
        returnData: false,
      ),
      if (widget.clearable && widget.value != null)
        ClearButton(
          withIcon: true,
          action: () {
            widget.onChanged(null);
            Navigator.of(context).pop(true);
          },
        ),
    ];

    if (isLeftHanded) {
      actions = actions.reversed.toList();
    }

    return GestureDetector(
      // required to ignore taps on empty places inside the sheet while also allowing taps on the barrier
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      widget.labelText,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const CloseButton(),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 16),
            if (widget.controller == null) Flexible(child: body) else Expanded(child: body),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 12,
                      spacing: 12,
                      alignment: isLeftHanded ? WrapAlignment.start : WrapAlignment.end,
                      children: actions,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.paddingOf(context).bottom + 12),
          ],
        ),
      ),
    );
  }
}

//

class LoliMultiselectDropdown<T> extends StatelessWidget {
  const LoliMultiselectDropdown({
    required this.value,
    required this.onChanged,
    required this.items,
    required this.itemBuilder,
    required this.selectedItemBuilder,
    required this.labelText,
    this.labelColor,
    this.labelStyle,
    this.labelBuilder,
    this.withBorder = true,
    super.key,
  });

  final List<T> value;
  final void Function(List<T>) onChanged;
  final List<T> items;
  final Widget Function(T) itemBuilder;
  final Widget Function(List<T>) selectedItemBuilder;
  final String labelText;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final Widget Function()? labelBuilder;
  final bool withBorder;

  Future<bool> showDialog(BuildContext context) async {
    final dynamic res = await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      isScrollControlled: true,
      isDismissible: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(false),
          child: ColoredBox(
            color: Colors.transparent,
            child: DraggableScrollableSheet(
              minChildSize: 0.3,
              initialChildSize: 0.7,
              maxChildSize: 1,
              shouldCloseOnMinExtent: true,
              builder: (context, controller) {
                return LoliMultiselectDropdownBottomSheet<T>(
                  controller: controller,
                  value: value,
                  onChanged: onChanged,
                  items: items,
                  itemBuilder: itemBuilder,
                  labelText: labelText,
                );
              },
            ),
          ),
        );
      },
    );

    if (res is bool) {
      return res;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    final theme = Theme.of(context);
    final inputDecoration = theme.inputDecorationTheme;

    final bool isDesktop = settingsHandler.appMode.value.isDesktop;
    final EdgeInsetsGeometry contentPadding = EdgeInsets.symmetric(horizontal: 12, vertical: isDesktop ? 2 : 12);

    const double radius = 10;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: withBorder ? const BorderRadius.all(Radius.circular(radius)) : null,
        onTap: () async {
          await showDialog(context);
        },
        child: InputDecorator(
          decoration: InputDecoration(
            label: labelBuilder?.call() ??
                RichText(
                  text: TextSpan(
                    style: labelStyle ??
                        inputDecoration.labelStyle?.copyWith(
                          color: labelColor ?? inputDecoration.labelStyle?.color,
                        ),
                    children: [
                      TextSpan(
                        text: labelText,
                      ),
                    ],
                  ),
                ),
            labelStyle: labelStyle ??
                inputDecoration.labelStyle?.copyWith(
                  color: labelColor ?? inputDecoration.labelStyle?.color,
                ),
            contentPadding: contentPadding,
            border: inputDecoration.border?.copyWith(
              borderSide: BorderSide(
                color: withBorder ? (inputDecoration.border?.borderSide.color ?? Colors.transparent) : Colors.transparent,
                width: 1,
              ),
            ),
            enabledBorder: inputDecoration.enabledBorder?.copyWith(
              borderSide: BorderSide(
                color: withBorder ? (inputDecoration.enabledBorder?.borderSide.color ?? Colors.transparent) : Colors.transparent,
                width: 1,
              ),
            ),
            focusedBorder: inputDecoration.focusedBorder?.copyWith(
              borderSide: BorderSide(
                color: withBorder ? (inputDecoration.focusedBorder?.borderSide.color ?? Colors.transparent) : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(child: selectedItemBuilder.call(value)),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_drop_down,
                color: theme.iconTheme.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoliMultiselectDropdownBottomSheet<T> extends StatefulWidget {
  const LoliMultiselectDropdownBottomSheet({
    required this.value,
    required this.onChanged,
    required this.items,
    required this.itemBuilder,
    required this.labelText,
    this.controller,
    super.key,
  });

  final List<T> value;
  final void Function(List<T>) onChanged;
  final List<T> items;
  final Widget Function(T) itemBuilder;
  final String labelText;
  final ScrollController? controller;

  @override
  State<LoliMultiselectDropdownBottomSheet<T>> createState() => _LoliMultiselectDropdownBottomSheetState();
}

class _LoliMultiselectDropdownBottomSheetState<T> extends State<LoliMultiselectDropdownBottomSheet<T>> {
  late final List<T> value;

  @override
  void initState() {
    super.initState();

    value = [...widget.value];
  }

  void onItemSelect(T item) {
    if (value.contains(item)) {
      value.remove(item);
    } else {
      value.add(item);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isAllSelected = value.length == widget.items.length;

    List<Widget> actions = [
      const CancelButton(
        text: 'Return',
        withIcon: true,
        returnData: false,
      ),
      ClearButton(
        withIcon: true,
        action: () {
          value.clear();
          setState(() {});
        },
      ),
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: isAllSelected
            ? null
            : () {
                value.clear();
                value.addAll(widget.items);
                setState(() {});
              },
        icon: const Icon(Icons.select_all),
        label: const Text('Select all'),
      ),
      ConfirmButton(
        text: 'OK ${value.isEmpty ? '' : '(${value.length})'.trim()}',
        withIcon: true,
        action: () {
          widget.onChanged(value);
          Navigator.of(context).pop(true);
        },
      ),
    ];

    final bool isLeftHanded = SettingsHandler.instance.handSide.value.isLeft;
    if (isLeftHanded) {
      actions = actions.reversed.toList();
    }

    return GestureDetector(
      // required to ignore taps on empty places inside the sheet while also allowing taps on the barrier
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      widget.labelText,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const CloseButton(),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Scrollbar(
                controller: widget.controller,
                thumbVisibility: true,
                child: ListView.builder(
                  controller: widget.controller,
                  itemCount: widget.items.length,
                  itemBuilder: (context, index) {
                    final item = widget.items[index];
                    final int selectedIndex = value.indexOf(item);
                    final bool isSelected = selectedIndex != -1;

                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => onItemSelect(item),
                        child: Row(
                          children: [
                            Expanded(
                              child: widget.itemBuilder(item),
                            ),
                            if (isSelected)
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 4,
                                ),
                                child: Text((selectedIndex + 1).toString()),
                              ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: isSelected ? 4 : 8,
                                right: 16,
                              ),
                              child: Checkbox(
                                value: isSelected,
                                onChanged: (_) => onItemSelect(item),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 12,
                      spacing: 12,
                      alignment: isLeftHanded ? WrapAlignment.start : WrapAlignment.end,
                      children: actions,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.paddingOf(context).bottom + 12),
          ],
        ),
      ),
    );
  }
}
