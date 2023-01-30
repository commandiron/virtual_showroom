import 'package:flutter/material.dart';
import 'package:virtual_showroom/virtual_show_room/widget/my_app_bar.dart';
import 'package:virtual_showroom/virtual_show_room/widget/my_footer.dart';
import 'package:virtual_showroom/virtual_show_room/widget/my_navigation_bar.dart';
import 'package:virtual_showroom/virtual_show_room/widget/my_page.dart';
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
            companyLogoPath: widget.project.companyLogoPath,
            companyContacts: widget.project.companyContacts,
          ),
          ProjectTitle(
            title: widget.project.name,
          ),
          MyPage(
            pages: PageItem.pages,
            project: widget.project,
            pageIndex: _pageIndex
          ),
          MyNavigationBar(
            pages: PageItem.pages,
            pageIndex: _pageIndex,
            onPressed: (pageIndex) {
              setState(() {
                _pageIndex = pageIndex;
              });
            },
          ),
          const MyFooter()
        ],
      )
    );
  }
}







