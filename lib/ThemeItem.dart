import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeItem{
  String name;
  // Flutters Colors.color should be used instead of using Color(0xFFhexcolour) because it breaks the light/dark mode on the text and icons for some reason
  Color primary;
  Color accent;
  TextTheme text = TextTheme(
    headline5: GoogleFonts.quicksand(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: GoogleFonts.quicksand(fontSize: 36.0),
    bodyText2: GoogleFonts.quicksand(fontSize: 14.0),
    bodyText1: GoogleFonts.quicksand(fontSize: 14.0),
  );
  ThemeItem(this.name,this.primary,this.accent);
}