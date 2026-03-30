import 'package:flutter/material.dart';

import 'package:lolisnatcher/gen/strings.g.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_build.dart';

class DDQueuedItem extends StatelessWidget {
  const DDQueuedItem({
    required this.queue,
    required this.queueIndex,
    required this.handler,
    super.key,
  });

  final SnatchItem queue;
  final int queueIndex;
  final BooruHandler handler;

  @override
  Widget build(BuildContext context) {
    final firstItem = queue.booruItems.first;
    final lastItem = queue.booruItems.last;

    return Row(
      children: [
        Stack(
          children: [
            if (firstItem != lastItem) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: SizedBox(
                  width: 100,
                  height: 134,
                  child: ThumbnailBuild(
                    item: lastItem,
                    handler: handler,
                    selectable: false,
                  ),
                ),
              ),
            ],
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: 100,
                height: 150,
                child: ThumbnailBuild(
                  item: firstItem,
                  handler: handler,
                  selectable: false,
                ),
              ),
            ),
          ],
        ),
        Text(
          queue.booruItems.length == 1
              ? '${context.loc.item} #$queueIndex'
              : '${context.loc.settings.downloads.batch} #$queueIndex (${queue.booruItems.length})',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
