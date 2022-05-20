import 'package:flutter/scheduler.dart' show SchedulerBinding;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ThemeItem.dart';

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
    onPrimaryIsDark = primaryBrightness == Brightness.dark;
    Brightness accentBrightness = ThemeData.estimateBrightnessForColor(theme.accent!);
    onAccentIsDark = accentBrightness == Brightness.dark;
  }

  final ThemeItem theme;
  final ThemeMode themeMode;
  final bool isAmoled;
  late bool isDark;
  late bool onPrimaryIsDark;
  late bool onAccentIsDark;

  ThemeData getTheme() {
    return isDark ? darkTheme() : lightTheme();
  }

  ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      primaryColor: theme.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme().primary,
        foregroundColor: colorScheme().onPrimary,
      ),

      colorScheme: colorScheme(),
      textTheme: textTheme(),
      textSelectionTheme: textSelectionTheme(),
      elevatedButtonTheme: elevatedButtonTheme(),

      useMaterial3: true,
      // androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
    );
  }

  ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: isAmoled ? Colors.black : null,
      backgroundColor: isAmoled ? Colors.black : null,
      canvasColor: isAmoled ? Colors.black : null,

      brightness: Brightness.dark,
      primaryColor: theme.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme().primary,
        foregroundColor: colorScheme().onPrimary,
      ),
      // appBarTheme: AppBarTheme(
      //   brightness: primaryBrightness,
      //   titleTextStyle: TextStyle(color: onPrimaryIsDark ? Colors.black : Colors.black),
      //   toolbarTextStyle: TextStyle(color: onPrimaryIsDark ? Colors.black : Colors.black),
      //   backgroundColor: theme.primary,
      //   foregroundColor: onPrimaryIsDark ? Colors.black : Colors.black,
      // ),

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
      // primaryIconTheme: iconTheme(),
      // primaryTextTheme: textTheme(),
      // primaryColorDark: colorScheme().onBackground,
      // primaryColorLight: colorScheme().onBackground,
      // buttonBarTheme: buttonBarTheme(),
      // bannerTheme: bannerTheme(),
      // cardTheme: cardTheme(),
      pageTransitionsTheme: pageTransitionsTheme(),
      // scrollbarTheme: scrollbarTheme(),
    );
  }

  ColorScheme colorScheme() {
    return ColorScheme(
      primary: theme.primary!,
      onPrimary: onPrimaryIsDark ? Colors.white : Colors.black,
      secondary: theme.accent!,
      onSecondary: onAccentIsDark ? Colors.white : Colors.black,
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
          onPrimary: onAccentIsDark ? Colors.white : Colors.black,
          onSurface: isDark ? Colors.white : Colors.black,
          textStyle: TextStyle(
            color: onAccentIsDark ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );

  ButtonThemeData buttonTheme() => ButtonThemeData(
        buttonColor: theme.primary!,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      );

  FloatingActionButtonThemeData floatingActionButtonTheme() => FloatingActionButtonThemeData(
        backgroundColor: theme.accent!,
        foregroundColor: onAccentIsDark ? Colors.white : Colors.black,
        elevation: 0,
        shape: const StadiumBorder(),
      );

  IconThemeData iconTheme() => IconThemeData(
        color: onPrimaryIsDark ? Colors.white : Colors.black,
        size: 24,
      );

  InputDecorationTheme inputDecorationTheme() => InputDecorationTheme(
        fillColor: theme.primary,
        filled: true,
        labelStyle: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
        },
      );

  ScrollbarThemeData scrollbarTheme() => ScrollbarThemeData(
        thickness: MaterialStateProperty.all<double>(2),
        interactive: true,
      );
}
