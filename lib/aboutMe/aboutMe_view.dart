import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portofolio_web/components/desktop_view_builder.dart';
import 'package:portofolio_web/components/mobile_desktop_view_builder.dart';
import 'package:portofolio_web/utils/hover_extensions.dart';

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
            Image.asset(
              'images/aboutMe.jpg',
              height: isSmall ? imageWidth : 350,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Hi there! My name is Raymond Kurniawan Liptro. I\'m a Flutter developer from Indonesia.',
                      style: Theme.of(context).textTheme.headline4,
                      maxLines: 2,
                    ),
                    SizedBox(height: 15),
                    AutoSizeText(
                      'I enjoy taking complex problems and turning them into simple and beautiful interface design. Currently learning flutter to build mobile and web application. In Summer 2020, I gathered my first experiences working in startups company.',
                      style: Theme.of(context).textTheme.headline4,
                      maxLines: 5,
                    ),
                    SizedBox(height: 40),
                    FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        color: Colors.purple,
                        onPressed: null,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 17, horizontal: 15),
                          child: Row(children: [
                            Text(
                              'Download CV',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              maxLines: 1,
                            ),
                            Icon(Icons.download_rounded)
                          ]),
                        )).moveUpOnHover,
                  ],
                ),
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
    return Container();
  }
}
