import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import 'package:lolisnatcher/src/data/theme_item.dart';

class ThemeHandler {
  ThemeHandler({
    required this.theme,
    required this.themeMode,
    required this.isAmoled,
  }) {
    final platformBrigtness = WidgetsBinding.instance.platformDispatcher.views.first.platformDispatcher.platformBrightness;
    isDark = themeMode == ThemeMode.dark || (themeMode == ThemeMode.system && platformBrigtness == Brightness.dark);

    final Brightness primaryBrightness =
        ThemeData.estimateBrightnessForColor((isDark ? darkDynamic : lightDynamic) != null ? colorScheme().primary : theme.primary!);
    primaryIsDark = primaryBrightness == Brightness.dark;
    final Brightness accentBrightness =
        ThemeData.estimateBrightnessForColor((isDark ? darkDynamic : lightDynamic) != null ? colorScheme().secondary : theme.accent!);
    accentIsDark = accentBrightness == Brightness.dark;
  }

  final ThemeItem theme;
  final ThemeMode themeMode;
  final bool isAmoled;
  ColorScheme? lightDynamic;
  ColorScheme? darkDynamic;

  bool isDark = true;
  bool primaryIsDark = true;
  bool accentIsDark = true;

  void setDynamicColors(ColorScheme? light, ColorScheme? dark) {
    lightDynamic = light;
    darkDynamic = dark;

    final platformBrigtness = WidgetsBinding.instance.platformDispatcher.views.first.platformDispatcher.platformBrightness;
    isDark = themeMode == ThemeMode.dark || (themeMode == ThemeMode.system && platformBrigtness == Brightness.dark);

    final Brightness primaryBrightness =
        ThemeData.estimateBrightnessForColor((isDark ? darkDynamic : lightDynamic) != null ? colorScheme().primary : theme.primary!);
    primaryIsDark = primaryBrightness == Brightness.dark;
    final Brightness accentBrightness =
        ThemeData.estimateBrightnessForColor((isDark ? darkDynamic : lightDynamic) != null ? colorScheme().secondary : theme.accent!);
    accentIsDark = accentBrightness == Brightness.dark;
  }

  ThemeData getTheme() {
    return isDark ? darkTheme() : lightTheme();
  }

  ThemeData lightTheme() {
    final ColorScheme lightColorScheme = colorScheme();

    return ThemeData.light(useMaterial3: true).copyWith(
      brightness: Brightness.light,
      appBarTheme: appBarTheme(lightColorScheme),
      colorScheme: lightColorScheme,
      textTheme: textTheme(),
      textSelectionTheme: textSelectionTheme(lightColorScheme),
      elevatedButtonTheme: elevatedButtonTheme(lightColorScheme),
      splashFactory: InkSparkle.splashFactory,
      applyElevationOverlayColor: true,
      buttonTheme: buttonTheme(lightColorScheme),
      cardColor: Color.lerp(lightColorScheme.surface, Colors.black, 0.04),
      dividerColor: lightColorScheme.onSurface.withOpacity(0.12),
      dialogBackgroundColor: lightColorScheme.surface,
      floatingActionButtonTheme: floatingActionButtonTheme(lightColorScheme),
      iconTheme: iconTheme(lightColorScheme),
      inputDecorationTheme: inputDecorationTheme(lightColorScheme),
      primaryIconTheme: iconTheme(lightColorScheme),
      primaryTextTheme: textTheme(),
      bannerTheme: bannerTheme(),
      cardTheme: cardTheme(lightColorScheme),
      pageTransitionsTheme: pageTransitionsTheme(),
      scrollbarTheme: scrollbarTheme(lightColorScheme),
      progressIndicatorTheme: progressIndicatorTheme(lightColorScheme),
      checkboxTheme: checkboxTheme(lightColorScheme),
      switchTheme: switchTheme(lightColorScheme),
      sliderTheme: sliderTheme(lightColorScheme),
      drawerTheme: drawerTheme(lightColorScheme),
      tabBarTheme: tabBarTheme(lightColorScheme),
      dropdownMenuTheme: dropdownMenuTheme(lightColorScheme),
    );
  }

  ThemeData darkTheme() {
    final ColorScheme darkColorScheme = colorScheme();

    return ThemeData.dark(useMaterial3: true).copyWith(
      brightness: Brightness.dark,
      appBarTheme: appBarTheme(darkColorScheme),
      scaffoldBackgroundColor: darkColorScheme.surface,
      colorScheme: darkColorScheme,
      textTheme: textTheme(),
      textSelectionTheme: textSelectionTheme(darkColorScheme),
      elevatedButtonTheme: elevatedButtonTheme(darkColorScheme),
      splashFactory: InkSparkle.splashFactory,
      applyElevationOverlayColor: true,
      buttonTheme: buttonTheme(darkColorScheme),
      cardColor: darkColorScheme.surface,
      dividerColor: darkColorScheme.onSurface.withOpacity(0.12),
      dialogBackgroundColor: darkColorScheme.surface,
      floatingActionButtonTheme: floatingActionButtonTheme(darkColorScheme),
      iconTheme: iconTheme(darkColorScheme),
      inputDecorationTheme: inputDecorationTheme(darkColorScheme),
      primaryIconTheme: iconTheme(darkColorScheme),
      primaryTextTheme: textTheme(),
      bannerTheme: bannerTheme(),
      cardTheme: cardTheme(darkColorScheme),
      pageTransitionsTheme: pageTransitionsTheme(),
      scrollbarTheme: scrollbarTheme(darkColorScheme),
      progressIndicatorTheme: progressIndicatorTheme(darkColorScheme),
      checkboxTheme: checkboxTheme(darkColorScheme),
      switchTheme: switchTheme(darkColorScheme),
      sliderTheme: sliderTheme(darkColorScheme),
      drawerTheme: drawerTheme(darkColorScheme),
      tabBarTheme: tabBarTheme(darkColorScheme),
      dropdownMenuTheme: dropdownMenuTheme(darkColorScheme),
    );
  }

  ColorScheme colorScheme() {
    if (isDark) {
      if (darkDynamic != null) {
        return darkDynamic!;
      }
    } else {
      if (lightDynamic != null) {
        return lightDynamic!;
      }
    }

    final brightness = isDark ? Brightness.dark : Brightness.light;
    final SchemeTonalSpot scheme = SchemeTonalSpot(
      sourceColorHct: Hct.fromInt(theme.accent!.value),
      isDark: brightness == Brightness.dark,
      contrastLevel: 0,
    );

    return ColorScheme.fromSeed(
      seedColor: theme.accent!,
      primary: theme.primary,
      onPrimary: primaryIsDark ? Colors.white : Colors.black,
      secondary: theme.accent,
      onSecondary: accentIsDark ? Colors.white : Colors.black,
      surface: (isDark && isAmoled) ? Colors.black : Color(scheme.background),
      onSurface: Color(scheme.onBackground),
      error: Colors.redAccent,
      onError: Colors.white,
      brightness: brightness,
    );
  }

  TextTheme textTheme() => GoogleFonts.notoSansTextTheme(isDark ? ThemeData.dark().textTheme : ThemeData.light().textTheme);

  TextSelectionThemeData textSelectionTheme(ColorScheme colorScheme) => TextSelectionThemeData(
        cursorColor: colorScheme.secondary,
        selectionColor: Colors.blue.withOpacity(0.66),
        selectionHandleColor: colorScheme.secondary,
      );

  ElevatedButtonThemeData elevatedButtonTheme(ColorScheme colorScheme) => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.secondary,
          foregroundColor: accentIsDark ? Colors.white : Colors.black,
          disabledForegroundColor: Colors.black,
          disabledBackgroundColor: Colors.grey,
          textStyle: TextStyle(
            color: accentIsDark ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          fixedSize: const Size(double.infinity, 44),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          splashFactory: InkSparkle.splashFactory,
        ),
      );

  AppBarTheme appBarTheme(ColorScheme colorScheme) => AppBarTheme(
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
        backgroundColor: colorScheme.primary,
        foregroundColor: primaryIsDark ? Colors.white : Colors.black,
        actionsIconTheme: IconThemeData(
          color: primaryIsDark ? Colors.white : Colors.black,
        ),
        iconTheme: IconThemeData(
          color: primaryIsDark ? Colors.white : Colors.black,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: (isDark ? Colors.black : Colors.white).withOpacity(0.25),
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
          statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        ),
      );

  ButtonThemeData buttonTheme(ColorScheme colorScheme) => ButtonThemeData(
        buttonColor: colorScheme.primary,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      );

  FloatingActionButtonThemeData floatingActionButtonTheme(ColorScheme colorScheme) => FloatingActionButtonThemeData(
        backgroundColor: colorScheme.secondary,
        foregroundColor: accentIsDark ? Colors.white : Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      );

  IconThemeData iconTheme(ColorScheme colorScheme) => IconThemeData(
        color: colorScheme.onSurface,
        opacity: 1,
        size: 22,
      );

  InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) => InputDecorationTheme(
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
          borderSide: BorderSide(color: colorScheme.secondary, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.secondary, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.error, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.error, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.secondary, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      );

  MaterialBannerThemeData bannerTheme() => const MaterialBannerThemeData(
        backgroundColor: Colors.red,
        contentTextStyle: TextStyle(color: Colors.white),
      );

  CardTheme cardTheme(ColorScheme colorScheme) => CardTheme(
        color: colorScheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      );

  PageTransitionsTheme pageTransitionsTheme() => const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(), // PredictiveBackPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
          TargetPlatform.linux: ZoomPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: ZoomPageTransitionsBuilder(),
        },
      );

  ScrollbarThemeData scrollbarTheme(ColorScheme colorScheme) => ScrollbarThemeData(
        thickness: WidgetStateProperty.resolveWith((states) {
          if (Platform.isAndroid || Platform.isIOS) {
            return 8;
          } else {
            final List<WidgetState> goodStates = [WidgetState.hovered, WidgetState.focused, WidgetState.pressed];
            for (final WidgetState state in states) {
              if (goodStates.contains(state)) {
                return 8;
              }
            }
            return 4;
          }
        }),
        interactive: true,
        thumbVisibility: WidgetStateProperty.resolveWith((states) {
          if (Platform.isAndroid || Platform.isIOS) {
            return true;
          } else {
            final List<WidgetState> goodStates = [WidgetState.hovered, WidgetState.focused, WidgetState.pressed];
            for (final WidgetState state in states) {
              if (goodStates.contains(state)) {
                return true;
              }
            }
            return false;
          }
        }),
        thumbColor: WidgetStateProperty.resolveWith((states) {
          final List<WidgetState> goodStates = [WidgetState.hovered, WidgetState.focused, WidgetState.pressed];
          Color color = isDark ? Colors.grey[300]! : Colors.grey[900]!;
          color = colorScheme.secondary;
          for (final WidgetState state in states) {
            if (goodStates.contains(state)) {
              return color.withOpacity(0.75);
            }
          }
          return color.withOpacity(0.5);
        }),
        radius: const Radius.circular(10),
      );

  ProgressIndicatorThemeData progressIndicatorTheme(ColorScheme colorScheme) => ProgressIndicatorThemeData(
        color: colorScheme.secondary,
        circularTrackColor: Colors.transparent,
        linearTrackColor: Colors.transparent,
        refreshBackgroundColor: null,
      );

  CheckboxThemeData checkboxTheme(ColorScheme colorScheme) => CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          final bool isHovered = states.contains(WidgetState.hovered);
          if (states.contains(WidgetState.selected)) {
            final Color color = colorScheme.secondary;
            return isHovered ? Color.lerp(color, Colors.black, 0.15)! : color;
          } else {
            return isHovered ? Colors.grey[600] : Colors.grey;
          }
        }),
        checkColor: WidgetStateProperty.all(accentIsDark ? Colors.white : Colors.black),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );

  SwitchThemeData switchTheme(ColorScheme colorScheme) => SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          final bool isHovered = states.contains(WidgetState.hovered);
          if (states.contains(WidgetState.selected)) {
            final Color color = colorScheme.secondary;
            return isHovered ? Color.lerp(color, Colors.black, 0.2)! : color;
          } else {
            return isHovered ? Colors.grey[600] : Colors.grey[500];
          }
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          final bool isHovered = states.contains(WidgetState.hovered);
          if (states.contains(WidgetState.selected)) {
            final Color color = Color.lerp(colorScheme.secondary, Colors.white, 0.3)!;
            return isHovered ? Color.lerp(color, Colors.black, 0.2)! : color;
          } else {
            return isHovered ? Colors.grey[400] : Colors.grey[300];
          }
        }),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );

  SliderThemeData sliderTheme(ColorScheme colorScheme) => SliderThemeData(
        activeTrackColor: colorScheme.secondary,
        thumbColor: colorScheme.secondary,
        inactiveTrackColor: isDark ? Colors.grey[900]! : Colors.grey[300]!,
      );

  DrawerThemeData drawerTheme(ColorScheme colorScheme) => DrawerThemeData(
        elevation: 0,
        backgroundColor: colorScheme.surface,
        scrimColor: Colors.black.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        endShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      );

  TabBarTheme tabBarTheme(ColorScheme colorScheme) => TabBarTheme(
        labelColor: colorScheme.secondary,
        unselectedLabelColor: isDark ? Colors.grey[300]! : Colors.grey[900]!,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
        indicatorSize: TabBarIndicatorSize.tab,
      );

  DropdownMenuThemeData dropdownMenuTheme(ColorScheme colorScheme) => DropdownMenuThemeData(
        menuStyle: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(colorScheme.surface),
        ),
      );
}
