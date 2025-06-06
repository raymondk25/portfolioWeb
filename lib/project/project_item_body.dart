import 'package:flutter/material.dart';
import 'package:portofolio_web/project/project_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectItemBody extends StatelessWidget {
  const ProjectItemBody({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ProjectItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () async {
              final Uri url = Uri.parse(item.url);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            child: Image.asset(item.image)),
        SizedBox(height: 15),
        Text(
          item.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 10),
        Text(
          item.description,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 10),
        Row(
          children: [
            for (final tech in item.technologies)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Chip(label: Text(tech)),
              )
          ],
        ),
        SizedBox(height: 50)
      ],
    );
  }
}
