import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio_web/portfolio/portfolio_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Raymond Portfolio Website',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline2: GoogleFonts.montserrat(color: Colors.black),
          headline3: GoogleFonts.montserrat(color: Colors.black),
          headline4: GoogleFonts.montserrat(fontSize: 30, color: Colors.black),
          headline5: GoogleFonts.montserrat(color: Colors.black),
          headline6: GoogleFonts.montserrat(fontSize: 15, color: Colors.black),
        ),
      ),
      home: PortfolioView(),
    );
  }
}
