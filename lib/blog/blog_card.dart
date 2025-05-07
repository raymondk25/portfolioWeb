import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portofolio_web/experience/experience_container.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';
import 'package:portofolio_web/utils/hover_extensions.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    Key? key,
    required this.isMobile,
    required this.article,
  }) : super(key: key);

  final bool isMobile;
  final RssItem article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () async {
        final String? articleLink = article.link;
        if (articleLink != null) {
          final Uri url = Uri.parse(articleLink);
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
        }
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.redAccent,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: 10, vertical: isMobile ? 20 : 30),
              child: Text(
                article.title ?? 'Untitled Article',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.content?.value != null
                        ? removeAllHtmlTags(article.content!.value)
                        : 'No content available',
                    style: textStyle(),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ).moveUpOnHover,
    );
  }
}

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

String convertDate(String dateText) {
  final date = DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(dateText);
  return DateFormat('d MMMM yyyy').format(date);
}
