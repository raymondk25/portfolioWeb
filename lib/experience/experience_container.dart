import 'package:flutter/material.dart';
import 'package:portofolio_web/utils/colour_assets.dart';

class ExperienceContainer extends StatelessWidget {
  const ExperienceContainer({
    Key key,
    @required this.experience,
    @required this.index,
  }) : super(key: key);

  final ExperienceInfo experience;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colors = ColourAssets.all;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: colors.elementAt(index % colors.length),
          ),
          borderRadius: BorderRadius.circular(3)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          experience.company,
          style: textStyle(isBold: true),
        ),
        SizedBox(height: 10),
        Text(
          experience.timeline,
          style: textStyle(isGrey: true),
        ),
        SizedBox(height: 10),
        for (var item in experience.descriptions)
          Text(
            item,
            style: textStyle(isBold: false),
          )
      ]),
    );
  }
}

TextStyle textStyle({bool isBold, bool isGrey}) {
  return TextStyle(
      fontSize: 20,
      fontWeight: isBold ?? false ? FontWeight.bold : FontWeight.normal,
      height: 1.3,
      color: isGrey ?? false ? Colors.grey : Colors.black);
}

class ExperienceInfo {
  final String company;
  final String timeline;
  final List<String> descriptions;
  ExperienceInfo({
    @required this.company,
    @required this.timeline,
    @required this.descriptions,
  });
}

final experiences = [
  ExperienceInfo(
      company: 'Quality Check (QC) @ 啟碁科技股份有限公司 (WNC)',
      timeline: 'June 2019- August 2019 (3 months)',
      descriptions: [
        '- Controlled the whole procedure of production',
        '- Proven ability to assist machine operators, assemblers and other worker',
        '- Ensured the quality of the end products'
      ]),
  ExperienceInfo(
      company: 'App Developer @ 博睿科技 (Brilltek) | Start up',
      timeline: 'Sept 2020 - Oct 2020 (1 month)',
      descriptions: [
        '- Design business card for mobile app',
        '- Worked in a team of 2 developers',
      ]),
  ExperienceInfo(
      company: 'Intern Frontend Web Developer @ 雲耕隊 (YPCloud)',
      timeline: 'June 2020 - Sept 2020 (4 months)',
      descriptions: [
        '- Learnt new programming languages such as Node-Red & Flutter',
        '- Created a bot in telegram and use it for notification information from website by using Node-Red to Web scripting',
        '- Created a 3x3 grid Website with  Flutter'
      ]),
  ExperienceInfo(
      company: 'Flutter Developer Intern @ 台灣基達科技股份有限公司',
      timeline: 'January 2022 - Present',
      descriptions: [
        '- Currently, building a mobile app for iOS and Android',
        '- Analyze and optimize app performance',
      ]),
];
