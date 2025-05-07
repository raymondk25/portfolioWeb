import 'package:flutter/material.dart';
import 'package:portofolio_web/components/desktop_view_builder.dart';
import 'package:portofolio_web/components/mobile_desktop_view_builder.dart';
import 'package:portofolio_web/components/mobile_view_builder.dart';
import 'package:portofolio_web/experience/experience_container.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({
    Key? key,
  }) : super(key: key);
  static const title = 'Experience';

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      desktopView: ExperienceDesktopView(),
      mobileView: ExperienceMobileView(),
    );
  }
}

class ExperienceDesktopView extends StatelessWidget {
  const ExperienceDesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: ExperienceView.title,
      children: [
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var rowindex = 0;
                rowindex < experiences.length / 2;
                rowindex++)
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var index = 0; index < experiences.length / 2; index++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExperienceContainer(
                        experience: experiences.elementAt(rowindex * 2 + index),
                        index: rowindex * 2 + index,
                      ),
                    ),
                ],
              ))
          ],
        ),
        SizedBox(height: 100)
      ],
    );
  }
}

class ExperienceMobileView extends StatelessWidget {
  const ExperienceMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: ExperienceView.title,
      children: [
        for (final experience in experiences)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ExperienceContainer(
              experience: experience,
              index: experiences.indexOf(experience),
            ),
          )
      ],
    );
  }
}
