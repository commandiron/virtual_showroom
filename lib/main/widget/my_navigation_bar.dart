import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import '../../model/page_item.dart';
import '../../provider/app_state_provider.dart';
import 'my_navigation_item.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({required this.pageIndex, required this.onPressed, Key? key}) : super(key: key);

  final int pageIndex;
  final Function(int pageIndex) onPressed;

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {

  Offset _offset = Offset.zero;
  double _height = 100;

  @override
  Widget build(BuildContext context) {

    final screenState = Provider.of<AppStateProvider>(context).screenState;

    if(screenState == ScreenState.collapsed) {
      setState(() {
        _offset = Offset.zero;
        _height = 100;
      });
    } else {
      setState(() {
        _offset = Offset(0, 1);
        _height = 0;
      });
    }
    return AnimatedSlide(
      offset: _offset,
      duration: Duration(milliseconds: _offset == Offset.zero ? 600 : 0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: _offset == Offset.zero ? 300 : 0),
        height: _height,
        padding: AppPadding.horizontalXS,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ),
    );
  }
}
