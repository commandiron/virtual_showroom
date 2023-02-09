import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/configs/app_padding.dart';
import '../../cubit/animation/animation_cubit.dart';
import '../pages/current_page/page_item.dart';
import 'custom_navigation_item.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
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
    return BlocBuilder<AnimationCubit, AnimationState>(
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
                CustomNavigationItem(
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
