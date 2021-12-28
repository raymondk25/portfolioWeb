import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portofolio_web/components/mobile_desktop_view_builder.dart';
import 'package:portofolio_web/constants.dart';
import 'package:portofolio_web/header/header_body.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 850;
    final imageWidth = width * 0.45;
    return MobileDesktopViewBuilder(
        mobileView: HeaderMobileView(),
        desktopView:
            HeaderDesktopView(isSmall: isSmall, imageWidth: imageWidth));
  }
}

class HeaderDesktopView extends StatelessWidget {
  const HeaderDesktopView({
    Key key,
    @required this.isSmall,
    @required this.imageWidth,
  }) : super(key: key);

  final bool isSmall;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 864,
      width: kInitWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Expanded(
              child: HeaderBody(),
            ),
            FadeInLeftBig(
              delay: Duration(milliseconds: 300),
              duration: Duration(milliseconds: 3300),
              child: Image.asset(
                'images/header.png',
                height: isSmall ? imageWidth : 400,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeaderMobileView extends StatelessWidget {
  const HeaderMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.85,
      width: width * 0.85,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          Expanded(
              child: Image.asset(
            'images/header.png',
          )),
          SizedBox(height: 10),
          HeaderBody(
            isMobile: true,
          ),
        ],
      ),
    );
  }
}
