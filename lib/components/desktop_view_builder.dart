import 'package:flutter/material.dart';
import 'package:portofolio_web/constants.dart';

class DesktopViewBuilder extends StatelessWidget {
  final String titleText;
  final List<Widget> children;

  const DesktopViewBuilder(
      {Key? key, required this.titleText, required this.children})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        padding: kScreenPadding,
        width: kInitWidth.toDouble(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleText,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            ...children
          ],
        ),
      );
}
