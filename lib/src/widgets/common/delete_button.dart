import 'package:flutter/material.dart';

import 'package:lolisnatcher/gen/strings.g.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    this.action,
    this.returnData,
    this.withIcon = false,
    super.key,
  });

  final VoidCallback? action;
  final dynamic returnData;
  final bool withIcon;

  @override
  Widget build(BuildContext context) {
    if (withIcon) {
      return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          iconColor: Colors.white,
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
        icon: const Icon(Icons.delete_forever),
        label: Text(context.loc.delete),
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
      child: Text(context.loc.delete),
    );
  }
}
