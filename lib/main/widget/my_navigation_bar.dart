import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/app_padding.dart';
import '../../model/page_item.dart';
import 'package:virtual_showroom/main/widget/my_navigation_item.dart';

import '../../provider/app_state_provider.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({required this.pageIndex, required this.onPressed, Key? key}) : super(key: key);

  final int pageIndex;
  final Function(int pageIndex) onPressed;

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {

  double _height = 100;

  @override
  Widget build(BuildContext context) {

    final screenState = Provider.of<AppStateProvider>(context).screenState;

    if(screenState == ScreenState.collapsed) {
      setState(() {
        _height = 100;
      });
    } else {
      setState(() {
        _height = 0;
      });
    }

    return AnimatedContainer(
      padding: AppPadding.allS,
      height: _height,
      duration: Duration(milliseconds: _height > 0 ? 300 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: PageItem.pages.map(
          (pageItem) => MyNavigationItem(
            pageItem: pageItem,
            enabled: pageItem.index == widget.pageIndex,
            onPressed: () {
              widget.onPressed(pageItem.index);
            },
          )
        ).toList()
      ),
    );
  }
}
