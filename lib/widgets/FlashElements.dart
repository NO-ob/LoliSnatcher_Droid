
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlashElements {
  static showSnackbar({
    required BuildContext context,
    required Widget title,
    Widget content = const SizedBox(height: 20),
    Color sideColor = Colors.red,
    IconData? leadingIcon = Icons.info_outline,
    Color? leadingIconColor,
    double leadingIconSize = 30,
    Widget? overrideLeadingIconWidget,
    Duration? duration = const Duration(seconds: 5), // set to null to leave until closed by user
    bool tapToClose = true,
    bool shouldLeadingPulse = true,
  }) {
    showFlash(
      context: context,
      duration: duration,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          margin: Get.find<SettingsHandler>().appMode == 'Desktop'
            ? EdgeInsets.symmetric(horizontal: Get.mediaQuery.size.width / 3)
            : EdgeInsets.zero,
          behavior: FlashBehavior.fixed,
          position: FlashPosition.bottom,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12)
          ),
          borderColor: Colors.transparent,
          boxShadows: kElevationToShadow[8],
          backgroundColor: Get.theme.colorScheme.background,
          onTap: tapToClose ? () => controller.dismiss() : null,
          forwardAnimationCurve: Curves.linearToEaseOut,
          reverseAnimationCurve: Curves.easeOutCirc,
          child: DefaultTextStyle(
            style: TextStyle(color: Get.theme.colorScheme.onBackground),
            child: FlashBar(
              title: title,
              content: content,
              indicatorColor: sideColor,
              icon: overrideLeadingIconWidget ?? Icon(
                leadingIcon,
                color: leadingIconColor ?? Get.theme.colorScheme.onBackground,
                size: leadingIconSize,
              ),
              shouldIconPulse: shouldLeadingPulse,
              primaryAction: IconButton(
                onPressed: () => controller.dismiss(),
                icon: Icon(Icons.close, color: Get.theme.colorScheme.onBackground),
              ),
              // actions: <Widget>[
              //   TextButton(
              //       onPressed: () => controller.dismiss('Yes, I do!'),
              //       child: Text('YES', style: TextStyle(color: Get.theme.colorScheme.onBackground))),
              //   TextButton(
              //       onPressed: () => controller.dismiss('No, I do not!'),
              //       child: Text('NO', style: TextStyle(color: Get.theme.colorScheme.onBackground))),
              // ],
            ),
          ),
        );
      },
    );
  }
}