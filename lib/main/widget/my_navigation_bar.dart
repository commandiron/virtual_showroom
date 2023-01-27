import 'package:flutter/material.dart';

import '../../configs/app_padding.dart';
import '../../model/page_item.dart';
import 'package:virtual_showroom/main/widget/my_navigation_item.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({required this.pageIndex, required this.onPressed, Key? key}) : super(key: key);

  final int pageIndex;
  final Function(int pageIndex) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.allS,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: PageItem.pages.map(
          (pageItem) => MyNavigationItem(
            pageItem: pageItem,
            enabled: pageItem.index == pageIndex,
            onPressed: () {
              onPressed(pageItem.index);
            },
          )
        ).toList()
      ),
    );
  }
}
