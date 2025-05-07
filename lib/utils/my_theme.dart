import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      displayMedium: GoogleFonts.montserrat(color: Colors.white),
      displaySmall: GoogleFonts.montserrat(color: Colors.white),
      headlineMedium: GoogleFonts.montserrat(fontSize: 30, color: Colors.white),
      titleLarge: GoogleFonts.montserrat(fontSize: 20, color: Colors.white),
      titleMedium: GoogleFonts.montserrat(fontSize: 15, color: Colors.white),
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      displayMedium: GoogleFonts.montserrat(color: Colors.black),
      displaySmall: GoogleFonts.montserrat(color: Colors.black),
      headlineMedium: GoogleFonts.montserrat(fontSize: 30, color: Colors.black),
      titleLarge: GoogleFonts.montserrat(fontSize: 20, color: Colors.black),
      titleMedium: GoogleFonts.montserrat(fontSize: 16, color: Colors.black),
    ),
  );
}
