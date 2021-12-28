import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portofolio_web/utils/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeaderBody extends StatelessWidget {
  final bool isMobile;
  const HeaderBody({
    Key key,
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
          style: isMobile == false ? Theme.of(context).textTheme.headline4 : Theme.of(context).textTheme.headline2,
          maxLines: 1,
        ),
        SizedBox(height: 5,),
        TypewriterAnimatedTextKit(
          text: [
            'Frontend-Developer',
            'Flutter Developer',
            'UI/UX Designer',
            'Blogger'
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
          style: Theme.of(context).textTheme.headline5,
          maxLines: 2,
        ),
        SizedBox(height: 30),
        // ignore: deprecated_member_use
        FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7))),
            color: Colors.redAccent,
            onPressed: () => launch(
                'mailto:raymondtaiwan25@gmail.com?subject=News&body=New%20plugin'),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: isMobile ?? false ? 10 : 17,
                  horizontal: isMobile ?? false ? 8 : 15),
              child: Text(
                'Contact Me',
                style: TextStyle(
                    fontSize: isMobile ?? false ? 20 : 24, color: Colors.white),
                maxLines: 1,
              ),
            )).moveUpOnHover,
      ],
    );
  }
}
