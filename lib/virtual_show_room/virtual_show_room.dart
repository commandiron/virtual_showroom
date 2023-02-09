import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_showroom/virtual_show_room/cubit/animation/animation_cubit.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/widget/app_footer.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/widget/app_page.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/widget/my_app_bar.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/widget/navigation/app_navigation_bar.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/widget/project_title.dart';
import '../core/configs/app_config.dart';
import '../core/model/project.dart';
import 'presentation/page_item.dart';

class VirtualShowRoom extends StatefulWidget {
  const VirtualShowRoom({required this.project, Key? key}) : super(key: key);

  final Project project;

  @override
  State<VirtualShowRoom> createState() => _VirtualShowRoomState();
}

class _VirtualShowRoomState extends State<VirtualShowRoom> {

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppConfig.init(context);
    return BlocProvider<AnimationCubit>(
      create: (context) => AnimationCubit(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            MyAppBar(
              project: widget.project,
            ),
            ProjectTitle(
              title: widget.project.name,
              locationUrl: widget.project.locationUrl,
            ),
            AppPage(
              pages: PageItem.pages.where(
                (page) => widget.project.enabledPageRoutes.contains(page.route)
              ).toList(),
              project: widget.project,
              pageIndex: _pageIndex
            ),
            AppNavigationBar(
              pages: PageItem.pages.where(
                (page) => widget.project.enabledPageRoutes.contains(page.route)
              ).toList(),
              pageIndex: _pageIndex,
              onPressed: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
            ),
            const AppFooter()
          ],
        )
      )
    );
  }
}







