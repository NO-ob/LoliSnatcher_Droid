import 'package:flutter/material.dart';

import 'package:lolisnatcher/gen/strings.g.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    this.action,
    this.returnData,
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
          backgroundColor: Colors.grey[300],
          foregroundColor: Colors.black,
          iconColor: Colors.black,
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
        icon: const Icon(Icons.keyboard_return_rounded),
        label: Text(label ?? context.loc.cancel),
      );
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
        iconColor: Colors.black,
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
      child: Text(label ?? context.loc.cancel),
    );
  }
}
