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
    bool inViewer = ViewerHandler.instance.inViewer.value;
    if(!allowInViewer && inViewer) {
      return;
    }

    if(context == null && Get.context == null) {
      return;
    }

    BuildContext contextToUse = context ?? Get.context!;
    MediaQueryData mediaQueryData = MediaQuery.of(contextToUse);

    bool isDesktop = SettingsHandler.instance.appMode.value == AppMode.DESKTOP || Platform.isWindows || Platform.isLinux;
    bool isDark = Theme.of(contextToUse).brightness == Brightness.dark;

    FlashPosition flashPosition = position == Positions.bottom ? FlashPosition.bottom : FlashPosition.top;

    if(asDialog) {
      showDialog(context: contextToUse, builder: (context) {
        return SettingsDialog(
          titlePadding: const EdgeInsets.all(0),
          buttonPadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(0),
          insetPadding: const EdgeInsets.all(0),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          content: DefaultTextStyle(
            style: TextStyle(color: Theme.of(contextToUse).colorScheme.onBackground),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: FlashBar(
                title: title,
                content: content,
                indicatorColor: sideColor,
                icon: overrideLeadingIconWidget ?? Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    leadingIcon,
                    color: leadingIconColor ?? Theme.of(contextToUse).colorScheme.onBackground,
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
      context: contextToUse,
      duration: duration,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          margin: (isDesktop && mediaQueryData.size.width > 500)
            ? EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 4, vertical: 0)
            : const EdgeInsets.symmetric(horizontal: 20, vertical: kToolbarHeight * 1.1),
          behavior: !isDesktop ? FlashBehavior.floating : FlashBehavior.fixed,
          position: flashPosition,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(8),
            topRight: const Radius.circular(8),
            bottomLeft: !isDesktop ? const Radius.circular(8) : Radius.zero,
            bottomRight: !isDesktop ? const Radius.circular(8) : Radius.zero,
          ),
          borderColor: isDark ? Colors.grey[800] : Colors.grey[300],
          boxShadows: kElevationToShadow[8],
          backgroundColor: Theme.of(contextToUse).colorScheme.background,
          onTap: tapToClose ? () => controller.dismiss() : null,
          forwardAnimationCurve: Curves.linearToEaseOut,
          reverseAnimationCurve: Curves.easeOutCirc,
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: DefaultTextStyle(
            style: TextStyle(color: Theme.of(contextToUse).colorScheme.onBackground),
            child: FlashBar(
              title: title,
              content: content,
              indicatorColor: sideColor,
              icon: overrideLeadingIconWidget ?? Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  leadingIcon,
                  color: leadingIconColor ?? Theme.of(contextToUse).colorScheme.onBackground,
                  size: leadingIconSize,
                )
              ),
              shouldIconPulse: shouldLeadingPulse,
              primaryAction: IconButton(
                onPressed: () => controller.dismiss(),
                icon: Icon(Icons.close, color: Theme.of(contextToUse).colorScheme.onBackground),
              ),
              // actions: <Widget>[
              //   TextButton(
              //     onPressed: () => controller.dismiss('Yes'),
              //     child: Text(inViewer.toString(), style: TextStyle(color: Theme.of(contextToUse).colorScheme.onBackground))
              //   ),
              //   TextButton(
              //     onPressed: () => controller.dismiss('No'),
              //     child: Text('NO', style: TextStyle(color: Theme.of(contextToUse).colorScheme.onBackground))
              //   ),
              // ],
            ),
          ),
        );
      },
    );
  }
}