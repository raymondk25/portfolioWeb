import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portofolio_web/aboutMe/aboutMe_body.dart';
import 'package:portofolio_web/components/desktop_view_builder.dart';
import 'package:portofolio_web/components/mobile_desktop_view_builder.dart';
import 'package:portofolio_web/components/mobile_view_builder.dart';

class AboutMe extends StatelessWidget {
  final bool isMobile;
  const AboutMe({
    Key key,
    this.isMobile = true,
  }) : super(key: key);
  static const title = 'About Me';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 850;
    final imageWidth = width * 0.35;
    return MobileDesktopViewBuilder(
        mobileView: AboutMeMobileView(),
        desktopView:
            AboutMeDesktopView(isSmall: isSmall, imageWidth: imageWidth));
  }
}

class AboutMeDesktopView extends StatelessWidget {
  const AboutMeDesktopView({
    Key key,
    @required this.isSmall,
    @required this.imageWidth,
  }) : super(key: key);

  final bool isSmall;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: AboutMe.title,
      children: [
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            FadeInRight(
              delay: Duration(milliseconds: 800),
              duration: Duration(milliseconds: 3300),
              child: Image.asset(
                'images/aboutMe3.jpg',
                height: isSmall ? imageWidth : 350,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AboutMeBody(isSmall: true),
              ),
            ),
          ],
        ),
        SizedBox(height: 100)
      ],
    );
  }
}

class AboutMeMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(titleText: AboutMe.title, children: [
      Image.asset('images/aboutMe3.jpg'),
      SizedBox(
        height: 10,
      ),
      AboutMeBody(isSmall: true),
      SizedBox(height: 70)
    ]);
  }
}
