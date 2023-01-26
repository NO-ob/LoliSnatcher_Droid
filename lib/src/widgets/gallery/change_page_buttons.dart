import 'package:flutter/material.dart';

import 'package:preload_page_view/preload_page_view.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/long_press_repeater.dart';

class ChangePageButtons extends StatelessWidget {
  const ChangePageButtons({Key? key, required this.controller, required this.isPrev}) : super(key: key);
  final PreloadPageController? controller;
  final bool isPrev;

  void changePage(int direction) {
    if (controller?.hasClients ?? false) {
      controller!.jumpToPage(((controller!.page ?? 0) + direction).round());
    }
  }

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final int direction = isPrev ? -1 : 1;

    return LongPressRepeater(
      onStart: () {
        changePage(direction);
      },
      fasterAfter: 20,
      child: IconButton(
        icon: Icon(
          settingsHandler.galleryScrollDirection == 'Horizontal'
              ? (isPrev ? Icons.arrow_back : Icons.arrow_forward)
              : (isPrev ? Icons.arrow_upward : Icons.arrow_downward),
        ),
        // what idiot designed mirrored arrow icons with 1px of difference????????
        // padding: direction == 1 ? const EdgeInsets.fromLTRB(8, 8, 8, 8) : const EdgeInsets.fromLTRB(7, 8, 8, 8),
        // padding: direction == 1 ? const EdgeInsets.fromLTRB(8, 0, 8, 0) : const EdgeInsets.fromLTRB(7, 0, 8, 0),
        onPressed: () {
          changePage(direction);
        },
        // visualDensity: VisualDensity.comfortable,
        color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
      ),
    );
  }
}
