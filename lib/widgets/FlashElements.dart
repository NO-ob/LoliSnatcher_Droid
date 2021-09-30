import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlashElements {
  static showSnackbar({
    BuildContext? context, // current build context, if no given - get it from Getx
    required Widget title, // title widget - required
    Widget content = const SizedBox(height: 20),
    Color sideColor = Colors.red, // color of the strip on the left side
    IconData? leadingIcon = Icons.info_outline, // icon on the left side
    Color? leadingIconColor, // icon color
    double leadingIconSize = 36, // icon size
    Widget? overrideLeadingIconWidget, // custom widget which will replace the icon
    Duration? duration = const Duration(seconds: 4), // set to null to leave until closed by user
    bool tapToClose = true, // close the tip by tapping anywhere on it
    bool shouldLeadingPulse = true, // should icon widget play pulse animation
    bool allowInViewer = true, // should tip open when user is in viewer
    FlashPosition position = FlashPosition.bottom,
  }) {
    if(!allowInViewer && Get.find<SearchHandler>().inViewer.value) {
      return;
    }

    showFlash(
      context: context ?? Get.context!,
      duration: duration,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          margin: (Get.find<SettingsHandler>().appMode == 'Desktop' && Get.mediaQuery.size.width > 500)
            ? EdgeInsets.symmetric(horizontal: Get.mediaQuery.size.width / 4)
            : EdgeInsets.zero,
          behavior: FlashBehavior.fixed,
          position: position,
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
              icon: overrideLeadingIconWidget ?? Padding(
                padding: EdgeInsets.all(12),
                child: Icon(
                  leadingIcon,
                  color: leadingIconColor ?? Get.theme.colorScheme.onBackground,
                  size: leadingIconSize,
                )
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