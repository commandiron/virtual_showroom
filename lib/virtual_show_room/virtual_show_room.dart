import 'package:flutter/material.dart';
import 'package:virtual_showroom/virtual_show_room/widget/my_app_bar.dart';
import 'package:virtual_showroom/virtual_show_room/widget/app_footer.dart';
import 'package:virtual_showroom/virtual_show_room/widget/navigation/app_navigation_bar.dart';
import 'package:virtual_showroom/virtual_show_room/widget/app_page.dart';
import 'package:virtual_showroom/virtual_show_room/widget/project_title.dart';
import '../configs/app_config.dart';
import '../model/page_item.dart';
import '../model/project.dart';

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
    return Scaffold(
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
    );
  }
}







