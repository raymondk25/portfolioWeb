import 'package:get/get.dart';
import 'package:portofolio_web/utils/my_theme.dart';

class NavigationBarController extends GetxController {
  final isDarkMode = false.obs;

  void darkMode() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? MyTheme.darkTheme : MyTheme.lightTheme);
  }
}
