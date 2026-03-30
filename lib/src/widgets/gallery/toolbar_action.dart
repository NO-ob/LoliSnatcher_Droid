import 'package:flutter/material.dart';

class ToolbarAction extends StatelessWidget {
  const ToolbarAction({
    required this.icon,
    this.onTap,
    this.onLongTap,
    this.subIcon,
    this.stackWidget,
    this.tooltip,
    super.key,
  });

  final Widget icon;
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final Widget? subIcon;
  final Widget? stackWidget;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: onTap == null,
      child: GestureDetector(
        onLongPress: onLongTap,
        onSecondaryTap: onLongTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ?stackWidget,
            IconButton(
              icon: icon,
              color: onTap != null ? Colors.white : Theme.of(context).colorScheme.onSurface,
              onPressed: onTap,
              tooltip: tooltip,
            ),
            ?subIcon,
          ],
        ),
      ),
    );
  }
}
