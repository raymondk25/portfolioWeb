import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      headline2: GoogleFonts.montserrat(color: Colors.white),
      headline3: GoogleFonts.montserrat(color: Colors.white),
      headline4: GoogleFonts.montserrat(fontSize: 30, color: Colors.white),
      headline5: GoogleFonts.montserrat(fontSize: 20, color: Colors.white),
      headline6: GoogleFonts.montserrat(fontSize: 15, color: Colors.white),
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      headline2: GoogleFonts.montserrat(color: Colors.black),
      headline3: GoogleFonts.montserrat(color: Colors.black),
      headline4: GoogleFonts.montserrat(fontSize: 30, color: Colors.black),
      headline5: GoogleFonts.montserrat(fontSize: 20, color: Colors.black),
      headline6: GoogleFonts.montserrat(fontSize: 16, color: Colors.black),
    ),
  );
}
