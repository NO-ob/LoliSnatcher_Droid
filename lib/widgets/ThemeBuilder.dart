import 'dart:io';

import 'package:flutter/scheduler.dart' show SchedulerBinding;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'package:LoliSnatcher/src/handlers/settings_handler.dart';
import 'package:LoliSnatcher/src/data/ThemeItem.dart';

class ThemeBuilder extends StatelessWidget {
  const ThemeBuilder({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    return Obx(() {
      ThemeItem theme = settingsHandler.theme.value.name == 'Custom'
          ? ThemeItem(
              name: 'Custom',
              primary: settingsHandler.customPrimaryColor.value,
              accent: settingsHandler.customAccentColor.value,
            )
          : settingsHandler.theme.value;
      ThemeMode themeMode = settingsHandler.themeMode.value;
      bool isAmoled = settingsHandler.isAmoled.value;

      final ThemeHandler themeHandler = ThemeHandler(
        theme: theme,
        themeMode: themeMode,
        isAmoled: isAmoled,
      );

      return Theme(
        data: themeHandler.isDark ? themeHandler.darkTheme() : themeHandler.lightTheme(),
        child: child,
      );
    });
  }
}

class ThemeHandler {
  ThemeHandler({
    required this.theme,
    required this.themeMode,
    required this.isAmoled,
  }) {
    isDark = themeMode == ThemeMode.dark || (themeMode == ThemeMode.system && SchedulerBinding.instance.window.platformBrightness == Brightness.dark);

    Brightness primaryBrightness = ThemeData.estimateBrightnessForColor(theme.primary!);
    primaryIsDark = primaryBrightness == Brightness.dark;
    Brightness accentBrightness = ThemeData.estimateBrightnessForColor(theme.accent!);
    accentIsDark = accentBrightness == Brightness.dark;
  }

  final ThemeItem theme;
  final ThemeMode themeMode;
  final bool isAmoled;
  late bool isDark;
  late bool primaryIsDark;
  late bool accentIsDark;

  ThemeData getTheme() {
    return isDark ? darkTheme() : lightTheme();
  }

  ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      primaryColor: theme.primary,
      appBarTheme: appBarTheme(),

      colorScheme: colorScheme(),
      textTheme: textTheme(),
      textSelectionTheme: textSelectionTheme(),
      elevatedButtonTheme: elevatedButtonTheme(),

      useMaterial3: true,
      // androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,

      // TODO fill as much objects here as possible
      // TODO maybe add custom extensions, since google added them in flutter3?

      applyElevationOverlayColor: true,
      buttonTheme: buttonTheme(),
      cardColor: colorScheme().background,
      // dividerColor: colorScheme().onBackground,
      dialogBackgroundColor: colorScheme().background,
      errorColor: colorScheme().error,
      floatingActionButtonTheme: floatingActionButtonTheme(),
      iconTheme: iconTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      primaryIconTheme: iconTheme(),
      primaryTextTheme: textTheme(),
      primaryColorDark: colorScheme().onBackground,
      primaryColorLight: colorScheme().onBackground,
      buttonBarTheme: buttonBarTheme(),
      bannerTheme: bannerTheme(),
      cardTheme: cardTheme(),
      pageTransitionsTheme: pageTransitionsTheme(),
      scrollbarTheme: scrollbarTheme(),
      progressIndicatorTheme: progressIndicatorTheme(),
      checkboxTheme: checkboxTheme(),
      switchTheme: switchTheme(),
    );
  }

  ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      primaryColor: theme.primary,
      appBarTheme: appBarTheme(),

      scaffoldBackgroundColor: isAmoled ? Colors.black : null,
      backgroundColor: isAmoled ? Colors.black : null,
      canvasColor: isAmoled ? Colors.black : null,

      colorScheme: colorScheme(),
      textTheme: textTheme(),
      textSelectionTheme: textSelectionTheme(),
      elevatedButtonTheme: elevatedButtonTheme(),

      useMaterial3: true,
      // androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,

      // TODO fill as much objects here as possible
      // TODO maybe add custom extensions, since google added them in flutter3?

      applyElevationOverlayColor: true,
      buttonTheme: buttonTheme(),
      cardColor: colorScheme().background,
      // dividerColor: colorScheme().onBackground,
      dialogBackgroundColor: colorScheme().background,
      errorColor: colorScheme().error,
      floatingActionButtonTheme: floatingActionButtonTheme(),
      iconTheme: iconTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      primaryIconTheme: iconTheme(),
      primaryTextTheme: textTheme(),
      primaryColorDark: colorScheme().onBackground,
      primaryColorLight: colorScheme().onBackground,
      buttonBarTheme: buttonBarTheme(),
      bannerTheme: bannerTheme(),
      cardTheme: cardTheme(),
      pageTransitionsTheme: pageTransitionsTheme(),
      scrollbarTheme: scrollbarTheme(),
      progressIndicatorTheme: progressIndicatorTheme(),
      checkboxTheme: checkboxTheme(),
      switchTheme: switchTheme(),
    );
  }

  ColorScheme colorScheme() {
    return ColorScheme(
      primary: theme.primary!,
      onPrimary: primaryIsDark ? Colors.white : Colors.black,
      secondary: theme.accent!,
      onSecondary: accentIsDark ? Colors.white : Colors.black,
      surface: isDark ? Colors.grey[900]! : Colors.grey[300]!,
      onSurface: isDark ? Colors.white : Colors.black,
      background: isDark ? Colors.black : Colors.white,
      onBackground: isDark ? Colors.white : Colors.black,
      error: Colors.redAccent,
      onError: Colors.white,
      brightness: isDark ? Brightness.dark : Brightness.light,
    );
  }

  TextTheme textTheme() => GoogleFonts.notoSansTextTheme(isDark ? ThemeData.dark().textTheme : ThemeData.light().textTheme);

  TextSelectionThemeData textSelectionTheme() => TextSelectionThemeData(
        cursorColor: theme.accent,
        selectionColor: Colors.blue.withOpacity(0.66),
        selectionHandleColor: theme.accent,
      );

  ElevatedButtonThemeData elevatedButtonTheme() => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: theme.accent!,
          onPrimary: accentIsDark ? Colors.white : Colors.black,
          onSurface: isDark ? Colors.white : Colors.black,
          textStyle: TextStyle(
            color: accentIsDark ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );

  AppBarTheme appBarTheme() => AppBarTheme(
        titleTextStyle: TextStyle(
          color: primaryIsDark ? Colors.white : Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        toolbarTextStyle: TextStyle(
          color: primaryIsDark ? Colors.white : Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: theme.primary,
        foregroundColor: primaryIsDark ? Colors.white : Colors.black,
      );

  ButtonThemeData buttonTheme() => ButtonThemeData(
        buttonColor: theme.primary!,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      );

  FloatingActionButtonThemeData floatingActionButtonTheme() => FloatingActionButtonThemeData(
        backgroundColor: theme.accent!,
        foregroundColor: accentIsDark ? Colors.white : Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      );

  IconThemeData iconTheme() => IconThemeData(
        color: colorScheme().onBackground,
        size: 24,
      );

  InputDecorationTheme inputDecorationTheme() => InputDecorationTheme(
        fillColor: isDark ? Colors.grey[900]! : Colors.grey[300]!,
        filled: false,
        labelStyle: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          color: isDark ? Colors.grey[300] : Colors.grey[900],
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        alignLabelWithHint: false,
        // contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.accent!, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.accent!, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme().error, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme().error, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.accent!, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      );

  ButtonBarThemeData buttonBarTheme() => const ButtonBarThemeData(
        buttonTextTheme: ButtonTextTheme.primary,
        buttonMinWidth: 120,
        buttonHeight: 48,
        alignment: MainAxisAlignment.spaceBetween,
      );

  MaterialBannerThemeData bannerTheme() => const MaterialBannerThemeData(
        backgroundColor: Colors.red,
        contentTextStyle: TextStyle(color: Colors.white),
      );

  CardTheme cardTheme() => CardTheme(
        color: colorScheme().background,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      );

  PageTransitionsTheme pageTransitionsTheme() => const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
          TargetPlatform.linux: ZoomPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: ZoomPageTransitionsBuilder(),
        },
      );

  ScrollbarThemeData scrollbarTheme() => ScrollbarThemeData(
        thickness: MaterialStateProperty.resolveWith((states) {
          if (Platform.isAndroid || Platform.isIOS) {
            return 8;
          } else {
            List<MaterialState> goodStates = [MaterialState.hovered, MaterialState.focused, MaterialState.pressed];
            for (MaterialState state in states) {
              if (goodStates.contains(state)) {
                return 8;
              }
            }
            return 4;
          }
        }),
        interactive: true,
        thumbVisibility: MaterialStateProperty.resolveWith((states) {
          if (Platform.isAndroid || Platform.isIOS) {
            return true;
          } else {
            List<MaterialState> goodStates = [MaterialState.hovered, MaterialState.focused, MaterialState.pressed];
            for (MaterialState state in states) {
              if (goodStates.contains(state)) {
                return true;
              }
            }
            return false;
          }
        }),
        thumbColor: MaterialStateProperty.resolveWith((states) {
          List<MaterialState> goodStates = [MaterialState.hovered, MaterialState.focused, MaterialState.pressed];
          Color color = isDark ? Colors.grey[300]! : Colors.grey[900]!;
          color = theme.accent!;
          for (MaterialState state in states) {
            if (goodStates.contains(state)) {
              return color.withOpacity(0.75);
            }
          }
          return color.withOpacity(0.5);
        }),
        radius: const Radius.circular(10),
      );

  ProgressIndicatorThemeData progressIndicatorTheme() => ProgressIndicatorThemeData(
        color: theme.accent!,
        circularTrackColor: Colors.transparent,
        linearTrackColor: Colors.transparent,
        refreshBackgroundColor: null,
      );

  CheckboxThemeData checkboxTheme() => CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          bool isHovered = states.contains(MaterialState.hovered);
          if (states.contains(MaterialState.selected)) {
            Color color = theme.accent!;
            color = isHovered ? Color.lerp(color, Colors.black, 0.15)! : color;
            return color;
          } else {
            return isHovered ? Colors.grey[600] : Colors.grey;
          }
        }),
        checkColor: MaterialStateProperty.all(accentIsDark ? Colors.white : Colors.black),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );

    SwitchThemeData switchTheme() => SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          bool isHovered = states.contains(MaterialState.hovered);
          if (states.contains(MaterialState.selected)) {
            Color color = theme.accent!;
            color = isHovered ? Color.lerp(color, Colors.black, 0.2)! : color;
            return color;
          } else {
            return isHovered ? Colors.grey[600] : Colors.grey[500];
          }
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          bool isHovered = states.contains(MaterialState.hovered);
          if (states.contains(MaterialState.selected)) {
            Color color = Color.lerp(theme.accent!, Colors.white, 0.3)!;
            color = isHovered ? Color.lerp(color, Colors.black, 0.2)! : color;
            return color;
          } else {
            return isHovered ? Colors.grey[400] : Colors.grey[300];
          }
        }),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
}
