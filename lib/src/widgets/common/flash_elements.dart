import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flash/flash.dart';

import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

export 'package:flash/flash.dart' show DefaultFlashController, FlashController, FlashPosition;

class FlashElements {
  // Controllers are either DefaultFlashController (has exposed dispose completer) or FlashController (no exposed dispose completer, used in dialog version)
  static Map<String, List<dynamic>> controllersMap = {};

  static void addController(String key, dynamic controller) {
    if (controllersMap.containsKey(key)) {
      if (controllersMap[key]!.every((c) => c.hashCode != controller.hashCode)) {
        controllersMap[key]!.add(controller);
      }
    } else {
      controllersMap[key] = [controller];
    }
  }

  static void removeController(String key, DefaultFlashController<void> controller) {
    if (controllersMap.containsKey(key)) {
      controllersMap[key]!.remove(controller);
    }
  }

  static void cleanAllDisposedControllers() {
    for (final controllers in controllersMap.values) {
      controllers.removeWhere(
        (c) => c is DefaultFlashController ? c.isDisposed : (c as FlashController).controller.isDismissed,
      );
    }
  }

  static bool keyHasActiveControllers(String key) {
    return controllersMap.containsKey(key) &&
        controllersMap[key]!.isNotEmpty &&
        controllersMap[key]!.any(
          (c) => c is DefaultFlashController ? !c.isDisposed : !(c as FlashController).controller.isDismissed,
        );
  }

  static Future<void> dismissAll() async {
    for (final controllers in controllersMap.values) {
      await Future.wait(
        controllers.map((c) async {
          try {
            return c.dismiss();
          } catch (_) {}
        }),
      );
    }
  }

  /// Shows a snackbar with a title, content and a leading icon, with a strip on the left side. Optionally can be used as a dialog.
  ///
  /// [title] - title of the tip, required
  ///
  /// [context] - current build context, if no given - gets it from navigatorKey
  ///
  /// [key] - key of the tip, used to dismiss tips of same type
  ///
  /// [isKeyUnique] - should the dialog of the same key be dismissed
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
  /// [duration] - duration before the tip is removed from the screen, set to null to not remove until closed by user, 4 seconds by default
  ///
  /// [tapToClose] - should the tip close when tapped
  ///
  /// [shouldLeadingPulse] - should the leading icon pulse
  ///
  /// [position] - position of the tip on the screen
  ///
  /// [asDialog] - should the tip be shown as a dialog
  ///
  /// [ignoreDesktopCheck] - should we ignore desktop specific style checks
  static FutureOr<void> showSnackbar({
    required Widget title,
    BuildContext? context,
    String? key,
    bool isKeyUnique = false,
    Widget content = const SizedBox(height: 20),
    Color sideColor = Colors.red,
    IconData? leadingIcon = Icons.info_outline,
    Color? leadingIconColor,
    double leadingIconSize = 36,
    Widget? overrideLeadingIconWidget,
    Duration? duration = const Duration(seconds: 4),
    bool tapToClose = true,
    bool shouldLeadingPulse = true,
    FlashPosition position = FlashPosition.bottom,
    bool asDialog = false,
    bool ignoreDesktopCheck = false,
    List<Widget>? Function(BuildContext, FlashController)? actionsBuilder,
    Widget? Function(BuildContext, FlashController)? primaryActionBuilder,
  }) async {
    // do nothing if in test mode
    if (Tools.isTestMode) {
      return;
    }

    if (context == null && NavigationHandler.instance.navigatorKey.currentContext == null) {
      return;
    }

    final BuildContext contextToUse = (context != null && context.mounted)
        ? context
        : NavigationHandler.instance.navContext;
    // TODO can this cause an exception? maybe change to WidgetsBinding ?
    final screenSize = MediaQuery.sizeOf(contextToUse);
    // Get theme here instead of inside the dialogs themselves, since the dialog could close after the page is changed
    // therefore causing an exception, because this context is not available anymore
    final ThemeData themeData = Theme.of(contextToUse);

    final bool isDesktop =
        !ignoreDesktopCheck && (SettingsHandler.instance.appMode.value.isDesktop || SettingsHandler.isDesktopPlatform);
    final bool isTooWide = screenSize.width > 500;
    final bool isDark = themeData.brightness == Brightness.dark;

    final String usedKey = key ?? (title is Text ? title.data : null) ?? uuid.v4();

    cleanAllDisposedControllers();
    if (isKeyUnique && keyHasActiveControllers(usedKey)) {
      bool found = false;
      final controllers = controllersMap[usedKey] ?? [];
      for (final c in controllers) {
        try {
          if (c is DefaultFlashController ? !c.isDisposed : !(c as FlashController).controller.isDismissed) {
            unawaited(c.dismiss());
            found = true;
          }
        } catch (_) {
          // exception (probably when accessing the animation controller when it's already disposed), try to dismiss
          try {
            unawaited(c.dismiss());
            found = true;
          } catch (_) {
            // if exception again - it's probably already dismissed/disposed
          }
        }
      }
      if (found) {
        // wait a bit to avoid overlapping
        await Future.delayed(const Duration(milliseconds: 300));
      }
    }

    if (asDialog) {
      return showModalFlash(
        context: contextToUse,
        builder: (context, controller) {
          addController(usedKey, controller);

          return SettingsDialog(
            titlePadding: EdgeInsets.zero,
            buttonPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.zero,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            content: DefaultTextStyle(
              style: TextStyle(color: themeData.colorScheme.onSurface),
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
                  shadowColor: Colors.black.withValues(alpha: 0.4),
                  elevation: 8,
                  icon:
                      overrideLeadingIconWidget ??
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Icon(
                          leadingIcon,
                          color: leadingIconColor ?? themeData.colorScheme.onSurface,
                          size: leadingIconSize,
                        ),
                      ),
                  shouldIconPulse: shouldLeadingPulse,
                  primaryAction: primaryActionBuilder != null
                      ? primaryActionBuilder(context, controller)
                      : _defaultPrimaryAction(themeData, controller),
                  actions: actionsBuilder != null ? actionsBuilder(context, controller) : null,
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
      builder: (context, controller) {
        addController(usedKey, controller);

        return FlashBar(
          title: title,
          controller: controller,
          position: position,
          forwardAnimationCurve: Curves.linearToEaseOut,
          reverseAnimationCurve: Curves.easeOutCirc,
          dismissDirections: const [
            FlashDismissDirection.startToEnd,
            FlashDismissDirection.endToStart,
          ],
          content: DefaultTextStyle(
            style: TextStyle(color: themeData.colorScheme.onSurface),
            child: GestureDetector(
              onTap: tapToClose ? () => controller.dismiss() : null,
              child: content,
            ),
          ),
          indicatorColor: sideColor,
          margin: (isDesktop && isTooWide)
              ? EdgeInsets.symmetric(horizontal: screenSize.width / 4, vertical: 0)
              : const EdgeInsets.symmetric(horizontal: 20, vertical: kToolbarHeight * 1.1),
          behavior: !isDesktop ? FlashBehavior.floating : FlashBehavior.fixed,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(8),
              topRight: const Radius.circular(8),
              bottomLeft: (isDesktop && isTooWide) ? Radius.zero : const Radius.circular(8),
              bottomRight: (isDesktop && isTooWide) ? Radius.zero : const Radius.circular(8),
            ),
            side: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
          ),
          shadowColor: Colors.black.withValues(alpha: 0.4),
          elevation: 8,
          backgroundColor: themeData.colorScheme.surface,
          icon:
              overrideLeadingIconWidget ??
              Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  leadingIcon,
                  color: leadingIconColor ?? themeData.colorScheme.onSurface,
                  size: leadingIconSize,
                ),
              ),
          shouldIconPulse: shouldLeadingPulse,
          primaryAction: primaryActionBuilder != null
              ? primaryActionBuilder(context, controller)
              : _defaultPrimaryAction(themeData, controller),
          actions: actionsBuilder != null ? actionsBuilder(context, controller) : null,
        );
      },
    );
  }
}

Widget _defaultPrimaryAction(
  ThemeData themeData,
  FlashController controller,
) {
  return Align(
    alignment: Alignment.topRight,
    child: Padding(
      padding: const EdgeInsets.only(
        top: 8,
        right: 8,
      ),
      child: IconButton(
        onPressed: () => controller.dismiss(),
        icon: Icon(
          Icons.close,
          color: themeData.colorScheme.onSurface,
        ),
      ),
    ),
  );
}
