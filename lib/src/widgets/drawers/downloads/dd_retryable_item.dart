import 'package:flutter/material.dart';

import 'package:lolisnatcher/gen/strings.g.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/widgets/common/retry_button.dart';
import 'package:lolisnatcher/src/widgets/common/save_anyway_button.dart';
import 'package:lolisnatcher/src/widgets/common/skip_button.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_build.dart';

enum RetryableItemType { exists, failed, cancelled }

class DDRetryableItem extends StatelessWidget {
  const DDRetryableItem({
    required this.record,
    required this.type,
    required this.handler,
    required this.onRetry,
    required this.onSkip,
    super.key,
  });

  final ({BooruItem item, Booru booru}) record;
  final RetryableItemType type;
  final BooruHandler handler;
  final void Function(bool isLongTap) onRetry;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final isExists = type == RetryableItemType.exists;
    final isFailed = type == RetryableItemType.failed;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: 100,
                height: 150,
                child: ThumbnailBuild(
                  item: record.item,
                  handler: handler,
                  selectable: false,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8,
                children: [
                  Text(
                    isExists
                        ? context.loc.mobileHome.fileAlreadyExists
                        : isFailed
                            ? context.loc.mobileHome.failedToDownload
                            : context.loc.mobileHome.cancelledByUser,
                  ),
                  if (isExists)
                    SaveAnywayButton(
                      withIcon: true,
                      onTap: () => onRetry(false),
                      onLongTap: () => onRetry(true),
                    )
                  else
                    RetryButton(
                      withIcon: true,
                      onTap: () => onRetry(false),
                      onLongTap: () => onRetry(true),
                    ),
                  SkipButton(
                    action: onSkip,
                    withIcon: true,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    );
  }
}
