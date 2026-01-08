import 'package:flutter/material.dart';

import 'package:lolisnatcher/gen/strings.g.dart';

class RetryButton extends StatelessWidget {
  const RetryButton({
    this.text,
    this.onTap,
    this.onLongTap,
    this.withIcon = false,
    this.customIcon,
    super.key,
  });

  final String? text;
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final bool withIcon;
  final IconData? customIcon;

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
        onPressed: onTap,
        onLongPress: onLongTap,
        icon: Icon(withIcon ? (customIcon ?? Icons.refresh) : null),
        label: Text(text ?? context.loc.retry),
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
      onPressed: onTap,
      onLongPress: onLongTap,
      child: Text(text ?? context.loc.retry),
    );
  }
}
