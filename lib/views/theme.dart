import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: dark,
      accentColor: darkAccent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: darkAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    scaffoldBackgroundColor: dark[500],
    useMaterial3: true,
    textTheme: GoogleFonts.robotoTextTheme(
        TextTheme(
        displayLarge: const TextStyle(
          fontSize: 93,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
        ),
        displayMedium: const TextStyle(
          fontSize: 58,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
        ),
        displaySmall:const  TextStyle(
          fontSize: 46,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.25,
          color: Colors.white,
        ),
        headlineSmall:const  TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        titleLarge:const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: Colors.white,
        ),
        titleMedium:const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          color: Colors.white,
          // color: dark[200],
        ),
        titleSmall: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: dark[200],
        ),
        bodyLarge: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        bodyMedium: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        labelLarge: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
        bodySmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        labelSmall: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
      ),
    ),
  );
}

 const MaterialColor dark = MaterialColor(_darkPrimaryValue, <int, Color>{
  50: Color(0xFFE5E6E6),
  100: Color(0xFFBEBFC1),
  200: Color(0xFF939598),
  300: Color(0xFF686B6E),
  400: Color(0xFF474B4F),
  500: Color(_darkPrimaryValue),
  600: Color(0xFF23262B),
  700: Color(0xFF1D2024),
  800: Color(0xFF171A1E),
  900: Color(0xFF0E1013),
});
 const int _darkPrimaryValue = 0xFF272B30;

 const MaterialColor darkAccent = MaterialColor(_darkAccentValue, <int, Color>{
  100: Color(0xFFEF233C),
  200: Color(_darkAccentValue),
  400: Color(0xFFEF233C),
  700: Color(0xFFEF233C),
});
 const int _darkAccentValue = 0xFFEF233C;