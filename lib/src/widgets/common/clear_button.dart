import 'package:flutter/material.dart';

import 'package:lolisnatcher/gen/strings.g.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({
    this.text,
    this.action,
    this.returnData = 'clear',
    this.withIcon = false,
    super.key,
  });

  final String? text;
  final VoidCallback? action;
  final dynamic returnData;
  final bool withIcon;

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
        icon: Icon(withIcon ? Icons.delete_forever : null),
        label: Text(text ?? context.loc.clear),
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
      child: Text(text ?? context.loc.clear),
    );
  }
}
