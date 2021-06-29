import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portofolio_web/experience/experience_container.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';
import 'package:portofolio_web/utils/hover_extensions.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    Key key,
    this.isMobile,
    this.article,
  }) : super(key: key);

  final bool isMobile;
  final RssItem article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => launch(article.link),
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
                  horizontal: 10, vertical: isMobile ?? false ? 20 : 30),
              child: Text(
                article.title,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    removeAllHtmlTags(article.content.value),
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

String converDate(String dateText) {
  final date = DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(dateText);
  return DateFormat('d MMMM yyyy').format(date);
}
