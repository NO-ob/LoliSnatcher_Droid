import 'dart:io';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/ViewerHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';

enum Positions {
  bottom,
  top
}

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
    Positions position = Positions.bottom,
    bool asDialog = false,
  }) {
    bool inViewer = Get.find<ViewerHandler>().inViewer.value;
    if(!allowInViewer && inViewer) {
      return;
    }

    if(context == null && Get.context == null) {
      return;
    }

    bool isDesktop = Get.find<SettingsHandler>().appMode == 'Desktop' || Platform.isWindows || Platform.isLinux;
    bool isDark = Get.theme.brightness == Brightness.dark;

    FlashPosition flashPosition = position == Positions.bottom ? FlashPosition.bottom : FlashPosition.top;

    if(asDialog) {
      showDialog(context: context ?? Get.context!, builder: (context) {
        return SettingsDialog(
          titlePadding: const EdgeInsets.all(0),
          buttonPadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(0),
          insetPadding: const EdgeInsets.all(0),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          content: DefaultTextStyle(
            style: TextStyle(color: Get.theme.colorScheme.onBackground),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
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
              ),
            ),
          ),
        );
      });
      return;
    }

    showFlash(
      context: context ?? Get.context!,
      duration: duration,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          margin: (isDesktop && Get.mediaQuery.size.width > 500)
            ? EdgeInsets.symmetric(horizontal: Get.mediaQuery.size.width / 4, vertical: 0)
            : EdgeInsets.symmetric(horizontal: 20, vertical: kToolbarHeight * 1.1),
          behavior: !isDesktop ? FlashBehavior.floating : FlashBehavior.fixed,
          position: flashPosition,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: !isDesktop ? Radius.circular(8) : Radius.zero,
            bottomRight: !isDesktop ? Radius.circular(8) : Radius.zero,
          ),
          borderColor: isDark ? Colors.grey[800] : Colors.grey[300],
          boxShadows: kElevationToShadow[8],
          backgroundColor: Get.theme.colorScheme.background,
          onTap: tapToClose ? () => controller.dismiss() : null,
          forwardAnimationCurve: Curves.linearToEaseOut,
          reverseAnimationCurve: Curves.easeOutCirc,
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
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
              //     onPressed: () => controller.dismiss('Yes'),
              //     child: Text(inViewer.toString(), style: TextStyle(color: Get.theme.colorScheme.onBackground))
              //   ),
              //   TextButton(
              //     onPressed: () => controller.dismiss('No'),
              //     child: Text('NO', style: TextStyle(color: Get.theme.colorScheme.onBackground))
              //   ),
              // ],
            ),
          ),
        );
      },
    );
  }
}