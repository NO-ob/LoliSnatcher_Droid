import 'package:flutter/material.dart';

import 'package:preload_page_view/preload_page_view.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/long_press_repeater.dart';

class ChangePageButtons extends StatelessWidget {
  const ChangePageButtons({
    required this.controller,
    required this.isPrev,
    super.key,
  });

  final PreloadPageController? controller;
  final bool isPrev;

  Future<void> changePage(int direction) async {
    if (controller?.hasClients ?? false) {
      if (controller!.page == null) return;

      if ((controller!.page! + direction) < 0) {
        // do a small overscroll instead of full page change
        await controller!.animateTo(
          0 - (controller!.position.viewportDimension / 3),
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
        return;
      }

      final double maxPages =
          controller!.position.maxScrollExtent /
          (controller!.position.viewportDimension * controller!.viewportFraction);
      if ((controller!.page! + direction) < 0 || (controller!.page! + direction) > maxPages) {
        // do a small overscroll instead of full page change
        await controller!.animateTo(
          controller!.position.maxScrollExtent + (controller!.position.viewportDimension / 3),
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
        return;
      }

      controller!.jumpToPage(((controller!.page ?? 0) + direction).round());
    }
  }

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final int direction = isPrev ? -1 : 1;

    return LongPressRepeater(
      onStart: () async => changePage(direction),
      fasterAfter: 20,
      child: IconButton(
        icon: Icon(
          settingsHandler.galleryScrollDirection.isHorizontal
              ? (isPrev ? Icons.arrow_back : Icons.arrow_forward)
              : (isPrev ? Icons.arrow_upward : Icons.arrow_downward),
        ),
        // what idiot designed mirrored arrow icons with 1px of difference????????
        // padding: direction == 1 ? const EdgeInsets.fromLTRB(8, 8, 8, 8) : const EdgeInsets.fromLTRB(7, 8, 8, 8),
        // padding: direction == 1 ? const EdgeInsets.fromLTRB(8, 0, 8, 0) : const EdgeInsets.fromLTRB(7, 0, 8, 0),
        onPressed: () async => changePage(direction),
        // visualDensity: VisualDensity.comfortable,
        color: Theme.of(context).iconTheme.color?.withValues(alpha: 0.5),
      ),
    );
  }
}
