import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portofolio_web/components/mobile_desktop_view_builder.dart';
import 'package:portofolio_web/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portofolio_web/utils/hover_extensions.dart';

class FooterView extends StatelessWidget {
  const FooterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: FooterMobileView(), desktopView: FooterDesktopView());
  }
}

class FooterDesktopView extends StatelessWidget {
  const FooterDesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    return Container(
      height: 100,
      width: kInitWidth,
      padding: kScreenPadding,
      child: Row(
        children: [
          Text('© Raymond Kurniawan Liputro $currentYear -- '),
          InkWell(
            child: Text(
              'See the source code',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            mouseCursor: WidgetStateMouseCursor.clickable,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () async {
              final Uri url =
                  Uri.parse('https://github.com/raymondk25/portfolioWeb');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
          ),
          Spacer(),
          for (var social in socials)
            IconButton(
              icon: social.icon,
              color: Colors.redAccent,
              onPressed: () async {
                final Uri url = Uri.parse(social.url);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ).moveUpOnHover,
          SizedBox(width: 50),
        ],
      ),
    );
  }
}

class FooterMobileView extends StatelessWidget {
  const FooterMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    return Container(
      padding: kScreenPadding,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var social in socials)
                IconButton(
                  icon: social.icon,
                  color: Colors.redAccent,
                  onPressed: () async {
                    final Uri url = Uri.parse(social.url);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )
            ],
          ),
          SizedBox(height: 20),
          Text(
            '© Raymond Kurniawan Liputro $currentYear',
            maxLines: 1,
          ),
          SizedBox(height: 20),
          InkWell(
            child: Text(
              'See the source code',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            mouseCursor: WidgetStateMouseCursor.clickable,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () async {
              final Uri url =
                  Uri.parse('https://github.com/raymondk25/portofolio_web');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
          ),
        ],
      ),
    );
  }
}

class SocialInfo {
  final Widget icon;
  final String url;

  SocialInfo({
    required this.icon,
    required this.url,
  });
}

final socials = [
  SocialInfo(
      icon: FaIcon(FontAwesomeIcons.facebook),
      url: 'https://www.facebook.com/raymondk25'),
  SocialInfo(
      icon: FaIcon(FontAwesomeIcons.instagram),
      url: 'https://www.instagram.com/raymondkl_'),
  SocialInfo(
      icon: FaIcon(FontAwesomeIcons.linkedin),
      url: 'https://www.linkedin.com/in/raymondk25'),
  SocialInfo(
      icon: FaIcon(FontAwesomeIcons.github),
      url: 'https://github.com/raymondk25'),
];
