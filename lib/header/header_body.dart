import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portofolio_web/utils/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeaderBody extends StatelessWidget {
  final bool isMobile;
  const HeaderBody({
    Key? key,
    this.isMobile = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Hi! I\'m Raymond',
          style: isMobile == false
              ? Theme.of(context).textTheme.headlineMedium
              : Theme.of(context).textTheme.displayMedium,
          maxLines: 1,
        ),
        SizedBox(
          height: 5,
        ),
        TypewriterAnimatedTextKit(
          text: [
            'Frontend-Developer',
            'Flutter Developer',
            'UI/UX Designer',
            // 'Blogger'
          ],
          textStyle: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
          speed: const Duration(milliseconds: 100),
          pause: const Duration(milliseconds: 50),
        ),
        SizedBox(height: 15),
        AutoSizeText(
          'I have experience in building beautiful Web & App with Flutter',
          style: Theme.of(context).textTheme.titleLarge,
          maxLines: 2,
        ),
        SizedBox(height: 30),
        TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              backgroundColor: Colors.redAccent,
            ),
            onPressed: () async {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'raymondtaiwan25@gmail.com',
                query: encodeQueryParameters(
                    <String, String>{'subject': 'News', 'body': 'New plugin'}),
              );

              if (await canLaunchUrl(emailLaunchUri)) {
                await launchUrl(emailLaunchUri);
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 10 : 17, horizontal: isMobile ? 8 : 15),
              child: Text(
                'Contact Me',
                style: TextStyle(
                    fontSize: isMobile ? 20 : 24, color: Colors.white),
                maxLines: 1,
              ),
            )).moveUpOnHover,
      ],
    );
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
