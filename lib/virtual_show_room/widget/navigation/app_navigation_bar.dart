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

  int _expandedAnimationDuration = 0;
  Offset _offset = Offset.zero;
  double _height = 100;

  @override
  Widget build(BuildContext context) {

    final screenState = Provider.of<AppStateProvider>(context).screenState;

    switch(screenState) {

      case ScreenState.animatedCollapsed:
        setState(() {
          _offset = Offset.zero;
          _height = 100;
        });
        break;
      case ScreenState.expanded:
        setState(() {
          _expandedAnimationDuration = 0;
          _offset = const Offset(0, 1);
          _height = 0;
        });
        break;
      case ScreenState.animatedExpanded:
        setState(() {
          _expandedAnimationDuration = 300;
          _offset = const Offset(0, 1);
          _height = 0;
        });
        break;
    }

    return AnimatedSlide(
      offset: _offset,
      duration: Duration(milliseconds: _offset == Offset.zero ? 600 : _expandedAnimationDuration),
      child: AnimatedContainer(
        duration: Duration(milliseconds: _offset == Offset.zero ? 300 : _expandedAnimationDuration),
        height: _height,
        padding: AppPadding.allS,
        child: Row(
          children: widget.pages.map(
            (page) => AppNavigationItem(
              title: page.title,
              iconPath: page.iconPath,
              enabled: page.index == widget.pageIndex,
              onPressed: () {
                widget.onPressed(page.index);
              },
            )
          ).toList(),
        )
      ),
    );
  }
}
