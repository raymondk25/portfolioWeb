import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portofolio_web/components/mobile_desktop_view_builder.dart';
import 'package:portofolio_web/navigation_bar/navigation_bar_controller.dart';
import 'package:portofolio_web/portfolio/portfolio_view.dart';
import 'package:provider/provider.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: DrawerMobileView(), desktopView: SizedBox());
  }
}

class DrawerMobileView extends StatelessWidget {
  const DrawerMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationBarController navigationBarController =
        Get.put(NavigationBarController());
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();

    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Raymond Kurniawan Liputro'),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue, Colors.red]),
            ),
          ),
          ListTile(
            title: Text('Dark Mode'),
            trailing: Obx(
              () => Switch(
                  value: navigationBarController.isDarkMode.value,
                  onChanged: (value) => navigationBarController.darkMode()),
            ),
            onTap: () {},
          ),
          for (var item in navigationItems)
            ListTile(
              title: Text(item.text),
              onTap: () {
                scrollController.animateTo(item.position,
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.easeInOut);
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}
