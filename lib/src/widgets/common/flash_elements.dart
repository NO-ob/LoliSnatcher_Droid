import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flash/flash.dart';

import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

enum Positions { bottom, top }

class FlashElements {
  /// Shows a snackbar with a title, content and a leading icon, with a strip on the left side. Optionally can be used as a dialog.
  ///
  /// [context] - current build context, if no given - gets it from navigatorKey
  ///
  /// [title] - title of the tip
  ///
  /// [content] - content of the tip
  ///
  /// [sideColor] - color of the strip on the left side
  ///
  /// [leadingIcon] - icon on the left side
  ///
  /// [leadingIconColor] - leading icon color
  ///
  /// [leadingIconSize] - leading icon size
  ///
  /// [overrideLeadingIconWidget] - custom widget which will replace the leading icon
  ///
  /// [duration] - duration before animation is removed from the screen, set to null to leave until closed by user, 4 seconds by default
  ///
  /// [tapToClose] - should the tip close when tapped
  ///
  /// [shouldLeadingPulse] - should the leading icon pulse
  ///
  /// [allowInViewer] - should the tip open when user is in viewer
  ///
  /// [position] - position of the tip on the screen
  ///
  /// [asDialog] - should the tip be shown as a dialog
  ///
  /// [ignoreDesktopCheck] - should we ignore desktop specific style checks
  static FutureOr<void> showSnackbar({
    BuildContext? context,
    required Widget title,
    Widget content = const SizedBox(height: 20),
    Color sideColor = Colors.red,
    IconData? leadingIcon = Icons.info_outline,
    Color? leadingIconColor,
    double leadingIconSize = 36,
    Widget? overrideLeadingIconWidget,
    Duration? duration = const Duration(seconds: 4),
    bool tapToClose = true,
    bool shouldLeadingPulse = true,
    bool allowInViewer = true,
    Positions position = Positions.bottom,
    bool asDialog = false,
    bool ignoreDesktopCheck = false,
  }) async {
    // do nothing if in test mode
    if (Tools.isTestMode) return;

    bool inViewer = ViewerHandler.instance.inViewer.value;
    if (!allowInViewer && inViewer) {
      return;
    }

    if (context == null && NavigationHandler.instance.navigatorKey.currentContext == null) {
      return;
    }

    BuildContext contextToUse = context ?? NavigationHandler.instance.navigatorKey.currentContext!;
    // TODO can this cause an exception? maybe change to WidgetsBinding ?
    MediaQueryData mediaQueryData = MediaQuery.of(contextToUse);
    // Get theme here instead of inside the dialogs themselves, since the dialog could close after the page is changed
    // therefore causing an exception, because this context is not available anymore
    ThemeData themeData = Theme.of(contextToUse);

    bool isDesktop = !ignoreDesktopCheck && (SettingsHandler.instance.appMode.value.isDesktop || Platform.isWindows || Platform.isLinux);
    bool isDark = themeData.brightness == Brightness.dark;

    FlashPosition flashPosition = position == Positions.bottom ? FlashPosition.bottom : FlashPosition.top;

    if (asDialog) {
      return showModalFlash(
        context: contextToUse,
        builder: (context, controller) {
          return SettingsDialog(
            titlePadding: const EdgeInsets.all(0),
            buttonPadding: const EdgeInsets.all(0),
            contentPadding: const EdgeInsets.all(0),
            insetPadding: const EdgeInsets.all(0),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            content: DefaultTextStyle(
              style: TextStyle(color: themeData.colorScheme.onBackground),
              child: GestureDetector(
                onTap: tapToClose ? () => controller.dismiss() : null,
                child: FlashBar(
                  controller: controller,
                  title: title,
                  content: content,
                  indicatorColor: sideColor,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    side: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
                  ),
                  dismissDirections: const [],
                  shadowColor: Colors.black.withOpacity(0.4),
                  elevation: 8,
                  icon: overrideLeadingIconWidget ??
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Icon(
                          leadingIcon,
                          color: leadingIconColor ?? themeData.colorScheme.onBackground,
                          size: leadingIconSize,
                        ),
                      ),
                  shouldIconPulse: shouldLeadingPulse,
                ),
              ),
            ),
            actionButtons: null,
          );
        },
      );
    }

    return showFlash(
      context: contextToUse,
      duration: duration,
      persistent: true, // true - toast is not a part of navigation tree
      builder: (_, controller) {
        return Flash(
          controller: controller,
          position: flashPosition,
          forwardAnimationCurve: Curves.linearToEaseOut,
          reverseAnimationCurve: Curves.easeOutCirc,
          dismissDirections: const [
            FlashDismissDirection.startToEnd,
            FlashDismissDirection.endToStart,
          ],
          slideAnimationCreator: (
            BuildContext context,
            FlashPosition? position,
            Animation<double> parent,
            Curve curve,
            Curve? reverseCurve,
          ) {
            Animatable<Offset> animatable;
            if (position == FlashPosition.top) {
              animatable = Tween<Offset>(begin: Offset.zero, end: Offset.zero);
            } else if (position == FlashPosition.bottom) {
              animatable = Tween<Offset>(begin: Offset.zero, end: Offset.zero);
            } else {
              animatable = Tween<Offset>(begin: Offset.zero, end: Offset.zero);
            }
            return CurvedAnimation(
              parent: parent,
              curve: curve,
              reverseCurve: reverseCurve,
            ).drive(animatable);
          },
          child: DefaultTextStyle(
            style: TextStyle(color: themeData.colorScheme.onBackground),
            child: GestureDetector(
              onTap: tapToClose ? () => controller.dismiss() : null,
              child: FlashBar(
                title: title,
                content: content,
                indicatorColor: sideColor,
                controller: controller,
                margin: (isDesktop && mediaQueryData.size.width > 500)
                    ? EdgeInsets.symmetric(horizontal: mediaQueryData.size.width / 4, vertical: 0)
                    : const EdgeInsets.symmetric(horizontal: 20, vertical: kToolbarHeight * 1.1),
                behavior: !isDesktop ? FlashBehavior.floating : FlashBehavior.fixed,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(8),
                    topRight: const Radius.circular(8),
                    bottomLeft: !isDesktop ? const Radius.circular(8) : Radius.zero,
                    bottomRight: !isDesktop ? const Radius.circular(8) : Radius.zero,
                  ),
                  side: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
                ),
                shadowColor: Colors.black.withOpacity(0.4),
                elevation: 8,
                backgroundColor: themeData.colorScheme.background,
                icon: overrideLeadingIconWidget ??
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        leadingIcon,
                        color: leadingIconColor ?? themeData.colorScheme.onBackground,
                        size: leadingIconSize,
                      ),
                    ),
                shouldIconPulse: shouldLeadingPulse,
                primaryAction: IconButton(
                  onPressed: () => controller.dismiss(),
                  icon: Icon(Icons.close, color: themeData.colorScheme.onBackground),
                ),
                // actions: <Widget>[
                //   TextButton(
                //     onPressed: () => controller.dismiss('Yes'),
                //     child: Text(inViewer.toString(), style: TextStyle(color: theme.colorScheme.onBackground))
                //   ),
                //   TextButton(
                //     onPressed: () => controller.dismiss('No'),
                //     child: Text('NO', style: TextStyle(color: theme.colorScheme.onBackground))
                //   ),
                // ],
              ),
            ),
          ),
        );
      },
    );
  }
}
