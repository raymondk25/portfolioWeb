import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BackToTopButton extends StatelessWidget {
  const BackToTopButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = context.watch<ScrollController>();
    if (scrollController.isOffsetIsZero) return SizedBox();
    return FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          scrollController.animateTo(0,
              duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
        });
  }
}

extension on ScrollController {
  bool get isOffsetIsZero {
    return this.offset == 0;
  }
}
