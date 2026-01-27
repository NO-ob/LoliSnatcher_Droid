import 'package:flutter/material.dart';

import 'package:lolisnatcher/gen/strings.g.dart';
import 'package:lolisnatcher/src/widgets/common/kaomoji.dart';

class DDEmptyState extends StatelessWidget {
  const DDEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Kaomoji(
            type: KaomojiType.shrug,
            style: TextStyle(fontSize: 40),
          ),
          Text(
            context.loc.settings.downloads.noItemsQueued,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
