import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    this.text = 'Cancel',
    this.action,
    this.returnData,
    this.withIcon = false,
    super.key,
  });

  final String text;
  final VoidCallback? action;
  final dynamic returnData;
  final bool withIcon;

  @override
  Widget build(BuildContext context) {
    if (withIcon) {
      return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
          foregroundColor: Colors.black,
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
        icon: Icon(withIcon ? Icons.cancel_outlined : null),
        label: Text(text),
      );
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
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
      child: Text(text),
    );
  }
}
