import 'package:flutter/material.dart';

import '../../model/page_item.dart';

class MyPage extends StatelessWidget {
  const MyPage({required this.pageIndex, Key? key}) : super(key: key);

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: AnimatedSwitcher(
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            duration: const Duration(milliseconds: 600),
            child: PageItem.pages.elementAt(pageIndex).view
        ),
      ),
    );
  }
}
