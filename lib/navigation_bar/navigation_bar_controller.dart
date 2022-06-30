import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  var isDarkMode = false.obs;

  darkMode() async {
    isDarkMode.value = !isDarkMode.value;
    isDarkMode.value
        ? Get.changeTheme(ThemeData.dark())
        : Get.changeTheme(ThemeData.light());
  }
}
