import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
      primaryColor: Colors.amberAccent,
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: GoogleFonts.abel(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white)),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.zero,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 0.7, color: Colors.green)),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.red),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(primary: Colors.green, secondary: Colors.amberAccent));
}
