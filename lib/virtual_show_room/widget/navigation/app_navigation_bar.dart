import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_showroom/bloc/app/app_cubit.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import '../../../model/page_item.dart';
import 'app_navigation_item.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    required this.pages,
    required this.pageIndex,
    required this.onPressed,
    Key? key
  }) : super(key: key);

  final List<PageItem> pages;
  final int pageIndex;
  final Function(int index) onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return AnimatedSlide(
          offset: state.navigationOffset,
          duration: Duration(milliseconds: state.navigationAnimSlideDuration),
          child: AnimatedContainer(
            duration: Duration(milliseconds: state.navigationAnimContainerDuration),
            height: state.navigationHeight,
            padding: AppPadding.allS,
            child: Row(
              children: pages.map(
                (page) =>
                AppNavigationItem(
                  title: page.title,
                  iconPath: page.iconPath,
                  enabled: page.index == pageIndex,
                  onPressed: () {
                    onPressed(page.index);
                  },
                )
              ).toList(),
            )
          ),
        );
      },
    );
  }
}
