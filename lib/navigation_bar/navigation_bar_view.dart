import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portofolio_web/components/mobile_desktop_view_builder.dart';
import 'package:portofolio_web/constants.dart';
import 'package:portofolio_web/navigation_bar/navigation_bar_controller.dart';
import 'package:portofolio_web/portfolio/portfolio_view.dart';
import 'dart:html' as html;

import 'package:provider/provider.dart';

class NavigationBarView extends StatelessWidget {
  const NavigationBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: NavigationMobileView(),
        desktopView: NavigationDesktopView());
  }
}

class NavigationDesktopView extends StatelessWidget {
  const NavigationDesktopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationBarController navigationBarController =
        Get.put(NavigationBarController());
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();

    return Container(
      height: 100,
      width: 1200,
      child: Padding(
        padding: kScreenPadding,
        child: Row(
          children: [
            Obx(
              () => GestureDetector(
                onTap: () =>
                    html.window.open('https://raymondk25.me/', '_self'),
                child: navigationBarController.isDarkMode.value
                    ? Image.asset(
                        'images/navbar_logo_dm.png',
                        height: 36,
                      )
                    : Image.asset(
                        'images/navbar_logo.png',
                        height: 36,
                      ),
              ),
            ),
            Spacer(),
            for (var item in navigationItems)
              NavigationBarItem(
                  onPressed: () {
                    scrollController.animateTo(item.position,
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.easeInOut);
                  },
                  text: item.text),
            SizedBox(
              width: 50,
            ),
            Obx(
              () => GestureDetector(
                  onTap: () => navigationBarController.darkMode(),
                  child: navigationBarController.isDarkMode.value
                      ? Icon(Icons.dark_mode)
                      : Icon(Icons.light_mode)),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationMobileView extends StatelessWidget {
  // Making the controller final
  final NavigationBarController navigationBarController;

  NavigationMobileView({Key? key})
      : navigationBarController = Get.put(NavigationBarController()),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(width: 20),
          Obx(
            () => GestureDetector(
              onTap: () => html.window.open('https://raymondk25.me/', '_self'),
              child: navigationBarController.isDarkMode.value
                  ? Image.asset(
                      'images/navbar_logo_dm.png',
                      height: 36,
                    )
                  : Image.asset(
                      'images/navbar_logo.png',
                      height: 36,
                    ),
            ),
          ),
          Spacer(),
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer())
        ],
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 725;
    return Container(
      padding: const EdgeInsets.only(left: 49),
      child: InkWell(
        onTap: onPressed,
        mouseCursor: MouseCursor.defer, // Updated from MaterialStateMouseCursor
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          text,
          style: TextStyle(fontSize: isSmall ? 17 : 24),
        ),
      ),
    );
  }
}
