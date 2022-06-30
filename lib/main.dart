import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portofolio_web/portfolio/portfolio_view.dart';
import 'package:portofolio_web/utils/my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Raymond Portfolio Website',
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      home: PortfolioView(),
    );
  }
}
