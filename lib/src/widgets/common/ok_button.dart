import 'package:flutter/material.dart';

class OkButton extends StatelessWidget {
  const OkButton({
    this.action,
    this.returnData = true,
    this.withIcon = false,
    this.count,
    super.key,
  });

  final VoidCallback? action;
  final dynamic returnData;
  final bool withIcon;
  final int? count;

  @override
  Widget build(BuildContext context) {
    final String label = count == null || count == 0 ? 'OK' : 'OK ($count)';

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
        label: Text(label),
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
      child: Text(label),
    );
  }
}
