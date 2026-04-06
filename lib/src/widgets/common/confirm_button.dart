import 'package:flutter/material.dart';

import 'package:lolisnatcher/gen/strings.g.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    this.action,
    this.returnData = true,
    this.withIcon = false,
    this.label,
    super.key,
  });

  final VoidCallback? action;
  final dynamic returnData;
  final bool withIcon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    if (withIcon) {
      return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: () {
          if (action != null) {
            action?.call();
          } else {
            Navigator.of(context).pop(returnData);
          }
        },
        icon: const Icon(Icons.check),
        label: Text(label ?? context.loc.confirm),
      );
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: () {
        if (action != null) {
          action?.call();
        } else {
          Navigator.of(context).pop(returnData);
        }
      },
      child: Text(label ?? context.loc.confirm),
    );
  }
}
