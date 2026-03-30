import 'package:flutter/material.dart';

import 'package:lolisnatcher/gen/strings.g.dart';

class SaveAnywayButton extends StatelessWidget {
  const SaveAnywayButton({
    this.onTap,
    this.onLongTap,
    this.withIcon = false,
    super.key,
  });

  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final bool withIcon;

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
        icon: const Icon(Icons.refresh),
        label: Text(context.loc.mobileHome.saveAnyway),
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
      child: Text(context.loc.mobileHome.saveAnyway),
    );
  }
}
