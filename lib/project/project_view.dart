import 'package:flutter/material.dart';
import 'package:portofolio_web/components/desktop_view_builder.dart';
import 'package:portofolio_web/components/mobile_desktop_view_builder.dart';
import 'package:portofolio_web/components/mobile_view_builder.dart';
import 'package:portofolio_web/project/project_item_body.dart';

class ProjectItem {
  final String image;
  final String title;
  final String description;
  final List<String> technologies;

  ProjectItem(
      {@required this.image,
      @required this.title,
      @required this.description,
      @required this.technologies});
}

final kProjectItems = [
  ProjectItem(
      image: 'images/project_1.png',
      title: 'grid_web',
      description: 'grid 3x3 website',
      technologies: ['Flutter']),
  ProjectItem(
      image: 'images/project_2.png',
      title: 'Jboard',
      description: 'Jboard',
      technologies: ['Jboard']),
  ProjectItem(
      image: 'images/project_3.png',
      title: 'weather_bot',
      description: 'tele bot',
      technologies: ['Node-Red']),
];

class ProjectView extends StatelessWidget {
  const ProjectView({
    Key key,
  }) : super(key: key);
  static const title = 'Projects';

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: ProjectMobileView(), desktopView: ProjectDesktopView());
  }
}

class ProjectDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: ProjectView.title,
      children: [
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final item in kProjectItems)
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProjectItemBody(item: item),
              ))
          ],
        ),
        SizedBox(height: 70),
      ],
    );
  }
}

class ProjectMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: ProjectView.title,
      children: [for (final item in kProjectItems) ProjectItemBody(item: item)],
    );
  }
}
