import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portofolio_web/utils/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMeBody extends StatelessWidget {
  const AboutMeBody({
    Key? key,
    required this.isSmall,
  }) : super(key: key);

  final bool isSmall;
  final String cvLink =
      "https://drive.google.com/file/d/1dSW2f60JcaKk4kkbpDtoKuIFYdxFWa0Z/view";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        AutoSizeText(
          'Hi there! My name is Raymond Kurniawan Liptro. I\'m a Flutter developer from Indonesia.',
          style: TextStyle(fontSize: isSmall ? 24 : 30),
          maxLines: 3,
        ),
        SizedBox(height: 10),
        AutoSizeText(
          'I enjoy taking complex problems and turning them into simple and beautiful interface design. Currently learning flutter to build mobile and web application. In Summer 2020, I gathered my first experiences working in startups company.',
          style: TextStyle(fontSize: isSmall ? 24 : 30),
          maxLines: 7,
        ),
        SizedBox(height: isSmall ? 30 : 10),
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            backgroundColor: Colors.blue,
          ),
          onPressed: () async {
            final Uri url = Uri.parse(
                "https://drive.google.com/file/d/1KW5lDhnkeN4wW3SaALLo74Rg_UL-rDN8/view");
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isSmall ? 5 : 10, vertical: isSmall ? 5 : 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Download Resume ',
                style:
                    TextStyle(fontSize: isSmall ? 16 : 20, color: Colors.white),
                maxLines: 1,
              ),
              Icon(
                Icons.download_rounded,
                color: Colors.white,
              )
            ]),
          ),
        ).moveUpOnHover,
      ],
    );
  }
}
