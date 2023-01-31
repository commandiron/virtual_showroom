import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import '../../../model/page_item.dart';
import '../../../provider/app_state_provider.dart';
import 'app_navigation_item.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar(
    {
      required this.pages,
      required this.pageIndex,
      required this.onPressed,
      Key? key
    }
  ) : super(key: key);

  final List<PageItem> pages;
  final int pageIndex;
  final Function(int index) onPressed;

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {

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
          children: widget.pages.map(
            (pageItem) => AppNavigationItem(
              title: pageItem.title,
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
